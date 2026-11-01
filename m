Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD1606A329
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z92Qo9zR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=k8GoOWXD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F2580F40;
	Sun,  1 Nov 2026 10:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsGJWLlEsCSv; Sun,  1 Nov 2026 10:46:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6ECB080F39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793529970;
	b=iiqdcup6hG8vpH+/y1gZCtQnz2tn41I4lyqTBCeY4e0qmJs7k1WauFZDewb3VKscayqR
	 cUlLndiHoB+fYLhIynwhPKYVx3IksYmrALy9Qz3FwIRtWHF49yp2UECsHlGMiQdB5MTI1
	 YHnIwB6ftC6qoTnLq3sUsG3kaLSC99xQC8r1JszbTX3aBVHE9A350i0siEvf3QoncEA9C
	 dNxsbppNePp3t/X4oA/JI4LYmML+X5q3uN380kkAHtfU9V1BvPInn6n+lffnh1XRU4jVR
	 I3bWqJ7CUM6YAS3xH+Zem54Jh7utjHT3KVsk/54jlE1OiTtPDQgkgEXTuBMuiEHnK6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793529970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gp1XMxGudHHIMyOLb2YRgmeofcJo0y44L0D40oQdf+Y=;
	b=WL0owbm5zOG9SZSKViJEf+sy9k59ADB384pDTacVAsKFSFKVGE475j17ThISoh8xcZwc
	 eA4p7LoKZ69AkiD3cI2AfNuF6x9Lr5ZZr9g2BjztcwUVXyC6bcJK+KGfkJjuKa0t4qGaK
	 H08cwZSljlGfNmZNCFnXChMmGvXbBoFS213KdDVFMJLSSqeTGqFlS0h/nNGEGgN5wdVmH
	 T+kPk4GvBIY3rkDKUCjAC2o/6LHggs7/uaoxlNufzV1fKXX8VEMdeqCNFp4dbDDf057RI
	 oENIPHXyko+IBtRW8yxNpfdafRV7mgp9AJk5RbJUVlOHRKLRRls4aaQSZcn23BSGLiw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793529970;
	bh=gp1XMxGudHHIMyOLb2YRgmeofcJo0y44L0D40oQdf+Y=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z92Qo9zRLsHvWtLN9rc80o7uVy5oIvGDfRgoPyeRyOtGajhIZgcGUmpy8byIGR2k4
	 xF7sfRDczqq9lpIkmLZMkesg0fSEBWH9w7KZ6DozIgKFER+HvYlP2RkSsDG3mRlW26
	 JL/ySuokCfajEvDTvJWp51Yg8NNB16vfQJ5QOxA4A+tbcx6azOmhgSoN+IF4EOrMH+
	 vK4aIBQQfcTBlPdiHfEOv+M1uXAwgK+s3KUaKaouW8yuBBZpei9PlLEAni2hByT6Pl
	 PM5I537XwCiEeGOfe6Zbq9us/RBaDTyf+esXWX3D2Rc98CbdTQyTjV2w9oamX2C4h7
	 s5leSWBFpeJaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ECB080F39;
	Sun,  1 Nov 2026 10:46:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC23323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A0940602
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKqTCzNvR9Xw for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EB7444048A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793529967;
 b=NQEtQGWPWkB099RcI+LfsThQdXqZJxh5z+3+YSfunL448MDQN7HIkwVitu1pp0XmubXG
 W+XLNKwVMrElzrUWtxKA0kbN9mO1Mw33RZRupU/MXO1YlSAOqoLbtH+bNVqoWvqarn7Vd
 22edNADtd0el7zaXTME7SkF1GAuXMS29aWcnGUX913OmSjOKaen8HDBOe+399apwHcQhm
 Yi755C6mY1O0jfWlJUp+TwK3soRtJk5vknN/cy2ozijv100BjV7m86YuYPR1b0JFj9CIs
 NYvksiY5HqQgx08cg5MBwG+OWyMBtkLod6JuFMAEssumKgmzl5KnRr1RVSJj4k+ENqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793529967;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tyxlVGooKeRLwf+rzPxjiGmCcTN72VtMSRb3CpWXFyg=;
 b=YzgvRlgXR3wYdMu1oNPOmlaKDxLYul8eDWmCNl/BGR47lRbGwM3f2800EdaiFw7kaUMn
 S/msoKFHRXDFjYJYfjyhmVGuqyWobDoij3vbj120QcJKS9AxwmhDGFpnwHVYKBhgHGnf7
 oHDQQ/5DvnsMeamcB1i+SSrkDWbWUYpHnXAnPYfEkA6VdHyYwt/yKABcRTIrzVvT3luM/
 DnC6v1JqJB8rMc/5d++6VbdcNNTE2YxrBG1GjU8dr0TLDF306jkyf7kycubeNlCkM1HJp
 dZIW0t0FMgkkhQiVkMI0s9VpM7Mocjjz9Ru9ZyI4hlc+Z3N52rhS6LYaxZPkyMcniww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k8GoOWXD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k8GoOWXD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB7444048A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793529937;
 bh=tyxlVGooKeRLwf+rzPxjiGmCcTN72VtMSRb3CpWXFyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k8GoOWXDcQqnh4ar1qAQjCzldGKX72uTaJIE6SlVs6tmNGrDfw+3Xx4BBQzUxTYV5
 bfYJXKqMssJUJ2PXqo1l9C+d0vmb3+T9QunyaioOKG3LUDKFfc/XTnLzI0tRLE6z59
 QlIzcn7M3+gjYewgENtKQH/qwW4ZQ2V1Uvuq8IugJ5neC+lajyfUkkDFrB4mp6kgST
 oLz9rbk0MxcQY5pHoIN5erk3DhhE3w+DmJlgesGTNgvmLj0zVpxZprc71WQbT7WZ2h
 /eot0FdqbkPqKMAOmgUzIPVobhVvbewkDBjRolwaCLqkmC4p/sbB/oNYEqnBlICsxn
 IoI8dUWTPu5zg==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 0MxNeN8XO+UcRAQlPebdvkLKxTD823nBnCVxmAAF3mK+32Nmw4a9YP8Zd4NGJYKzcqEUni0TQHx
 Wc8axuaXfJ4jDs4oPDigXm/DCHIbfCFz/YcPftwWRUCgr0R6MF5BS2cNVmSq6BfNoGCWy3d0nbJ
 KvAL2nX5Bk7yXrrzkbdYV1HPrOe0C4nsGNAz3U1LtunMZqIh/taudHCtRauPVQE1Q0hrCb6hwNN
 1Wn8s/gjVxbcPpHtZK3gt07O4NF3ybcyfB131LtJ6r8P271C3kA4PyMQbammxsNI33Y5hyxwR9q
 0xeqlLZ1oLZWQfYRwsIiM0rnuGf7dYDp691lBY09GYQ5YwHQUjNmqJNUDa+/uXumTn9RCiLmXGu
 mGivAmEUYrbTma/P69szPtnNLxwx9ibRiJWMVXLLjU4qrsJhE8d8rsvoj23buJ5G1oKM2BafMci
 rI7t2TRVKGkR4FTSA5BLuWzWUDO342PpXM9ng+o0JrCyrVWn5/w2I0hCsX5cDahB9HecwAqdDxS
 YUYcQ+awDEVJYId8NLgqs+dzYzEmEPJ3QOmAYpajfJi56WH8A36HFV0THIPTqEdwGUdXFh0gbny
 NkpUF3cabaKHhf+Wy8xPEtvOvueF4gbSWW55I8K1CoOS590HwETRJS6rzfs89hs=
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80F32A4C00EC;
 Sun,  1 Nov 2026 11:45:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47698)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT4D-000000004Gs-1mCS;
 Sun, 01 Nov 2026 10:45:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun,  1 Nov 2026 11:45:31 +0100
Message-ID: <20261101104535.1696412-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101104535.1696412-1-bernd@kuhls.net>
References: <20261101104535.1696412-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/6] package/libcamera: bump version to
 v0.7.2-167-g8fe1f4514
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

The releases of libcamera-apps and this package are not synced feature-
wise. To use the newest release of libcamera-apps, version 1.14.0, we
need to use a git tree newer than the current release 0.7.2 of libcamera.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index d1d7576533..1caad4f40c 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7c5728f6a51d717542cfdd2ff368ac78fa2e50e8a7360a38bb37952e9293e008  libcamera-v0.7.1-git4.tar.gz
+sha256  58864d3ef4f14661187ce9871e2a2d38d6f0e89c76b6beff2f663021130359af  libcamera-v0.7.2-167-g8fe1f45140bace32677b1f7b9a17ae3b4fa85a59-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 256909ebc8..03c31eabb8 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git
-LIBCAMERA_VERSION = v0.7.1
+LIBCAMERA_VERSION = v0.7.2-167-g8fe1f45140bace32677b1f7b9a17ae3b4fa85a59
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
