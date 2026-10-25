Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD74606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YpJkx7il
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830C580DA7;
	Sun, 25 Oct 2026 20:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iDzinjKlCuz; Sun, 25 Oct 2026 20:42:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A138F80D80
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960921;
	b=khtkWGFxBRUWvL31unDI3xWVFqoBz87vaVy1Nf2HTBcdwdz6tju015/KI1jU+5reNODc
	 fFHX9vOBVcZeunRh64AlwbVeG9qNV+FH/FWh1SQdQtwKFc3zpTDQ4laRUaPsyGEdt8cns
	 ZxhjR/gQf6WK2dnAuGJfnmZC9hzIHxNv7mlRvcnMdAMfy9BE7v8tXfmzXP/8WWjvzvCvV
	 yPr9F8Z4xcK+o+qulDAqfn8cOdbjj3S8VOOz4siHdK1HzDpCUfpsSPowBoijufk29+IXE
	 4QgYhrLsdkJSNJp7yA/niMSmYp+HiM/mR5h8zob6TD7ZFB8cI/pLAApIN12pM+yVaOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0z8tY3SPQ4d5ZPb3c1a8KitMqmTMYXnJlf54aIJb62w=;
	b=cBnOwiuVVyoXIo00p7Ngbd0xW8QWTBw7b2ROmrFLh9FnGeY6hmwzJGFyGYu+Wvf9x+pE
	 C2Jyfmj3OJxM1wiS/R8bWBh4L8FLizxSWAwLqunRhOWpGqbqOI/ROqxTfvMox7k993VFx
	 s/Mi3a87QikqYUxDOmpbVFBL9a+5p9/5CPBGBlirCPPWXtliA6VYBEnz8E6OY17g3Cbaj
	 jOzapnqP/zXFzQM6Fj9aw115fZOTR33Vh5xX0bm9soGQm0mcYO6sX0VaQxQffFiJATshL
	 GNAjFYPURtvBNo70tGwV7EC/tYEgh/4cK6rz+lpRdn2h7d3Mmw3h0/VIzZsdETC2rkQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960921;
	bh=0z8tY3SPQ4d5ZPb3c1a8KitMqmTMYXnJlf54aIJb62w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YpJkx7ilh7eo/STRe9ak6Ex2WoZZsZ4OcH+rYDfjojbGWASOsgKGDvnCvkuYFuVaS
	 cOnQwsKSnO0AdOFU/p3pzfuMp+zKWTOlQNdUEJjIuA+or+k5cX3/Lcazp4E8B9ciFJ
	 C7AfRpvOAA9TSpv5wcFdz1ggu7iLC0Ian9n+STDQa6+ahh3bCK9qMmYirYiBdCc7KZ
	 Y/xjFZhYpW26Qn0JQ75vu46hnDyTSR5sGu1/XuPfdJo/VwRFono3VIjiSZD3sYKiZl
	 Hb/ZSiOdphX+DPTgk1w7o6vStWJN+sj/9SQoeKE1M10S2FY0nrV9JmHNjda6VGf686
	 YypyrbQDLjgdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A138F80D80;
	Sun, 25 Oct 2026 20:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A14380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7C4880D80
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXyTYlKjtaDQ for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:41:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D905808C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960919;
 b=D1/MP9BY6ca445qTsVaMRAfzC1S6Juv3xrzWMNV+M9gQF9ukBfRdx8HlAFqLYcxkeFC+
 xjMwuNZ+Qtd9W2OL2B8JKyQ0I030j011suq35N/TavESdCUJzPGeoM7TV/1uNpvCUHO/X
 5fqCzf7wKRiKw8A0TTJYCtd0VyLfB/K1hzwrgaCMBW5qIJJttxnKsqHJtX/+chY25XuKO
 fFrQP5kYBqy4pkJM+VQs2hoTy7m9Ft2kgYi5m7t6VsZ0oc07j5uUeIJWMSPnm3qmUEHMy
 azaj99PQAjTGAUAex2rkkH2kYcnPl7YFXGBCOmQyTvvxlP+94YX+4dKCQBxAiUhmiDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960919;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gWo4sB56p04Vw294xCphXvv+RQaYwA4YBwCu264cvLQ=;
 b=oJhv+tWWnJTUywV1eJotvv/rIgJsE0o17/8aHsdNQCbWw7/oaaAQG6JYH5tYSG+xZ/eV
 mCiP1ycjv8iqhwYazu6pGmiX6ue7Xy7Q/n8K64WjcmLqgBP91jUTYmOZ3E27R56/xDFmr
 l6Csxt4kt+6Q6GOb5q8RcqpabBtliKcvPJ5I7GIXzFf1GfNHbd1q8xxeCdq+7UVCX3W1w
 2LXOA684aPLUipXYFQ2Ic3r6kBkF6Rx8McxQZRO8dWzkT2MxDNo0RzjhCGr8x7ir+TDN8
 TXrPqNcqQcu4eTtjtY+X3tWvqXdXFimro1qcj9/RdEDnbxooI213x6EiYvybU9+S7nw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D905808C0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:41:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 637589B63D; Sun, 25 Oct 2026 20:40:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:41:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1c66c6d8ff032497b75e16456e61821e6c849e4
X-Git-Newrev: d46f1df72722855398efcb9771ae53d0a4484f99
X-Patchwork-Hint: ignore
Message-Id: <20261025204033.637589B63D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: radeonsi needs wchar
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d46f1df72722855398efcb9771ae53d0a4484f99
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_MESA3D_LLVM depends on BR2_USE_WCHAR, so does
BR2_PACKAGE_ELFUTILS.

Buildroot commit a24698054b4cf6c994c91d49513bbe5e7b270201 removed the
dependency to BR2_PACKAGE_MESA3D_LLVM from the radeonsi driver but
forgot to propagate the dependency to BR2_USE_WCHAR needed by elfutils
which still is a dependency for the radeonsi driver.

Fixes Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_ELFUTILS
  Depends on [n]: BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_USE_MMU [=y] && (BR2_i386 [=n] || BR2_x86_64 [=y])

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d1b6a38858..a62956bff3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -253,6 +253,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_WCHAR # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_VA_SUPPORTED_DRIVER
 	select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
@@ -273,6 +274,11 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 
 	  https://docs.mesa3d.org/envvars.html#envvar-AMD_DEBUG
 
+comment "gallium radeon SI driver needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
