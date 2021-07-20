Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB04C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CCC61037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11CCC61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF2C842B8;
	Wed,  4 Aug 2021 00:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPS_MXy2B0IS; Wed,  4 Aug 2021 00:18:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3019F8427E;
	Wed,  4 Aug 2021 00:18:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B08E1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D77040FA5
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nOpS8YWVWEP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8DD840F11
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1A526878D7; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:56:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ec2e4722be8cbf2f18964070f1d34baa0362485b
X-Git-Newrev: 3335c8d8685119ebb5b2a9a6e575f3a5337c4d90
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.1A526878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nginx-naxsi: bump
 version to 1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3335c8d8685119ebb5b2a9a6e575f3a5337c4d90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Other changes:
  - Change license to GPL-3.0 and BSD-3-Clause
  - Change license file to LICENSE and naxsi_src/ext/libinjection/COPYING
  - Update license hash's in nginx-naxsi.hash

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 5 +++--
 package/nginx-naxsi/nginx-naxsi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index 1f289c56cd..4712ede2af 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256	0a66dcadd32432460fab180be9f2efe24e911e3798917b2787ee710e02901eb4	nginx-naxsi-0.56.tar.gz
-sha256	046812ddc8f250f85b5d6e04218c185849c618b309271ef9d8b01e92c6f7a6ac	naxsi_src/naxsi_json.c
+sha256  439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628  nginx-naxsi-1.3.tar.gz
+sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
+sha256  d0732bc23658db5b9749e3f9cd4fe0f9b3e132b5955adccb08821845fe2a21c8  naxsi_src/ext/libinjection/COPYING
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 7cfa94a5d4..2dba8ad589 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.56
+NGINX_NAXSI_VERSION = 1.3
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
-NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
-NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
+NGINX_NAXSI_LICENSE = GPL-3.0, BSD-3-Clause (libinjection)
+NGINX_NAXSI_LICENSE_FILES = LICENSE naxsi_src/ext/libinjection/COPYING
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
