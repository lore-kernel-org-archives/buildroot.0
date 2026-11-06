Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C5606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=skDu51h2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A17814A1;
	Fri,  6 Nov 2026 21:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lpxux3Dpxa3E; Fri,  6 Nov 2026 21:15:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 916E981470
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999702;
	b=OeVdfYu3SF32ZTpey3Yvy4U8h5EVXRQHndAWHlgHHOOcjfYcIZCguy0SMjezgfux/ZuW
	 gUzOju+qBL0Go5LOL0pvFl94rcxO4/DQm6MP+cKga20ZcbQP1QJ0Obg+MSe7NLsheSA+7
	 sfu36rWY+c8bnCIkS0/pATTzMOaNA+JB/RRCeA0zutuAFM0zLDAAifMQHALocHMF29P0G
	 y7OScLTDcLc1FzybqF1rh+m0VDY3ALctFcxT/id+cMecFmRQJ6A+haV1Eqy5GmmxVQ8lA
	 A9rJZkTlDUqitTuv0KxnUhU34ahQwdvPw06zltTEBiZR/yyrv1Dg0/psLToYxh9Lo7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qn2wuKjUfxzVvtlATYN77vrEl9U1bKXDeuHXVcAHDtY=;
	b=YmqrG5fm5Kl2Z8x7XbyFySQr80Yrd0XcwPdZakHpnWaojpQDxSf2FxAuv/xRwNrO+/pD
	 rHQuYKUx5Mz+/fL+WC7TYepm8+JYNtF5ju6SCmIKsB2x77QHqMH8LGvYgD/YFeY5xEzCf
	 29ueZawc5ffPcY3SBgueKXQJe2K8KBlZJpHO7i2gwLj59q+te2M8+Sqa0O89VBMEHB8Dx
	 qqlENdSM/jPIMND9QbDRTqVUT+Q4xlKKwfw5KZYLT70yrPXSTtclt6jol1ITfIpk/Mjxd
	 U1iEB5fY3nmtR8vD8pqb1i08JEZVvnVAklAFtTaWNJzWrRBwabhgu77MlV4J8Pkzvog==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999702;
	bh=Qn2wuKjUfxzVvtlATYN77vrEl9U1bKXDeuHXVcAHDtY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=skDu51h2YBjOBP9HGXA4xFmNbDETlLe0pVdugi51ZQmMUYWi7OJhjMcXbaWBaSC0S
	 Mt1FqbQfIEwebiLiyO/5F+mLHsxe/vnxfIUZZV2p92h0OyjD2rb7042UovdG/bePEN
	 gx5BgOJ4O7Uwu5LR9JnCF9tsGIE6o++GIrzeCQlBEDOUppJwBplaD6VIuenh7ZbFJd
	 drrDPs3WO5ky3IEPSDe5AHFt/ZB6h57rBdARJjNUMXSVnyEGSWOZfGO+plbUgd+ei0
	 2ek4k7grBCwFSy3x6gWgJCJ4+IgrFZiwumiMCpcXImdr5b+hsULncVMjaBdsDpKIPM
	 xv2k8zQNxpaMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916E981470;
	Fri,  6 Nov 2026 21:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1699AA64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEA0781220
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4weYOMIfGFRJ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3687681287
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3687681287
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 538919DCF5; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27fe395079e3a6e0b13e2a96b465fba1d6b04b66
X-Git-Newrev: 7d3e4679f20bdee98ba4d1742fcded442d65edbe
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.538919DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump to version
 2.74.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d3e4679f20bdee98ba4d1742fcded442d65edbe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index ee77b2d028..7599d5cef2 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  b904b4e99adb7227d3b9026e71bba3cc  sentry_sdk-2.73.0.tar.gz
-sha256  4a2ab97b16e4693c325ab361c7bbbb346dbc7d0bc0150922d795a25bac8d5280  sentry_sdk-2.73.0.tar.gz
+md5  0507ff6aaef7fee4d00929df3eee3462  sentry_sdk-2.74.0.tar.gz
+sha256  dd91d75aacaef636006b579ac3ddb2fdbc9dce35f00f4b353b6b1b110c6b256a  sentry_sdk-2.74.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index e15f847060..1a442b1cdf 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.73.0
+PYTHON_SENTRY_SDK_VERSION = 2.74.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c5/3b/1e47acf2456781c26e12007379ecc154bf310b8f64d40390d78b791d55c3
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/8e/7f/1b16ab4aee53cc5db976bac12e6df5d562aae3880965200cef812e7121d9
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
