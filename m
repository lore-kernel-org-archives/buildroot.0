Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08539606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S6O13Iz6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D912160B34;
	Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geqXSM-xtdme; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DB55060B69
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369895;
	b=pz5Kze5H0frnLkWgcDkg+LDrt5AtslCTbgcguqiUYGRL4Fg2P7ldGRdCZHbyNjewKOwo
	 amvRWmybXc6T9yQh1swimcyyH6helk7TxJGgg3Vy+OCmigh/VfnH/spWYF6tLLNDGGhHr
	 mnL8F5yuFPEx9HOTM/reTQBxGLdoqkXx2+PFcE7iwH3MmVvUYtiVY46XQPUoxHcbIIrfs
	 49bYLE/cViZRZNMLFg6UeLoxnwfFTll9Q6vjtVB3sKZ9vQ524+CHD8Wy5zdTg92YORHRF
	 jMDrMU+urfFJLH2nTk+sISbTXNG6xTlPhWbXyLm1zj/6pC4ZafRRB+O3vaBeR2D3quQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SuXpoHzBniLtwbCMCF4WpPWWVB+yxLm30EgKc2hOzCs=;
	b=WQup4wclsCZv5Zi6Xqijvq+OBhjcjBWw6gIyp4RgJ4F0LksEY5mVw+/UgTvxaHo7NpTm
	 TW6aGyfbdmDe0nNqDCfcU+MRigaOVAMKlwwhxGbYIt/Xobh1RaMHWFU00mEhtaravmzOG
	 uHtkMENmKrLlwH/kCzEZhcgYMzYbWzaSDqR1GLkPsmMY8glLKnDPZiY4Sz4GZROk1wdFi
	 xeRoZ9LA8pMaJGD9NYcB03YNT7IKLs6eYuLS1JTKrJsP4K3WUBv4PKnS9/xgyuZCH4x6S
	 H1Kro5/7m1t8S8RD8F6c5wR4WLTP9wdShRiZ5hicH2wyzk5zd4afz9/O+hWgV7Mnmww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369895;
	bh=SuXpoHzBniLtwbCMCF4WpPWWVB+yxLm30EgKc2hOzCs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S6O13Iz6M4rxEBXWICvA6IHY9McStAz6b9nYczm/pzlcrlVqUHvPppWo6vfLQinX+
	 ugSbJ6Y06I27Nu9fFlZ6E20XtwHhpGK7nhC3LpzhHKGiwXwUL+xB7pFH9g9uJrR+ra
	 lQ5IrhNIK9oAoCoBImEED7X9no4n3X8oxC3KNSXNcUjjWFO5Y9RCMCuej1HeGeFCEw
	 pZDHYjFZprupCScj75tM9ma4UVFsHMV1V5xPYR5AeI22Py0kz/NQW0/S0ycgOHBqwv
	 JsSfWjbgpAk+xVjkcpI8c5ov736g5kIWT33xDH0DVv34sC7lL20hN2W9fQSLTnVqzm
	 FW5jUwCkFR0ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB55060B69;
	Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 910D0D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7465E812C8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaOTGvqoV8GB for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE1B6812B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=gjCBmInDFrRmIu2VMPaoCnJBIMfStthx0StYZ/hiMZNiNvLkF9Avfosh7Wtsw86jR8oO
 BegHvwry023m8Nv5hmCWPVjxt0RNNzk73z3mkZfbchhAZ1/Bqu6OQi5DJdAJWWPXVFJui
 dqcQVSlafUPh3+yLmX8LBnOlRh3dx5Y3dBc2kclEjAdvMvbHFYmooeYBl+YAKIokSxBe6
 IWkAl1BS+CYhriKp9C2rpoxqmhimVqlXjcUU7f0f/YdQPBP/o8Nd+2TiLJiQ98czcrMRf
 8Rflmsr8TanHkp1MtfGqt7eO2mechsu+4zN5/zlLwXe7ywTd31+dvSNpE6cfoCzPtSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oP0yr+Up9RBN3fxDbZ3EaaoGH/uMPGa+Kslmly599Ag=;
 b=BDVFEhhYso/ghs6T+eXaRmeXy6UpUCEtEgoO6EPfQgNAuSUkzO9mngTHS4PpZqGs+0uH
 L9HHnjJEesZ19AGVIwkSZaAkHTzIFmJgEcbgu/BkU2k5Jk1XQ6ZEsB9jffRObkYPoLrLB
 Iag2JQz3Zn/l7qvz5lia21SnRTQBwCyw22WW0zch8DYbJENWF0nETOB4z9kZ3CAlC23Rk
 OAzbTThPBOmW2FFqpygKz4aVP7f04z+jlwNpFLlAbFJWgKVNhUNbNO/r80A6x2xSmeWNr
 qi8VZALgX/2MBZ6SHPCZMinLww6lFGfHtZAefdOEWQpZXk04fC/HLmK5AwHot3RD7sA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE1B6812B3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD4679C645; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7674709e657f8b5d70619a2ed14f3ee0485f388e
X-Git-Newrev: 975b3e6420bfa21b2c85c62a83c405ad904f98b5
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.DD4679C645@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/podman: propagate
 missing dependency inherited from runc
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
Content-Type: multipart/mixed; boundary="===============4653527412006015266=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4653527412006015266==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/975b3e6420bfa21b2c85c62a83c405ad904f98b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_PODMAN has:

	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN

but forgot to propagate the
BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS dependency from
BR2_PACKAGE_RUNC.

Propagating this dependency requires a bit more care than usual, due
to the ability to use crun as an alternative to runc.

We also propagate it to the only reverse dependency of podman, which
is mender-update-modules.

Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3e1ac8ad16a8d0d54cf0757faa414ff663174ae1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/mender-update-modules/Config.in | 2 ++
 package/podman/Config.in                | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index dac83c47ec..53ffd13dbf 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -129,6 +129,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # podman
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # podman
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # podman
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
@@ -153,6 +154,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
diff --git a/package/podman/Config.in b/package/podman/Config.in
index bbcb15691d..a8c625c5b1 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PODMAN
 	bool "podman"
 	depends on BR2_USE_MMU  # fork()
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # runc
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
@@ -91,6 +92,7 @@ endif
 comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS

--===============4653527412006015266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4653527412006015266==--
