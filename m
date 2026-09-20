Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38DDC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE17780DD3;
	Sun, 20 Sep 2026 14:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_QmKQPpLzm9; Sun, 20 Sep 2026 14:48:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C5ABB80F28
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915728;
	b=dTPMQfx0XN1Rk5sBQOm4sGbFN3r7WQCKr2n80Kg9mIaAfPJDv7beBOSJW7v5sX5rSuE8
	 smjWlM6OhiZqFGov7YYAVJ+gZco978AAC7VCAlNB+Bidtx7b1w4JIdOOjIdRmH7gz9r9Z
	 8vb989vOgQbOPN/B/0oVil/m17vkjQn1bru+XKO+JpuTCBdx6EYjDvg5tMpk/ODOuNtqk
	 TXEI9t6F4MMCx6U1hNT1nl8M1VhemlGT0P+gWoW8GXJkzYVAkUpX9nmqCPaFlK/Xny+gi
	 HTHk09PWqEIm1EoFMxc3lUXpzRPMnKwA8VlOviWtHWOsEDGC9WHHgpHzzPLPEgPDIDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=d7L8mXWj8kG8e186ByvSx/kcnFxMQKL0Os+/Rc7jjmqAsdh4OfjV0/hMUZx4h7sab1MR
	 QsDNevXLMtAS472kfqmGoAy6sYBXztFLRBQKZ7v4VTP0JeHNmy8DalvM5H2TXGoBntiyr
	 qNBaGLzCc2Bkc4QiyrhWPeQAao5CxLE+QHX+L6jqn4WUhoYt2M4gOoSOTqJPEc1/nDfe4
	 QkAKnYlKbx/uzWgyzMf4Bx8XsgpcvN9C4p5zz2CdDoxnneQenLlNLa1/FonG5e36dxi7O
	 TmdPGnOp958byML++NAhQJgg6bxALmeHjm8y8SWpO0VNjinlBaaTnAsF06LhAKR/WlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915728;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=auljno1yQNOkOME7QwBuu3S5uNQgw0lRAc7j+Wya+BYmEs8Po48iach/Zc/jB2p0/
	 IBlpEAhL/LQuTnViJBIznBx2yfz2DG23nrCsBhiF/1AUQUtykIPkZ+ku7tnbONe+MS
	 u8BKJNdX3EkJmjn2wcOHLYA/JLti2WK/H5h9HK6b0jJmkzKc3CICpWsXjvDw/8rDSU
	 VdZt6uBXnHgl5nIFq6Xww88c1jm5ATGcqMC7Ub6ntgWdd7B+eu0YbadL4b35iz+xrH
	 fY2TSLuJf0azISc0FZot1tJw7Zva64H1Sum0mAgTE65YrxpKiQDklO9C5slegUo4Ko
	 1P3KrXEkzzROA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5ABB80F28;
	Sun, 20 Sep 2026 14:48:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB42824D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD27140836
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9enkp11bT5l for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:48:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1AEE74081E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915726;
 b=pDouuLdxaTLGJxv/meFMfBsaDjO26LJL/KD1uualGXXWqYwHah9AWLqoicCMtzDsVDdC
 X+X017NsM75t+A6Cnk7TVRikBD6vc1WUWcDEILb39q/UiLKemiSSgYNh2AzpFq2zcCzAs
 gUL/6YvlUXcXa8YIx1Gfdw2ffNpdLcr/67zTRLc88mjn1cbcEfqEA7gOpJyn5k1lqxQTQ
 FeMgoJcvIMz5JSseKETVJdk+BTVwedPFeEkEQ6hmeh6bFQwpgpeLDoSORcieGvQ/0awmI
 7TObBeNeNgWtr1a3mEf5DIJhgg3E6cvRQK/HzTICCb4wcI+qVYJ6Fmpw+uGZj/7cIaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915726;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=mb+593Evd43IpXjNuphC2+XXpfs1z2OLEOmIJrpm14q98Fza0X1pQ94+nKhPySmOI8+9
 vBDXBBifN7Xn/dlC82ukGr7gRKEwuS1xVIJNwfuVyuHX4ZithOKT4+1ykWWY41tGZM4UY
 FhjsM3ViJuhCEw8YuGHlB2H/LsXH2+W7T1NQhnY/fcFxZeaYgzex6FJeRdFhJsG0b82Dy
 vJFP0rGz5XsRj0USwPMtK9urS0qeiCoc3bAmordhKRWOLWBrvDhasuK3DwW/JEZrTKm8N
 TFEeTHW7YbO8JAJas5J500+Ez1fJdqLx8S4QjpDaLeWRi76y94oftldbV9DG+EWjzgw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="eSVtu/5n"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eSVtu/5n
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AEE74081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=eSVtu/5nsfVwm8BsbpCbFavkUP0k7Zh0qHTT3rSD6mMdkSYOhZWYgjAjz+c/mMeok
 jufJbB/KcDSWh4QYfy2hzJk9AmfOATng3ej6nDXBjSZV3jCNZEQuRji6p+V2yNKQz1
 WXmdZS11Wr5JQoIPBfXaMG5nROxWZpZXzPP+VC+NlwwNWoE7cCBy33RfL+8sC0yh25
 0I5dHnu9MWKffxe//YAUn48adHPQ2JWv+oi4gn4SvfYoHhyIDXC/L9+Jo8fF4XaAsM
 DUMgZNBa/hMpKfmLsDqYspfxGm3Q38HSMyDCeaEBVBlGjWFOe9Vkd3D3gqcuYBTJlf
 sgHFtlmN9xhyA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:RuiAnxAAM2+e154LzzKyCNywhuOtn7MN78YMsyNargCGJA5LUHS7gZFvZ27c5iGvgbJVnmrXfo6bXrKxbceioqKBra64/i/AzfBwZl65+WYKYiEWnXjuZlt1XBWhiPzNsuzBxW1BjtfNzUcq7zF+q1lYpT2AXJdbhk5CUcrqrZfXIw7WiW5JVz/Y8Vfuo7Pm3N/3uXX4dg2ylsdeSjar9DorNHaWQxslfANuvcL3KB8TgVH3nyb+wc4nJObr7ZrhMZFsUxKQyNrPWuI+yy/b5T/uyChGKtjCk7E68nYm23cSZ+SpdCv2tAk7SO24VI4XR/WFQMtNy2pmLGK/WEG3k98p/rlW4OOp0AKcCSArnVsU+MTkU+baFLdWE1zGM2R8o8wA6658qHLqY3BjvVhRRYdeLrypXiU0sI11jATWVQP8sCPDtL+FZDcit71FfwW/x8aG4AqfDPN2wxKc3upCbkWKq89lMfeLgZP2gtmoTPS5NLo0SmSmuF5HQdfNAq2cPGKJUsvSsVxsjxsDkLWkHocAmwvoQiML9ThhCHD/aaEfAFYYBy6KiE6e3b41TDz9np620yqE07A1IvL6/DUeN1OwwDwBeYTzWvP2cAa5pJ0hQG
 G3J54CIEjwVETlX5WOKUkoy/ZUlg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2F0B7A4C4874
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-31v7
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:43 +0200
Message-ID: <20260920144428.3009612-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 22/66] package/xtables-addons: use
 kernel-module infra
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package does not need the kernel-module infra because the kernel
module is build by autoconf but the MIPS fix from buildroot commit
1d8d9e8d6cd824b2a43a0b92d71cfb25a3f9300a is not added to _LINUX_CONFIG_
FIXUPS causing a build error with this defconfig:

  BR2_mips64el=y
  # BR2_MIPS_SOFT_FLOAT is not set
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
  BR2_PER_PACKAGE_DIRECTORIES=y
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.156"
  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
  BR2_PACKAGE_XTABLES_ADDONS=y
  # BR2_TARGET_ROOTFS_TAR is not set
  BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

  MODPOST /home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/Module.symvers
ERROR: modpost: "memcmp" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/compat_xtables.ko] undefined!
ERROR: modpost: "register_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "_printk" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "nf_register_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "unregister_pernet_subsys" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "xt_register_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "nf_unregister_sockopt" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "kfree" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "free_pages" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
ERROR: modpost: "xt_unregister_target" [/home/buildroot/buildroot/output/build/xtables-addons-3.24/extensions/ACCOUNT/xt_ACCOUNT.ko] undefined!
WARNING: modpost: suppressed 342 unresolved symbol warnings because there were too many)

To fix the problem we add the kernel-module infra to the package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xtables-addons/Config.in         | 2 +-
 package/xtables-addons/xtables-addons.mk | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xtables-addons/Config.in b/package/xtables-addons/Config.in
index 36a42c7efc..8943276843 100644
--- a/package/xtables-addons/Config.in
+++ b/package/xtables-addons/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_XTABLES_ADDONS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # extensions are .so
 	select BR2_PACKAGE_IPTABLES
-	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Xtables-addons is the successor to patch-o-matic(-ng).
 	  Likewise, it contains extensions that were not, or are not
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index efd8bd98ce..a3174725d0 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -39,4 +39,5 @@ define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
 endef
 
+$(eval $(kernel-module))
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
