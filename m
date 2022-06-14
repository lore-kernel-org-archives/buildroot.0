Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C320C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE07605A9;
	Tue, 14 Jun 2022 18:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dt2WAGFICY3; Tue, 14 Jun 2022 18:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4195C60E82;
	Tue, 14 Jun 2022 18:03:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61C2E1BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 506E240B77
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HS2HES3-QihT for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:03:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4B0240191
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:03:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q15so12264633wrc.11
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lWq4Hr7Bskv/d+tC2RrEDnypWL1XRcXs6H5ZE0n3j8s=;
 b=KC84uvTNiMLYuqyADOIb1a9D0ZtLFR7lDkB+Js3tk9ofQrnpi/tbqZ9j8JhBRocygi
 4eH0M+WwhIp2VepvuV/nxFUEvjhM1Teu3N1LwFLcqMXClWz11taqeHgKXsxhCU2v44wV
 TdhcnPbyZAl5Mo6NbY01qyWgqKtOcQXjMa1bIAyU/WYfYlau2Y0GokHgAkeXFvjOzhM6
 fTGrkmNdpgeiSvUwoYM5lqiu43R5uajnZ01M1zimTcDY8vlYeKpnh8E/kCRneumYT1Su
 cVEB9CUh6/RsekOAr+XABozRW4zNRDm57JjORdpSoU9v4+soVQjFaDjxLToFsE53He8r
 rpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWq4Hr7Bskv/d+tC2RrEDnypWL1XRcXs6H5ZE0n3j8s=;
 b=gGktyUor+cTlwFvC4kLGBbWRqITDCtAHGBseloDPF1eWH17lzYnHUkRub9VftJfTLB
 UkMfrhSfueEe2ttHihvb1+uDVxP9nf038Et9HgjI6OhUgnmdI2xEtQr1JM6jyUBEYZ1O
 yP2ymnXuygAPCCMroU1/5qGkzY1O4L/8t33edJ9/y7vu0ZexZVTU2IrxoIEafzUaHzTQ
 H7/GjmiDX/Hp0Ui/C2IW7YQW/cvRk/3UfTBXT5o5A/m9Pw2LfAFbz2RAMgFbZ4pgeFVO
 UgkQJ/plZdYP9MkwlDkWyNjOk7qpVJv+ux02aqaFy0CyW284Xjq4Uwe0bk2F5MCUy7uC
 mDiQ==
X-Gm-Message-State: AJIora91dp4fkxpqBMjO6LQa10jalVb/XSQaUyCUuYYMCXPhoi312UG+
 s/s0LqUbdl6gnL5SUt7wSHy1jW6rYFwtOdHV
X-Google-Smtp-Source: AGRyM1usf5Mrb1S1o4ChhJax6cenY/KKgVQ+z2EZcLS6vahkZPYcEazKEWauC1uqBSSXAvtv7Peu1g==
X-Received: by 2002:adf:f5c4:0:b0:210:2ac2:6aa0 with SMTP id
 k4-20020adff5c4000000b002102ac26aa0mr5957160wrp.300.1655229801055; 
 Tue, 14 Jun 2022 11:03:21 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 m17-20020adfc591000000b0020fff0ea0a3sm12840988wrg.116.2022.06.14.11.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 11:03:20 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:01:52 +0200
Message-Id: <20220614180152.15846-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
References: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/slirp4netns: new package
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

slirp4netns is for user-mode networking for unprivileged network
namespace.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v1 -> v2:
  - Fix typo in SLIRP4NETNS_LICENSE_FILES

 package/Config.in                    |  1 +
 package/slirp4netns/Config.in        | 20 ++++++++++++++++++++
 package/slirp4netns/slirp4netns.hash |  3 +++
 package/slirp4netns/slirp4netns.mk   | 15 +++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/slirp4netns/Config.in
 create mode 100644 package/slirp4netns/slirp4netns.hash
 create mode 100644 package/slirp4netns/slirp4netns.mk

diff --git a/package/Config.in b/package/Config.in
index 3b089166da..216e04e98b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1903,6 +1903,7 @@ menu "Networking"
 	source "package/rtmpdump/Config.in"
 	source "package/siproxd/Config.in"
 	source "package/slirp/Config.in"
+	source "package/slirp4netns/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
 	source "package/sysrepo/Config.in"
diff --git a/package/slirp4netns/Config.in b/package/slirp4netns/Config.in
new file mode 100644
index 0000000000..22414dfbc9
--- /dev/null
+++ b/package/slirp4netns/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SLIRP4NETNS
+	bool "slirp4netns"
+	depends on BR2_USE_MMU # libcap, libglib2, slirp
+	depends on BR2_USE_WCHAR # libglib2, slirp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, slirp
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_SLIRP
+	help
+	  User-mode networking for unprivileged network namespaces.
+
+	  https://github.com/rootless-containers/slirp4netns
+
+comment "slirp4netns needs a toolchain w/ wchar, threads, headers >= 3.17"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
new file mode 100644
index 0000000000..e3115c1be0
--- /dev/null
+++ b/package/slirp4netns/slirp4netns.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
+sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
new file mode 100644
index 0000000000..7ff594cc44
--- /dev/null
+++ b/package/slirp4netns/slirp4netns.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# slirp4netns
+#
+################################################################################
+
+SLIRP4NETNS_VERSION = 1.2.0
+SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
+SLIRP4NETNS_LICENSE = GPL-2.0
+SLIRP4NETNS_LICENSE_FILES = COPYING
+SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
+
+SLIRP4NETNS_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
