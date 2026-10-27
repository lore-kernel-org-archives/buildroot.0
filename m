Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562C606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=emj4RcNp
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C626061D;
	Tue, 27 Oct 2026 20:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yv6rc9Pd8Y3d; Tue, 27 Oct 2026 20:01:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 875F6606A8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131313;
	b=qUuH0pMUiQfdH+io1apZLe00+5R2OuDld+T96fWLUwxFkNKVordjov42PkOvpokmfzPw
	 xVHvZ0Ne33DZErf6JgHtIVIXENOZxRbJ9KUnT5Ro4eYyIQSWNOBIp8ZpYmPP3TDZ7gULA
	 Gth/QIRD9OQKgDSslnECaaYXXNRm2UHguuT6RtNqoWabdGz9JmAWKJ+Zi9HL9Yt9bJr3b
	 FXDh/3eLU1BOjclRw2MLa+okKVMqAGve+PDdhCrUVaNu3gVPdMuqnF6ypX+l+mM7rRHOH
	 uhCGb+59um9gt3MWEwoamFCULehLXQVQC4qCOlechWF4jp2uH1CYZd6VEWCrvKC6tPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gxe1c5wWdm1mxMYn/DBKSShC801xRVAR2I8dE2fyk4k=;
	b=oQ+UDNH5YvqpbmA0kfsg5eCWn2ZkNxnaWD2m4HJ/mWbxe3vHioMcEkL5gV0cOw0AWX27
	 up0r0VXrAQPq1csjrVA2Rxv0pYeWkMkX0pz6mAUSZg0iehaPJV6bhM1OQtH6Q9mXdmlZx
	 84l2COxJW9Zbo+uRBq5jbPwrOPOi9XJMPojwpgcFOvsu5dUlUydoLBKXaQGAOztKJxsUw
	 IsYl8R+0cPBPw6vaNlDLEojzG4Wv220LF99p/ng3+w5keoE1o/dQw8oEkXqZsZvTYXiEp
	 StVgcgFQv2dOVAMHaVbWPtfPgl5cggDnHtzmhBEksHgFlhogsqIOJM7HHAyNU73Nb7g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131313;
	bh=gxe1c5wWdm1mxMYn/DBKSShC801xRVAR2I8dE2fyk4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=emj4RcNpsx15oxwsV/srDtzwgVMH1PTSCFkBqiDDEGQbGSyMOlRrBCKlSwe0T0ART
	 BocqApDV8Z3sCokCe0uuX0hxzxJ8n3oCnCsxZIU7SR3e4mXIaG04Ngyw9Dbt+HN/K+
	 keMt7CUuTJ+Cr16eXsEPU1o6AVXArf1LS21vQRMEluGW2JzPH0svbL2iWZsSM+Jbi/
	 PRgCDHFVuGuCmgFQBk4lh33vXpSHB+GhlNj0htWXqTk5UIjq4eeSb3V2rE9xtJDyWk
	 nJq41QguZaUCddij2sr9QTS8pKjX6798xZKSeuJY5KgSDZniuGEiH3ub+iTHHClSEX
	 kyUB+p6Xd4ubg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 875F6606A8;
	Tue, 27 Oct 2026 20:01:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82642279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6847D406FA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1B4yRdqZuVnn for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:01:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2E5D406E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131310;
 b=hsNUCLidvLW++13Si7AqKN4xhW88fHPruphqyGRTJEdO5RTK+7+RYOFdDVfght0Mj2ra
 iuPaqXbcAtiTf4cBB/4HaeqcxJm3WmbnT07SjFIlzOQVfDIYfyIciaSA3QEv3oygSznWH
 JkFJxEeLTtt1k0GnD4LoS9+jwa3DAb46lAZfT1z05e9KBmn/HhR5m9csPetJEJBuKwSOB
 i/kwXAY20EY32KPNSyx9CmYsCUBrQRgup/t5zi/EJT44MwzMhutKB8nyxL7a0S5cC3otn
 zfqG/EVeqGZ5ZDPZxLR+Jq2lgg0uDHpkYPHHhwQwoRVaLkKnG28tlW7qQ2ZC8FZ5gxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131310;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=opGR/1c4DSN/6YtoocPBfhhS5HN8FV+2Ue3nPVQTTG4=;
 b=QWV3JMjiaH8DhxzeBe+nEWM9qT+e5M2dRwN4SBLAaTpeNFKpjHL6Z6s8efLT2CYhooW2
 419tbbp+QrkZlGDjpIc22QEM7UgotUqK6ctCeE8lnFforlL683IZMikd9kqT7urTnP8TD
 iiB7xpu+cFMNXJ9scNT/81dX8BWXxkkeTBwszAu9ta7o2hNkMEZkM8VQttTmgcj+fQICt
 tEki0NEt24MYLLr3iZOBwFCAQfCZQ9Fv+Oj9N/c48KN2aZgVg5QDM1iEq78bBAMKruMYx
 vHmBkj4lTCgFKXIB9RyoZRDxrOME4x/i2nuEA8HbqCvG7BdJ3HBVfluR5BHNy2m3woA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E5D406E4
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:01:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FF899D156; Tue, 27 Oct 2026 20:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 21:00:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a94b98c0a78e010e2bdc8c5c8c020aad4e86de7
X-Git-Newrev: 16e9d26454db405ea671709f83b4d96788ef0b80
X-Patchwork-Hint: ignore
Message-Id: <20261027200024.2FF899D156@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mender_x86_64_efi_defconfig: bump
 kernel version to 6.18.59
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/16e9d26454db405ea671709f83b4d96788ef0b80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Also update board/mender/x86_64/linux.config by running
`make linux-savedefconfig` and comparing the differences.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/linux.config    | 5 +++--
 configs/mender_x86_64_efi_defconfig | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/mender/x86_64/linux.config b/board/mender/x86_64/linux.config
index f17fc18edb..b758c6d45a 100644
--- a/board/mender/x86_64/linux.config
+++ b/board/mender/x86_64/linux.config
@@ -3,6 +3,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
@@ -10,6 +11,8 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_NETFILTER=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
+CONFIG_IP_NF_IPTABLES_LEGACY=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_CFG80211=m
@@ -35,7 +38,6 @@ CONFIG_RT2800USB_RT3573=y
 CONFIG_RT2800USB_RT53XX=y
 CONFIG_RT2800USB_RT55XX=y
 # CONFIG_RTL_CARDS is not set
-CONFIG_RTL8XXXU=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
@@ -43,7 +45,6 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM_VIRTIO=m
 CONFIG_DRM=y
 CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FB_VESA=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_USB=y
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 219f02839c..619122f5c9 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -1,5 +1,5 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_INIT_SYSV=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.28"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.59"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
