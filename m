Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ECB606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wn9MSs9E
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C76A660AC4;
	Sat, 24 Oct 2026 11:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyB95VI-BkfW; Sat, 24 Oct 2026 11:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DE84660A9B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842848;
	b=bSX1xQVCBUABXU/hBy9b7GhWqGmDnfvMSJPYS4PIfgW//z+SUuarEva8CIK0GKsoOUAM
	 lkQw2D+0zNKMFnat7Q54YtNkoKAhiiRZofZOrIjCmrZLsmWTyZOKV6wxTaj0gmP5l4vYm
	 HCYxTB0UwiZm+WKdA+y/75tXjCn68GW80nTWE4Dv0mDxeWpTmN9tooPqpnjuKdyDyRet7
	 8draLmcvp5s8ht33cFNPuiN0aEfYMFZDUvG91UER6V38v1Hx+iP2QBXsoxZtidY5O8+nv
	 gzPBsOKvQ0xd+mOntrVJUQYqqs99cQ0Q7IJYOWAMu6B7ZBVBMwRH/Xd42W5c7P3Vx+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842848;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jgy92N6UJDr/fjzHy0VGCh1X3VlwbWzyGC2Kd6c+Nsc=;
	b=ZP+d7pURi1UzimhGwOeVwZZDHclTbbzZeAq12YyrR1nJyGlbXbnPCcPks+JsqOn9x6dy
	 iqlj8eU6R+0s77tEvwtSlypB+ghM/XNv1UuFnqt835JctvwJmoupAe4/jnZJTzBzArGbR
	 eTxIH/B+MvLMyhi4infgTurBj6qx7fZtHC8StyZHPpqKT1fcRMcPXZUA00recOTI3Yykf
	 pyNWIuqTrMRvXdzLMzQQ34dBGJLHg4yh6AluuxVmUWsgNujUsnNpz0EkHmp5FwlB4un4f
	 XGdUbU3MQ4XYwbNqspvH7bZvozUSFi2RJ23X5fKlt5QK6UuxtCvV/MhkDWix09fVEAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842848;
	bh=jgy92N6UJDr/fjzHy0VGCh1X3VlwbWzyGC2Kd6c+Nsc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wn9MSs9EO8gS0Ry7/3QtRuJm9DYF5+RWYUoVvzss4Kio1kcG6i2joRJdarog6D6k4
	 zjhQ8pCR9JhG3kMOW08957T/wJEpSMBHrs1dcGOuPb2d7Xxa0d/sLEsYZWFp6jZ1lL
	 Ut0lhSWh7yJqe486gZCEiAKBf3o1nqhteeLCWB6dqSxW8tncVXST3OJuam4JcS4NF4
	 Xs4bDgjNf86gSiiw7uev9eqVjWTjLr8kpP2Wy13GqlvIbw2THQ8r5QII+Dr8afXBzx
	 aGVpIQmLgcHM4T/QBj9/3BTERrRp3qhb1kV2DIK0Qi6SNCb/XYmzR0qHQwRFwsS6Sd
	 pNNX7NG65kXuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE84660A9B;
	Sat, 24 Oct 2026 11:54:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05FEC4D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC23B80DFF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qPnZMXPrJ79 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BA3A80E8E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=dk3lRMt6+Cj4fw70SyT9dxmP53UHub/qI169/nKpi7GpnzZEuzKWGJxIBLgMrFWsX1xY
 vUDGebIT1ovqzF9wYktqh0sDnpHfEs7Oy1Z5I+QjAwLL/j/QXNDymW0N7bYknZwzzZZbR
 3h8qsVgOwLHndWka36kJw9NZvgFkEE6BEQoFZ8TKfxV9DkrJiQsTJ2dnUXKI5/TLekmor
 XYv31FA6eHkxAI/+LB5wXl70wNL37IzR+Ytp/CW8R4lZW1iBaZuPesqzwKmzF4LrqSbhv
 fyLBPqN4hzUX6oV6wBAQArv/YVYhP8hnywvmeED9aDoQfpyL2BPJVTnVo6RsoVUUYKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+GHKg2im2vCJ2pQmeXwwDswdgVBMtl/KqEJ0+coBZoo=;
 b=JjUhazWwO9yeV2PMq+e+HWwlvDBZbiSbGPHdkSKX5EYgCgBUn/jNFDNMba4gCMrC48TT
 gLYW11FJAck/Ap/1Dhj2pTvNHvz0md6DzwEzuD4992TmZUUlPQVQ9iV6IJLdSFpH7ngEe
 POT1kyDsDp7qcfDC5kkyvc3iMPVHNeUeAmCA5yfE7R6VV+Ovjrz5Z1RPNwkk1bU9oyV8E
 calaKKr/6sD7AKZLLPV3CXgcDBFiLYXQr3GIcLyvtVjKH5Sp9D7VB40b6DWNwMIQW07Pu
 CO303Ha8wTnPXhmqvm38MKN3BWTFzcIOfcLVmcjEzf6wQ5O/BjnXQ9UkLXk3lRrriuw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BA3A80E8E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F9B99C7A5; Sat, 24 Oct 2026 11:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:10:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adcac6190d5328be65b00fbbb5d642fac9110430
X-Git-Newrev: 74355c8b1fecb6039592b7074dd28ff979c65ee4
X-Patchwork-Hint: ignore
Message-Id: <20261024115227.4F9B99C7A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-vcs-versioning: bump to
 version 2.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74355c8b1fecb6039592b7074dd28ff979c65ee4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-vcs-versioning/python-vcs-versioning.hash | 4 ++--
 package/python-vcs-versioning/python-vcs-versioning.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-vcs-versioning/python-vcs-versioning.hash b/package/python-vcs-versioning/python-vcs-versioning.hash
index 964a21fb70..b641af6b82 100644
--- a/package/python-vcs-versioning/python-vcs-versioning.hash
+++ b/package/python-vcs-versioning/python-vcs-versioning.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/vcs-versioning/json
-md5  bfb201115bc6c78668ed643c9b06503f  vcs_versioning-2.5.0.tar.gz
-sha256  956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55  vcs_versioning-2.5.0.tar.gz
+md5  3e25e932a706a6bc3e3f45eff7f97037  vcs_versioning-2.6.0.tar.gz
+sha256  22e9159288e2d8bca2fa6f6c31c34c9c66aec157f60e9e526f5d160d2516d60f  vcs_versioning-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f52f6085a2f4acdb7f425fac78d4bb013b2d723616792fb173a9f8aea191d8f0  LICENSE.txt
diff --git a/package/python-vcs-versioning/python-vcs-versioning.mk b/package/python-vcs-versioning/python-vcs-versioning.mk
index 78d04b8457..a4ec8e027f 100644
--- a/package/python-vcs-versioning/python-vcs-versioning.mk
+++ b/package/python-vcs-versioning/python-vcs-versioning.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VCS_VERSIONING_VERSION = 2.5.0
+PYTHON_VCS_VERSIONING_VERSION = 2.6.0
 PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
-PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/6f/a0/6977bb418312ad30f27e522c5040604d4bbf7e40ccd5a11d333afe549354
+PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/ad/e7/2a691db7d076b75d099fdba1a14cd966931f2aeb591e77f6d22f15097326
 PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
 PYTHON_VCS_VERSIONING_LICENSE = MIT
 PYTHON_VCS_VERSIONING_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
