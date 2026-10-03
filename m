Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C614BCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA5F60DBC;
	Sat,  3 Oct 2026 07:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I8nDJWRCMFW; Sat,  3 Oct 2026 07:18:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B672A60D97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011887;
	b=QNoEhY6sTZMbSetiuvjxJ+sVbt2hR4YE3hdXJcb9nZoTTnUdJQiEZ0iRDjJ+WG0B4UAS
	 YsIvMOyo8gCMz++avSIU7MsQaCAfllNV65fOT1NP9LfH3dNR2kF17Bk2r3Qb3nTT/dncJ
	 kNC3Q3s7ry02voQlNiI/UtuQbaJc9b84gf4TUqGQq5zN3XVOWTW3BsayljJVrpeLZSzMJ
	 qIRDLMJQt9orZL423Ht8i0D5EOIb6JaC7DBZz4cdz+ci8hP/55CcqKEXPrDbGzBku5rx1
	 m7U+IzZ7gHusGqhh7/NWclaH36Z+a1qCyES683EM2Zychex3mQoaYwu9haZ0EV27xcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PH6rmSS56zNp+S+g28h+Q8zkPsKDz2YfmfWFQpNpul8=;
	b=k/ORIF7Wd94FHQowvT2V6QjTlULXdE5aNzwJM1+Q5hf2UYaQRI9zIh8H2bu32yURTpfo
	 UJgVvr3vd7iKsd7HHX+ReATs69cpqcjo2GH2vT8vcgzBr7ugjk3IIJ3c2HHI6NClIJtw1
	 X3JQUkoTzKEETNmcXiLGkkyPggIlSDlufnwRlffB5Hl3xUVubTfuViLq3TpoMxepNBT3/
	 q7RCKhC8lSTzUn3pojncLSArS+cgq8HLxQ2i1pKRBRsg12diY1nRroh9/hXZtRmrOK7/d
	 gyQjHya7olnoX1KRg1M9PaWwqb5VomQW3LINWeALh/N9330ZtlulXRiH2mpSLqkHy0g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011887;
	bh=PH6rmSS56zNp+S+g28h+Q8zkPsKDz2YfmfWFQpNpul8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=D5+vcqqV7G82aIUDIOpesrCgef3tn+XdiwOPbf8SSeRywIap8kNCSISdJHKgniZrI
	 kAw1YEhHHr5cpv/zgQY6IcFZEwB0kxxNI2K++e9gmmMs+y8cY7apH5CHql//vCtAM1
	 61IaNHVMKbqRaiE6Kptfjydy7ppJwtA1sYMFR29VAmsP27N9Kqau1BJvHxnT174Oxw
	 qjTMQxx6FAnwZxntZQaSEGttyF30fFy1dfpfFh/y46lNj3TfLaX3aRUEf/gXUajkTY
	 zwrWeQmL8oaH4afXZja/leima7GVqirDLIbSkqDtFYtxAG6bXkaGHakkYa+HkgtxtM
	 CWtf6U7D9zkEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B672A60D97;
	Sat,  3 Oct 2026 07:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DFBB1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 043A780F66
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4WSTj0aeDrL for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:18:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0D92580F0F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011886;
 b=HIiVTN6mREbsIVIYluZEVSpCk1BLTM8T7pwhP7BcDk+C+B1fygG4dvs1o9+TpxouR1pS
 mH4VzFM5U/AqSBrQu9sMuAlIU05mh0GVeIqlM5rNdiQMLMr8Oh3V0WLLFhuADT+krZToz
 Fm2+tFDOsH2sw3wJz5KLDsqXP+TC7bAd5+T2Uv/UMVIGQmVdFn5svH9WjQMUh6tg81Zjj
 g6bndJ9BPfs87hc93JvUEzo4k37lJEvGLOQc8GtA8sORdXoZ9rPe6dUnmujLMY1BJyyE1
 VCxX05pji7dYRpwOAm++cmUwQ5v1SiR8w52SEpHH8Eu2Khp5gphQxkFK2TQVtkuIuKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011886;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=W+z5AFwNbc9iDc2qwDJrczgjB2L2l0+VgURt3yU6iuY=;
 b=rAXU86kDT9MRzMH4LM7KzBuvKG8YiabdSDvS4Kov4/6kfwpPvrPtkXyrS5TV+6uhBCgU
 W6Bh3Wm4taXHJxys0vE5wWpHnoNWU66ufnvU/bI4R+LKPlK9qaFsUxfFcVCwOlSbDhBz1
 Qzz7CA8cR9j0W5BnedgDX+7y3K5FqjT3eSKxe57qKWjkqfc/cEf179I20kBcphcFVrKci
 4NEvgliPzinvj7sEW69NV+csaSEL34zIFN1D0wLX1/CzV+qVl2K49Y+hTAfd/D3/vaBet
 iqEdxR8BQyHD4bipfdWaE0EBBtlJmqh7E3Os/AcBuFh7H16nTyaV0LwhEYEgHWvUtuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="L5Yvj88/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=L5Yvj88/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D92580F0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010937;
 bh=W+z5AFwNbc9iDc2qwDJrczgjB2L2l0+VgURt3yU6iuY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=L5Yvj88/Gv/IUO+kDgL7wY2l5e0f7Yeb5gTHHbY+OY67ZiBlQJuqoqr8sKifuHT+5
 7QMg7ItDVPqDtdmqDIYrYQkuWLra0axuXOxgfOA0ojOMxmLtZy8FSAKndxStVBsDgF
 uJhOxbBY+fSPqDBZXsZr8DcJjNN7+oGTzoz+mgmkN43wP00rSgsFNPXsB5vx/L6mvf
 HZTScCFMBNjh30pSUeLgNeBi8DhwuNyuDGvKbkhTF88OFUusuR6wsMJNEtKBu2uwmm
 jb/NfnPuWKiuyfU5Ol34+ytoL7MJ8gHk50HgrWqhn5HROgXbhR+5bSKs48oZLE2DV/
 1v8Xp9+Zq3QsQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Ck0NZBGyQO4SuR1a59wUc/QKKwf5/hW7nEzg12H4KFRZtjuYW61uxqGuK+fuEwm+5Cc+l96PGJx
 qy8mCTBYSRXEX9DM2NzdCEzL3UeiEfejDeMtnhBQj3CH1MRd4zKGQdSSGFndliJIF/aMutblKe/
 jv97ejyzw3036Svyx9nMASZwkn3yRCRt+h400pfSJh8i9zuEjKlNTsqybwvgZ6qdlcTQ5NU2O7L
 emOX++CSzApNBlqu3wUXUVjEXXlLUCs9jBexHmGtSyLI5OPtMQpEfGM/w6pOUZk7mVjBWkKCQvJ
 TwQfx6uj/55k2Ue/kxiBLFBb/pGMCVILZ0glruN01SsJ5XqgLyFZkDW7XDdb+X7ltoKC2Cc4otn
 E8IIF1jDqeiS71EGMAyxrc2bNRXR/HLiXYxwT3QukW/sT9+axUXwvgnuD/ss72pvaFmClLu+zVx
 ATXHQUmrrdbB4Y/n0JmhV2X/pbp5xVuxLa42x5hw4fsYLvj3efgW++dPexaI3vKn9AVWc0fM4vb
 NOEuOASb2O0h1SJllrT8e4hGvofyQ33HnKAsnAFlpiqUTZrXfl9UBuEi1HJ7qQubbGRd/29WI6e
 kPpQEuMNx3vGQSnETLFJrQm/G8PIzvoRAA4eExfIZQJvPUdoJaihnaFz67yCrw11KyaH1pHrMeF
 GMhAv2MLoJ+7DQsJVgEI=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3456DA4C5475;
 Sat,  3 Oct 2026 09:02:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-1nrG;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:50 +0200
Message-ID: <20261003070128.1295458-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 018/114] package/python-docker: bump version to
 7.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index c8f8e7501a..7585ff255a 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5  04e92a7b6dc8b88dde3c7cca6850b277  docker-7.1.0.tar.gz
-sha256  ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c  docker-7.1.0.tar.gz
+md5  a6f97d4f81fc342dfaf9b4d3d5b154cc  docker-7.2.0.tar.gz
+sha256  cebb93773d334f778e023a7ee352a8d6e13ab1bd3b863a4d4a59dec897df43ac  docker-7.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 582d9ee1d0..3d26f2ebfc 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 7.1.0
+PYTHON_DOCKER_VERSION = 7.2.0
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/88/7f/731ff914b0255d3d065f45fd4e626d4b8c95dbcbaada049f337a6ac16410
 PYTHON_DOCKER_SETUP_TYPE = hatch
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
