Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8125BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2206B42E67;
	Tue, 21 Feb 2023 00:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2206B42E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfLLBy1Ymu4L; Tue, 21 Feb 2023 00:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09DB54F232;
	Tue, 21 Feb 2023 00:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09DB54F232
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85D0A1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09A57610A1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A57610A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_lPH9Sy8XoW for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5170B6FAD4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5170B6FAD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F0EF8648F; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:50:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c1e63188347b1e5bab9d524e2489d4f948ec719e
X-Git-Newrev: 3a22b009992883ad57553ffb3f194303f90ad1a4
X-Patchwork-Hint: ignore
Message-Id: <20230220205227.4F0EF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgpg-error: add
 configure option to install gpg-error-config
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a22b009992883ad57553ffb3f194303f90ad1a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream commit[1]

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=0b47de9c719b0ed0da0791f0525de073737bde5a

changed behaviour: "gpg-error-config is now only installed when enabled"

Fixes:
http://autobuild.buildroot.net/results/bc1/bc1566a0fa42f68f1f15f74a61d4081e269e1689/

[1] included in version 1.46, added in buildroot with commit b5bdcb4cc5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpg-error/libgpg-error.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index ab3c7c3bf2..3f4a45a7e4 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -15,6 +15,7 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = \
 	--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
+	--enable-install-gpg-error-config \
 	--disable-tests \
 	--disable-languages
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
