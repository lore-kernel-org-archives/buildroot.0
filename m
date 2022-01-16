Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D99AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 17:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67034033D;
	Sun, 16 Jan 2022 17:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IkQCSKZ6rb8; Sun, 16 Jan 2022 17:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA1E4033B;
	Sun, 16 Jan 2022 17:54:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4671BF5DE
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 17:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51A5F40338
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 17:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X16hGdZIfWqD for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 17:54:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F8DB40348
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 17:54:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso17447611wmd.5
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 09:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AW0vQ6Upd5YtPp7HXUqDmIn20iK6X4v9ONXOzoF38Bo=;
 b=VRD+MI2JMOqeLQSy4OX8wgDXo/+OwaWGsj+0ImrWE/5YgRPF14mINqzO0Z2vTKdDH/
 NqQ7vuO2rfIhhf1epvbXDMmHq4cX4uuQLyUUt+zx9heuoQLY6kb9o5MA3H0SjDv+1oil
 VX7iDq2khVmX/4lY47XaZpeEGtsbRI/6PuuWC/ZAlTNfpr9SSLUaZGjCWqvnIS5HkbF5
 ojz83mYqvSF6JhAxeyLWTT6Ru9Zd8ny4LQiNUMUcm1dMzjYfyjqOtm0gXXxTqEgbn196
 QLrDHZ0ClqSQvZoK5JC8pZa/+znaI5kN17LZpiOpKlEtsrRp3pUXAlqCfL5dGo8x7J0R
 8AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AW0vQ6Upd5YtPp7HXUqDmIn20iK6X4v9ONXOzoF38Bo=;
 b=u0nubFHDjnwsfjc4BSezQ4NidbKqu+uo7yjNehyIWIBn8UkWUtgcYsQx4vft70cR/q
 OGyCxLiq5Tu/gQ+0IxQY/Pe5xcmJMIZLaAYJRghUii3fxqNzTQGk66DLKbBmKYzl9hq3
 Aqu5jGZEtTgEZWbqYjxw9ptpCixbjxcF7WVP+iufuw+NZW9+PGkklOC77oGoMmJ8Hguc
 fQgEcuGcql6zUZvEl5It0QDGplW22pVTLL5F0ElenHmeQ97Iwr8cv5289it9rZ2iWD6Y
 GhB4Bb/W9fY011FeSVpiMUhxbYcmqQ1CLL8INxf86EwjjZj4hv0ZMlpyX2Gzfm3w1dJX
 w24g==
X-Gm-Message-State: AOAM533w9C+AY6fhRD8aJUxO5doToam3bFhfTJFclveGWK8PbTSBKgfl
 Vlf0rivFRxMCj16WqqSHtyExxi2NAnc=
X-Google-Smtp-Source: ABdhPJwKSV0kpTff1+7HCtpKwLND5qOzp1HlMtve70+L8/vk0rdm5en1otRVTGTlQlWJiwV1eiYNHg==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr1711611wri.398.1642355647207; 
 Sun, 16 Jan 2022 09:54:07 -0800 (PST)
Received: from gilles-Gazelle-Professional.. (138.23.87.79.rev.sfr.net.
 [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id c11sm18922302wmq.48.2022.01.16.09.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 09:54:06 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 18:53:20 +0100
Message-Id: <20220116175320.453041-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220116175320.453041-1-gilles.talis@gmail.com>
References: <20220116175320.453041-1-gilles.talis@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/clpeak: new package
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

clpeak is a tool that profiles OpenCL devices to find
their peak capacities

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
v2:
 - Added opencl-clhpp dependency

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/clpeak/Config.in   | 15 +++++++++++++++
 package/clpeak/clpeak.hash |  3 +++
 package/clpeak/clpeak.mk   | 13 +++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/clpeak/Config.in
 create mode 100644 package/clpeak/clpeak.hash
 create mode 100644 package/clpeak/clpeak.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 483afa4932..04b3f8fba9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1075,6 +1075,7 @@ N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	configs/freescale_imx8mmevk_defconfig
 F:	package/cctz/
+F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
 F:	package/httping/
diff --git a/package/Config.in b/package/Config.in
index 08eb3ad809..b38d05b3b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -87,6 +87,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/clpeak/Config.in"
 	source "package/coremark/Config.in"
 	source "package/coremark-pro/Config.in"
 	source "package/dacapo/Config.in"
diff --git a/package/clpeak/Config.in b/package/clpeak/Config.in
new file mode 100644
index 0000000000..c83297549c
--- /dev/null
+++ b/package/clpeak/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CLPEAK
+	bool "clpeak"
+	depends on BR2_PACKAGE_HAS_LIBOPENCL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_OPENCL_CLHPP
+	help
+	  clpeak is a tool that profiles OpenCL devices
+	  to find their peak capacities
+
+	  https://github.com/krrishnarraj/clpeak
+
+comment "clpeak needs an OpenCL provider, a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_PACKAGE_HAS_LIBOPENCL \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/clpeak/clpeak.hash b/package/clpeak/clpeak.hash
new file mode 100644
index 0000000000..e0d2c1e92b
--- /dev/null
+++ b/package/clpeak/clpeak.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1e9c3f959498253d6bb956dc786de7b3e4019264216a1781c06ae49a1d6600e5  clpeak-0777205be1d5681d5a76d46ec94588544e8462a5.tar.gz
+sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/clpeak/clpeak.mk b/package/clpeak/clpeak.mk
new file mode 100644
index 0000000000..5fa990fb34
--- /dev/null
+++ b/package/clpeak/clpeak.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# clpeak
+#
+################################################################################
+
+CLPEAK_VERSION = 0777205be1d5681d5a76d46ec94588544e8462a5
+CLPEAK_SITE = $(call github,krrishnarraj,clpeak,$(CLPEAK_VERSION))
+CLPEAK_LICENSE = Unlicense
+CLPEAK_LICENSE_FILES = LICENSE
+CLPEAK_DEPENDENCIES = libopencl opencl-clhpp
+
+$(eval $(cmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
