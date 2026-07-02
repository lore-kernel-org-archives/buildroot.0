Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7A8C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 18:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38766418E4;
	Thu,  2 Jul 2026 18:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMa5QoxATfgE; Thu,  2 Jul 2026 18:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12756418D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783016011;
	bh=l75fuGIbHFHteVCoZlIyOO/xdLmkelXia23mUhEsG4A=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rY8WA9TQFptxiW36OgUho3JBTTQYZb9fcwa+46g4hngqliaKeowyN8KLnldbr9ujI
	 JpFy32XkxiDwRVF2grBi4Wcg7mY4sT9BRZS0jBz35YbFwqxTsd4lbarjZuzCVjVvGP
	 5feeuI4FWrr56lTRZyh0+yXP7PSLrpaENW7Zkz5KpDaK1YM/gdMUIUs2N3zHCt3iG4
	 W3Eptp4TXfLpz7n9fvuJq++bByBec1TAtXm4pvPfvPkgixNhL/3dLkSx7lu5hQnQ2b
	 KHTsN85AjNo/n75r62qvHZvfBDG/1naMQk/d2NHAoU9EpwoBABkITTSBN6At3WIYvs
	 aGoeYMhV2ZG9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12756418D2;
	Thu,  2 Jul 2026 18:13:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7463316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D50C4418D2
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdkO7WLwb8ph for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 18:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3CAE418D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CAE418D1
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3CAE418D1
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 18:13:28 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B033331E0B1F; Thu, 02 Jul 2026 20:13:26 +0200 (CEST)
Date: Thu, 2 Jul 2026 20:13:26 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <akaqRiHr-DLEYcqw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1783016006; bh=bEz8/CK8daYzC7WFNGlHbyM0Kmw2nw6ChWsU9gxSrwU=;
 h=Date:From:To:Subject:From;
 b=DjjErKl41lvMGEA16fMGOBd/MO2JbdTnqhl2ZBzcVnDaPugc9eEtQu/AEUE8uiDLN
 HX2yulcnXqVp7WpKOgge+JXTET58bxgpJbPSitWupw9ORyOqG+pojf5IaJ/PnkRGYX
 0/VbgsfS2QPMumew4WzB0cAkR8QMBr7AwWkGUROpQ8d2BgnGVloWRnkAa9VkH65is0
 vs5IQkgar9o5PtOvDAU4XLKBpBZ3yTUb1RQaLjxz7+zbrsOF7NRwiWBKD2VtXIrqhZ
 zaljii9kaMUhUFcyg5DwiZHisH3BiIEfN2m8Gx77BAwkIzEMYV9L1dz7H3RCBQzDsF
 B5I0VzGvUL3yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/mpg123: bump to 1.33.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for changes:
https://www.mpg123.de/#2026-06-06

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 8ab8040396..5617aca5b3 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.5/
-sha1  f3538d36c360bc34a83f2fcd69ddb67ee04d332f  mpg123-1.33.5.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.6/
+sha1  94aea4e3698a020ef081b2fea778c55e79903a19  mpg123-1.33.6.tar.bz2
 # Locally calculated
-sha256  0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd  mpg123-1.33.5.tar.bz2
+sha256  929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a  mpg123-1.33.6.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 0b8f0e1a83..99fe6b82fb 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.5
+MPG123_VERSION = 1.33.6
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
