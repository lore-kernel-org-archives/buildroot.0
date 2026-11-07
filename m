Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FBF606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mrQkcCCW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AbNpVJXX
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D99D40786;
	Sat,  7 Nov 2026 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBElZiC7ser2; Sat,  7 Nov 2026 16:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2046D40723
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069272;
	b=ebS9rJYJxFCWW8mpW/te/mA7rE8J5gRrYw9a9QEsyEebsnSvn6u3Ir3HnhLY5ayFs0QP
	 8CwXkk8Qehxs9eMYovp92F4POglBLcFM/6llAvSGDoF/OKLCIXlN6eWpW6O5nNdLEnWkG
	 uqxhWVh28rC1KjwYjzNIUqihJI+6L4MyU9z7BA5sbO1kVCVDMXULJsmyYmMvcqcpYV5KI
	 NsYAzytTodPY9Ho0EkbbXP6ibfBd2g7XbYQzojsMbhPpGA6B16oIAvkP49yWcWAp+62Gw
	 wC+Zw34jIFXEGyCAkzoKbqe8f7fm8IruIolzET14h5Z56XhxCa95Fu5ifhZhOlFzjJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069272;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Q2614aRKy8XOZYU6uHphzCYbpFIB8cUaLthk5QoudkI=;
	b=MJ5bFfgcHSyu6kEHiIjTB5vg2NvA7mO7E1i9JabzZ9wLsvmIlfgS3HEJbvbM5Ru+gxx1
	 cPNeWsSsP3veVl4IW+N87oRu5GaY/28Q8HCIkVVlnwqxuOf4djQHs2BfVPUKXBxQzpqoa
	 0AMmIMwlU3QDGDFEpya5HMgpg+lfWHxLdY3RmGFIK9QCzqBzrdQkKyXBQNakBmgdCNLIn
	 so9rYycfMe+QgZVTXx8vidEzkY3RIcDpOge0npcF2dHlwcU2tJlI9rkuogXAD37rmfnzB
	 36zahsa+WcuMi1XJG3YalM9BT3T4ACNgNF+Y2laiT8p1s/t7DDMswsP8etjJ6cs4cDA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069272;
	bh=Q2614aRKy8XOZYU6uHphzCYbpFIB8cUaLthk5QoudkI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mrQkcCCWnFS3YwwdxDTvbUzJOB5zm3/KxxgplWwjSM0l8DlXfSAE/0u/koDrkvRZX
	 ad/cPMII2iamWZHPWtD9db/RwrXqi+jCfTsgAzqTh083WjJiMDMrtTfX0UoUa4jLbJ
	 gsT3yx88GlapVMc861CB5LofsOY6fof6wOWyisWjzvja5O5eaU6b5XJZyFAU79hmeW
	 9VwlngX0zhvPAd8XOYUt9tJxPZ9Lhy3hca3yUA5kteAR6JJStfvhnbKFnMzZv5BLt6
	 wt+FGbV2HBW6AjXVrxXiOxFwrywC54v4Uurh1eq568O/NLKPaP9eAByqKGgpwrLLKE
	 STDDYLQKyZ0Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2046D40723;
	Sat,  7 Nov 2026 16:34:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F321317
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC778116F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3G-XsMAwS7o for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 38DA581149
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AbNpVJXX
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38DA581149
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so8509945e9.1
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069267; x=1794674067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WtQCicA3DpNrH5UnxWr32NUYLoASUNHcQ7+nfLMmduU=;
 b=AbNpVJXXsH8znCeftet4VynJc16pOKioC7UcBOr5ToiGud+RaAW+l3VNziqvklJ4ka
 K4JzO1yIVC6uSDwNsVY9oppLNB6Jz5pnJLxyYnzyp9eQzkdkbdFIbcHcbe9qWBM4dvhP
 Z06pV4ktZVqR6EI6vD1JPUmvJvbFVvNXOH1tnpE9tNUNjuHLUUs7toc8NnselAkPUi+1
 HmBHPz5aFTyNKR9KEzLrmFujI2IpzoUAogfESwBPAm+6zMm4tVOl/e18PXmDLxNlLES9
 bcG2ln8WQuOM/+AKVHjMnx+7BogJT/1ETDlM6UzvGb9K9bWEb4QSNZhnUypE7X4nzsQy
 GAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069267; x=1794674067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WtQCicA3DpNrH5UnxWr32NUYLoASUNHcQ7+nfLMmduU=;
 b=EdAtwYPDyfqXUYWJya0PpNeZWqa3YRjBtXs9J9QfhUxgFnqJgNjs2T9sUJ6J1uXCPy
 VbOOmhPkLHC5p2E77R0tQupUVtL/rJTfXaUmLLQqztAgtLHL3wiaRtObnHHF1SBiwFjB
 gpXfymrUZ7duCMC8bCPiJgX4fLNAKbKidrPnhIlKGYHmCNMvfJsYMeW1w74R5LVvj9AU
 epGVjTRmnMmZ3F+y2YHT308uZUeV1RV4x22jgFBXqnc+gMMf/4grF1ctodHa4WgpZ4u8
 2pQ7go6YGpRe8oDkrd5CDULelTlcx2PhZoUog7zoN6NSXNGjYDiQam4lsjYkQRE/EOlo
 /7lQ==
