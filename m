Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F060606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Lo5i5Iex;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=htguXPeK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BFF406EB;
	Sat, 24 Oct 2026 20:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEy8g8YB0txe; Sat, 24 Oct 2026 20:07:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 87535406E4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792872466;
	b=PKMHoUGr0Yh/X9zaTTOJIAd0nHAA+NrpIq+hd+RabLL7FxCIIxu+Xh7rCkqrKsO/7a2i
	 y1gNU55sQigG1z9ywOjdiZkwyNpAi5oK6+dg8oshkhU6smp1kJJ4hIup+EIwwlBAQ/Koa
	 EsTODXdyDSzTOAaEFAnpUBo9xlMprKDlCxGrptDVq8Y3bIOcojh0mUyKxe+Mo538IVXjQ
	 toBg3aPotiWrHHFEmGKLDvUSMZeUgOGBq3BB/9GeKmZRNFbJb4GSwNcw03Mt0STX6H6Za
	 WwM1TExtVPU9Rx+WpOGbYLrE0B9gUD5x+uqYNgCMIRWWYQ8movB4piEwtun7Pp+8EXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792872466;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gPzoipquJfjRl7o/qFDGCY0UZT8KLbOUq4OKesICcno=;
	b=AmrugZ/cfJEEZ/UgslwEs9M+HWt3GjknWA9Km5Dl/SpdcCUtL3ZW59mlJfbtA/q+oPP8
	 cN97wx1kM6zuMSNjzshE9ZaYgFU0GRTlUpUYmeF2DpYvrPIKlC/HZF3ddDK1upUqe1vgu
	 AFqTfoSSjpr/zsCRsjsNZ69QmMLoQmTl0RCubElmjmL9IuOZfIDgBYuERgu0Ros14qfjr
	 jtptxVQ9ycJMoJpYhjNfuyAYbzEQVweNaYoVZuBiz/g+7ppfTNR8RDWAs/f5X0NOlk5LH
	 0nsF0cTyh2DkTQwH+8lT/7hPVZGrdpvCb+RaVLxW/N5AnEvBIblfr4bL/kvORr/C/aw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792872466;
	bh=gPzoipquJfjRl7o/qFDGCY0UZT8KLbOUq4OKesICcno=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lo5i5IexdxNhr1VZYgmFMDEBnMOGWhP8OJi79prQ51b9uDpGgmfhBGMzwtWuv9cnV
	 V0yvJb6QsWBsxW6w1SavLtK+ccT9skzKDQ6Ede0WZqHR2l6MgJrlPOzNmb9ak5DHIE
	 UmZj7ewj1lnXEF8k5zq3dIwfq6VYiDwQVx+bnmli9Mec11D0cJyrmzYZjAdihotNBB
	 E/PMF/W+maQ8IxlAvhDGHYLxDxa4w5WTQ41xc+gyjIZ7k2gouY5B2wxUsZRa9gHUZR
	 i0bH9rJ4NXL0resvZWWGsAbpf/5joamq62NPXey8ut8JpX+l88byOGsSfFN8J5oyof
	 NAP28YlaJZd6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87535406E4;
	Sat, 24 Oct 2026 20:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2970F380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F6AE60624
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFgaGC3YFYpA for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 20:07:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D718C6061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792872464;
 b=bVeAOELI0Gd/rBFx2as/AJoWuO75QP7u5vhcw4Ec1uSdNNfC1R1Ao2FEqyTc6jBDy4nR
 hsqSiwRptTlb95/fmDsOifMyue2qgjzBDN2LTUBmWmr6bcsMS0mAFiHtGj/sx4pSDUhL3
 zN7DRx4xHDMW4qwi6+NrJSVDEb/mwDQt9u/q5ZKQqkJTqHmlV6k2qV4wzHbVzAqWaZig+
 OW7KEovul6nnL34Hz8rkF2pSLol+bEFkYv+ZxHJbIBZn/rITTY/oWtl1PY/ZDQShoECzv
 GeqPdWP0x/MLpvYOjwsJ1HdXMEmMe9mfkNhYn/DYH5xs2y24Hb/2JvRPcbMWRlXjBXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792872464;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DCpET6F+HVcP/vHFqhOp1lqDuIJdpqWYFZMyotB/4+s=;
 b=NnSYqb3MTh+LDBLrl/OsizJxQv9Sk7AMX3LoJa+gf+EyPZeziYZQQShVAJ3ntc0F4nqB
 N+p1sLMOYs4mbdpHLEPLFA5KU/w/u6C4l/1CCkGPFs4lEEBQUzKXGS3Ov6BjCALw0t7Dh
 AClQxqEFEExfjuTjj8BEeY8nhv+G+RwvsoGMyMIfOB9dqV+s3nd9DSUVASv/MT36bt7Xz
 L+ZtRX83w836ntLg/2aPucGPlR9w7vYPNLx+vVkRJb2yIJ3KttXftnjIqqAAUWoH/aaAF
 uKhLIob/JjvOq+voI/IKuSXmw4jt2AaOfFfuY3+nb9Sf8GoxUWtxdr6Hnm6VyHHc6Ag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=htguXPeK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=htguXPeK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D718C6061D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792872449;
 bh=DCpET6F+HVcP/vHFqhOp1lqDuIJdpqWYFZMyotB/4+s=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=htguXPeKTuf3NCmQncQX8lWr4JSdcCpxkT3kb4Ce8vAVqyCeu6tDIOm16HLhuggu5
 oCp2qiBeXM6/Sb4iiTyPwY0dB3Mj9VKEZq9NJzJOUurUdrM3t/E8pf+pvNCvZJbiRg
 chB+Ehw73SGX76dgZNQ5Pu269QNN6ObObPHciGjpF4GMgHTeV43PYvbNOCPjyrev1F
 YPCJRt/sDLW74XMhDHHEbXDj3lrj1oj3zLZ97h8RASVeTWTucKhzn2JMSdZwKVcHf8
 sEeS8+Dx2+k2S7MTaMtzWspIznrvumUVhIUlGgPsatjopxJSytNMwbr0QklLtXQZEQ
 mXrbMDHxDvO5A==
