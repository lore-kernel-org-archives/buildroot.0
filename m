Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534DE606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ddxYm4Lt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxnI+GJr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E4460A51;
	Fri,  6 Nov 2026 19:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKPQftsQGybn; Fri,  6 Nov 2026 19:16:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3809E608F9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992587;
	b=YiPtvFY/F9dHeV4T9qKJeVzoW02QYZkkmL/4lC3NE32Y9hLJ4k0p8dJRTOorvPxaLy6r
	 6Cdd/Y+pGsk39hzge0LMf3uOOyi7YOZs3vx2qJxa+woY+DrsKBaLTdiQ0I0ui/bsI2o9w
	 0zFMel3ffeGINjZx22I05iNRzfnuFcYpfH6DIdzHUJbljX+nxN2kUg19bK2imVDBo1ass
	 QSXTxpENlRFoBcd+gm+DvHSdNODXKglkhcO2UBWOGjET16vmP7Jtshw7ZgnK/T6FWkSFd
	 mQwHcu0rxTignrK9yQNNqtwSn9vx2qY1C9TSiMbqV4f15+eKmpBSdl6von+3qXIB3LA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NX3k7EmvIFpad5y4C+iBCOPqJJod0j+AT/sejSYn+t4=;
	b=UNcNxFbfRUjP3qdHueJtjzFnwJN9NFyk304ACtMf6gUgSkTmaCEGpJf94OEiEVfPevlO
	 TCKP57nJtRmUvKm0UfyqLwGM7ZknOpsK6J75RvvWOwyK0728V3Yx3DY5f5AC9KcMZWAD3
	 eXF3PC+vzaF06Vgpeoxyu/Zc6nd718GvdauncaukQd6Jf+GNiMpE4bNSMhN48AbB6A4Gw
	 8WnorZ5Kwl6wLDJsfWLwobpDfetWNOdtU6FiWz1CsPCwUSRXoB30qW2pAIv3dM4TFjpXD
	 c0hEqxxz9O9BQ0WwjkdLHf2tipTDlHBBgFiJs1Xox72vihwHBP2Z7lUP7AU/1P+J4nQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992587;
	bh=NX3k7EmvIFpad5y4C+iBCOPqJJod0j+AT/sejSYn+t4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ddxYm4LtTayMR0PmTY3VPjA2uY2j8SE9jYrxC6gARUPtdpzjaUgh9TyqVTH77lJjr
	 fvrpjeH7JPf+xdaDp3BHKdZ8NmEASIP+Uu7tKKsQ2PiMKipa7Nafxhy+wkFyz8r9AK
	 s/SueLAVwIqWeZqQzqZ6SABONRm0DKNNa3S4DOBnW/1Qppcr/TGBv/O5AivCFreH9p
	 DnIX5Z1v5c3IokLS6b6uKuJWmPeRqiGnmGpBc0Une7sVmbnUWkosCc+bcP+fZiPjh6
	 JfqvprysdAq3t9SvzrnYeJGajoNroKAoXW+X049rYtAjQzLyG4pt0Ch6Vu+/WYmJfS
	 kQATBgnCK3sOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3809E608F9;
	Fri,  6 Nov 2026 19:16:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30A23362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 222118130A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5M7wpj-5v05f for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9611081375
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=kxnI+GJr
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9611081375
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:21 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-846566246e8so908490a34.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992580; x=1794597380; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fRdXJxtMl0y+kjZIQzeGpWjrFqADG6PsCH4x1YuxWig=;
 b=kxnI+GJrTzI5X80gs4+1Be3s+2gRMhOg0ZBtA9qMCKAMf/KboJv9cPlGZo9nvWHexo
 x7D4P5HgGOplXRcVe8bwHhaxbOjNfYdn3Mj4OEVFjPDd5PgBJ9gWR82D1BnMRvyvXWkt
 PVZNjIicwnlLvwS1EShKIwiLY69YoWwp+PSaLTqoydG7D4Gbw9yqzpziGLb9sxyqQtGy
 5tz1MMN0mjFy8U8zyJJESXzzIklW1QJXV8jZfvmWwqLX5fRXPOCybm5UKDyS5d0LW/xl
 3juWRFkEwkKWmT4rTj2qQ0Rig9FlNwTpyyiFK0qjPVPqYAQR7Mt0dx7pcoajIg1rBExy
 uKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992580; x=1794597380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fRdXJxtMl0y+kjZIQzeGpWjrFqADG6PsCH4x1YuxWig=;
 b=v8aiKGzKhkU/QlsTlWQm8tXXTE9HrNUI9KCsvfZHMXLdmKgzwo4agT6z9dOPMn5iq7
 G0s9bxrT9B1VLy4v+RglATccm7EQ6bo2/Aslp4OwMltYoFRRbot0ULSJ+nBiawFbScJA
 6uLn7Qk1A+m3LJXwzMlUNEbdFc0xT22TumV0US2i/KIgQTCsKufMKXeZoiLxKHJj14jI
 8W5zUo2+b1eLMih+RcJbQ1/jxcw6YxJOhP58ftp85QCFG7cL/tETqXMBFEW3Qn+S7WMq
 62nTDuOKpPlJhj6cd3K8ceBsa1B2bsnZFvom6cjeAMGhLPvTgibJXscVkaAdR3MqPBor
 aE1g==
