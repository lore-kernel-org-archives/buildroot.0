Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363E3CD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC6D60DEA;
	Sun, 31 May 2026 17:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0yH5zZn_GyC; Sun, 31 May 2026 17:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13B8460E3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249133;
	bh=DUPkF0HfcAVe4TkmMsbxiFJcABzRM/ZWfVR8I1WE/JY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SyHz5ytrr258mIxY2KkLGbnYzOJHdiL+azavJd8V4X96p7GYjQtnGGZbu3MWVXKWT
	 RDMldq7R1EOWqvsGixXLwXOQjvVyLTR8vhqlgdsMr5k2S8PeneC0Vj4AgWWQby3B7p
	 rcPwdTZeUUH3A1jodlcxN1Wz+jMnLs4p9PK7mjatnKLuWVeKqilwwqOHP3tN++Qoxm
	 NGADZSqnWQtW0xxhci8Ci5MdSnuk1QH9V4p4twa1XT0tcplRfJP/zpakU+9kyse/oC
	 2hZ1M/AWpEZ09rn1Z+bSK4MrIqGEdeqlGn9bqw3nezPaOZyi78hfQxQ1YmRgC7V0O6
	 xVaSZ+DyuZSPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B8460E3B;
	Sun, 31 May 2026 17:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00B68F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F224D42876
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TAmlvV_hzl4 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A951427EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A951427EB
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EDC8876F9; Sun, 31 May 2026 17:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 19:38:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bfe1da97054413814d26e4d1705fb2fc77cffa8
X-Git-Newrev: ba8016aa03f57304c8537c62b21fe632ac706634
X-Patchwork-Hint: ignore
Message-Id: <20260531173836.8EDC8876F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: needs C++
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba8016aa03f57304c8537c62b21fe632ac706634
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 2e6b2b82d5301977cf2f59adfd633d8774830f69 bumped the
package to version 15.0.0 but forgot to add a dependency to C++ which is
needed due to upstream commit
https://gitlab.freedesktop.org/wayland/weston/-/commit/bdfe7a3e588c26a5b3eca0636a2353de2af24ff6
which was first included in this release.

Fixes:
https://autobuild.buildroot.net/results/297/2971e8cd37224f08e5a9932cb62d2fdde0c397d1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 6f61c3c561..abd996482a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,10 +1,11 @@
-comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
+comment "weston needs udev and a toolchain w/ C++, locale, threads, dynamic library, headers >= 3.0"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
-		!BR2_ENABLE_LOCALE
+		!BR2_ENABLE_LOCALE || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
