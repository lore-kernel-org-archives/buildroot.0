Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A71DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D5260F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37D5260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 031DC40488;
	Tue,  3 Aug 2021 21:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UbiS-SR_F5T; Tue,  3 Aug 2021 21:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E499F40480;
	Tue,  3 Aug 2021 21:32:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8ADC1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C14B0404A7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lerwQbUcP3dQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8F6B402EE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1FAF5810E2; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 May 2021 10:24:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1eb1a24e9ff38667e4cc0ae8930a69a3026971e3
X-Git-Newrev: 990d0c1cd282674adf09da316568678bafa505c6
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.1FAF5810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/expat: security bump
 to version 2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=990d0c1cd282674adf09da316568678bafa505c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2013-0340 "Billion Laughs":
https://blog.hartwork.org/posts/cve-2013-0340-billion-laughs-fixed-in-expat-2-4-0/

https://github.com/libexpat/libexpat/blob/R_2_4_1/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index dd448982fe..8cf563d8f5 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.3.0/
-md5  1c1b523a8d917e6d9f7af4f8881d8ec5  expat-2.3.0.tar.xz
-sha1  596a37d048b357a58990a538a8d83e2e38325122  expat-2.3.0.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.1/
+md5  a4fb91a9441bcaec576d4c4a56fa3aa6  expat-2.4.1.tar.xz
+sha1  7988e4df355162500f09837aa95cbb48e6754420  expat-2.4.1.tar.xz
 
 # Locally calculated
-sha256  caa34f99b6e3bcea8502507eb6549a0a84510b244a748dfb287271b2d47467a9  expat-2.3.0.tar.xz
+sha256  cf032d0dba9b928636548e32b327a2d66b1aab63c4f4a13dd132c2d1d2f2fb6a  expat-2.4.1.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 04ea413e1b..bb1cfd8c8a 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.3.0
+EXPAT_VERSION = 2.4.1
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
