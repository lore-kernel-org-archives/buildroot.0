Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2542BE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9CAB612D3;
	Wed,  4 Feb 2026 17:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bxDP-t2nH71; Wed,  4 Feb 2026 17:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D804A612DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224969;
	bh=3F2DxgDLpALvblLzQIQcD/JZU0pJkP5fJH+UabXmCnU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UPYeB0kdCX6bro8jF5YEb2FpcX8Hya7Gi0riuSZWLwHr21N5Lg2pr0BkrSDgmyhyD
	 i7QFXD41XMPj1Ej0gBWakERCvWT5bWO6LCCEhmMol7XtrvUrodIQFx9Z4OgA89anPf
	 9GZsJlZQ0xBuPaUMnybd3RSWkyPVwjTdihVMAnUmItNG8N92DTHEkn36KuAVRz7KrJ
	 W0l4eRUoQhXcJMyVkZPyJVR/2a4ZtKJAzWulG8pT6ZxUCXU4QBhzapdfT+gFEuugpI
	 DyW2AapqVOWBRuTwJaOUyk9rS1btHcW88j2RPE//jSkHa10tZhpMQYkdOEK/BKBmkG
	 AMzUikJ5sYmHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D804A612DB;
	Wed,  4 Feb 2026 17:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 798F0173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FD6040576
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4DdS4dS5LIW for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539CB40580
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 539CB40580
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48E5386977; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:37:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5178621ab0b1571f526f90d16019c93b8f3af59c
X-Git-Newrev: 6bc63d08a7e6bccf5b20d656cdb65d51fb323c06
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.48E5386977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/busybox: default
 to BR2_TARGET_GENERIC_PASSWD_* algo
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bc63d08a7e6bccf5b20d656cdb65d51fb323c06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Make busybox follow the BR2_TARGET_GENERIC_PASSWD_* system configuration
option, E.G.

cat defconfig
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE=y
BR2_STATIC_LIBS=y
BR2_TARGET_GENERIC_PASSWD_SHA512=y

./target/usr/bin/mkpasswd --help
BusyBox v1.37.0 (2026-01-27 17:31:51 CET) multi-call binary.

Usage: mkpasswd [-P FD] [-m TYPE] [-S SALT] [PASSWORD] [SALT]

Print crypt(3) hashed PASSWORD

        -P N    Read password from fd N
        -m TYPE des,md5,sha256/512 (default sha512)
        -S SALT

./target/usr/bin/mkpasswd test
$6$VQ6lDdGRJOgs8Exs$gEWp1nN/FHCAgmoB6lD.fN13EKA40yV7WQmZJcFp114VrL/st74zP5iPsLHi5NFX/A6GAa1gD.yqzp5Lz3DKl/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fb523a75cfdf60906fc266a14475335937ea76ed)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/busybox.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d7eda71db6..446f93c36c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -176,6 +176,18 @@ define BUSYBOX_SET_CRYPT_SHA
 endef
 endif
 
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256),y)
+define BUSYBOX_SET_DEFAULT_PASSWD_ALGO
+	$(call KCONFIG_SET_OPT,CONFIG_FEATURE_DEFAULT_PASSWD_ALGO,"sha256")
+endef
+endif
+
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
+define BUSYBOX_SET_DEFAULT_PASSWD_ALGO
+	$(call KCONFIG_SET_OPT,CONFIG_FEATURE_DEFAULT_PASSWD_ALGO,"sha512")
+endef
+endif
+
 ifeq ($(BR2_USE_MMU),y)
 define BUSYBOX_SET_MMU
 	$(call KCONFIG_DISABLE_OPT,CONFIG_NOMMU)
@@ -427,6 +439,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_SET_CRYPT_SHA)
 	$(BUSYBOX_LINUX_PAM)
+	$(BUSYBOX_SET_DEFAULT_PASSWD_ALGO)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
