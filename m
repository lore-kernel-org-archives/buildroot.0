Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9174C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9320F80FFF;
	Fri,  4 Sep 2026 16:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc_Qr087rA06; Fri,  4 Sep 2026 16:11:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E267580D6A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538314;
	b=B4n8dohGTArIvQq44xdYNUIB3IYtJeD7scr5Q1H27XBo5IZBGJYObruRJKDKlpony0m8
	 fsyWXvtOFLQIPmahTo2LehSZNYPR7ILBW4xEUDpwGbZWSVJNYNXcOFwPOYYTu8R4GmlkK
	 z1rVhx0LVRtgqVu5qb4MTkw+FR05LBIhkoc5j2y5iXbL8BNFckQ1dCWN2KnlIGbVrNau4
	 /9EtBpFYQf+cXSnlkplJfoE55Ps4+i8pFLqvJNZCcm6zyPuiOHJn4b84enrHvDHftPpmx
	 mYdvylFoJUtlqYG8MtW+bK+sTKRDV1lvulWwTnz9Xjjzk4Ncee7bDQ2epQyj9o4v+5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538314;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=x9KVYP2vJFIAPxGdY0fg5mshKj8CZdk/r6DaW2+TiDE=;
	b=hMPyMQUQUFxj9GAWVPoSFvBY/A4KWgQwKviYTTXYGBlg0AL19HUXybU+/kDP7EzPWyyW
	 RVRFLXsTuOy/b4mKprR1goNRMw3DGCWWXwWakl5aCd/92u6z0XtY5YEqgv2oLZFsGDIIK
	 OHaM9l6jNZY9TBGDuwNBJWjPTol3mivOZkohY6gWbhHAxJ1JvHEb3yGbQ5z+QmcxuFard
	 +j2tNkqfWhqTMF2C0yw75pEkr8B3jvxsMzn7jzOjHjHatOy2u4p7DxfTzqJd2AJxyGyi1
	 29AcGuPNBiqAmQ4zozOD1RDdVmFpTIhAt4lFObJGCmXSCKMr1l1u1RwTgFQzrNX6Z0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538314;
	bh=x9KVYP2vJFIAPxGdY0fg5mshKj8CZdk/r6DaW2+TiDE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OO10YTZdgBHiK7HoCQU+zHZOlq8lqIPq21PbiJfqrQ4Ie2PdoEGXgPt+Gj8hSh06u
	 YdRiDL4agM0evrMANn8glADUApgEVbnxuMkGtrsG8nDElQBYjpaP0TK6OhIsq8bkWZ
	 dq1dz5BGmdC/BnUSbHb9pJm+sGaCA2XqK13xLMGDUjPZ0C32naN2HFYIbYLsMn1mR7
	 R4HabEBBBdq/ENPahm1CfA/r3NKFTmACIn3U9dSYIGypGpVmFhzw8xS0H//OtqxLp5
	 bt4bF5O0bhEBRPL+ruLanqJhnu2zJQHRvfygryloCuvkP/x1PJNxSfop7HDy9JwO9w
	 fthgp/b6POiPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E267580D6A;
	Fri,  4 Sep 2026 16:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5079CF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BDB76063F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QREr3lXIcBW3 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B950860638
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538311;
 b=lDAFhhqbDimx7b+JDC4nae2KNfGcy3aQGq5t7dMoL5GXYNXvSGFEHdhloqdsIFdyBJON
 n9uq/LTShdpiQnW23LhbnffAT41895SBbTgRvf//nidiXsAVjq7xShZdSFO92e2szK+gn
 XOsU61U069Qp1oo2FlotVhTjp+hgUUqA3VmyM6DQVYOWP23m/Zgdww/WJo2G29cRENE0P
 JfJT2Y5m62waebc+x+4gLuPESZXMXFmwOmL1PeF+dvl4GZkPYOj69nIElWX02XpU7EwHh
 FnOoFL61lwcJqn1jsW3ZDg1b1fJkBO1RZxAC4IQLSjxy4ZjrCGb8+bl6fn2vpZBJr4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538311;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=yb3aDgLHrAKaUOtUerDli0z45OhskisnjCqgNQznCe4=;
 b=psKK8HZ94aRb7ycPIwbBH+6ygmcnnLxsMxUhU/4JdodcHA1nGg51yCP5ItpPdQk98KJd
 IxZmY+YI4PqEZ49U1ouGebqDHQBBzD9z/rfKpEfLoFRJPI5sg9z+Y/84+ksGKzjlkvWKT
 b1cVsL8JO4uCfj1WCYfAvCPaKdvd11Rvuh/F/mVRfGNCR5tWNeXifAfPDoNztoYhv1ETq
 S8o5xDn/r/6MhFet/jIN5APFpXx9O8i1ZoYGUiJw7MJRbpbA4PGszyAHCB1LmvwTbrUl4
 A3ECbobL+PmnGBtKVfv601GJ353Y39PFDK67FlqvcKL81/IaDvY2T+o4AQ1dluD1kZA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ltbx8jzg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ltbx8jzg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B950860638
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788538308;
 bh=yb3aDgLHrAKaUOtUerDli0z45OhskisnjCqgNQznCe4=;
 h=From:To:Subject:Date:From;
 b=Ltbx8jzgS00byoBPd3Z4pGAORAXmcVvdBYucG6SJ4JZZT4HnjTVwvz7dP3HbMdD2h
 bjedaZqqgacLeZg95PWYQkz4ZX1akzi/M1agQqxAI61xMLmXfvtlIohzPE3rxqdggA
 DQLoAuB/kjOcSEzL/fPFBKQrQIm7Py9QkjlBE8BLu6La5JmjoGRSJ0RET2pY8mA/3B
 M6FPIi6N/6XLVngamsUH53R9yCEiNJtIxHkziXTEBdydtJfu0qJcqWa8h+etRmba44
 BOsewlktd1ZSy+sqM6k54SjSLzbDn8tgIb8Nlq4+b+mV7Q+bEVLAQdK4Oj5V5DkXy+
 2FV9Ukn8N8ixQ==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F27AAA4C2E98
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:11:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53882)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2WW3-000000002Xw-2gcJ
 for buildroot@buildroot.org; Fri, 04 Sep 2026 16:11:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 18:11:47 +0200
