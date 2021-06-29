Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C943AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:00:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786206103C
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 786206103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32C8F40628;
	Wed,  4 Aug 2021 00:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZnlflZTOydg; Wed,  4 Aug 2021 00:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426B640655;
	Wed,  4 Aug 2021 00:00:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B241A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71F32404CC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id matc-EZMUbLU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A3740617
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C5A782926; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 22:25:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4937dda8935b671b6f2a9f42e1ebea9912c67351
X-Git-Newrev: 99c797ad8908bd831acb9aa7d6690f30bf3a8677
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.9C5A782926@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/opkg: bump to version
 0.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=99c797ad8908bd831acb9aa7d6690f30bf3a8677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Along with version bump, update hash file to two space format and
switch to HTTPS URL.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.hash | 4 ++--
 package/opkg/opkg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index b1ead67a11..b0c0ba6574 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,4 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256 86887852c43457edfff9d8b6d9520f3f1cdd55f25eb600a6eb31e1c4e151e106  opkg-0.4.2.tar.gz
+sha256  a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e  opkg-0.4.5.tar.gz
 # Locally calculated
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index e25e51b9e6..501edcf8af 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.4.2
-OPKG_SITE = http://downloads.yoctoproject.org/releases/opkg
+OPKG_VERSION = 0.4.5
+OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
