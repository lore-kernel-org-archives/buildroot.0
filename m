Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08661C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C082D81387;
	Thu, 24 Apr 2025 21:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-TefQSd-cXr; Thu, 24 Apr 2025 21:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB2E8135B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB2E8135B;
	Thu, 24 Apr 2025 21:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E02EF127
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D28D342503
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MV8bEvnjGwm9 for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 21:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86693424F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86693424F7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86693424F7
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:12:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0D86543A7F;
 Thu, 24 Apr 2025 21:12:16 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Date: Thu, 24 Apr 2025 23:12:15 +0200
Message-ID: <20250424211216.4117827-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedthedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdefiedvhfevieetgfethffgiefhjeevfefftdfhtddvffeuieeludehfeeguefgnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehvjhgrrhguihhnsehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745529137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y6yO4iKlxHbb/YOAQJMTAtkXLoy9HXyXRmBI/HTeOBM=;
 b=UOPx4vZ3ZCGLM+7K3dvPKa42zL5aK73XAWoSt7qP75liBCenHGxmO5WCGVkUAVDwOOV8pU
 GW0Um++QCGvtaS87ydl7J0GOm2gAB28yEkUfMtvVeWXMwitNntiQHBp+IGH0/TJVyQkslY
 fIrk+WzNkj+h8mfMUkr9nWtBBojKi1pB/czPwkNhMZxbWWq3c+e3c0crqjx5eVYdY48wSW
 OZl0IiXoT6Awu1Vg2kMrHv5+xvS6QKYY74VH+2vACNQekfXuNznqCyeLPlUos7+SW0yQ3o
 Jwn+twh8ZqQD7E490Crb8BaK9JrqSW/nHYDziNYfCdjwgNha9EwoYDvp56EPFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UOPx4vZ3
Subject: [Buildroot] [PATCH] package/dpdk: fixup Config.in comment about
 dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Config.in comment in the dpdk package was wrong for a number of
reasons:

- It didn't mention the glibc dependency

- It didn't mention the gcc >= 4.9 dependency

- It mentioned a wchar dependency that isn't listed in the dpdk
  dependencies

- It mentioned a dynamic library dependency that isn't listed in the
  dpdk dependencies

- It used "kernel headers >= 4.19", while for brievity we use "headers
  >= 4.19" everywhere in Buildroot

- Minor nit: DPDK was written allcaps, while we write package names
  lower-case in Buildroot

Fixes: d17d1b6bde95d46376c4fe93e8ca1a1f9da6c179 ("package/dpdk: add 24.07")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dpdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 328129ea65..7d4a002002 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_DPDK_TESTS
 
 endif
 
-comment "DPDK needs a toolchain w/ dynamic library, threads, wchar, kernel headers >= 4.19"
+comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
 	depends on BR2_USE_MMU # pthread() memory mappings
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
