Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B8AC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9D46612F9;
	Thu,  9 May 2024 20:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQ9qEtliZ9p4; Thu,  9 May 2024 20:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64250612F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64250612F6;
	Thu,  9 May 2024 20:18:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED1A91BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA2EA41DEA
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYqvdZ5vVSCV for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2826A41DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2826A41DFD
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14C5386D9A; Thu,  9 May 2024 20:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:17:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6542cf10b80a0e44d1301ab7ef9a78c6f24e1d0
X-Git-Newrev: dabd983c0d8f019a9b285bd3a1a843cbd5ed9d4d
X-Patchwork-Hint: ignore
Message-Id: <20240509201804.14C5386D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hidapi: fixup Config.in comment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=dabd983c0d8f019a9b285bd3a1a843cbd5ed9d4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Config.in comment was mentioning both "NPTL" and "threads" as
dependencies, while mentioning only the former is sufficient.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hidapi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 061c7883f7..1d3c86b677 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_HIDAPI
 
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, threads, gcc >= 4.9"
+comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
