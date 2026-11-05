Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF1606D830
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kAL5VaYf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=uMFNfqqm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D974088F;
	Thu,  5 Nov 2026 13:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8wIi5KXEKVt; Thu,  5 Nov 2026 13:23:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B728408A5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793884992;
	b=JFKi05+EJ6gAA4CGaMqs6dDiEEjQYvI7MR9P0ukF8pnbaZfGVua/ubhv/84DqnoEXI8n
	 fNEAxTQ0wyVzd8VdqH+4nubZNZsY5dVrGtarvTZPiKT9UIVZz7OQPBIa3zoMsaI1GM6jM
	 C6BKucPGJyZqk6oT5UZ8erbdxD4pVRJIaPH9UtGxL5x2C/K/vdyhriTY9LVFlSd/Rz2E4
	 pFnIxSp7R282mW+7nIStJ7BHA9Bw/dQRvUVhZs3U9NABJcuk5583e9bhzpyTklSYZZmQ9
	 gxqMHWYReK+BFl3RByBpnTp7XYit1K6m4XZy8NRtPdwOYTxz2wsYoG7Iw750wihSmxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793884992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yIAGJOIcHsWkBQPYkSXlbB3feLY4GLpG+xktGlX4zvU=;
	b=kISCuieGtU7ppm/lallCujbWwv4965yEukmBGK+WH8WaodL/lqUGxO+CTRB0CKtIn7nt
	 J5hafjqu/gBAhh123IIE08vdt+lhaH3fMf53kyWwWmpP4JxlWki/p5YRfQuwbYAuVWa2d
	 BWWvUMvatmJpFE832/qaFFvkZ98w40qEoGmVmrroLtTpA6VvStg19Vi3nl8/veraSbgbd
	 hMAinMQV65p22dUI8GIXNAsnibvRwD2/+Nfi6BgqKVfuNgxJ2zOlcLJxvhWDMTOHW0FWu
	 SZ+HxETf+DjKUvzQ+w4n/D642AgFF77ghQI3XKnHHXWXLnPXxveMpujeN9pVcKV0xFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793884992;
	bh=yIAGJOIcHsWkBQPYkSXlbB3feLY4GLpG+xktGlX4zvU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kAL5VaYf+Y78aSC+4N+RjGgKgRzq3YgaFr5EcAf8mYM1zwhMUu0q90jSVz7xRYLjS
	 fhRa+B1Z1q9OcqgDICt0pYNpYDR/LVQo8Qwh49BttXdFC/MlvlvSZIL7mFzikRZGVF
	 QuAz0P8SLRMqv6wJr7pe09PrgQH9CJm/01BYfpcb8c2zCVsDRt5CG8ejGHzrat3xQx
	 Hv4Ap7DNDAMWyYcqxKpiqtwsX3HCwX8cGTPuW6B5C1IKNLxAZx4qP3U/2+G+X2bGWR
	 TYRnIFBy7kk1FeEnn8KAWHzrDUDY+x/LFgipOTq4DVoC34OqmzzDnOUPIrLGjCaSfr
	 TJOPf16VWwlWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B728408A5;
	Thu,  5 Nov 2026 13:23:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA4B34D
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D3A3400F3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1ANqDbpi2MJ for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 13:23:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 267F64007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=uMFNfqqm
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 267F64007E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 13:23:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c3fd91337baso25977966b.3
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 05:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793884982; x=1794489782; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h1VTm0EDjWV+uCOczmqarXgilsucHekXm+LRI8lWh+0=;
 b=uMFNfqqmb7nHVEADjblFuU2gpwRDb+NBuLjJtrgxFyLR/6YXcla9qFKAEoHjFPx1F8
 wjxUlefl4hIVTFl2pRdGkGlqL3Uxm79+agY8liqFipExiAlxAMWPsruA2qGtCi1+VaOT
 tc8g+JeUvYJPnZx9KLFs5uOo08Vsl1xetX8A5V7hZZVWFws9JnLkWIt9ChEYyWm5BMx9
 6yzBziccpmdX9xCbdon3SNzUvQk1JIPZk9UOCSTKAh0wfDaGNcM0f/PUpeBwBuoryuHl
 InfpAusPL2t9rAJ8NYf1ajQWOlc7cJxJKEl3r2lTk5eH2v9R7Guz8Yfj9kAzDtgRtZ7Z
 0agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793884982; x=1794489782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h1VTm0EDjWV+uCOczmqarXgilsucHekXm+LRI8lWh+0=;
 b=sZ+ynzK+y+TOyStuBLx0/srJjW3fETYHmRR1ab8FE+RRt6PPEWYwuN1gcmHMavabh1
 tlQ+G20pzonN+ZZFX3vCIhGNSUq+/mWKY+kCAVliL5lgjdY0f/+57LXFeRi1sPvODIl0
 fiXSKBzgdnkZqX5ktjJwOE9+yQ6XYmz9gUHwS3kR8cN1zR+F+2dGGRaEnsNN7xnww5oi
 +sgd3ZK/B0mOyFVAb1WRVCDI7Ls0kBlFLcXAufThDWb4q2f6UUFMGPTLLr92kF5IMXkJ
 SVCy5kDbtWErpmlRpxmMSXI/xGet9Ixx5tsmNRV72HUdz39tc/yHK8qbbcEXMvgng6qr
 Fntw==
