Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACBF606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 05:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jW9Arzv0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QKcrfqnu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7FC607FD;
	Tue, 20 Oct 2026 05:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbGEwM8qFUYo; Tue, 20 Oct 2026 05:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3300D607F6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792473744;
	b=i/Msrka20iSoCURb/Nz9KOnRVVP3PS+9h25h55AHyNTFURcGDLul6RMccFDFhyKYMOR6
	 MO5fn4GJR3qUhvkz5T5UCpWX29+BAUxem7CeUfRuIRrpkFJMCxVTlzA3EqrrJpvAPpEYC
	 JlbFbnOlr71FwiC8tzSNgXMANWC/bE/oQ8k60DOiQ3zxImkhyj8E+hjU1m7pedbggpYd2
	 aI28y0c/rn7aSCmadzO3Q2ltD5uNTdm7BuRjKP0VAq2E5KgaJ2foJaFAm5vVrZ5SVGTeo
	 wGsNKxI7evO90X2zY9c5MSK8MmdYsuzqFs5WaqyS/zj5ak/Zr4Ci1nyfDX7H5L6UY2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792473744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nsuiTo/Er/XjKbk+O4qZl3DTsbXd3Lmjl5FmLcpHN7k=;
	b=g9DLpEWI2UP7UcGj6aXuG0Yb6GJlOCO7kfpTUglT2K0VtcRMjxJkUWbKW2PXWV++GQjD
	 5aZAxJBk6V+9Hs0rNYdMxmLx11bHx7Fa9CYvfqCaONTrbPz3AYcMPNks/h9aRnkWUrW4w
	 ufwEauPHXG1MnGp9UKpbf7fhvK0dejDtlyWQ5Uwiydnv4R0CWW4SnJ+WXIE66ncQKrQy4
	 zwnarstt8n+x9TOyGz2kCHEjWXPw1ZOUNWanN2jIh1z70AjPurBZl9VzrruigIHdNBGD5
	 QeNHIfdV2lbj2FHeOvGw0Gdw9M9Llj7FIFAgqrbmBtcWaK/P4EPXXfAb70hsSe1jCDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792473744;
	bh=nsuiTo/Er/XjKbk+O4qZl3DTsbXd3Lmjl5FmLcpHN7k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jW9Arzv04PBNsIhKLWF8jTowxS3HbrtYdEkV1a+uIt8xCO0gi/bRvU8sBDbjWXpHK
	 GaWUe5c9syfPRVBec9465DOaQ2Hs21xceZ8AZroW3pCfzpxHMfdXQbXwNwkL/qUzhf
	 wF0C/N7ipK0hX+T1M5ElU/P+EuMNQqsyM3Tn21ZdKZu47V17JjZbRtPnLTuU0OGvDo
	 ZNtPgQjuWsipI4fXfBy5w35shmQZ0M1jU09YS+Zvp8JIJRkT560NENbzbMGE8a6m4t
	 DKHevvXqZIucB7KhN1+06uQAcm2pOwYtJfqf6pWbH/SaQk4hKOJ4mK2F6W5xuUqiJy
	 wX5AWyhNzERbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3300D607F6;
	Tue, 20 Oct 2026 05:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 49F2A23A
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 05:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4503E4080C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 05:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbLJxjofka0g for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 05:22:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B00D40804
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792473742;
 b=iAiTYrpqcPG3kgc7BY8q1KylysDxVwFtCIuTpq6bVPO+KSKAUSbZJDAZN++7ECoOBTUJ
 1GzRRiPUJ0BPHzIsSPESD9KGAO02yMvtoEPNIFSN+hLkjoiDkTU9OWhu7hsVNgiFZtzBf
 3xRRsw02H+ehYOiivCO9zBhkdY1TmbifOT0cNkaocKtDpvN20m1V2N6dkQ94CWhqn3WvZ
 ATgVELUrhLH7SFFP3xfYWff2dc7M8WYMmaGkUgwPgVuk1VlNiQ94jGRDmUFMEq7bN0x8S
 IKrYsrdkJt90b+mfww6P3F3vbzydguqQTLEBkT29i1JG1K9dzYR/ff/ac0dsarcEJBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792473742;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6TxKmU5roGLJ4+mkQkm6BF9Ji78HfeSL9e2vMoHqJbc=;
 b=qdOaftvnlP1oK/N2urKPPvu5gkdRoqi8uZT00LgQtlKC9cAXskrmAFyE+4mBB8q76x2R
 y6HKTOO9PAA+D8cf5o8RF5t3wqImqJ963Ps8Yz6EzMX3yFyLCVbGHgS5GalQ3MeGLCBJT
 GzyKWl4i30Dqs0yAMBuFYkG96Ov7ErjiQN2iHEXIk1AfqhDR5cT9P3x9GRM4sG/3DQCtv
 evS2zdBbZY6y9c3t1yheISOTi++bL/5I612asp5fsPHgvfdNsD1sNJUDOH09APIpl6bHw
 w2PRl9ges+uv/quTnRQU+FL71wH1JtTiGTXujdqAiHm/WSIeUB+RhBMj9JvuftzDv+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QKcrfqnu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QKcrfqnu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B00D40804
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 05:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792473725;
 bh=6TxKmU5roGLJ4+mkQkm6BF9Ji78HfeSL9e2vMoHqJbc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=QKcrfqnu6BYCUo6ccTlI6rMcBAq3XHiL0079412EX5grNg8Eo43LtYyJEGwpbCNIu
 tH+apiAl3qfShk49D9lpwl4XZcjOxnzAZgTDaZkgvzb28Rl4zkBawLi2icXB/tTHbg
 Aft2GQ5QNpn25zkkJKHwEfyITqmsCY5/1jcmzYi9oVuqdNORG8rmWtk0wGpq5qlqXq
 A3u4S0GND1tRv4lQxJ6mHTneSw2EwFZFP8g/+nJPOGL24dScQWUKSZ7vioIR1i6pms
 UfzEEZT2u2QMfj8p8DD49oVuGhcGh8puJNJh0rHSlGN1/FRI2Tab/f1rGheR5aeNQM
 Gxn7PQfwjeRAA==
