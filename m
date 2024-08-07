Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE74C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62D480C10;
	Wed,  7 Aug 2024 10:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxjD7YhdDoCI; Wed,  7 Aug 2024 10:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C0380E78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4C0380E78;
	Wed,  7 Aug 2024 10:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C1631BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 799734017B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qM5I2_EFl_O9 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4DAC400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4DAC400A4
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4DAC400A4
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:44:23 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7120935210E4; Wed,  7 Aug 2024 12:44:21 +0200 (CEST)
Date: Wed, 7 Aug 2024 12:44:21 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrNQBcWzOEsRkZij@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723027461; bh=tNgAdPzmhX++DEcj9d+brIUmNV9sPsIcN7skkjq7Tjc=;
 h=Date:From:To:Subject:From;
 b=JiCO77CRPsCrCswrxms+oqbYSzEgAH/zAu/kU4FlOLQR/q0XA/XqfaOzNnvj479OK
 VyKmVDb2rm+nOpT9GWDl02haozFB262RCmM4hNM0LLRZXNOGSob6Swgo9gmkwru4Rb
 ylXUW9VucZxjSLjmCReSuPOqt6NAWATCnbd0oz+kub2YtPclt1Tcur4xeRUgipCJE6
 wokUfWxV1Yg4yPMoq4wgYeOnjpTpv3/hy+HOcq+Mqaw6b4gXaAI5gMCPJv+pewq7C5
 d5LSo3DUz1jRDUX5cFHdVZenL+QKFAADpwQp0Ch/I5gGxH77H5w7qDfz8TNdwg2pYI
 yRXJkbkw/HZdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=JiCO77CR
Subject: [Buildroot] [PATCH] package/mpg123: update to 1.32.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the homepage for News and Changes:
http://mpg123.de/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 0fe4699606..5a83f29586 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.3/
-sha1  3a94848a620db7917c757cb21e261c711e44618f  mpg123-1.32.3.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.6/
+sha1  886c8c5f100caccfb4fefabc1c75ff6e2a834128  mpg123-1.32.6.tar.bz2
 # Locally calculated
-sha256  2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4  mpg123-1.32.3.tar.bz2
+sha256  ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6  mpg123-1.32.6.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 4de5f99bdf..af036132d2 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.32.3
+MPG123_VERSION = 1.32.6
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
