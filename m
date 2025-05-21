Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9814C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 07:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2862B613C5;
	Wed, 21 May 2025 07:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oEwnBQ8iEsS; Wed, 21 May 2025 07:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F1E613AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F1E613AB;
	Wed, 21 May 2025 07:40:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 320C611B
 for <buildroot@buildroot.org>; Wed, 21 May 2025 07:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1845A613AB
 for <buildroot@buildroot.org>; Wed, 21 May 2025 07:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pceUJm6Os8AC for <buildroot@buildroot.org>;
 Wed, 21 May 2025 07:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65D7C613C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D7C613C5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65D7C613C5
 for <buildroot@buildroot.org>; Wed, 21 May 2025 07:40:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRRT-1uT2qN43R5-00MyfS; Wed, 21
 May 2025 09:40:05 +0200
Date: Wed, 21 May 2025 09:40:04 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer via buildroot <buildroot@buildroot.org>,
 buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250521094004.4fb92fe1@gmx.net>
In-Reply-To: <20250518165536.724fb681@windsurf>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20250518165536.724fb681@windsurf>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:dh5FosjDY0Qk3BKzVQC9wRUI6w5U9xCBb3ENQQ/uW7PgFyEdZ1f
 om/RLlO9RJKn/Mqpxbkw4aPv3wLUW/pgz7xw6tlFglB3Nue0ZIVfjeYhZzlZbeuezOaSXMt
 6xhVdCnRsKqQE0z4cAyhkr0S+g6q6sutx0n6pvaINkzI2Ydb0WW2UBf3DTZnHDYq9Ck/CjB
 LqM2XuaBFK4j/jvuTHhuQ==
UI-OutboundReport: notjunk:1;M01:P0:jse0V/VGbho=;zZ6wS9T/EPEKBlWx/9gDLWrTBSJ
 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
 z2qutMXEblVjwfXExznOo1y97
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1747813205; x=1748418005; i=ps.report@gmx.net;
 bh=xkHrip2xRfY8Mduz2TmbJgoEM+RQLrXT6gbzQVpMepU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Bfhi/SVJt7sZEfp/XXlyhLwf0xUCyniwJXOiWX8kp7coSFxEqkpxroyUk5v3LFy2
 xYfkuWyCd7u40QP9FeTAgn4JnVBAQJvjuX8MxG8jcxfM3SS7MBp85pi3j8/6w2HbZ
 90u0kXZFFBamQ05Qu1AFjjJUbmJxM+Xty5tANnhdVO/TBJijZaSEH7MlkRzvS2YdQ
 hZKjMONVt9NwZdUy7FDbcp9B4KZJhuF/Fl7tjpw6BD8XqeodhkaOaKOiFC3T3dQIB
 Fv5lZDPz41PLtMkrwSnNs+RyjWrNlyv/HBLNmS9GnXVqJ4pfW9iL9tBc/IrAD2r6P
 zzgrINL/H4p1XQWf/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Bfhi/SVJ
Subject: Re: [Buildroot] [PATCH v1 0/8] support/kconfig: bump to
 linux-v6.9-rc5 version
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sun, 18 May 2025 16:55:36 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> On Mon,  6 May 2024 16:45:43 +0200
> Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
> 
> > First draft of updating support/kconfig to an actual linux upstream version
> > (6.9-rc5).  
> 
> I was wondering if you had any updates on this patch series? Indeed,
> updating kconfig would be quite nice, there are some fixes/improvements
> that we would like to have that were added recently in the Linux kernel
> kconfig, but that requires updating our support/kconfig code of course.

Quite some time passed ;-), no real update since v2 (see [1]), besides the following
additional patch in my local git repo:

From 364ccc709b2997f30a4f88770c6d238c04369f31 Mon Sep 17 00:00:00 2001
From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 14 May 2024 00:02:31 +0200
Subject: toolchain-external: do not expand ARCH

- escape ARCH usage to force to not expand at configure time (but at make
  time), needed for upcoming kconfig update (see upstream commit [1])

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=104daea149c45cc84842ce77a9bd6436d19f3dd8

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - new patch

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 502411d4cc..45dd86c942 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -509,7 +509,7 @@ def gen_config_in_options(toolchains, fpath):
         f.write("if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN\n\n")
 
         f.write("config BR2_TOOLCHAIN_EXTERNAL_PREFIX\n")
-        f.write("\tdefault \"$(ARCH)-linux\"\n")
+        f.write("\tdefault \"\\$(ARCH)-linux\"\n")
 
         f.write("\n")
 
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index ef3d23d026..d8d54584de 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -49,7 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "$(ARCH)-linux"
+	default "\$(ARCH)-linux"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-bootlin"
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 94ea3b82de..23028188d8 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
-	default "$(ARCH)-linux"
+	default "\$(ARCH)-linux"
 	help
 	  Component name prefix used by your external toolchain.


Not much buildroot work from my side (besides very sporadic contributions ;-) )
as I have no (payed) buildroot related projects at the moment...

Regards,
Peter

[1] https://lore.kernel.org/buildroot/20240513091950.30116-1-ps.report@gmx.net/t/#u

> 
> Thanks a lot!
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
