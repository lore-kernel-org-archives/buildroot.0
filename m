Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83350C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223CF40B7A;
	Tue, 14 Jun 2022 17:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBBUopTZxzKb; Tue, 14 Jun 2022 17:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34D8740B74;
	Tue, 14 Jun 2022 17:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5B91BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 893AD60B19
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smny0S0qS06f for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 17:51:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A81560A70
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 17:51:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso6644481wms.2
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6dtqHe68Ka9auvhax4ueY50t/DCev7bcCDpWhrutgM=;
 b=LiLmJnpEnpy/xxdZrX/fNQw27ui7iodlMX9/SylrCkjfPl+vfsNBeCW7+G4c13z/ko
 hHodJiDYLHWW3IPnQhMc7tH4PIyn6F4vCyHYX0uHnGaiX4p1tbw4Bvwb3WWvGGtdokqQ
 nCcuAP5debQu/9tqYKC/wNaIRzI8lJJJI3DK23xAyP1CWBoEL+OoAslTrE7kSd0gDTgF
 2wQxxsTDVGWEsqk05/mmU98qFzrWSQu55bN+V+J8cXMjwqQObVBGRzBdwfFiDHf9b2ux
 WyFihakiopUPgzG2oB4hWSvyNC3rtVM6rxK2Ebqn+KpMQmdL2XTjXI8mlYF1jwXxp8VA
 ZPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6dtqHe68Ka9auvhax4ueY50t/DCev7bcCDpWhrutgM=;
 b=SsqOtQ/UWtVR4+vG9BYNDSBCfGtTueuQjX53o/1qPNhyWuaSngPyXdZAYKQVVdkZCy
 s6hy5SM1BPMhAAnqJLZp+5+Mg3l0iJNFZLEUpY4HnHDBoTdQhFG2OymUnn+/yLC8TOTh
 kNMxXwWVnpKFzRk9+QLNAERHsyHOwlJjck4ola8di37+bNC8ICBdKuQ+rJnVZYiE7GEj
 zyb0xA6IIUL9CIXrYtAeyMR9lw24EXX2kBLyrZaT7FwnG4kFC7qXF/snbr2OUiWH/94B
 j85e4VOEuupUpOWBIc6AiRZdeI7SfpOGo6q3FvvAs5r+Udoh5/oUFOf+1sl6aV+CfptR
 35kQ==
X-Gm-Message-State: AOAM530FIG9L8/5BEKVbZC9ImAIY+GouOj22/NcYNIyu1bt4YowcQwwi
 k0n9TGBI3PeM4T+NGABum5OXspMwrPpBfQ==
X-Google-Smtp-Source: ABdhPJyzaIKGn9e47IwVPUJ7XYVt6PislhdxcKo4s7RhcoXW3VhYCZvd0vXuj2AQqIg3wL7AXv53SA==
X-Received: by 2002:a05:600c:1906:b0:39c:7f82:3090 with SMTP id
 j6-20020a05600c190600b0039c7f823090mr5360952wmq.152.1655229100693; 
 Tue, 14 Jun 2022 10:51:40 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a05600c4f8400b0039c362311d2sm19162792wmq.9.2022.06.14.10.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 10:51:40 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 19:50:48 +0200
Message-Id: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/slirp4netns: new package
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
index 0000000000..89fe275a74
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
+SLIRP4NETNS_LICENSE_FILES = COPYRIGHT
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
