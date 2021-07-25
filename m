Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0AEC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD3160F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CD3160F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B639606BE;
	Sun, 25 Jul 2021 13:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQ9bhS8bmCv7; Sun, 25 Jul 2021 13:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8060F60661;
	Sun, 25 Jul 2021 13:13:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77AAD1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 670B960661
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWp4JbvnuAxF for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:13:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6159F60648
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:13:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2AF63868E4; Sun, 25 Jul 2021 12:38:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:13:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ccd3b4c384e98703841b12f7309362957f8f17d
X-Git-Newrev: 9d8b1d3977fa5cd2829a7214a8f2ea479560d421
X-Patchwork-Hint: ignore
Message-Id: <20210725123838.2AF63868E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: needs wchar
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9d8b1d3977fa5cd2829a7214a8f2ea479560d421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

php depends on wchar since bump to version 8.0.7 in commit
469c11c516959375f6caddde178adbdcdc5d9887 and
https://github.com/php/php-src/commit/457380cae7813a4a34faa1f9a49fa121395fe290

Fixes:
 - http://autobuild.buildroot.org/results/751fea989e4c0136d0bbda0f5487d55d387ee5f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 6fa420428b..226d2d5fd2 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PHP
 	# message like "ld.real: section .junk LMA [...,...] overlaps
 	# section .text LMA [...,...]"
 	depends on !BR2_BINFMT_FLAT
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
 	       !BR2_PACKAGE_PHP_SAPI_APACHE && \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
@@ -49,3 +50,7 @@ config BR2_PACKAGE_PHP_SAPI_FPM
 source "package/php/Config.ext"
 
 endif
+
+comment "php needs a toolchain w/ wchar"
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
