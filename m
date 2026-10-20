Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A538606A31C
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ogT/UD0M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D3AA6083A;
	Tue, 20 Oct 2026 07:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTCtLRTQM_0B; Tue, 20 Oct 2026 07:20:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 42C736080E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792480858;
	b=MgnmPJbWaUhkH4E2xdIjNCBNRr9FQiltQrbsja/AHT0gjSzob6pIXCOtSPGOx/eG0dm0
	 SCUFfidKJnid0NigPkfTjEuzZTF2U74lejr6HnRHuRUMBeTTcw1oWNgoCGGgCVSqh3jo2
	 D5MjWrEiiVpquOanv21VWZmjlS5vwQdXeP5S+kxHRFSbuUAqr1I4JQ2cwCYqO+ozOsbhe
	 1Th5RYP1+6yR5OnsB2rAveuqlLVwXmts+IYI0OvFZ+qiLUWpSCvCd5KsVZurmZsUh/mVA
	 JvsK1GOZbt7pYzoFUFmEXS5pceWSU9BYgFsigVdYWocM4rMI9sr9wDSWp1sD8mRHeew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792480858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VGjSGkKqgCfZM/6G5s/5MEx8iJ98vQ1RqPT6qhVf1UY=;
	b=iVtYeri0bw9D9b53MPcmwiQu2LIRS+aFxsDQYlnRM4JGreC7iC2sdqAKQmmPsmQJWLbF
	 VQFQtTYmG4qf38+aQL+fOkimOVTFTusuuOCGvH46OjiYboBhLRNV27/2fj8mF6kQ6Vm6Y
	 gFUIt5h/s8cXo1ff37w958IObxChueGlG+LFHqeMEB8eb4n+RBsoIjzN7HHNJnkKOGL2e
	 4/n7Ibc0mhWNGaulRePaNUFIuKih0r/PdZ64QPN1HgBJrR/lgxKkdD+w5wG/qmQqs43x7
	 wHqzhNJX9gHWVZE+l4Rz+m9gz6tvHM5a5gIqTfZnccZnpsezjPCwyQ67PuJ/nhvujog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792480858;
	bh=VGjSGkKqgCfZM/6G5s/5MEx8iJ98vQ1RqPT6qhVf1UY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ogT/UD0M7urGoz0yyShmk+/aJbXVQBjN6Roifr4kIxdAv4BYTWSJAlHWIZ/kUCl5Q
	 vj2Kx0URwzp16nSD/pIy/vKvCb2IX3LxPrLgOi8cgy+p5XwBQoPAF8meEdf/c+VZrs
	 S+Ljf1krJlxMbRGrsG/KiI/kitNijulJf6cN5kbdymhxd1LlUeXwu+ONIjX26B1BxL
	 7md46nAr8cZoFRSFrprz0M6nnz51Vp85Pcr1WNmBloS/Ay3hhxaVMn+u0/f/X2A4r2
	 1nyC6OnaSorSvLL5wdAHpqT8BvGPGYVmNHb+c3Z3MAUlOzfjgbJocw1ayTsjOPy98Q
	 pv1qxzkClpgWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C736080E;
	Tue, 20 Oct 2026 07:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79CAC279
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FE1E4075F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwGVupXsK2vB for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 07:20:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A592405A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792480855;
 b=DHYZZU3Vmp2yAPtNM9uo6ecICj/bA4O6SJB/54/+PlHxAa7mHtWFkJ707rSFD7EHDv0T
 q3AFCuRvu83dP32iTJhN6dG+XOt/C2RMs6sOSlBbJylOiBl9+NgfFZKg93rxCxu9t5XzO
 7SRadp1neQzMS7yqnrnFDHyyvJ3R9JKzZc9XPdZyL8O1PfIsuakVItoswjgBwWtk1A/UW
 VuANE1VJMcD+5NWLQd89aeWAw/h/PNnir4pxq8jhGrdnEGcdWuTuLpUrYlOIxWjkN5LKj
 QCjo9kAVTT7Msor12YJAj77f4OaScB0t9cQ4xpNaUUxtXsdQsFJAjP64r/XZ1JBaSCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792480855;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uLfQyWv2OFdFqF9kF4DHYAfw2DfXV9WPCMA8YeihFIs=;
 b=gRC7PNyx5lJ4uzQVUFCEQqkdD8q5sayO1c5pvF0jAo2XkEdvB8i952Ir6cDcUlpJt1MJ
 TPpiF15tfZDor3ZqabX/cvxsofjCObxOqNRmMUwhGvK2hMujQlq6D1vf77DNf9PxOei/4
 d6UpIKbKeBVeE18GgTNtQGi2+5VlKVMeK1fU9Nw8ydTlmQxjX9RTWWbAnNLfSUhbV9xq0
 BoqRVPbemT+XvQSqWp5gYXJVa+s5/Z68XKpqkdDs9nwc8S27zTHGqrp2mCuTjRyaBRopO
 zuwFi8mWYRJEz9pWp5oSE0Nxyn8YpAMqz2xJaOaxATVCM9ElaKNruqfG6R6c1btzUZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A592405A2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 07:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8669A996AB; Tue, 20 Oct 2026 07:19:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 09:15:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76c5a305d366f16b5b9839a7ee2688d415dc1fcd
X-Git-Newrev: 59f3ebf60ae7d980ce2bddcfbff5b2e14d6e059c
X-Patchwork-Hint: ignore
Message-Id: <20261020071932.8669A996AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59f3ebf60ae7d980ce2bddcfbff5b2e14d6e059c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
