Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B7BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 20:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59988400CB;
	Tue, 22 Feb 2022 20:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UY2BjvMnfd0i; Tue, 22 Feb 2022 20:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383834011C;
	Tue, 22 Feb 2022 20:53:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55E521BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 441CE402C4
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AoaIUkJY5Aa for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 20:53:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D17A8402A4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:53:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d3so20118700wrf.1
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUNh0FXGPVyAmOOApBS3NQFwk19Ck0eXXFN+mXHDtUI=;
 b=XjKVQsdsGQ3E9GOnw6aOXSc214qe9Owt5WktfsJeDcHpTPwFvc2m2U7YNgb+gf++IZ
 IxpRf+72k+H+N9T1H4C03z5Spwwr7dgkpChL/4NFyZG4ToSKu9RqfQTgMGPqJ+EyivtG
 f2iRSLLNiDRrof7aRCDz841J1dJ02zJ9DZRJ+VER1hpLMAl/AGlI238UqttoV1i96TJr
 1oTUZkNxv/G7L1XbE0vAnvVj7h4+voUZKYMHVsAqGSiN4ToC3OOtOTi7lULtfNDWWOOC
 EgnsIxwq6CtbQuu4YDY9VFlEqxpwhiTJDnbNGb19C2M9zkX0zAV4sUu18eWpM2J3WVg3
 v+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUNh0FXGPVyAmOOApBS3NQFwk19Ck0eXXFN+mXHDtUI=;
 b=0zypRIR5IbxGLh/hB624p6OjiXbyXRqnf+aJ873+1LELGIjI6Ft03/0LWOPQpWg8QT
 dDnH+rz4zhAfr5iCGP9oheEELE5ksE7DBX2wl0dUmk5UamhFDr6uevicew8HfqdFAVGm
 B3cPUFzR94xbe6srbeY9EBTg8gYRX2x1bQrr7r5Pi3y5mb+dOBijFGjMQ2ONAhklbzhS
 3tUo1n2hutLYdmsSYkBxuJXEElsxLbyxv5PnXJq9iTZJN5iXDnkn38EWWGU2/LKEDK9z
 06YPvDm/qP6J65dU3TXUkR1dzcKfMuiCrZhhxKnnd12ez5k0bOX86nI2iPvN2NJNidO+
 Rayg==
X-Gm-Message-State: AOAM530uJQJfHg2cfpUEArel1iaZ5Aic67Kimr4UVUi6isU6zsMNrOV1
 /jXCOoWZWiXdyJxXWsgwi0IF3ZuW8fU=
X-Google-Smtp-Source: ABdhPJwDmLwc7n82n0OnKYgPrKnJ4QL973+V0oFnolRpwzibMlkdc4+XzBmMIPRLGvfFNz0j0W5cWQ==
X-Received: by 2002:a5d:6d8f:0:b0:1dd:1ced:4050 with SMTP id
 l15-20020a5d6d8f000000b001dd1ced4050mr20792914wrs.549.1645563227699; 
 Tue, 22 Feb 2022 12:53:47 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id e7sm33428304wrg.44.2022.02.22.12.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:53:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 21:53:17 +0100
Message-Id: <20220222205317.3161653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libnetfilter_conntrack: bump
 to version 1.0.9
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch | 38 -------------------
 .../libnetfilter_conntrack.hash               |  4 +-
 .../libnetfilter_conntrack.mk                 |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch

diff --git a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch b/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
deleted file mode 100644
index 0b373d9261..0000000000
--- a/package/libnetfilter_conntrack/0001-libnetfilter_conntrack.pc.in-add-LIBMNL_LIBS-to-Libs.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 93bbd7e56cefc8488a61892b3bf5df63a175d20d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Apr 2020 14:05:15 +0200
-Subject: [PATCH] libnetfilter_conntrack.pc.in: add LIBMNL_LIBS to Libs.Private
-
-Since version 1.0.8 and commit
-c1c0f16c1fedb46547c2e104beeaaeac5933b214, libnetfilter_conntrack depends
-on libmnl so add it to Libs.Private.
-
-Otherwise, applications such as dnsmasq will fail to link on:
-
-/home/buildroot/autobuild/instance-0/output-1/host/bin/arm-linux-gcc -Wl,-elf2flt -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnetfilter_conntrack -L/home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib -lnfnetlink
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in function `nfct_fill_hdr.constprop.4':
-api.c:(.text+0x34): undefined reference to `mnl_nlmsg_put_header'
-
-Fixes:
- - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: commit e94172f09e4d]
----
- libnetfilter_conntrack.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libnetfilter_conntrack.pc.in b/libnetfilter_conntrack.pc.in
-index 857f993..fbd7132 100644
---- a/libnetfilter_conntrack.pc.in
-+++ b/libnetfilter_conntrack.pc.in
-@@ -12,5 +12,5 @@ Version: @VERSION@
- Requires: libnfnetlink
- Conflicts:
- Libs: -L${libdir} -lnetfilter_conntrack
--Libs.private: @LIBNFNETLINK_LIBS@
-+Libs.private: @LIBNFNETLINK_LIBS@ @LIBMNL_LIBS@
- Cflags: -I${includedir}
--- 
-2.25.1
-
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
index 19520aa3f0..205eecf1f3 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.hash
@@ -1,5 +1,5 @@
-# From ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.8.tar.bz2.sha256sum
-sha256  0cd13be008923528687af6c6b860f35392d49251c04ee0648282d36b1faec1cf  libnetfilter_conntrack-1.0.8.tar.bz2
+# From https://www.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-1.0.9.tar.bz2.sha256sum
+sha256  67bd9df49fe34e8b82144f6dfb93b320f384a8ea59727e92ff8d18b5f4b579a8  libnetfilter_conntrack-1.0.9.tar.bz2
 
 # Hash for license file:
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index 0a5a94be8f..e10bdd02e9 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETFILTER_CONNTRACK_VERSION = 1.0.8
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.9
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
