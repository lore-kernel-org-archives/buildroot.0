Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D46606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XL5tae+F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=jImjig/W
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680D340762;
	Mon, 23 Nov 2026 17:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-4DEID4e8vA; Mon, 23 Nov 2026 17:46:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31EEE40792
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455998;
	b=YFJFXzIoRoircELxAOGkaZla+vBeq7jW7HHKsDJa18GcCWdqytT/jvWhay5Be4AwbHTT
	 9jT5Ce0WNcfW3bysuI7aTpfqjGyL+G2WII3qvgpuraYwV9SUspzEQiO80J77VR1+ydUUT
	 GZwWEPMIybg51JYbvd03wTAOMtRpTo+rjQy70q4l9talKXxNv8jpNrsTYWnZZBakBUfaG
	 9PYz+ZxQXHmQKkO0pOiwuPTPamg2rQ9aL5KBSebGBUbvG0lke0eHGhIcEE/8aAuwLkF4i
	 DZLsOHg5NDMUsit7v0nLWWLsCOrY93NovArbLEOHiCR05f+hFL5oVHXrHEXqbJYZ+Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/iic3lKhNtKlRyMvzIZgSdZfm7mnsSQBQ+BldGSxY5s=;
	b=h+ao0d99LWcFhvIRSrm4v8b3HWjfMKxzvEGJd6iiZPsBHyvthpMK/NUrmN5mYEkxXTqK
	 KF0FO26UOo9m1PkjefWEfpHaRoI2QLZBZCPt2PYIhulSB+kmeuyH7vLDpBjIfEY/NULMC
	 2pa6hQshk2WBvMFskiPk26XPMqcyQ0SVHhyIoa7tsrpKSpkMvmco/DZo/SvCwf9s1xArk
	 elLFR+l2wlq7JwRVQlWwDOlVG2mo9TFhcC+NwVAQ/g+fkiXGOIOekYVbt6XK+hRq5L34Z
	 jLaEQNM8kztXxSxlfYAqOucodzZmHr7tLCwKLOew4i7Ed6HT58BkVRYsAVDY1t0XjGQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b="jImjig/W";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455998;
	bh=/iic3lKhNtKlRyMvzIZgSdZfm7mnsSQBQ+BldGSxY5s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XL5tae+F05qWHCIuhVLqerkMc81eKPIc1IqtkaA9kQCt29vXQ717ncdrqsQJMZcuc
	 ZBjq50esZWl4iBweexH4idRkYMciimgiS1Xr1DqnhHRk1J2xwZqFZLDZOweIcLPxyA
	 GVFBcQCEdPDI8gAPusvukFAiiqE7pr3FxN5PR0H/71e/JTGbn1Zo959QIUbVEBONxD
	 U6pYgNfsp1DPX+fekqQJ0ljIsqWxEtMRYICMivNUwIC+oPUYJW/QujOxxA78j1N19z
	 +zbPx6h5BTYn3bqonmSxUBjDRbADcsBAB1ZKi9wddrjOYLPg3bNwjuorx2G1Da959j
	 CAHBUkwd+r/bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31EEE40792;
	Mon, 23 Nov 2026 17:46:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE113A8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4263140704
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2eG_79InWHN for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E091A40738
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=62.149.156.87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jImjig/W
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E091A40738
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:27 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VY7UxKIX66q8sVY7Vx5MtP; Mon, 23 Nov 2026 18:46:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795455985; bh=JrEen3Lzfqp+2niRUmGs2bMOo8zaXvevQJLm6qW/kIo=;
 h=From:To:Subject:Date:MIME-Version;
 b=jImjig/WIplLFjBuNSkPvyuw5mdty2nBSYcgMhrQR83wbkPhLoFaBFnztgYqiV9dY
 ovMwQ3PCSS2ssfVpTXvTaywtRAEtvps28ElAuxME83y/gIMQndNlAGYAS/kDrGCz07
 xpwIvC6WYPSu+pnHEqUwezbp8GIULjrQnH9aWrYoGoNyk9Dav1OyMSax+pSIoNIepv
 xbw/uUC+LV4rDezpsQv/IjNjT2kb2tT3w373EbbmzNYDcmAzepSAR3fb4WZtN+0Ywg
 WcBzMeyyvT7UkAfeiY5Y38qvOZlA7BxqFoIGLF0HaZV+d7tg/sG3GpizlUBeMK4B9P
 rWVlyL0YmZuWg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Nov 2026 18:46:23 +0100
