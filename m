Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D29606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hYN0YC9k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LILKl33x
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A971E60D58;
	Fri,  6 Nov 2026 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_Nl0JiCu8vI; Fri,  6 Nov 2026 21:19:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A6A660D6E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999968;
	b=VVO7Px9C38h6ylWELaEWpc5QTnRfEjKP4soSo6ogMoew9MD7Qz9cdyLfIYZPjmblavz6
	 RJpx8/9soA4tyESkTLSEu6K5RCP1IRKsSAmaiYOGVPAiOn0I/BzgLztKxFEmLAgxLFYSD
	 vsMjhMDR8+0IYfD6+xwyVzeAh2ozP7LilkatxYNO3OhK12WOV5rXKFVqWVcvP+1vaKb4W
	 i/ut7xYORHCIUybj09fH4OszKUZvDG+1b2xyz09KZ9pQrka5eZiKEV7pqNWXoaANG1QWM
	 NOlPFj2p6BHwuI3XwXbZ7qjw4N6OQHinqGlxZGNB+guNLtUqF0QjQBA0477uX1GmInQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CPeJ/baCLwYkI9QilXbR8Hng5kLPpthAFs5b4EShMbU=;
	b=E8s+mbDoX97KIahhy9TEQgR1/8JOAiGCc2JECIjF14I3Ld5qserPFWxGiUc5sr/XRVfj
	 OQvoHv4TbgXuf7hMVDwE/roBWt+FhOHAQa3lboJ8yDJk2WSMD6jdoECwYMXU+C04E2ZEg
	 FsO3OzTosYRGLxu+nSbiw0PTbdU3swSd/YHxDfIzCTSvXbb4pyNUj9JP9IvZ3d/P6lY5+
	 1RQBvK41o+jyjj6uNGGRVGnqkbxuq3xvoD1R//kE/coA2uG37RaL70xq3SiWdvjxeWgyM
	 bhlD2I9xpmA64jJ63dQf78ySCEdV6TZVrqRD9S9ADWfs/FegojJVzixgd3Qx9dmT/TQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999968;
	bh=CPeJ/baCLwYkI9QilXbR8Hng5kLPpthAFs5b4EShMbU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hYN0YC9kWf7Ii9TkOs5PTd57+SXDrrOY9OdSL2MFJyJPfiajrao+XZ6PVIRCXzzn9
	 Dcmolgg0Zyz9BROT0MDm7S+HIH6vuu/6OBQ3CzCVJbNYiK5i4YNUg+O5OTzev/7djc
	 uD5huI8OPJY1Qm+9mm6XatsdfAyKK/P4RbAsNS6lfT89olwU0ngMSQkAO4j6jfSj7R
	 6qjtlbKea98PkC1wAPy+/urfLok/cFPO7oqSbN0eTbwJrxvFJejqJf7bdYZWaM79PB
	 85skH3rrCuE/sfCZojF/bK4k1WHrfV8xu4FBRuTts1P4mMdKbHB/4YBp6JStPNzLGW
	 +4S1LD8FrHIAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6A660D6E;
	Fri,  6 Nov 2026 21:19:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 485AC31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A4B8403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f92R7RgHkdzK for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4EFB4400A2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=LILKl33x
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EFB4400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:19:24 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-46556b9e02cso65606fac.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 13:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793999963; x=1794604763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UHyeMtKWE4YrdQ9Zbv2QpIv8zyFMokzDDtUwd6h2O3Q=;
 b=LILKl33xPkQ8wit+HZe+GHHXKIkXKNlY+3cWv57jxgq6cXGCNnTKvbmvD8x23872mn
 N7yrmDG7FmcYCpW8md6TTC2pQOEwyB8os/JCfbSglF2DZrjSCQVs+CPpG3+UFbnClgRh
 Pn76Pt1VduUFq4mqEcruIY6NuNFQRWjVCZDdy6KRMjzfbHSgaR6T/wHzpKJ1m+0wcVMt
 JDe9PxIGzAPCE9ojqG3frDKKN7eaj0md0lfLy5kOnbIUXveZz06bhXSwuVyIiy7/fMQx
 cb1DmaIAXDX2MeqD3kZrf/mayqv34Zir0QmZKjvd1OeQ8d0U0COV1WfudFDlygNiTyfD
 vuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793999963; x=1794604763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UHyeMtKWE4YrdQ9Zbv2QpIv8zyFMokzDDtUwd6h2O3Q=;
 b=uCP3w/RG4LtxDqlcUL7cEoAO8f++TRe48YI2MKvY9M1I1eTXDM3YWxmdZMHtDiVOzw
 s4nVL2cPnHw+69kdwxWg3Boi5kuiOQq0HPaM3/ew6WHuh0ut0WRHoMjfLTtYO/muOw8O
 nI0CRGfeC1n9IgPtz8s6CQMrds1dbVFEqjJRQYmsyyXt4V/D4ZXBJOcSd8OMBsqqE2gl
 ETfoAuaYQr5IcdEi+2ooeecj0IPPOKxyFXAK98ZPIhq8j0Xkq7WrXsYW9PTtX84yvOEh
 LuCZ+oaAeOxWtDeqKxlmy+i7R/10oE0HKWcuUwGgdyia7mEbE31XUaVHQVoK46tVJPAg
 kTQQ==