X-Gm-Message-State: APuU4Z+2Apu30r9h3CzVVrDh82qPXwyo7oeaSZofEJLNnJ4Xi8RZOPqS
 pGKEoQGNuK+kwIDv+axFS6Ux8s8v6ZISCij7sJrwpZlpJ+LTbtVSZcpO1clyzQ==
X-Gm-Gg: AYBFou0MqX7jUvJdsGykweolPHWC/MksE8OUV/jcnUJDXR1TbaJICiy5zKSmQKPTjsd
 UOFckMMSj/hEfLYDztv3tr4YYCIZTmXjeCiwCsy/lHzsHM0B3BRwSXbA4w3ehWiOorglKG8rjzb
 HJgYIh2SE/+5KtJZ2fa6YzkSk0h1oU5/5T/lOylqHu/vzUMS+BIq9fMtGiLDN7VK7POWo/eGTdF
 AOImLR5mVoqEdzAmCaWdRptogGMdsjXSRsS9xVCaAV29qdXmo3q8HwAuJFPTQpejZ8hH3Y4tNUw
 ARXE6Wu0zAtsz3v35etm8lEsm3//T9MbAl7SbhQHN1shdMY+4WkCO97qB1FBFTGSkjB0C8LBJxo
 prUawCQK4FH2kXQGbmRkJJc7+ZD7mt9542WDnaTuuWguxu/oanCpgJGVSExCqd6X0cS0XL+v3Lf
 fwAyxV/4Lzxm4yTAlWNo70cdmOs9YZpA8C9bZrcTMOZHX+Voml+QT+6kAnwFMvRgoicajBPKWqf
 exiM+8EbPKKd1SiSIhydfjztMeaRTLIOWUwdnhp641sUP2m3ymu/EUYjrxL4tnUK/OzSFoje2NN
 +QDNv/CbcCGkQPHRqngnOSIA+AW5zvi+Mw87F8r0pp3L1FYhZLY0keA87BPGdWWKfrsqZzENMHv
 csY06G9+i
X-Received: by 2002:a17:907:d91:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c4ca7a4bd85mr1686078366b.10.1793884981591; 
 Thu, 05 Nov 2026 05:23:01 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e424fa2sm172522366b.30.2026.11.05.05.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:23:01 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 14:22:56 +0100
Message-Id: <20261105132258.1868556-4-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105132258.1868556-1-yegorslists@googlemail.com>
References: <20261105132258.1868556-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/bitstream: download from
 download.videolan.org
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, Bernd Kuhls <bernd@kuhls.net>,
 Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get.videolan.org does not serve files itself but redirects each request
to a random mirror. One of them, mirror2.evolution-host.com, has been
unreachable for months, so downloads fail whenever it is picked and no
backup site is configured, as on the autobuilders:

  Location: https://mirror2.evolution-host.com/vlc/... [following]
  Connecting to mirror2.evolution-host.com (mirror2.evolution-host.com)|167.114.8.249|:443... failed: Connection timed out.

Download from download.videolan.org instead, which serves the files
directly and is already used by most other VideoLAN packages. The
tarball is identical, so the hashes do not change; also update the
URLs in the hash file comments.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bitstream/bitstream.hash | 4 ++--
 package/bitstream/bitstream.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bitstream/bitstream.hash b/package/bitstream/bitstream.hash
index fb41a40ee1..568c021fb9 100644
--- a/package/bitstream/bitstream.hash
+++ b/package/bitstream/bitstream.hash
@@ -1,6 +1,6 @@
-# From https://get.videolan.org/bitstream/1.6/bitstream-1.6.tar.bz2.md5
+# From https://download.videolan.org/pub/videolan/bitstream/1.6/bitstream-1.6.tar.bz2.md5
 md5  3106981310a54d4717cec766a0183f74  bitstream-1.6.tar.bz2
-# From https://get.videolan.org/bitstream/1.6/bitstream-1.6.tar.bz2.sha256
+# From https://download.videolan.org/pub/videolan/bitstream/1.6/bitstream-1.6.tar.bz2.sha256
 sha256  dea67a9dca7eda0d72017359c8d649bd5a9d249f9f9a691b8daf739d16798029  bitstream-1.6.tar.bz2
 # Locally computed
 sha256  9644a812f9a8377a59acb7092a36ce8882a39743425d9171a8fb84637e2f6e04  COPYING
diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
index 44228242ce..af417f2d4c 100644
--- a/package/bitstream/bitstream.mk
+++ b/package/bitstream/bitstream.mk
@@ -6,7 +6,7 @@
 
 BITSTREAM_VERSION = 1.6
 BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
-BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
+BITSTREAM_SITE = https://download.videolan.org/pub/videolan/bitstream/$(BITSTREAM_VERSION)
 BITSTREAM_LICENSE = MIT
 BITSTREAM_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