X-Gm-Message-State: APuU4Z/0JC6FCAqOssw3q9GozxrmKPyT3f/eE3orUtBMW7TN8Wb+aQfc
 w8wekaRVUf/Niolyc4Ol1crbZYnQyJJEKeYx0ku9zJ9CtGlYjdSyABSxNsQHRw==
X-Gm-Gg: AYBFou3w9ScgYoWGSI4X1pEsVO5sn0PlwhjntnmDz/QWkyy7kSaH0fvCoPiyYQ7SEtT
 XscU2ZiFznFbpDhJJufDPqX+XiJGzkY34FTWiv6MPtplNstsFYoBS7vbDtekct7PQIxlHYrfZyq
 T/Zyj/Oq6/aUXuG/7HZvCpAyMJ9H5ttKLaFkIi/boMYHRBunno7W3Dz6gF3mjqii9VkS0NyispZ
 SfQcZfyCgO2/zWTz5dt76pMlBXUzZxah9GbCFJ8k3aIrxBy/tYBLYisJvKaKmkAm6IRsUNKhOJL
 2vAcfrRykmyw2SuM24shVKRn5vUoLlLzpMxLc1ZHXXY1RyuINr0uFVNrcbTxIE5qlCO+4VNKdkl
 sy2Wvh5rZ3OqSiQVrQTSBph1O5TSCdM/3H0hrVJvM3MHtGT0b7iuzQVh6bori2VRrX5bDXlfXj/
 cz3zY7MD/BSSflihrtaKgiEF9pVJgMkBsGjbQB9y2/7HAwMbNVu6q4qhTLyVi5dDOIJmyUPUO7a
 1yLmzo+e8OcNuOQH2RHsZB1jj8uAitaBOLAy6qECCWq6QtBnDqGv/6FRQQw1AIAcdjAAQNC3gCP
 7+wIlZ410ODtnZ3kpBtUPS5TyXo4JLgPulcNABLKI6McZ1jFPBOVrFmmhK0MxXwJWfH9zlskKDL
 +Ui1g/kmLKHKRnVP7z2Fa42CY5WI0NTxg+5fx7plSFX1mdt5pz83z+z2H8I9NikYv8qu2NQ5a1e
 j5ArrD3iZgbjcMXUtLvjZIewaxrmhUWAe0Uk200iBR1Jjj4XHIfPY78gSu01C1eTLwNjSuBWfIl
 w==
X-Received: by 2002:a05:6830:270a:b0:844:53b7:9890 with SMTP id
 46e09a7af769-85f0586542dmr3778208a34.8.1793992580111; 
 Fri, 06 Nov 2026 11:16:20 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:47 -0700
Message-ID: <20261106191536.2120153-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycryptodomex: bump to version
 3.24.2
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 3d3c72172c..58ad8f310d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  1ae989574479d8b5f5440a68a4159148  pycryptodomex-3.24.1.tar.gz
-sha256  09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356  pycryptodomex-3.24.1.tar.gz
+md5  6d4ff7c5db59af922b6f5e3cf3dd21aa  pycryptodomex-3.24.2.tar.gz
+sha256  e4dbc29e2575365d15e272f769329106277649aea081e2119cf43d66950f8f8f  pycryptodomex-3.24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index a9ec4b25e3..a12f976c50 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.24.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.24.2
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f4/e7/50e72301e32acb73a314e663c2014e1ddefc019d5f434ff14ec89861d664
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f3/c2/f5855412372e47d635599a97c00cfcf9fc40accac9436a11bf9ded19f859
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