Message-ID: <20260904161147.115283-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/strukturag/libheif/releases/tag/v1.23.3

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-x8r2-mggj-j6wr) Heap buffer overflow (write) in the
 uncompressed (unci) mixed-interleave decoder when the two chroma
 components declare different bit depths. Both the written bytes and the
 overflow length are controlled by the file. (critical)

CVE-2026-XXXXX (GHSA-8fmq-r4pf-7m57) Permanent decoder deadlock through
 a reference cycle between an image and its alpha auxiliary image. The
 alpha edge was not covered by the cycle guard and re-entered a held
 mutex. (high)

CVE-2026-XXXXX (GHSA-w7mc-p8jc-p853) Heap out-of-bounds read in the
 YCbCr 4:2:0 to 16-bit interleaved RGB conversion when the chroma
 planes have a lower bit depth than luma. Heap memory could end up in
 the decoded image. YCbCr conversions with mismatched luma and chroma
 bit depths are now rejected. (high)

CVE-2026-XXXXX (GHSA-4jqm-2x34-6f6r) Heap buffer overflow in the SVT-AV1
 encoder plugin when encoding a high-bit-depth alpha channel, and a
 double free on its send-picture error path. (high)

CVE-2026-84451 (GHSA-hh47-fhqr-cj2r) Incomplete fix for
 GHSA-73p7-m7gg-w2jv: the tile range check of the unci decoder (without
 icef) could still overflow, allowing an out-of-bounds read. (medium)

CVE-2026-XXXXX (GHSA-4h82-g446-83fm) Heap out-of-bounds read when
 converting odd-height 4:2:0 frames of an uncompressed (uncv) image
 sequence to RGB. (medium)

CVE-2026-XXXXX (GHSA-9rj8-5mp5-26c9) Out-of-bounds read in the RGB to
 YCbCr identity-matrix color conversion when the R, G, and B planes
 have different bit depths. (medium)

CVE-2026-84450 (GHSA-gh5q-69gg-c964) A clap property combined with an
 oversized ispe reached an assert() in the Fraction arithmetic and
 aborted the process (incomplete fix for GHSA-jc8f-p23p-5hjg). An error
 is returned instead. (medium)

(GHSA-mw6f-29j3-76f4) Several smaller findings:
 heif_image_handle_get_depth_image_handle() and
 heif_image_handle_get_depth_image_representation_info() dereferenced a
 null pointer on files without a depth image; the TIFF input decoder of
 the example tools had an unbounded EXIF tag allocation and a division
 by zero on zero YCbCr subsampling; assert()s in the PNG input decoder
 are now error returns; integer overflow in the Go binding's
 ImageAccess.GetPlane(); heif-view now verifies the decoded frame size
 before display. (medium)

(GHSA-8857-r8x5-7499) Undefined behavior (negative shift) in the HDR
 bit-depth up-conversion for target bit depths above 16. Such
 conversions are now rejected. (low)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/63d70386271ea8601da05d4545e643110c9889e5

 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 31fe79b16e..6001e84ce9 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.2
-sha256  8bd5d41d19dc84536d118b04774709f244df6104ef66d623dad5fa4650143405  libheif-1.23.2.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
+sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 755a9909c4..1614dafc74 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.2
+LIBHEIF_VERSION = 1.23.3
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
