Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9595DD2FED9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 20:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597D860DD4;
	Tue, 27 Jan 2026 20:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-xHx08bc4H4; Tue, 27 Jan 2026 20:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89330606BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769547186;
	bh=dO1zZGDftVqOAFJKO7u08+Vei7Zko2KKSmG4JZZCbok=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kb784dHnTXlRRXdajoeo/tJg/senEM7IfWhJdC/pGqadjLlbOtHECyKxKIooSQiA0
	 nbHVfQjONqCUfTRSidOZYCuSwG04FtNqDJg3KdSUctbU+PXVcq99GZDHygYBHPsAdF
	 qc4+BwyWRlr1uG6kLfPC4maqOU2OBlCwocbnOkr7iWVroXoEik3Ub/1wgT8z8HgAP0
	 hYqmBwcVrrVWaN2vs4GnPFfPQyEsxQxM9/ceyOKn0egfy7Vw24Yk76ZSOKZWTtP+1I
	 5356lSm6N8sZ6CIlX6qPJ5cvrzOt6R1QTuxwISY/DT+cTPWheaM8SwAm5PXAl09ZPm
	 IZa/4hOPHo9cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89330606BB;
	Tue, 27 Jan 2026 20:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B16A21AF
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F8D3407FD
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlSH81pEV6Ok for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 20:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 980BB4079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 980BB4079D
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:53:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8719387774; Tue, 27 Jan 2026 20:53:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Jan 2026 21:32:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdeced6692b12641097864399ab930b88cebff64
X-Git-Newrev: fb523a75cfdf60906fc266a14475335937ea76ed
X-Patchwork-Hint: ignore
Message-Id: <20260127205302.8719387774@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: default to
 BR2_TARGET_GENERIC_PASSWD_* algo
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb523a75cfdf60906fc266a14475335937ea76ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
