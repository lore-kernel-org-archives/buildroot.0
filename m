Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFAC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 18:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6017041639;
	Thu,  6 Jun 2024 18:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYzTJqk0meFg; Thu,  6 Jun 2024 18:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E8440567
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1E8440567;
	Thu,  6 Jun 2024 18:22:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42DA31BF592
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E4A3848E5
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 18:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW32NyfuRxRz for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 18:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C8F1848B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8F1848B2
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C8F1848B2
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 18:22:30 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ea903cd11bso17034271fa.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 11:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717698148; x=1718302948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jczyGtZwe/LQ2+4b9sbVSSTVBG2jEbDoGUDHOZLqX2U=;
 b=EEBEplP2l+cCjsDgAH/BkdVKFvPiobRLNjp/sk6jSbiff3ON/MT9z3xXVkUsuE+E2C
 I1zpyCk0d6gwrSGWwp3oXDsYG5W06ePoKrFgb6Wp/gi+ejTrAW28bTKutL8Mtzx/m1eB
 kQkFW9QKaXwyegya3c7cLlmvWQi1MOalA4qW6jX4TchUYXobw8ELho/ii+c2Vwa2jqkF
 IF7pMLIrguie+4nTTwkphjUDVBfv+SA0sytJMrbtIMZFH4KHSkyWXcwF6GHtkjje+4lg
 v16+nj4TTS8Gl2+wkJGQwlEH2ocqRgYkqD5wUXZmGRAz14qi61jJH7xUSkCDqjG7FtP0
 nv2Q==
X-Gm-Message-State: AOJu0YyA/ecvresvg73DjfxH5JpFaCB2jaDpl5ZRLw7iRx37w0kxmhrZ
 hyb35w1nggwj1hTJenG76r8yCmLbjcdjsxHt+n6hCIalGoRUznpKbrJ8sA==
X-Google-Smtp-Source: AGHT+IEL3QxDWHg8b6IPLJj0x4Ww8IGEm45BLpBjD8aeMNIH3ssh1r4aF1RmKNqouxolkyjCD4eHeQ==
X-Received: by 2002:a2e:be04:0:b0:2e5:3f56:2a0e with SMTP id
 38308e7fff4ca-2eadce4bd17mr4555861fa.24.1717698147961; 
 Thu, 06 Jun 2024 11:22:27 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae0ca9c9sm1471633a12.22.2024.06.06.11.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 11:22:27 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 20:21:24 +0200
Message-Id: <20240606182124.4069700-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1717698148; x=1718302948; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jczyGtZwe/LQ2+4b9sbVSSTVBG2jEbDoGUDHOZLqX2U=;
 b=cwV4gsZ26rssNIw4gMS6jfBjZ0L8DCUDctHDsuSFQg9H3rEecG+5NBseCMMlaCpPrA
 QVhZ0POo1GumSZ1mc6QGEa8l6Enbk/jogoPtrmHlaU2vTYyKU5zT92MJcZCM2Crzm1fZ
 OaQFppEZD95fG4HhtRheY9DqBZ7BjTOAyoi9gLNiU7RM49KfNv5CIgQQQtIvkewfjdO7
 0CK8XXOEnqDMufjI4FPwhXVZzQHFcyRL1akuK3BcBgV/Y0+PkfGbIsjqqYfnO6zy/AL+
 vb32cNuIh2I/Ih2ZwBg4/tI3g5HnFwBEaerVcYfb+DJ8Eh7BYyrD/8vtoIG1Qa4sfK3C
 CbMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cwV4gsZ2
Subject: [Buildroot] [PATCH] package/ntp: remove the obsolete patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

0001-nano.patch: both MOD_NANO and MOD_TAI were added to glibc
on 2011-03-30 in commit 83fe108b0a9bc4f2deb14695bb0c8b2011e79f28.

Renumber the remaining patches.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |  3 +-
 package/ntp/0001-nano.patch                   | 28 -------------------
 ...patch => 0001-ntp-syscalls-fallback.patch} |  0
 ...ch => 0002-fix-pthread-detach-check.patch} |  0
 4 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/ntp/0001-nano.patch
 rename package/ntp/{0002-ntp-syscalls-fallback.patch => 0001-ntp-syscalls-fallback.patch} (100%)
 rename package/ntp/{0003-fix-pthread-detach-check.patch => 0002-fix-pthread-detach-check.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index d0bd179a5c..a7d353e7d8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1118,8 +1118,7 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch lib_patch.Upstream
 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upstream
 package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/ntp/0001-nano.patch lib_patch.Upstream
-package/ntp/0002-ntp-syscalls-fallback.patch lib_patch.Upstream
+package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
 package/numactl/0001-link-with-latomic-if-needed-again.patch lib_patch.Upstream
diff --git a/package/ntp/0001-nano.patch b/package/ntp/0001-nano.patch
deleted file mode 100644
index bce3478261..0000000000
--- a/package/ntp/0001-nano.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fixes issues with glibc header files, see
-http://bugs.gentoo.org/show_bug.cgi?id=270483
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-Rebase to apply cleanly.
-
-Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
-
-
-diff -purN a/include/ntp_syscall.h b/include/ntp_syscall.h
---- a/include/ntp_syscall.h	2015-02-11 08:42:37.794576469 -0500
-+++ b/include/ntp_syscall.h	2015-02-11 08:43:03.216957279 -0500
-@@ -10,6 +10,14 @@
- # include <sys/timex.h>
- #endif
- 
-+#if defined(ADJ_NANO) && !defined(MOD_NANO)
-+#define MOD_NANO ADJ_NANO
-+#endif
-+
-+#if defined(ADJ_TAI) && !defined(MOD_TAI)
-+#define MOD_TAI ADJ_TAI
-+#endif
-+
- #ifndef NTP_SYSCALLS_LIBC
- # ifdef NTP_SYSCALLS_STD
- #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
diff --git a/package/ntp/0002-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
similarity index 100%
rename from package/ntp/0002-ntp-syscalls-fallback.patch
rename to package/ntp/0001-ntp-syscalls-fallback.patch
diff --git a/package/ntp/0003-fix-pthread-detach-check.patch b/package/ntp/0002-fix-pthread-detach-check.patch
similarity index 100%
rename from package/ntp/0003-fix-pthread-detach-check.patch
rename to package/ntp/0002-fix-pthread-detach-check.patch
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
