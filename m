Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F5AC636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 23:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E551D415BC;
	Fri, 10 Feb 2023 23:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E551D415BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 018zLcnJ6oLW; Fri, 10 Feb 2023 23:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F7A415B4;
	Fri, 10 Feb 2023 23:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06F7A415B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54AC41BF473
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 293D2415B4
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 293D2415B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EeBKoA3RRDtl for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 23:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EF9F401AD
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EF9F401AD
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 23:37:11 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so7400300wmb.4
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGBnCkWdP5PdkfhKnM0nO8CY+gtgRpiY1I9cZibjqxI=;
 b=SyBgv187tpJa2mwloShzy+/3tf/264on1+KZO8veT8Vzf7cqs7B6/aB9Y+a0BnzkdQ
 daKgZKRQYFrC/K4PEWqLVpWD5kF7xPDi63UdXJDarbQuVYWYCl3ZYbB1edpf+x52lNP1
 TBaUZTH0gBPCYvqWL+qV9ogNHCfyCwB/B7k4DnmfgglT2CqpY7xEENzOeBFwC3VnE+/e
 nIoDtLETmGI12duT22k8VyR3O0uiGuWgv13QVkj+y6mA5q5k1AjofjwUvn30bywpXjTq
 TimSk6Prq5YPh/2m0+sWkF9zUC6Uw+0rm8G7tHUbQcxyjV+7CMhRNwdZf2kg6uMmd3oa
 26iw==
X-Gm-Message-State: AO0yUKUTbtBvIs9vnrTVBJfK1jK2zKFCZXBzjMr6Y3+o+IkDAHgi5kCH
 eaFnoyyOa9fo4p7ZhJOHC42iAjTvAqQ=
X-Google-Smtp-Source: AK7set+qYVnMyXhMNQfr+/jW4Odqt0Nt/DoTAbcPsYHatazCJUa6XM2UcmZGG2R4SPyw3Ok6SXA58Q==
X-Received: by 2002:a05:600c:331b:b0:3df:ead3:c6fc with SMTP id
 q27-20020a05600c331b00b003dfead3c6fcmr14253571wmp.17.1676072230093; 
 Fri, 10 Feb 2023 15:37:10 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b003db06224953sm6934821wmq.41.2023.02.10.15.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:37:09 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 00:36:58 +0100
Message-Id: <20230210233658.3763549-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rGBnCkWdP5PdkfhKnM0nO8CY+gtgRpiY1I9cZibjqxI=;
 b=KsljnQ+h22nX1BJKmIvVaoC2UNx38jf+gPDspceCh3GBg3Bdjlcf2OdwmzdMjyp/E9
 HsnIO65c3bUPYwPK+wePWXgsMlFnF3CpctFVctzgvUGRcaEYr2LgtOxI+8RtvtlEB4fN
 m4ybhqOMIac9b5NCUQ4UXiKQGMfyXTR2ntT+dHHZxMs6X3x0GCwyJO7WH8NF7hp1OZXt
 g3f5Uzc/De8+ThV9QcFVW3T4h9lm9lue5mTIVBGjpmO0MpvbQfQfgE76Lb9buFNpFOUX
 E5gigivPkpaHdAwOm0ztEkusFGuyHjIRb4y7hyzZyC/+fZ6huosQIg7aRdTvLnVuRWUT
 h9rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KsljnQ+h
Subject: [Buildroot] [PATCH] package/busybox: disable stack optimization for
 i386 target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The toolchain-builder project reported an issue with Qemu 7.2.0 for
x86-core2--glibc--bleeding-edge toolchain [1]:

  Run /sbin/init as init process
  random: fast init done
  EXT4-fs (vda): warning: mounting unchecked fs, running e2fsck is recommended
  EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disabled.
  Starting syslogd: OK
  traps: syslogd[52] general protection fault ip:b7e21465 sp:bfe59e6c error:0 in libc.so.6[b7d9b000+123000]
  Starting klogd: OK
  traps: klogd[56] general protection fault ip:b7e94465 sp:bf8f069c error:0 in libc.so.6[b7e0e000+123000]
  Running sysctl: traps: logger[62] general protection fault ip:b7e48b6c sp:bfd7d194 error:0 in libc.so.6[b7e05000+123000]
  Segmentation fault
  traps: logger[64] general protection fault ip:b7dd3b6c sp:bf9b8604 error:0 in libc.so.6[b7d90000+123000]
  Segmentation fault

  (Followed by a kernel panic.)

Testing with the pevious Qemu release (7.1.0) allows to boot the system without any problem.

Building qemu sources between 7.1.0 and 7.2.0 allows to identify the first "bad" commit [2] and
report to the Qemu project [3].

Thanks to Qemu maintainers review, several issues was noticed:

  "The default i386 busybox build config does not respect glibc's requirements around stack alignment
  (see [4] for previous discussions and a workaround)."

Disabling CONFIG_STACK_OPTIMIZATION_386 option (as suggested in the Gentoo bug report) fixed the issue!

This option has been added and enabled by default in buxybox 1_29_0, so it was used since then the for
Buildroot's qemu defconfig.

Note: The x86-i686--glibc--bleeding-edge (generic x86) doesn't trigger the issue with
CONFIG_STACK_OPTIMIZATION_386 enabled.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337

[1] https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337
[2] https://gitlab.com/qemu-project/qemu/-/commit/958e1dd1300f37f18b2161dfb4eb806fc8c19b44
[3] https://gitlab.com/qemu-project/qemu/-/issues/1478
[4] https://bugs.gentoo.org/725674

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/busybox/busybox-minimal.config | 2 +-
 package/busybox/busybox.config         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1fb4e39e21..1e7ad1d357 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -53,7 +53,7 @@ CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
 # CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_STACK_OPTIMIZATION_386=y
+# CONFIG_STACK_OPTIMIZATION_386 is not set
 CONFIG_STATIC_LIBGCC=y
 
 #
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 4826fb8242..6e8bd2799d 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -53,7 +53,7 @@ CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
 # CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_STACK_OPTIMIZATION_386=y
+# CONFIG_STACK_OPTIMIZATION_386 is not set
 CONFIG_STATIC_LIBGCC=y
 
 #
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
