Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E681C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E801281EB3;
	Sun, 18 May 2025 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDR_Bf_YezkP; Sun, 18 May 2025 14:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2122481EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2122481EBF;
	Sun, 18 May 2025 14:39:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BB3DDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA5F81EB4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YR78kfhIYj4 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DCB881ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCB881ECB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DCB881ECB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1BCF943A24;
 Sun, 18 May 2025 14:39:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:39:17 +0200
Message-ID: <20250518143918.749581-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfftddtledvgeefveegfedtjedvveeltdevkeffgfejgeeiveeijeeuvdevgeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 egurghnihgvlhdrtghrohifvgesmhgrgihmihhnvgdrtghomhdrrghupdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeihvghgohhrshhlihhsthhssehgohhoghhlvghmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747579159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dx5brddMCVOeN6oOCWECtsMc+a/I8L/eIzlb19UPkzw=;
 b=SKIj31aUM+FAwDTl1XDx3A5rtkPQBCCg/Q2+2TjpUabZibasJIH1aECHu6tco6pKV5TRbe
 2yx5GrX6hQ6S32lBtu9/wORxCiiAeNSZCxLMGah8rPnc6YrTtu6Zd6hRFOaoC5S9+VnEie
 zKwY09YQ1HBG+w906GwSjAbPewdLtaHOLBiyczuoA/HXnQfHb0T8l4sBKqAt7w9+lvnF9e
 iYB1xh75vkGZruYPgqfND/9QSKNI4iuLl0eG+T9Fa/+HQ5dJN5ohecaekdNmdZKWDRwt0l
 s/fD5BycsJl4hp/sKZYh+nWzPOtY5QKPFTA8VCAsX4tDaDdRIaeQ8SqDG0upKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SKIj31aU
Subject: [Buildroot] [PATCH] package/python-pyproj: propagate dependencies
 from proj
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-pyproj package was introduced in
7c65b4484e1ed414496488cf8eb4fe967b10c087, and it selects
BR2_PACKAGE_PROJ, but forgot to propagate its dependencies, so let's
do that.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PROJ
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_WCHAR [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYPROJ [=y] && BR2_PACKAGE_PYTHON3 [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyproj/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-pyproj/Config.in b/package/python-pyproj/Config.in
index ee829d71c5..19bdd82d43 100644
--- a/package/python-pyproj/Config.in
+++ b/package/python-pyproj/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_PYTHON_PYPROJ
 	bool "python-pyproj"
+	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
+	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PROJ # runtime
 	help
@@ -7,3 +11,8 @@ config BR2_PACKAGE_PYTHON_PYPROJ
 	  coordinate transformations library).
 
 	  https://github.com/pyproj4/pyproj
+
+comment "python-pyproj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
