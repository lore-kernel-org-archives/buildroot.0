Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61148C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B58C60BE9;
	Thu, 10 Sep 2026 21:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8tUuCYkEzpn; Thu, 10 Sep 2026 21:11:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7E15960B0D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789074668;
	b=L+aad3tJOM4uiHHBqbj6hCXU+HrZe7ZK82gF6dAySwIvJZS2sWl2Bcu/rb/FEshZqS+P
	 go/11npzvgPpwcp8AhdH6YfNEK1uypi4p7zwJUOOcpqIEo7E1xYSvBYKf206ccaaqsmqM
	 o1FrUDX/qAPvsIf1uyhjE+qKjlf/6AfhQYWKsR9F5t5E6JC9gJyfO/ytiODrGRHM+MYbb
	 AjrRD9w0lign5SQhMr5IQPXa/5olA13cUIbk3o2WY0i4bGivDdmiide/SdhiVoEejr+3m
	 /17GdLeyF3OqdcV5Q54Ijxk7Bff1dmlEr/eIVRaWwygb7dxPdUGDX0+V0z4kJtefs7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789074668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	b=qIWQb0kBtS8L7oSbuSENnHHewyqsWC9y1nt0NmbeHaNuWu9qdcbXVq9ZaiI/R7QIZ9ix
	 6Ig16tJFRTh/A8uAh/fczI+lKMGBinzaOs6bBQFixMorPl4ntGbvvZ1jOuaTUJbqc2KtU
	 yT5PjUHL/i3hJvRoZ5WYtMVgIw7/lKFx64qUbZlRfYlbzEb7k1iSDlxwiuOJwyyBbVRL3
	 hThCNtEwBBTY/LL8wWjNLvkvTIDcV+Cbcjq4TVv00oQ+4DCtfGWwG8BLoOOww380q+5AO
	 X12mHQvDZei4K7CJ0tDX13EySFcxdo+DXIwUHrdaaj0d07kE/zcovujLMoTvDfF2c6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789074668;
	bh=ml+Xwy1CX6Nq/4TlQDctN8ywTY0hQCiRmKKF+Gp2MNw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIv0LGkbV0fSk6V3o1irm/wwPCgq/FhT7yvn34hsPBzB2xMxDdAfsRCP0iEueG9yV
	 PI27fgxN7MGL5BXy7fyCIu2+GRVmrVpYx9B67R4VrOwTSdPZ+QoFy+59ZPyQMsOsr/
	 kLEPeB/Mu4BuXf5cFzFmVbKJEjDVMsctqP8OYnCXofGGkjKjpdAmQB0xEEhN2J5kuU
	 pZDzwLU4ZWmxW1r3F2pjvP8QbXNiK+WgFWi8EXG56XBth95k5lp4D77f82vvb7JIu5
	 g3xclRiH6wS9B3ZWF8otrBH+KBzlXPWPlGmLBiRl42srEZBBixH3pAdoMFlJ90vHlx
	 +z73KLvgZTpPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E15960B0D;
	Thu, 10 Sep 2026 21:11:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F243C49D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F02C5403BA
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOP0lrzGDe7H for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 21:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E1ABA403A9
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789074667;
 b=eMcPmETsOf8nuSb2eaKnRgFRn7xZ5LC5GvaE4XR7lbSFSjEEmAEYxYVzWe9pHlhfH7bj
 VoEaqzu8YVMODbXIemEdB+tWJq5ZA887f3xgTV1m8/ofruPW8hVXrCe0umF35kXfgBqWv
 EKvwrtTVdcT+cWQgfuGBlzaMuiMwRc5kH3ilSyPsHT7XmXjTwltj3av9sebRwV8vX1UH/
 JteJYj1rUnBpaYklDgoJWpNf9NJHha1XJ9kkuA1jEyd9TPtUWsXgHaRMztm1rzv7Iu2kV
 VRopayikxPH2GX5DyNT21ajNhFMmskDByTDjp/SOwyuQqm33uPFYfZiExBHpdEGpHnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789074667;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 b=Gxfjoe8VUREpuwon0+KJpOW7JGnYAmq3MawOQLxt2vbwST75rDmMVHAPlGWowrNHQQYF
 1VDHWuukb8tHzD+cpt6Badj78t5vdkTUnWUi6FqV/XSy7Ldq4G+ShMx72RsMuC/IPkAee
 KmNB7XRYPwz/mjf+W4oRsWK0HfqMB5vlOSxZktdCQeSyHZ8aJKgAY0xa9R1tvN6wXCfWZ
 XcT5PJBb+B1mfpbDLuc0C/UExtiQdoA2gvRjiryZO/36MrV1/Xe7JlVlzb7u7EhpgC+rQ
 pvco+IDvURKn75pFCsDku9EIzepAbv8ocJORjm7SmU0lCcQomvwPj7tefeKgtpTqW1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IkFakmOE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IkFakmOE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1ABA403A9
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789074664;
 bh=mv4AC+taowwAo+GoH7Vfw//yu3tboGbefmD/Cqnpr4M=;
 h=From:To:Subject:Date:From;
 b=IkFakmOEW8DEGB6pvI3HNP7B4oUB28iuRtxkDQJBN5pZTo8v7KyIn4IbnRkvQLrrW
 Cqh1RG7nxj3QvrTAvWGu3LcJ32tUKFCtG+giwPlnOR9KlHDlAi/GSIhCjFxxdJQwlO
 CyzV8zvUNicXvyqDSvfN9GxFtEapTuzEzaALICiz1KhVp37kDYd+2ny7ILFHNLzHVV
 xlFIzQ+o4ZK6JoPxSQX59yyjf7+KXD3ubOHKCI214aPoBf/504Us889cPtTPCPVfSG
 sf1qeFSTRLm9W4zL74Yz3T4ffsT2Rbj8ekEA7DyRLDfbymsamKirworT+RNImDqzsX
 hgLRi+/P5GhGQ==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22E38A4C3C26
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 23:11:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59782)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4m2x-000000007aF-2xWZ
 for buildroot@buildroot.org; Thu, 10 Sep 2026 21:11:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 23:11:02 +0200
Message-ID: <20260910211103.2554103-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/xtables-addons: use kernel-module
 infra
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
