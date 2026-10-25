Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E9606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y7y63J+v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Bu4bnMtL
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CCEE6062A;
	Sun, 25 Oct 2026 09:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCifAj4ZNSAn; Sun, 25 Oct 2026 09:07:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD81260618
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792919274;
	b=qNutN1GKoJzHJweBaQg64U/wSVIqqDZ1QxkuEE2cOA1QRu4sK/hvhBkW+pehdf8UK9dr
	 OdYmo9uHMW44ZdNvLQ3mATDNXem3+JR4ngkYgdzb62wsjmMWsZ0RQoErSQK4uhPEOqsVs
	 fmEgSVqyG9b20aLfLtCv5s0JTId/da8cncGoPJm9fOGaa7UQDx7fFmfltrHDdWcmArLG3
	 2tcrWJ1nFKnXWgQFO9wUBvBgWBjunWh5RSbbQ00fCEvI+ZnwDTMDjUJh9eEZ1YjtZctI3
	 h9aMUCOB1gpv/gSOMfFieGGSjfY5WQ/9F7U6oojukN5uxj5+qpt7oHaGfaTlEaJg+Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792919274;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RX9EWDxl/hnItof2d2/eZQL7pWV5MMo8IruV1PN1kOw=;
	b=YjI/GT26ZwNxcXrOOL5sA5Sj3i1oM0AVlXjiI8y/Fk5pJfAvtCIkCPEAcQXiVp+bSZNj
	 Iniq/J5SLCEwBm+I8FacoPeDIEEh31BV5ziJbc3vN1/4Bf7vhByxaTdPGrkA2yC9+XJVJ
	 3kl6zvV3aUuVRJorCbEmZHyM8/RLkOjobf/qPvU+n+SBl4cOUSGCETiAm/mT+ja6gLpdi
	 iYX41O+Yw0logQR8RvMfuwbP7BSgkp455FXi416kb/bQdH9bad7syhyfOtSrFlDUcq912
	 YLy1Q/86CpBZ3Ud3DQjiKebClB/OX6rGIx6tr5GJeafFWhoBwJoD7pjVMUueKdzw3wg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792919274;
	bh=RX9EWDxl/hnItof2d2/eZQL7pWV5MMo8IruV1PN1kOw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y7y63J+vSW1F+lioQrvjDgusSVbYCiFieKwF+GcliYdJ3wWIi+zhXJnjTkBNn7LdR
	 VZTWQvUZuzBaNugulWuq4HQ+qIi11+lRT/CEVUePO8Y7Yb6jHgtDLmrb5z4R7yYKrY
	 GpwD9yY0yWqVM/ey+6uecKMOchev81d6d8FWbKeMOsC3T5/UCpruDbgIho9af9lGAr
	 i4ac34/AuGLhDaMWsluTscxnZnv4QlDj98Vp9gAKNa0ZWpZR1OdKq1vDH9DrQKoslC
	 fs7Vf7db8fY2XEbAAYOZwfx0vE023x2n67RXQJqCeGuwl4SYuLXZUTiQMIu37IASKS
	 avTTrjz3y4/IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD81260618;
	Sun, 25 Oct 2026 09:07:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC1573AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1C76402BB
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwPRV4z9fx93 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:07:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 67B6D4028D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792919271;
 b=Ln2TE5fU6paUJBpc51dAFc/VSr21UwlBNsyHmRWKWLhf9ObBhlY3zPBCDehpTx0Vyn2+
 9Rg/79y3YGuSvIXV2pkvYu/LAJuA4NkEPyzcHG1onJkJiWzeB7fyG9M4JQ0yXGa/dp7hW
 OJXQZXB8g07C6lIdOI82zSvcmY4M0ENwMqmoCPQRjDh32JA/MtTA640UtYw3vNr3QPBSF
 p8MfRW32JcRaqmaEFzevzNmsYIV4BYI3YYJVkCYSML8rcWv9oc1YVewbOCCp0NDMyUjmT
 SFdWblPnputCcYxh5VbsqMVY7QYy3W2hZNveERUE4NprKS6nmhn9fNun4Tz7YqFp4EQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792919271;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nPtZUpFx45JLlP3vT2UpK6aBPhiWc8yDQ+GWyGVj24c=;
 b=HWlrq2p3hyv7+BlEfWeVnB5gLURcVCxA6EggV0lELOAWKHD9M1CWO899QWpzcgWsC80V
 dV9wGHH+bpSwpJgxY0qunLt7vUVupHNqphIzwoHMPOlr1EzgcIx1u35Ept+JWXLes8T+z
 IJkVykhPVuhLNPTyWkE/MzFCdnh/Zdp3ZotpUJGp2z6f/KruzLywV2BnKfl0OY+4Lxcar
 JO+zlZf2PYAFlcQPvwaCZKHqT/iD19+Yygj0fRcJOvQ4zJQUehzF1dcs7tQKpZ9sRgR75
 tvGd/BR8j82nsUS2zrb1JFwj14G+Smdw28TBCpvh6HJs4CqbxPD1zmIlrzE6hF7E1Aw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Bu4bnMtL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Bu4bnMtL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67B6D4028D
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792919266;
 bh=nPtZUpFx45JLlP3vT2UpK6aBPhiWc8yDQ+GWyGVj24c=;
 h=From:To:Cc:Subject:Date:From;
 b=Bu4bnMtL4UnpZbuTn1zBO88MTDGfduOpxV1VEQl6Aa7NIz5hrCP5sHVwmmuJyKQW6
 xDGIrmd91F2xSe8Xa812swDheogQfmsCyXsyRTlli6h2IKAVOTSbXfzemNzeWljaA7
 awlAYi7NkwLJA0A2udhViprxXwb57DDDaDPiHEWqpM58yB/4HEzTKUrJ9ouuWNmAGJ
 aVUs7wMZv4Rbz0pE3x8yTrZ4Y/TB+mGWQNpFQniBAGSp1cdaXfbTNoeGUM1dzJEoJK
 SM2c8vjTeDNr4hNVwGndxs5m6jqFERpoS6xlElEBQTYZYGcpwfL70Hd/lJQeqX+XfM
 SKnZOht3M2BJA==
