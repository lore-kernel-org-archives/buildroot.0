Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0C606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sW04IIN2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D924040761;
	Mon, 23 Nov 2026 15:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FF9AWPC_fII; Mon, 23 Nov 2026 15:07:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 150F24073A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795446448;
	b=LHw3AK8jsSr48aLjHD4vo8NiVxlspM53cnf0XwHsc8v0LVMHNj5As0IknoQX6Kd+yB1m
	 Hocvagwi2UY6D6OjGXdF89VLv1ycihO3VMyU297xL70DQgcTlSdkhQs8Yt+v1cHRXwRaY
	 DBv1weBlX2KcKUKstZKZkgpsbF/OOhnBfbaGRJHtI5vft33I0c2M9mH/4a338HoTFnY2k
	 wt/8jgR+mgPT1XjCvamu83EOHDZ6ahHMs3nBHBzWyFVMRnBPzpnWmGRzVdCt1ZZxNjqjR
	 eC5ojJkY9WIke8PHSi3Ycsxvh0n4TqRCTwphMy1RtAKM/xV5dBxDC1dZKDFRPFeQQ7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795446448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FWX53e7UWUTlC/QnTpy9MGUs79wX5Fdg2H+QTINSCvo=;
	b=n2tkwOevgkM82UsP/SV4TwmmTdZi2YHy9G5CU4fW1hEdpDR05x0Oq7m/NoD39bhDaVWg
	 Ew/7KYsVQbOXm/U6c4CVSBhgUpYQeLQWQGlZFRsdG3GDw5GkOd6hiYSiADny7vTN8Rqti
	 wYY3WiOwQ8imHqHgYdv+Qk9fb7tE7zbd19HWEj8P1t4tEKzXx3AMW4yqoH4ayjuAUav2n
	 kP7r1Gh5ropY4YyCe/TxB2pA+z5IM5jshTuQIJcXl/xW5FqM36g/PoeNFvs0lOcTxubDb
	 hskN7JA/Yv3M2PhV7BgbvgWAVa7LhUjZwSUCeYPgS19HameIPFN63kse1dNfJFP8xfQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795446448;
	bh=FWX53e7UWUTlC/QnTpy9MGUs79wX5Fdg2H+QTINSCvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=sW04IIN29OuHqiEsxymeTwEp5G1Ar+VNWcmBD0BFr9h72WpnwU7hjzp3RDp9WmRsa
	 HY7RvZlqp/bHVtP+6+F9FqdPiVg70MZHo5PZIqpp8l/GH2PTO6vRgD9InTg4XVyA0E
	 RkZqSVpDHOts42eV9802eW1PqErq94+OiapactAL8g2Du3GbeUpw7yRsKLBOnLN5Y0
	 5ymVjeunuA3tUjmVCeKA/ebIBUZv+j+UnWzMOgeEefKL0EBD+/YXIa1KvlJeBB/efm
	 VYnk0XT1FoXDGledcl4cXyoiF6DPE3wxds8boCDe7pemivWThFIhnqtnWTvNBVLEtD
	 fACI3iPWgtlLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 150F24073A;
	Mon, 23 Nov 2026 15:07:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8951822B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 15:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A6684073A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 15:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKJXgABfgsA8 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 15:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3337C406A7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3337C406A7
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 15:07:24 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 513C62C859D2;
 Mon, 23 Nov 2026 16:07:22 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 16:06:28 +0100
Message-ID: <20261123150629.709859-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2026.08.x] package/python-django: fix build with
 older setuptools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot bumped python-django to 6.0.10 [1]. This version includes
the following upstream commit [2] which bumped the minimum setuptools
version to 83 and broke the build on 2026.08.x maintenance branch, which
still provides setuptools 80.9.0:

  ERROR Missing dependencies:
	setuptools>=83

The upstream bump was a precautionary response [3] to CVE-2026-59890, which
does not affect django.

[1] 395f2aa263 package/python-django: security bump to v6.0.10
[2] https://github.com/django/django/commit/ff44d788e16ecc5971a1cfbff9cd7bee54390e50
[3] https://github.com/django/django/pull/21691

Fixes: https://autobuild.buildroot.org/results/151/151b4da72e5d11dae3953043383d7e0a95a6538f
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...ped-minimum-setuptools-version-to-83.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/python-django/0001-Revert-6.0.x-Bumped-minimum-setuptools-version-to-83.patch

diff --git a/package/python-django/0001-Revert-6.0.x-Bumped-minimum-setuptools-version-to-83.patch b/package/python-django/0001-Revert-6.0.x-Bumped-minimum-setuptools-version-to-83.patch
new file mode 100644
index 0000000000..5bc5072158
--- /dev/null
+++ b/package/python-django/0001-Revert-6.0.x-Bumped-minimum-setuptools-version-to-83.patch
@@ -0,0 +1,30 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Mon, 9 Nov 2026 12:00:00 +0100
+Subject: [PATCH] Revert "[6.0.x] Bumped minimum setuptools version to 83."
+
+This reverts upstream commit ff44d788e16ecc5971a1cfbff9cd7bee54390e50.
+
+Buildroot provides an older setuptools version and no Django code depends
+setuptools 83 feature.
+
+See https://autobuild.buildroot.org/results/151/151b4da72e5d11dae3953043383d7e0a95a6538f/build-end.log
+
+Upstream: N/A
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+[Marcus: target django 6.0.x]
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=83"]
++requires = ["setuptools>=77.0.3"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