X-Gm-Message-State: APuU4Z87UE+0hye6XDoXB4vEsz7e8NVTlhG4GEBQrF2qbEXX+CaYgICH
 WTPvPMZCzN5r6Fevq80eSA1WdFiPmAaCJ2AqQ1lzamz1Mo2pzuPi6vZRBqA+4A==
X-Gm-Gg: AYBFou3wL4r3Wfn88Tue3mXtuoQpMfw6hoituUa9H4WAA9fjqGHNgm+RKAxM0hokchu
 b1SkTIg9RzwzEA9ayySGPN+b11eVuGY7Tucr12HCSDgxch9U4QX8z4ARIyVHuDdHqQmQOfY3PQI
 tezF+4UcU/NvKiozsRWT/LYgsWn1FW4dZ0vzMearE3exZy3MNHY1bCsnMIWAl8Hg8W0MQ33ZZ80
 Ka1IOOQzZF6EY4OQb0KduIrvNS4IMEBXb+ER89jrMPW49CxzOOQT4p9Ut2yNMfjIEyvoahLkVE6
 2Lm+PrBqlxKKDLxmKCdEhR5bMtuJX+GM2Eqa0lzBr4GUGNaYcaLIu14MzLkT8ivDf5U8EZFUFlG
 bHvLGEPhNIWaPzyWa8SJeqA8/gdtD+dKMcCPzVWzy9p8TnwTkHyHaWNeyHsOU8HCQsZ+CLA307T
 N1msrzdd8BUT4oUWYPz4q1w6YOM53OxaSWYDw5wIRE7DWPqPX0fsmw4RWomIRCxMT2q32bckK/2
 E/sMTXVOsNQ3zu3zKIjRHe8lY6jT4PNaO1/2VVpDmC5M4Y43nIxD6evHVwymfGPZeuzzK1Hv6Uk
 xIV04zdEFugW0nRbdTu/xiMrCWDnL/Ylz2ARIP8ylwOeepJt+o2jHU9OEPuYcE+l1Pi80GnQ46U
 BNqiAbZhiTnG7Rkd/9XoVCiQP5U7BP+uqwclh2wvQ8w3wrzXAwI760gctaKQcZ+DFxsmzLPTZPQ
 BIyg4DJOqiNd2tBHqkBS4LNYxb1Jl9sZPv02phEBPQNr8uDPkFLsnW9hx5Mg8ZI0yDOoDKUblN
X-Received: by 2002:a05:6870:b909:b0:49d:c800:c431 with SMTP id
 586e51a60fabf-4adc0db6cc1mr128472fac.28.1793999963000; 
 Fri, 06 Nov 2026 13:19:23 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4ad979d7032sm2873593fac.7.2026.11.06.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 13:19:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 14:19:11 -0700
Message-ID: <20261106211918.2606369-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-maturin: bump to version 1.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 45e8492bf0..678456ca4a 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  df0b5d46b6a70ec13b5610de795e055c34b8cc898640c918b14e22fdbc92c9d0  python-maturin-1.15.0-cargo6.tar.gz
+sha256  ad246fc2309b2c0a5479872929db5ff001fcc6670b78eb2d5ee376deb345513f  python-maturin-1.16.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 5cab6697bf..062d734cde 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.15.0
+PYTHON_MATURIN_VERSION = 1.16.0
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/bd/71/eb078174335ff30bde1be2ad54fb6256db4b160eb3efa81163fa30f8c814
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