X-KAS-Sym: v3:f51bdf72230551df:kUVQ9P4KSkbE6omNcOiQEtc+FjsrlbiH/EicCBAxLDWgf
 YcI4TVtGomZ3udykrh7O57jQ0mRv+J/f1+z2mh1GeGKdM0+cIe5rMIYacQHH+yUP7KpGFGPCWIH
 405QFPPhWS/2J8Z2krbP6ls4PA3bcOe7EWVqvCUxXVRwnMYZU1OW4hNE/H5ZP4TlfdCX+91YCUv
 RXxs/KEU3u9gY8KEWuYrFzmuciQsFyv44ZB/fBtXRfTzJqVU6/nnC9a+EhCG6grKLjPUF7C/EOB
 BqJ7UpMjnu9D+ubFjQMzC54b1z2nQyR9Gv9My53hz1ykfpCFvq3l6AdOaQOqMfzczWZ/zXqQ==:
 RNgMv4rQ4OG0Ho0Sbh7AQnfEejXxvfnbMMfG0z8zzroPot8eM79LGMbKg5kuYOUM7TwaeKs8jtJ
 aD/wS5KfEaoklG+FyQBvXfSWTfxDL41c9IpYh/UbWdpusukVxT/pLWW1Nagb83Nm1C6eJ+zhSe2
 IujsPpOfFU+d7QOpJyeGzDoeSUoCEqggpOvGg80jEc/RgSQ70XBK5R+J57uBhkm1kQ/j19061W4
 BVnUVj6oAQx6B2xOYlkNQPYpkWlT1lc/NMc2iqYImaiFYvmkc9tU4qzvWYR4gU5/fL1SsichagP
 ihx0v3ivBL9TeYibvIDT0MISTkwbnBGT10GzFw1QFhs2/GdJc6Wxp/Dk8eU3Y6XxjMuSQX6AkVA
 3xYMAY0EafMMoFhVLcM+2Nckx0BwsL/RxmBiWND/Yr66ZX/iPQWcosfqmwYQ7I/8ycudXoNzFak
 GUyZeHkYv8Uv3OOBBN/lug0QUVu5fyOpB7RK8ji3j5b6OJBVGGVqlAbE1LtQ2DYZdvGz4c1v3Uk
 pHYk8HfmlPPZvKg2dxuOrE3KMsflPGkO2EGRHQFOPU2Db+jXspM/sNk4wqYhqxqC2DJAVV8MIJW
 CvOsF6s=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5E36A4C687A;
 Sun, 25 Oct 2026 10:07:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56158)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKuCf-000000007X2-10a6;
 Sun, 25 Oct 2026 09:07:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Sun, 25 Oct 2026 10:07:44 +0100
Message-ID: <20261025090745.3693129-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/containerd: security bump version
 to 2.0.14
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/containerd/containerd/releases/tag/v2.0.14
Fixes GHSA-hc94-p972-ch66.

https://github.com/containerd/containerd/releases/tag/v2.0.13
Fixes CVE-2026-53493.

https://github.com/containerd/containerd/releases/tag/v2.0.12
Fixes CVE-2026-53495 & GHSA-rp3h-jf77-q9p4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7c6b5d9a4cf9553a66173f785993f0079948a05d

 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 410e5d61e1..97d2691c5a 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
+sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 4a3a371ee4..753011e125 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.11
+CONTAINERD_VERSION = 2.0.14
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
