Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5665A606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=W6CQVEII;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VNm1W3yU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 114C5605EE;
	Mon,  2 Nov 2026 20:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIAmK-l0aVrO; Mon,  2 Nov 2026 20:11:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2B0D5605D8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793650312;
	b=XozpfWeuAEcsl6KyrYn4rIgR7U9d7hPqDJAutlpsdHZuKrT5X7u61qM4/fMVwPVgwm4U
	 7xRIJGHzTms1PZWxpBCi2PHljUYG+ffyf802GQVZiFcteJgmYg32OsOhDLcO1tTwDw/BJ
	 6GcAQR9NKrHjtmfSDAyujlkg2bQcCRpZttLh1BbVThlyxbAFv6x1zw2h818DcSAbNibca
	 UPyIyRMJOnz+HLttjkRCPgR5mCwqNUPxh0+G2u15/kHnqgDM4faaTPoKEFF6Z4DpAHGsL
	 KpVlpYF3QwToMDFHbOkUCwkpNDhxxfLhbmt/f4kGxCw2Oz/Qu68fXNUDyrWsowE9Plg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793650312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QXpakDyoHCmkk232UxkLhGPOBwasbPt4nQ2TdtF50K0=;
	b=qbQ4C+9pFq9coRgkCD4g5EOu15UZuDWTg5sDXjtg/RymO0GNokh5tOVj+hTME4HA9wz/
	 L0yjDIOMj6xDWC3Z0QWx9X6kgN4LdE5HKFf0aojrHNoInIihu9F3whRooCj64EmL1LnY/
	 FphdHrXSUwx9xDC8vDWZ/f3hJZ7ipIGYNhvxUCyhcVByyvcP+nshOw707kRbFRkiaCtXL
	 ZlCDxnQM4w9Ea/JsUmHZcA/lQ2P4YWAtBwIvqHc7Nc8aCvzqwdiAUlhBwlmWQLSr5zbf4
	 7hoWLMqaVsGHlrUyXsEN7bgn7bPS6ZmF4yAAaoCvUuzZhCLsWaPsSaeNTeLsw58FFzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793650312;
	bh=QXpakDyoHCmkk232UxkLhGPOBwasbPt4nQ2TdtF50K0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W6CQVEIIjrhKf+9ZUhtgS9gwis3wMmoT+y1cYHCKoZckPx9GG6B3aABTPCbywzdJv
	 ru3A+AoebYzOR7rRm2/2Wo9Wx1fxHVlx+wSBCBub7ajMg1a7AFEAFx1+H2LVZ8Z5oy
	 LFFUgrxWaiCB9NNqbYUL1L1DyNOKxsW+kfftiu5m8c/gpqCctvNlvxoxWOFMIQijzY
	 YoMk0sgUcrUIDbBf5N7KLYfndHYH0Rk8Zqsxkl2WyAMJEm1EmPZN4tscEAzmL+771q
	 svQhQEaNOHJwpjZVQqLv/sLsAdINL7hwR0BdFBgXoezzYdVfRXCA8afJGoU1mNW1T/
	 ndEZNBr6Gr4zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B0D5605D8;
	Mon,  2 Nov 2026 20:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D05C356
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72A0740582
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0hw-FqcZ34m for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 20:11:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6CD50404A8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793650309;
 b=IrYL4k/dE1pLUnxz/gYzuzPwB34fh/MRgIpFGFL3ijTzd5oKRIZSEJ13iaTDL+4jkeX0
 3RqtyY1oO5qDiNjv54hHpVre7Mm7IAw2wZdT7PiaM2vn2Yq1QpMKrY+pt9AS7Qy50PMhS
 Q5Gb0/lErr0ntAQRULlo15DN02ozDIpUXxA6rFM6m7AeKS+uJOvqS3/e06HCwRiSMFaMz
 DL8J8Amsr5sVfdA0sT143PAlgUlohjjEF75BZlX73Aj96ho6XF8IoB2wFrb/54e9pUmgJ
 QaEJ1PhVrSOYYk2VwZ/myCq2lDg7mo7MPAkyfha+0CMTl1QgjbTflboA0RFv20hQYAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793650309;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=jU7VV2F7/Yf1lyd/uX8+ixtQs3bra5Jdh5Rcqlz2qfk=;
 b=kOKlfZ8G2uYviar4ZOzhV7bcvhC97HJSOMN223CC3ahTREQTrguqrS6YNJ7oxU5ppWJ5
 tlLxtEERPxQS/oBdG83izME2ZLWBSKYl65sF/QZhwu3RhZvISk0FC0KM2BKHnnCA4RHlu
 uFYt1qDT/dhySUjBQg+euCPRm9r82PGoT4WXDpsyj6MtmJB3wH0nyvcVYEBZu+DdC8Gbb
 fysCw+fQcRcRdsd0JTsNmpf3/DSHEPSW/6XrdeuwNMu3BCYWDcrf1dHuqQzUTcD4Xfyaq
 0n11XKyn9Rc8Niftoy61lod26SrGEoSGG+yrDLiRzErx0ew+9W9AJ4J+HQMAdolGzUA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VNm1W3yU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VNm1W3yU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CD50404A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793650306;
 bh=jU7VV2F7/Yf1lyd/uX8+ixtQs3bra5Jdh5Rcqlz2qfk=;
 h=From:To:Subject:Date:From;
 b=VNm1W3yUOBez1IXgfQagVUe4o+4kyzxeXgVL2xErJXqDSQ7yYYQndbBdRptZqQVAR
 uGBWPsg/m5EK7+wta77O8EgEICrraHCFWAvU9HVKCOC6a3344zHFnxDX9IsiTjhPl5
 VcCusVMqsFp3hkpOgUerfUc2idWSfq+vBK2N1pGPbb9i8yhxwtOhKd+UgFfPFGNp2R
 6SpaILPtmeRkrN6Zd8qVb+s0TQI6nf4AqKX4tKrfekL4c7cu6lcz59yWpU3RDbtcB6
 jre6QWA1tGicywuuQspurkUdF+woxNFcmsCrgVIBDuCMA/EsEqNFlJGn95Qro58iM3
 XaYmQAINWdSXQ==
