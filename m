Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0BBC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD4A340888;
	Fri, 16 May 2025 14:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8ExlBp1wELw; Fri, 16 May 2025 14:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFC904078E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC904078E;
	Fri, 16 May 2025 14:33:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1D9185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEBDB4057B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oTYLDnGkgEd for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0B314025F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B314025F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0B314025F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:33:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8DFC43A0D;
 Fri, 16 May 2025 14:33:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uFw7b-009gff-14;
 Fri, 16 May 2025 16:33:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:33:09 +0200
Message-Id: <20250516143310.2308959-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdetgeekkeejudeggeelleeuueehteduvddvjeekgfehgfdtieelheffvdeitddtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepphhhihhlihhpphgvrdhrvgihnhgvshesshhofhhtr
 ghthhhomhgvrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: add upstream patch to fix
 builds against libopenssl 3.5.x
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
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-tpm-Update-to-OpenSSL-3.5.patch      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch

diff --git a/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
new file mode 100644
index 0000000000..36a9cb97dc
--- /dev/null
+++ b/package/ibm-sw-tpm2/0004-tpm-Update-to-OpenSSL-3.5.patch
@@ -0,0 +1,39 @@
+From 720ed4b8c74c3b517a46b442be9482319ed027dd Mon Sep 17 00:00:00 2001
+From: Ken Goldman <kgold@linux.ibm.com>
+Date: Fri, 18 Apr 2025 13:41:59 -0400
+Subject: [PATCH] tpm: Update to OpenSSL 3.5
+
+Accept 3.5 as a supported version
+
+Signed-off-by: Ken Goldman <kgold@linux.ibm.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/kgoldman/ibmswtpm2/commit/720ed4b8c74c3b517a46b442be9482319ed027dd
+---
+ src/BnToOsslMath.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 165304d..5fd5323 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -54,7 +54,7 @@
+ /*    arising in any way out of use or reliance upon this specification or any 	*/
+ /*    information herein.							*/
+ /*										*/
+-/*  (c) Copyright IBM Corp. and others, 2023				  	*/
++/*  (c) Copyright IBM Corp. and others, 2023 - 2025			  	*/
+ /*										*/
+ /********************************************************************************/
+ 
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30500ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