X-KAS-Sym: v3:f51bdf72230551df:MIrcfYPXBe7ajkr7q7ZabW9muo9HMX6pRUMvCXrnXmSvl
 ilBn/bqMK15CEuDG05P+JUCFnQyaCl3jzT0KiimMpK1Kej9w6mnIRVoRFGLppnhTQUzumbFVi2Z
 1LuH7fJ8QVO1Xz07wjWSmOoGDEzFLm/2qK75KcFg2SsG2cW5DrfLUOrnUjzSof+0AcWM/L7hB9V
 VsczxorGokvqUWkymlr7/lxcv5BXPK1Nb1qmWi/PcTxz+/T4SYdhNz3/zJS2AtkFDEI37fSyKPf
 Fq0WqPCWBrblww5Q1VPZ+2hmWNpVKMvTAiBNO50tZM0a8GJd9otkY7D5HsDz2+G4u2OUQj3w==:
 fdiwh5HBwzb72O3HfcM2YXXFnFrU8CDzZ29xcnkofAkyJpzndUX88jpCYe8eCFW++aweW4Yfna1
 SBs3YF42XFWEhAvQvfG31mD83XidvtEgj9jnC0GZXZ87QEN/dHM3UTuXaQPe4Jg3dxENcEoZS4D
 +pWLuoPpie3C1HSJRSm0/3aqV8ExzW/qZTT//ZINExVEta27Ni+p7y3FP4oFCCwN4Ebbmp83pMg
 Ny1UThuk7drHrhRf1Nb3NqjZZGWC7tPnhGM+v1EU9v1RkvmEMIVto4feiehWWDgju2YNfVxfSYC
 MUSyEmVQSWWpDtuRP5HbL+AG3Q22Via3TLv7gVG/8mTqieJC8V0wgyOi8MgBhdgvpucSsKbXk1o
 HyiiWR+yDg0zb40R0Y6wAHTtFP197bI7K3iYanRsE6BLcC+BP35GFEEvSvUfdH4YwnK/6xuJgq7
 l+yOZ4Uh3dTYQM/wNS9aqXLoHxMNEcO9oJxdCEq9JhP6iVLbLQDMBbITveA3vkwyyaSZfBtZCL5
 KO85Va31tyUWCy7Wd/sOSjnvuOrC8oSCgDqBMsAMYRgtxzmptXKXrI=
Received: from fli4l.lan.fli4l (p54a1bacd.dip0.t-ipconnect.de [84.161.186.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8562AA4C5E0D
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:22:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40500)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJ2IX-000000002ci-193y
 for buildroot@buildroot.org; Tue, 20 Oct 2026 05:22:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 07:22:05 +0200
Message-ID: <20261020052205.4504-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020052205.4504-1-bernd@kuhls.net>
References: <20261020052205.4504-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.4.0
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/87f8ebf1f39d02841ce9dc2057a21d656f973be5

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 76d18cd3dd..50d382dca1 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  92867a0f8c09d81419102a61713e9f98dfd2af3fc9c91c6f4fb6d0c784c8e442  intel-vpl-gpu-rt-26.3.5.tar.gz
+sha256  6a1c5c7b3b1666273e2fd0060da13bb6d124f7473685a74c00f19044e813b14c  intel-vpl-gpu-rt-26.4.0.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 9bbac624cd..1268c0fc1a 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.5
+INTEL_VPL_GPU_RT_VERSION = 26.4.0
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