X-KAS-Sym: v3:f51bdf72230551df:Xp0McvTuVdI6xYIdn/GKl0xgZgA8qMiClKkPsmgM2nlEd
 mNlzTNzUwPMGiQJM3Amt1M7jy9O4UxyeuTrCmaENZ2RuXHEqk3UlRPpaHqVjOvvDio62Wv+6baJ
 /zOy+IzLLpBhVH9QFGAQ/5soQATJQ66i1SlM/Ow8xPk1KfeM/xaQaxQYj1RQ4upr7W16c1TzUZ1
 S7l1mR0v0ABdXjCR3ayIp1oM6wYeyXZXgBBIC0kt5bI6/x/ZIBP+eVo6Tp3qLZAiyUpy15SeQsZ
 ZKYVSV9FEU0f8iymgrD1P/3+92olV5syCYrQUhimgnV8GjdIQsiW6DK1IOl5wq/SRV4wP0XQ==:
 XmGFoLjpQp38OzWdGHWXLIc85ej8Q5TtYh1e5B/jZlMZ20JunJW4GyCq/NGH707/wRiPpn51t8i
 w7lLcO0CDTHIz1q/VjL2tx/fe5YLlcCzBmu+A+XaMR51fP24+gKXcgj4MAmHZUjyGGzml2OcWeO
 1lkeApzzpUSAPMbLxcXnd/LF1GUhlnCZd5uL5C6mYnFxqamZy48+jhwI9O+tCpgFcFM15DmTP6Q
 bFoscu8+g9jH+cRSJKXF1aLuGMW9mdhEHb4SUp6DzJusVXR44S7ibAlchHNS4jPK7XzQrgos3NO
 kwjEtsK6VklhoY+qSWPrhMSBuMFsN3nfya2dFh1A9c6j1INyzmFeEnz7qJuUjPNH6IC9ulUBWaw
 NDPyAEDSxxGEaPjHwiLm0bYmHnK4QXSaYw7Vm2rhJw5p/I7NGAWDqTrvha+/kLxbl6yqMENQ4vk
 LUfIro6TCCNpBSW/6eJUCb+9iBXSS8JVxmijjwaT81EEn0T06i5xKsh3zeOIITfzU8gugFNtOhn
 kck0JTQvqJ8x1lMVTfL9oTLdh+gRxUgTwBDoQ6B913D/mHpFWRBRsSzR8HNjtyKgsUYmDXnsFlK
 VG86d69aA1EiRtNy8nRG5e4VsU7ujuAduVrZEkBMX5Yq
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41434A4C0A99
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 21:11:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51962)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNyNe-0000000072O-19BR
 for buildroot@buildroot.org; Mon, 02 Nov 2026 20:11:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 21:11:45 +0100
Message-ID: <20261102201145.11099-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.23.7
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/strukturag/libheif/releases/tag/v1.23.7

v1.23.7 is a security and bugfix release. It is ABI- and API-compatible
with v1.23.6 and is a drop-in replacement.

Fourteen of the fixed issues are rated high, so all users are advised to
upgrade.

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-xwcv-cp39-m2w4)
CVE-2026-XXXXX (GHSA-jx54-6rm6-2cgj)
CVE-2026-XXXXX (GHSA-fpr5-xpfr-vcq3)
CVE-2026-XXXXX (GHSA-35mc-3887-rr37)
CVE-2026-XXXXX (GHSA-hpg4-g2gc-pq42)
CVE-2026-XXXXX (GHSA-9rpf-2x22-78m9)
CVE-2026-XXXXX (GHSA-48p4-gj45-w9v6)
CVE-2026-XXXXX (GHSA-2g6j-vhr6-6wrj)
CVE-2026-XXXXX (GHSA-7qm8-hj35-269r)
CVE-2026-XXXXX (GHSA-hhg3-fxg7-3gxw)
CVE-2026-XXXXX (GHSA-73j7-gvm9-x8q6)
CVE-2026-XXXXX (GHSA-74mj-m37q-h3q9)
CVE-2026-XXXXX (GHSA-rcqc-842v-m26h)
CVE-2026-XXXXX (GHSA-pfcm-ffqg-84hx)
CVE-2026-XXXXX (GHSA-gff5-3vgr-p8h2)
(GHSA-r9cg-w542-g7hj)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a910caa88abae46d79cd4cd4f7ad5a1940364126

 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 44e9c54781..d9f3d41470 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
-sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.7
+sha256  f7483e818503ea6224c8863e4a56ac02c7089021a98472c811c12aa19faf2475  libheif-1.23.7.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 179c952566..f53cdca4a2 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.6
+LIBHEIF_VERSION = 1.23.7
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
