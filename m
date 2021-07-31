Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53A1C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:12:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E9D60EC0
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79E9D60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50999606A0;
	Sat, 31 Jul 2021 09:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEg2wU-nk1Uh; Sat, 31 Jul 2021 09:12:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A623A60733;
	Sat, 31 Jul 2021 09:12:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE28A1BF2F3
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E87BF40286
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25FSasaEKmIw for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 09:11:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001B74026D
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 09:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C3DD887C6; Sat, 31 Jul 2021 09:11:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 11:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca1912e1f8e4386862b8cfa6460769ab6f02dd1
X-Git-Newrev: 7905ac1f3458e9eea9762101625d372d6311ad79
X-Patchwork-Hint: ignore
Message-Id: <20210731091119.4C3DD887C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cvs: fix SELinux
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

commit: https://git.buildroot.net/buildroot/commit/?id=7905ac1f3458e9eea9762101625d372d6311ad79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add apache module as for now it is unconditionally used in cvs.fc

Fixes:
 - http://autobuild.buildroot.org/results/838266bef1deec560e336d03a64d64fa1990c344

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cvs/cvs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 8200997d3a..bd1e04eee0 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -11,7 +11,7 @@ CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/
 CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
 CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
 CVS_CPE_ID_VENDOR = gnu
-CVS_SELINUX_MODULES = cvs
+CVS_SELINUX_MODULES = apache cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
