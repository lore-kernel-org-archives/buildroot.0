Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72216606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kwoikr6r
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391A28121A;
	Sat, 24 Oct 2026 17:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdbkGIOVTKPr; Sat, 24 Oct 2026 17:54:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C3B6811E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792864458;
	b=IwvbsaccLCkgQ7dQMhOKskuvI/un3eoGLAxRK2bBMOgzfXLHLM81WWTZzciEnL2ReOEF
	 xylQIkPMQuXqkHDhYLiEs3UPF6fewS3Ru6YCrKjJ/XZlvrJS6VIBumovZUSh4m7dskscO
	 bs77RKmEZVQOG2RihxVhpLBvNxaTLdeG+yScAw1qSObkYaqxRj14AwJK81OjCNQpbKOYg
	 KfvMNr1vp4bvBOD7aceOS6rIB4G+rbGcBa15CeMsmmTjSS9vFQifaDH1ZNTJhqSKajrDH
	 GoN5A86Z4/UN9JbvBr6Lb9SKwIPkkgneMrBIy571h+LvDUweo6hUX265/5KI/o0t9eA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792864458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZMn/jaAlX+BCFW+PVsDaaQPKMu+FEUS40GhihbJSN3A=;
	b=nSpv+BedwqbdFWzoO+dAnoNHg4kUY/yaidXSAc5NBZ32MEOauywqdw09XHo8v8hyHN6G
	 IkOZQrOhmIi3rnp/hbJA1yUm2Ww3mObkzHkVtrnOCdFrR3REOToFE+ovjBAUPyJYWdnJj
	 cHmWkAIfKLY0nJR2Yc20oe7m7+U4WaI6Mxmc8XVcXNW34F9HuJ3lP3kwB6SpPfoTGinBJ
	 qystDUUJBM1DlgeLKbPMFtS7y62H1eWcNlqw0M/QY7lCZUBVZwobb3CTISiHwq2dFB1Jv
	 Fl+QsUqNx+prCBmfnI8kjZOIx3BEo/d1m2WNkPc6bhK2G1TjJPNtTk2lHf8qqXg7u7w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792864458;
	bh=ZMn/jaAlX+BCFW+PVsDaaQPKMu+FEUS40GhihbJSN3A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kwoikr6r14pxSj7d5ZD8jg6HOpy60DWJagv8PjIHX6wn4/vTwmjDuve/q1vDdCdnP
	 0D49nmBx5YE7bPMzele0NB3XTnpO8wFeDKZLpdF2z9TmUemI1KLa9hhNd4ZpKShpd5
	 +L1ku1vngHNA8keqIu7Uq/Gp3EciPHYrYcXIkjK1wrU31pr12hA72coEr6MMebh09t
	 JKh7mJM+zJ+iKgkZ800NB8SLmOs9EVLZk4+kRRlXp4H/M0s/mNVO3KFXG8Xm3LR7Kv
	 ld4Dq60wnMvjWU+1HcLbuNtgA6vfgJzAktgr/7OI9pBO0iZZjzEOEb0at5QS9Xna1a
	 j7bkYRmKo1IJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3B6811E7;
	Sat, 24 Oct 2026 17:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C362765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1213440692
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92PGSmibUSS1 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3ED3F4054E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792864453;
 b=psNWi8SqvqfAms5T4Sbm+raC6VWV/qWAtb2XP/K+W7WAyCSPLNWKvetyyES6S3yuKlWl
 b2Z2CUaQ0p13BKzzbWLomDafLtYxVmbo1YNaHV70D/WtqgBQGc+2b29fuviWGq6N19Ytq
 XN+nqcjDOlxlJVOspvqLxnZ3onU1ySsudqTj1zhzFrvWbxSDgbPwKlE9qrR7y9jdPpPWs
 YE+iGMByP4SuVIUNjlhQAiJ9kwdJHs0x8PHjO2YjkF090y+hq/77GiKd5Gel4Tnis88/u
 BisjopOF90jFVwwVhc2hIYzJ/mz6tCcFsEe3h25q0MLKM2nRQMFj1MdVI/cKf/2ClEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792864453;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Fi1xUZb3gbqUHCi2ZRyFaRcdGw7VvMf0zHUiJZbopz8=;
 b=Mr3d5ZF0m4a9V7PQkm6xU1voRfx6FRqTEFw4igeKeRKaTNBlqdHIEAVvQasltyqGVd/e
 /KW11Os2k6a9CuSJVig8u1D0XW1CWJUvbJMlGlF7aZXEeBXAHT95OmoFgrV/dM04VUtDg
 Y8XO8PHooK6tBHooOHFvT3rsVgcf/Tg2dHopu/WJyfmy9PIpSVdHXqAcczTmlq99vpJC0
 JgZJRzKjc2694bVOcEfbWHebbcGfJ+2qKIKRMpzrz4EXYWXl6AOSdEi0nfYgCUSYNMEGS
 8XqV2wiytx/ps1SoNbjdDX/cpo8J5Q3WOKPKsZwCovoYpR/GPfRQA/GltwujHDcVKvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ED3F4054E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2791D9C8B5; Sat, 24 Oct 2026 17:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a538bf0ac93e030e8ad8106865d11559a448b655
X-Git-Newrev: 52ae9f49b215178784f36b486611248e217fc153
X-Patchwork-Hint: ignore
Message-Id: <20261024175248.2791D9C8B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: i915 Gallium driver needs
 llvm
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52ae9f49b215178784f36b486611248e217fc153
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 3e296a151195f9d32dbfd62d6c75d08b822be6dd bumped the
package to 25.3.0 which includes upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b8b38d38b1c14b60de0324ac2f98ff7f1f4cc3c5
that enforces llvm for the i915 gallium driver causing configure errors
in buildroot:

../output-1/build/mesa3d-26.1.6/meson.build:241:3: ERROR: Feature llvm
cannot be disabled: i915 Gallium driver requires LLVM for vertex shaders

Please note that
https://gitlab.freedesktop.org/mesa/mesa/-/commit/4235c39a9a8378f1e2dc0899dd4c3c941f27b887
later removed the llvm dependency for the r300 driver introduced by the
commit mentioned above so we only need to add the dependency to the i915
driver.
The configure option draw-use-llvm is disabled by default when llvm is
not available:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/37c7d19e46a4863c120186a99ac0344c2dd31260

Fixes:
https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e18d25eb8e..f45a675445 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -147,11 +147,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
+comment "i915 driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