X-Gm-Message-State: APuU4Z8RLEENKwCvJfjv1XPTzmVvTvBVNXhx2f6M3w8uGSR/BopHhYba
 NA5lSaK8ZpwrUf8j+B0VWswnakRRz6fNnTgzVRYSMEa/KaKfqdeaStyju8AbTwRO
X-Gm-Gg: AYBFou2nJkqvETocs4BdnCW163gHuI02hEUYUpUCRayKbWS/IUIvYhsHwWuHrh6iwkY
 qmL00B/E4yBTvtztY5fFPmC5GU8fUp07F/0qYEJMQmlBXJPq9qyY4t17yVnSw3gncLsjevGu6EW
 5HgTZSViEKpb9t1mgarVSz2QfJXfkwc+T52H6DoBxtcsJGNS/alvFO/dwCsFONiZSeNgzWRme9t
 AGaOtvBGTM3ZKCnXzE8GjURCFebQBH/V+iBrlCL4JUC6X7+eGxr4lQ6whaYp46lYLPliCOHgWdG
 O3iGmhLeTMq3Tbinr0pOFfVdhMLtM6sCg8bdncfvc2YBVdJafsnrKgiFHWvJvqP2jJF0MHVstja
 KXw8oeJye1z/nzbRuhTidTodU8J3usEzNEe1IeFVTWn8f2qYPvbJIKqGlSR7ZhuGwEpXlyRIUua
 fCXX62bXHyoQ7MHeAtNBGgdSpXxGcERQPbRtfnu6egV3Nz/kQUtRXQ6QncQflsMVn9NJRxByl2+
 gfD1FeuGM7qqDhjlKec3Z0dw6HiK4Bv2psJVBGBkEfmr5B92gkypQTzcStDREdMNa3ulQFVEW80
 Xyd4OuclXfd0m2uZcWNPJKjklO+ZNG169j2d9nvXhG96xKEY9e46
X-Received: by 2002:a05:600d:82e2:b0:4a2:18d4:f9e0 with SMTP id
 5b1f17b1804b1-4b6df6deffbmr106736655e9.25.1794069266396; 
 Sat, 07 Nov 2026 08:34:26 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:25 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:03 +0100
Message-ID: <20261107163414.560896-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 04/15] package/andes-spi-burn: fix the
 license files variable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
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

Since the package was added in ee9d6414d1 ("package/andes-spi-burn:
new package"), the license file is set in ANDES_SPI_BURN_FILES instead
of ANDES_SPI_BURN_LICENSE_FILES, so legal-info does not save it and its
hash is never checked.

Rename the variable. The hash of LICENSE in the hash file is the one of
another variant of the Apache-2.0 text, not the one of the file shipped
by andes-spi-burn: update it, now that it is checked.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/andes-spi-burn/andes-spi-burn.hash | 2 +-
 package/andes-spi-burn/andes-spi-burn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/andes-spi-burn/andes-spi-burn.hash b/package/andes-spi-burn/andes-spi-burn.hash
index 5022f0fc1b..adf8b295a4 100644
--- a/package/andes-spi-burn/andes-spi-burn.hash
+++ b/package/andes-spi-burn/andes-spi-burn.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  72a5b016ebe0da77662a10edb8078c29cfcbedd8c0ff523d299248e0b1fb84dd  andes-spi-burn-5b8193c35360febd8445cfa32adc6b13a861616d.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/andes-spi-burn/andes-spi-burn.mk b/package/andes-spi-burn/andes-spi-burn.mk
index 8ee5fb2897..599b1f6fa1 100644
--- a/package/andes-spi-burn/andes-spi-burn.mk
+++ b/package/andes-spi-burn/andes-spi-burn.mk
@@ -7,7 +7,7 @@
 ANDES_SPI_BURN_VERSION = 5b8193c35360febd8445cfa32adc6b13a861616d
 ANDES_SPI_BURN_SITE = $(call github,andestech,IntelJ3,$(ANDES_SPI_BURN_VERSION))
 ANDES_SPI_BURN_LICENSE = Apache-2.0
-ANDES_SPI_BURN_FILES = LICENSE
+ANDES_SPI_BURN_LICENSE_FILES = LICENSE
 
 define HOST_ANDES_SPI_BURN_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) -f Makefile_SPIburn
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
