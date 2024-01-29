Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24B4C47422
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 03:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF5F410A3;
	Mon, 29 Jan 2024 03:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF5F410A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKdI_Y9eOx0P; Mon, 29 Jan 2024 03:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7884410A0;
	Mon, 29 Jan 2024 03:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7884410A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65B7E1BF2A9
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 03:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2066240469
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 03:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2066240469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyy1hn_RX8O3 for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 03:44:45 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5C38400B8
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 03:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5C38400B8
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B196C5C0144;
 Sun, 28 Jan 2024 22:44:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 28 Jan 2024 22:44:40 -0500
X-ME-Sender: <xms:KB-3ZUHhzSZLh9ZWoK8H_f51iIt0wdnKsC2nC6hNEEZUkHOR9AnGLA>
 <xme:KB-3ZdVq68v48bG4YXZIQSAtt9fIxKBMnP4N6Ln3BRkbXDbKEGXBqAb4WdZbwi5-x
 YFR0uEEoVvSZ-YjhhM>
X-ME-Received: <xmr:KB-3ZeIy9H7irVzoyKco9gxLzDYRi55szEKNQczXDQPP4VzS9JDDEfvp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtfedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 evufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmvghvihhnucevuhhiuceo
 sghhsegsuhhgshdrtggtqeenucggtffrrghtthgvrhhnpefhjefhleegieegjedufeehle
 ffhfevhfdvtdevfeeugeeuveefgeefhedvueeivdenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegshhessghughhsrdgttg
X-ME-Proxy: <xmx:KB-3ZWEi7JxhwL22E9YSoGBZ_fTBDnTMI0nuQzu9dBDpnyMfTjNigA>
 <xmx:KB-3ZaWNHQPcWtgHVwBTMNyXDQwD4TeBnAPDdNb5_eLSKdFPLTBLTg>
 <xmx:KB-3ZZMp2gtNv0Mv3U86mKjNnU3ataBdkDxm8CoeCnQpIOoEsyLu3g>
 <xmx:KB-3ZXjKbHKGt0b57vkkqL6_pPGRiaC4osVxsCYIq2eQGlCvl7L7Gw>
Feedback-ID: i5e494642:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 22:44:38 -0500 (EST)
From: Kevin Cui <bh@bugs.cc>
To: peter@korsgaard.com
Date: Mon, 29 Jan 2024 11:44:04 +0800
Message-ID: <20240129034403.10232-2-bh@bugs.cc>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87ede3236l.fsf@48ers.dk>
References: <87ede3236l.fsf@48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bugs.cc; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1706499880; x=
 1706586280; bh=IoM7E85iR1cpXESA/ytfZQ167lRUpW0sBBnrhCJADjc=; b=V
 +3KRe4/iQZweaFmmSl9U5nwuWRibJHiNqst0amuGpahRczQLLr+Tf4xbbda61Bxf
 TrvdkpioTRfFC7G8kN7iJ/BJJQu4M4s7XPjcuT41IqjYOEUxozCVxM+SKsXb5VYo
 /nwq4EUFnnmGQltywQoBEmugWWWAtNQQfB0Cm4QHD8xI+W0T3eBKVRNjSNvFjAfi
 Bf6pckFpo+1Wbsq44gY6/1j+LCAEkCFjO0gRwr30DPWXWJKAsvp2EhTaVNYicxeH
 wSZkH6vqBXf6GvFzEZckmJSYfwTxflqLvjjdcCBVzORlAvlrEL9LKJLLlob4yrXn
 eD1oY6T9fEh5t97g6V2yQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706499880; x=
 1706586280; bh=IoM7E85iR1cpXESA/ytfZQ167lRUpW0sBBnrhCJADjc=; b=i
 lQSPEV5ZpfEqZFfNAyvfTjt86gjD40EZnM1XTuekAFetRIrXZwI1FpBMrRsA7ccm
 YH96k0Xspvjmf3pPF34gouhMmKJ7PeswHcob2sBBGnEPMLUsA1exy+NuEWsfmeLa
 zI8pSleDNfPQw3zNoB3WsDbZT7lGlYOvywE8OBiH85ViqsVxU5etkQQoHaMSrdm1
 /KtPF8TKTO3MxYuRaooA4vCg9wyLUkQaWhDbwM8naJizXP/r0dBYmDwNx5iWukPZ
 +vmkkBsnTKHGnBVe5FpqGuQYXLQT8JxABWm6R4JQmCpiG40O1SzYdjvVnpoGzPsn
 vrRvh3g4C7ml92SgDXlHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=bugs.cc header.i=@bugs.cc
 header.a=rsa-sha256 header.s=fm2 header.b=V+3KRe4/; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ilQSPEV5
Subject: [Buildroot] [PATCH v2 1/1] package/libxml-parser-perl: bump to
 version 2.47
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
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com, bh@bugs.cc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kevin Cui <bh@bugs.cc>

---
Changes for v2:
  - use real name in "From" and "Signed-off-by"
---
 package/libxml-parser-perl/libxml-parser-perl.hash | 4 ++--
 package/libxml-parser-perl/libxml-parser-perl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.hash b/package/libxml-parser-perl/libxml-parser-perl.hash
index c3ef1016e8..4b91386573 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.hash
+++ b/package/libxml-parser-perl/libxml-parser-perl.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d  XML-Parser-2.46.tar.gz
-sha256  6a2e768443ed00f09d3d4bc4dd14451035eac13c6864d68d8e2f76edf5a044f2  README
+sha256  ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8  XML-Parser-2.47.tar.gz
+sha256  3bedfe79fbad08a2b50e1b2b6123e40c68b58b1988d53763b63b6fd295bb0f90  README
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 37cef2e418..06bbd3b1ad 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBXML_PARSER_PERL_VERSION = 2.46
+LIBXML_PARSER_PERL_VERSION = 2.47
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