Message-ID: <20261123174624.1851887-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123174624.1851887-1-giulio.benetti@benettiengineering.com>
References: <20261123174624.1851887-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPGkvjs98efHdsV59T0pvsQnK/yvTvxkb0sDf6Te7QKu/YJ/TI42/86aga0+jeNOZ1m+8nydVdO5TSKHxRp1md32mVDzWNaWArFNd4kDD1TKkzFsQp3B
 k/NmJEd821i7M/8JWA/lIcakve7WD/jAuxY9z9BJR0j/KxghOr7keCDGjULL3mTs2NCCsH1tM0mdQg0SSZLQNbixoFc4s0X+8QvJPrfGTIHa5AGWp4aAQdvs
 Sz8Llp++ClknsPSBkMFllYwhqLncXmYbuFXBLIbjyI0sTHQ6YgeiUM5P2Go26cbm
Subject: [Buildroot] [PATCH 2/2] package/wireshark: security bump to version
 4.6.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

- wnpa-sec-2026-111: RTSE protocol dissector crash. Issue 21585.
- wnpa-sec-2026-112: NBAP protocol dissector crash. Issue 21630, Issue
  21632.
- wnpa-sec-2026-113: PEAK CAN TRC file parser crash when built with
  older versions of GLib. Issue 21500, Issue 21609.
- wnpa-sec-2026-114: ERF file parser crash. Issue 21635.
- wnpa-sec-2026-115: Ascend file parser large loop. CVE-2026-130465.
- wnpa-sec-2026-116: MsgPack and NNTP protocol dissector crashes. Issue
  21746.
- wnpa-sec-2026-117: Android Logcat file parser crash. Issue 21639.
- wnpa-sec-2026-118: Multiple protocol dissector and file parser hangs.
  Issue 21747.
- wnpa-sec-2026-119: IEEE 1609.2 protocol dissector crash. Issue 21640.
- wnpa-sec-2026-120: Multiple protocol dissector crashes. Issue 21749.
- wnpa-sec-2026-121: Tektronix K12xx file parser large loop.
  CVE-2026-130459.
- wnpa-sec-2026-122: IrDA protocol dissector crash. Issue 21658.
- wnpa-sec-2026-123: Matter protocol dissector crash. Issue 21675.
- wnpa-sec-2026-124: ERF file parser crash. Issue 21682.
- wnpa-sec-2026-125: Kafka protocol dissector infinite loop. Issue
  21684.
- wnpa-sec-2026-126: IEEE 1905 protocol dissector crash. Issue 21683.
- wnpa-sec-2026-127: OpenWire protocol dissector crash. Issue 21676.
- wnpa-sec-2026-128: USB-PTP protocol dissector crash. CVE-2026-130452.
- wnpa-sec-2026-129: Multiple protocol dissector infinite loops. Issue
  21752.
- wnpa-sec-2026-130: Multiple protocol dissector crashes. Issue 21753.
- wnpa-sec-2026-131: TLS protocol dissector memory leak. Issue 21693.
- wnpa-sec-2026-132: Exported PDU protocol dissector crash. Issue 21695.
- wnpa-sec-2026-133: Exported PDU protocol dissector crash. Issue 21702.
- wnpa-sec-2026-134: ACN protocol dissector crash. Issue 21754.
- wnpa-sec-2026-135: Multiple protocol dissector crashes and infinite
  loops, and memory leaks. Issue 21755.
- wnpa-sec-2026-136: Multiple protocol dissector crashes. Issue 21757.
- wnpa-sec-2026-137: Multiple protocol dissector crashes. Issue 21758.
- wnpa-sec-2026-138: Multiple protocol dissector crashes. Issue 21759.
- wnpa-sec-2026-139: Multiple protocol dissector crashes. Issue 21760.
- wnpa-sec-2026-140: Dissection engine crash. Issue 21726.
- wnpa-sec-2026-141: Multiple protocol dissector crashes. Issue 21762.
- wnpa-sec-2026-142: PROFINET protocol dissector crash. Issue 21745.
- wnpa-sec-2026-143: Multiple protocol dissector crashes. Issue 21763.
- wnpa-sec-2026-144: Multiple protocol dissector memory leaks. Issue
  21764.
- wnpa-sec-2026-145: SDP protocol dissector crash. Issue 21696.
- wnpa-sec-2026-146: Protocol dissector crashes. Issue 21768.
- wnpa-sec-2026-147: SCTP protocol dissector heap disclosure. Issue
  21712.
- wnpa-sec-2026-148: iLBC audio codec crash. Issue 21779.
- wnpa-sec-2026-149: AMR audio codec crash. Issue 21772.

For release note, see:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.10.html

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 63a3226c19..ee16b33273 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.6.9.txt
-sha1  8287d01d50fa1269dcfd4e01c5dfd8d00ef652f4  wireshark-4.6.9.tar.xz
-sha256  d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f  wireshark-4.6.9.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.6.10.txt
+sha1  526f19be64b6d19676d0cbad5ecb03a1f5a43a7d  wireshark-4.6.10.tar.xz
+sha256  268f41bdf8acee561b670217cf6ea74cf9e779477543e59f92f1cd00294a03dd  wireshark-4.6.10.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 44f7595610..afbd8d5bb5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.6.9
+WIRESHARK_VERSION = 4.6.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
