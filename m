Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E45D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18B1D81568;
	Sat, 26 Oct 2024 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BH3s3sJL6Kco; Sat, 26 Oct 2024 16:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19BF981E21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BF981E21;
	Sat, 26 Oct 2024 16:21:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC0DA5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB14D81E7B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpzyhvvpgH4q for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA870810FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA870810FA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA870810FA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:21:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0575DC0002;
 Sat, 26 Oct 2024 16:21:11 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>, Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2024 18:21:08 +0200
Message-ID: <20241026162109.1055271-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729959672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=na+ri3r7tnRjDNl91rhXxEXx75QjCMtVQjIi9O1aZKA=;
 b=eQps5aIbImQ/Oa2VM+lSRgSTdPra6MSyCuD3au2QnwOol7QnlVni66+Ws44FQpqVStVPB6
 qJSUGv3I2DjWWAI4PTDxraUX815ij9YKO8BPQAiaaXlmPs2uHN34mmcQKBEBFNLBRAAtzX
 e6+tXFHDvHJ4UTY8/gKhYm7a+EBceiHUzYgeffpWbTdqKJqUhIlnlEVPbUjc5gysUBu5Uu
 SObuU//aBP+Q9HfigPs6SEdiiqlZ8Lm449Qkq2j7sEIME/Occ7bBO5XHyRqkTC070bR3Bf
 kDoHBljkwQZ0AvoFt4he7VcrgPLRtgUbLDGKJzKksrbGHRh8pdqaMOaIp9MH4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eQps5aIb
Subject: [Buildroot] [PATCH] DEVELOPERS: add Fiona as a developer for all
 init scripts
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

Recently, Fiona has been involved in a very nice effort to clean up
our init scripts, and make them more consistent with each other. In
order to continue this effort, let's make sure Fiona gets Cc'ed on all
patches that touch init scripts by adding her to the DEVELOPERS file
for package/*/S*.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Fiona, this is obviously a proposal, and I will not merge it if it
doesn't get your Acked-by.
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 409642f96f..8a14ed36ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1098,6 +1098,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/*/S*
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
