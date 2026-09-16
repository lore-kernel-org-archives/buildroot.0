Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F73C88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E0E3406E7;
	Wed, 16 Sep 2026 18:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYj0Vxix0YO3; Wed, 16 Sep 2026 18:50:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 60D1A404F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584606;
	b=MrvOYye9stkNUhI9gA4JIyG0f26ov0VYyG5Wbs+yPBJJ1JNufLUC26fkiHQl+vB2NFYO
	 JkQKJmnH7ejIyPUgShf4YqsVPXHXwMwHPFayL6XRTt6GWbiWz4HkCoH/9rxtnyniiKd1/
	 TviTmzdbJT8l8TF5VRb5JWkzxqhVj3vt+HcU/vBuGaxtaK+Uxdfj9tCHidIru1UqJzdu4
	 +VzKnTpT1kUheTKv7VTHUYVPLK0ipCkEftBlm/ySPUuT/k6j2UMq3nV4XDZgKzKKtPA+6
	 CW0hL//81JvjJwBa9ujc5LtE+75cpaRFHgZq5wtYZA0D4fR6nw0kPSouHV3NPHVNkFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kALr6BTUbgVl1J8+vLnFVhDeexSI2hbC9bE3nkt3sP0=;
	b=Y4ShrPzSjtRnV4c/3c78Y1IaHVrgUldQ7WCBis+sco+Kz8T4J7Ko90jv6mEHhq5TQaA/
	 NUO3wTcFZ1AWna1rURtTD8aYAJE5oBhcpixu5DbHJuvgdCOKbJ96I5aozdDLET9etYYXj
	 JI5vXQ6Wv/+dDMATTxFEei8Lbik6NmeqWCR1ll1/lbjRJKXBfciRq63MF8k7O3ZTQxIYC
	 wQFonHwaOJXwecI9/HcPkP51mZfHEUl+0LkYHCc4NzQ7fkxb67kb9CLw3WRfDDWjTpCrT
	 IpUyYJWXC2J/XggKcFxSzh4m+VhbVM2scoWDgV1Nyt85uSFshIO0sZ1TEHhaGUeOMTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584606;
	bh=kALr6BTUbgVl1J8+vLnFVhDeexSI2hbC9bE3nkt3sP0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LAcl8pvMeHoZPU3Rro9pr7wTAVFWYaMyE9Rq4jpr1+husLdw1H63TfoqZaUD8kNYb
	 DjsUFGJPLpl1VF0fBYw1PHVv/TqHwMUPpHDQsW8NG9Y2fqJe0dpRO1ub1M9z27Sde6
	 rvpfpZ4pUu+V4jwNHOk9I3vnrQNPwVmo4XPiBrTyXW1wyHrOF0kyxYJ2yypeEPDdaR
	 7/Trm/y37e3ePLr1OAVyYZvjkb1VStx3NQCbPJ6i3PHxLCcf0rvUuaeNYcPLmxsyev
	 cyFtdEks1OHePwmhAaWR3wbbZpsq43VgPj1RVImkNjbhDkKFb1TV0mFTtdxnjI9LrM
	 9A+58YYoLh6OA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D1A404F8;
	Wed, 16 Sep 2026 18:50:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33E8F7AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A32D60626
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 973jc2INZyqh for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 60F90605E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584603;
 b=MfRZdlXAeHQTbLenaCQKwwaMDWUeoNXq+qpHLUAEuOngG38JkdgR9Aeg8GTYPrdL3FKu
 TUbsKZwNp9S6VC/2e0kK1cg9sjPmRsIM1lL/OWSNDxO5kfKHfUVnRmbpQCiZe8LquXpkg
 ymMN1DmwhgIzMIxZK0gei09aA8EkN7QZwYRPDT3uIFYeQqLohM9L0lSnJKItzXleaIOrJ
 Vrw3dnuiIVLsvCd2Ij8D4X3pc3dVLwKtAmo5dLjF0Xz6aDB/YhWM/p6E2DmPqqegkem+g
 lGeXE4q3W+1jwsClo0SfAUpnL5CqABVpJuKP51TfZFkZZGuMyFW3acnCUpa8HGzA9fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cXpCrMM5CYCuAaz/0YmRc3GCmMa/4LqQlyHnNIfJDnY=;
 b=ejpKvMHps+Sm6rgqnWD78xkeuIl3kjVjqO93VRKGhm5pdOJDrepyll27Kqo2drBQoEGY
 g+72shBj7KMlTI+CRTBmTkCitoT52pnWH73gR59yp5Bca5yZKzwubns9cJeWM3K8pvdK2
 7oaYIsoSrqkq3IgCs9BpbCJ1ggg4BByTFxbW5klYnxpMA8gFFI+IlVXVnzMZLX8r7N/FK
 R4EoUbVbjsLXrwLI+KuQ9B8ifNgjqVjf4pwMyImry4jbk5hyYMPYBGrGMbaXiTJNzRfmq
 A5egruUkGV9+ijSD8e0D9ffYwRhQCXr+Yes5ZTpUS5C/zKvtlFxv+RmOKFgl4Q/Suig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60F90605E8
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8AC9960DF; Wed, 16 Sep 2026 18:48:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:48:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2e4fb9093c2eb6f9d1b02baa84c5c82bc292842
X-Git-Newrev: 69283cd161fe5b796e03459d714c9f7b340d5d90
X-Patchwork-Hint: ignore
Message-Id: <20260916184856.A8AC9960DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: bump version to
 26.3.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69283cd161fe5b796e03459d714c9f7b340d5d90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.3.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index bedf9f8af0..ed08ef3926 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  70782df455555dfd216507d727f67fcca191959b9c911e27ae23ecc8852664ce  intel-vpl-gpu-rt-26.3.3.tar.gz
+sha256  afd7c1cda2a5e9f96c21c333ef1b471d97e6325153d31f3ab468617afab0133e  intel-vpl-gpu-rt-26.3.4.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index f953cd20aa..56e77cda12 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 26.3.3
+INTEL_VPL_GPU_RT_VERSION = 26.3.4
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
