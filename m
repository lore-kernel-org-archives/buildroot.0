Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C41BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 17:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2EC9404C3;
	Thu, 24 Feb 2022 17:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwgNWACk6pqS; Thu, 24 Feb 2022 17:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B80FC4031D;
	Thu, 24 Feb 2022 17:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C42F1BF28C
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 484F260D52
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 17:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gIuu-o8xnojM for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 17:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CCFF60BA3
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 17:51:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p9so809307wra.12
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 09:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NtoBcgUWNDfj4irC4Zh/5HL5wq5sjL623v66442gwOg=;
 b=Xbp04BvBSD+MN2+IEKY3kSsWG+8d5/faxqNc0Un8Hz9Iyk9HDfJVRFnub0SdvxX29s
 6+eDvdRzLOZ9dKPJw71V5OElIXqiRXBl0oexTsMPNbAmHskTsf7hqcUKhPS7wc0LSHnI
 no0NelRmodPVkIHTQB4tti2tKDaGqyRD2jDluST9QWpSmKP5JNANd1DpgX2vQ4eH6Q7l
 fjLoiP3qPWbc0sTY1CLRbrbTyL+8aJEPv0tzMrlvpJ1b6Dbqte2mJ2UoHAej/hLrluWz
 2GJbKiCORsanr0iEg+jjFK0iJb+zV6rah0gjj6QgtMoXTFkVsJLSVt9+EjPWef5CqcAW
 WzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NtoBcgUWNDfj4irC4Zh/5HL5wq5sjL623v66442gwOg=;
 b=WBij32jyqZbyUbydrrHN7PEPP7ZRa++H8f0Y/8AhUzz2C9Z0iZnkPD5lGV+cobNxNn
 LNhWPkfxSbrvSWg5a567ZqH9fnCsINjPC7BszIyF1/S6TAzxdgkGrD/7TAh0xO+3lK1z
 kEOpeUA472hreEeYgpYx9oomIJqVTdE+7GXAg2oeJCsPCx/kVst2XNtlKZ4hWzGirQWK
 Nob2Lpe1N6qjWONgrpwhgqe4iD6svAIV0poJKXKKy0b12n1Ivh3xB2IzWS3Ebx7OEmVV
 nYSOdSTkTOpv/TN3C+dYTZ58j+GD2lCn6H0jG1NS+kYtU/A5MRTMNGifo9dRODUiW9Mw
 71Xw==
X-Gm-Message-State: AOAM533/OU6QBQ8xQhyqiHhsRABhEsZucmHecpBSzKs1lXxZ5Nh+yq/z
 V7Hiii50Y6xHQor9Nl29jeRK+0f+eTE=
X-Google-Smtp-Source: ABdhPJz+QUDPauuJ5aP9o6+1jdzZQN8XL6tHIGaoExrhHrM9REftzlstGBsET1GLZDp1sdGgnK+Cmw==
X-Received: by 2002:a05:6000:1a86:b0:1e8:d8d9:436 with SMTP id
 f6-20020a0560001a8600b001e8d8d90436mr3200806wry.39.1645725098236; 
 Thu, 24 Feb 2022 09:51:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adfc511000000b001edc0a8a8b6sm96303wrf.0.2022.02.24.09.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:51:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 18:51:19 +0100
Message-Id: <20220224175119.487040-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: add
 BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bpftool uses its own local copy of libbpf so add
BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS to avoid the following build failure
on ARM:

btf.c: In function 'btf_type_by_id':
btf.c:461:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  if (type_id < btf->start_id)
              ^
bpf.c:62:4: error: #error __NR_bpf not defined. libbpf does not support your arch.
 #  error __NR_bpf not defined. libbpf does not support your arch.
    ^

Fixes:
 - http://autobuild.buildroot.org/results/aae772f1cfb16516a57f310c4f022e80a2a8d65e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bpftool/Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index e81d874343..a1ef3843e6 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -1,5 +1,15 @@
+config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
+	bool
+	# see libbpf/src/bpf.c
+	default y if BR2_arc
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
+
 config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"
+	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils, elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
@@ -13,6 +23,7 @@ config BR2_PACKAGE_BPFTOOL
 	  of eBPF programs and maps.
 
 comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
+	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
