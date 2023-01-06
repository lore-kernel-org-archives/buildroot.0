Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC4DC54E76
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 07:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C3BF409B6;
	Fri,  6 Jan 2023 07:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3BF409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puMD0Cs8HjmZ; Fri,  6 Jan 2023 07:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E60C40A02;
	Fri,  6 Jan 2023 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E60C40A02
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0954F1BF359
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89E060FE2
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 07:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89E060FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6El5KsV1X3s for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 07:51:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 178E460B92
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 07:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 178E460B92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB7EA8769B; Fri,  6 Jan 2023 07:51:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Jan 2023 08:50:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1e63188347b1e5bab9d524e2489d4f948ec719e
X-Git-Newrev: 3a22b009992883ad57553ffb3f194303f90ad1a4
X-Patchwork-Hint: ignore
Message-Id: <20230106075101.EB7EA8769B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: add configure option
 to install gpg-error-config
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