X-KAS-Sym: v3:f51bdf72230551df:ItQOhoHdKTvWg0goPmYKXvJL9H6W56pV95e92f2XrMW5g
 7lgLaIeeEvfug8jGdfX1vOXBy+1EpV7jb7Rwxiw22ChBXv5ivne6wJmKZGWwpxubOizKiqb8P4x
 IQ9nbvN+NuS0QVgJ+cW6OJomD29RibcRx9OGAm6mbqqBYfsyE0j7EWGS5tN2+h5cQOAS9EWGq+C
 AhP1VY4d3i8ndF/x6jhli96WYDDyU5w6u2Efrzxt37PPo9HSkOZTjjnDjOsmDnylXWwhjr9PGkP
 AvGG8I92pPSHKWcqGWy+56V+3uF9SA92P+/xaoOkcykntohMjwMepiaqmUe8YMld/CAl7aLQ==:
 uGc1+7AfcTAc6RtCvkNA9jMwswN9Bim7G7DIkkbFUNyGAcFFOLcTLqL43uWf3BRfm1WgZa7ouQi
 yS+Gp37jqFvDYXkKmum6zikTa6nlk6Gt9TmZpEFSuZ8aTql/zB6yRvEQEfHl0F6cNw2q5hFdnbl
 GUxj57Q5qClMxChFy6xiqs9LyR1cw+RP+x3DbnesiZ6CPxoQWUWf8ABJf/HJeRp1SRXUXuQjsSM
 Rwd7sH5JbWE2TYOVZRJmgfee4Fezf2w5xTes7/sj2YKi3C54JYNi/WFe5DrTZje18hnvuHPlIuV
 7ZbDoPqMhfqIpVdB0wkK0z+Nd9fYrp4VixXUuypkTwN7i9VZjhku7P582/M6Dkjccrzbfoi/pBc
 ruz5GSUF+5/8c2R9aVfRXeIP31czX7VppDff5jcdgIaI/Popn+4mhWognIoZpm5d4hqcAfn7pQX
 t+RNB2EBbLchlCBZ/cCkRHsf84ay4MSFzdNoWbqs/bfHRZWfZ+Frm5v2SOmZUns/1NGxD9XmNzR
 9EpGuP2RiikJGIEejlM5++uTKFVcpYNsr/SDlg2yUw+PWqJlbD0Dvo/GgY=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1B7FCA4C6983
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 22:07:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40390)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKi1Z-000000004eR-06ZP
 for buildroot@buildroot.org; Sat, 24 Oct 2026 20:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 22:07:28 +0200
Message-ID: <20261024200728.3386039-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024200728.3386039-1-bernd@kuhls.net>
References: <20261024200728.3386039-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version to
 26.4.1
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

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.4.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/ca42bd788d77d6d2dc9233912afe73dbfbf0bca2

 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 50d382dca1..0d8b0760fd 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a1c5c7b3b1666273e2fd0060da13bb6d124f7473685a74c00f19044e813b14c  intel-vpl-gpu-rt-26.4.0.tar.gz
+sha256  7550feb11581709c884cfe8e8b0968b8b387ece23388189108005aeefde09ecd  intel-vpl-gpu-rt-26.4.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 1268c0fc1a..0bd9fffb66 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.4.0
+INTEL_VPL_GPU_RT_VERSION = 26.4.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
