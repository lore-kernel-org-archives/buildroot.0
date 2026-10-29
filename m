Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA53606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qg/fw0wH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE8C40DEA;
	Fri, 30 Oct 2026 14:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KC0LWPX47T7; Fri, 30 Oct 2026 14:20:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 098DB40DBB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370012;
	b=qlCixX0HgoTlMS0/oYICRLVSUXzLgW9f3wX7TQPW8hxDO5B0iQeJiocjV2cDSJq4pIkN
	 1KzOAJLtblmC85UDpyXx9CkXFFUS7YYJRU62Z9nbND/HOeuHFvUS8hxNfauyAiwCiupRu
	 YwBABPh1L+ib85ErBZBXUfMYo5NYKh3zWgyi6ujUOUl4YhnJqmXd9YxII2hnKB+MAIcS2
	 qat6FNggiKqs4fkNoEnR5EB2MwW0WZFcjx238mNmZr9rWVL7pSGN67kZl3RxLifdxEKnB
	 eFwMaiukHfZEOBWt2zqMxTDlJlkYyV0l2AyPYc/WVDklg7FGyNkbfm/+9rYpvDQ2vzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VwVfnYzsFhtpPzSJspFTPCPKmn0j+j+3ebW0DW5anVo=;
	b=CMZVEs+1uU/noDeyqvLD+CbT0mChvGaCrD8LC4hxqkK4v7DUq6qjz6RjwkhiL7gK0C1K
	 gnqLxfOsRysi7I0kKFXxTq7OvwC2G2twQ3XhCZvHTGyeFpeZKxW+AnbstaqHfOTpOq0tn
	 dAc/yRljgX07rm7aZyoZfR0e+meCIM+NMkKQAW/s3watzBBm2yE8WquLi47pyegsD+Z+X
	 BHbw2p2MVojRzb76FYWqFxnACMm4nfTAghd7tdjAqPXLzqQCBegsoirBXDD/lt8Xoexfd
	 AprpJzCsedfafzfP9TwVY6n4uF7Pvfdb6gKvOqyT0D2Nz4spTj6K14/ZZiNKnpFWDrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370012;
	bh=VwVfnYzsFhtpPzSJspFTPCPKmn0j+j+3ebW0DW5anVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qg/fw0wHDswdfid86fAEf8dSmLlKcWcuIk0Chc4XbNapulcPvPYR7BI41ibpoY6ss
	 lllJdOoAYFmfeUWD320MJqFks/VIvVXoCklU29mv6rs35P/HjbJLif4a8DH+qwrNkJ
	 Ol1oSVQrWNcGaDmx0+p4EWlgMpGGpeSZM+2fxS9DglHqwI357nGXz7VH4tecV/hNq3
	 Qv18Nx92BFziN6cf5CLJvy5t3CqOzjABpumz8e/iVXENGrWmp0dGNXDcwc+9cjtLWj
	 9bxRM203fSCjMqSEw09scuI6rXgTlv8YNym/iY588DJFqdTV0qAoDQwvXe2yR3yxaa
	 GmVBEAtOJRFsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098DB40DBB;
	Fri, 30 Oct 2026 14:20:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 153B1362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED54E4052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30hi1UL0XQ_9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3A1A9400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=ex6GQKJm+LGnRNZ5X2ja8zRXrE6J6utqjNN8Ep1uofHJZaC3p9/+6k00C0HJ/AAjUkUG
 zEtUI4zRLnyLMXNMNDxhLX3JtV03GnswnhhAtFrvdbAhobw291QaPw39m+Uj9kAAxIezh
 YNNnRCBX5S4f2FDMeSZFplFP4u1g1NVsE1gBYBREiPEU/42WrMD8ozpvlP/OH5LPaW8J0
 sxCxigSY+AIxoslJwyBRpi+bLPDEaLhZ9+wzbahaLiZgsdAm/mRlj+avYOtceF8hQ8KrG
 vqAt0mgy1Ysdf7wSjczPFrrPwz27oYXibAwPTa2hoMj6r6n9yxhII7gDswytR7x73Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xkG8OXsjzfoYcYWiLerSRZcj+8L/w/XeoQalWB6B1bw=;
 b=ESuqwdNKr2KPHuXe0Wuhu6v1Vj5Jb0O6XpJ8yJL9QthGER/dH9qmwXLYWwnJuKmACFFu
 eZ8voD0EOtVOikeCX6Sw1Ketm+cq2lyqmhInX883CxFwHxfoxM4Or/Y0SmXw0FJ8T9ePZ
 TJaUVQWNgMLStOcOu6LNMwXfi81cHboaeYmtNHSoSR58rSMO2FgJVScby1xVVB0g2wIb/
 7h0PkXVbGkDF1jJKJLwKcP1sv8ReZuqwdTRHooNeldqPWCaqBAb32m7w7pyKIRzgny6z3
 MtjIHu/A6XgBaRil0OlAgTXHQKDgTgK7x64M4aXytFGXdJwFVWw8Mt63Tq+XpCEbmHg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A1A9400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58B1D9D389; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2b3f15445f090a6c92ce055e32acc37f8a5de898
X-Git-Newrev: 60dd511d7a478996a85285d90a1137fae92dc852
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.58B1D9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mesa3d: i915
 Gallium driver needs llvm
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0155786158516197051=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0155786158516197051==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60dd511d7a478996a85285d90a1137fae92dc852
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 52ae9f49b215178784f36b486611248e217fc153)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0155786158516197051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0155786158516197051==--
