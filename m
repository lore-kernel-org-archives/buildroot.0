Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B973C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 10:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D0661B30;
	Thu, 14 Dec 2023 10:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D0661B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlnMxqXtJ9tT; Thu, 14 Dec 2023 10:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558B761B21;
	Thu, 14 Dec 2023 10:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 558B761B21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88EAD1BF59D
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 10:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60F1F61B19
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 10:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F1F61B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4PSbucqZ4Ta for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 10:01:59 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95E1761B11
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 10:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95E1761B11
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-35f82a7448eso722235ab.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 02:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702548118; x=1703152918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BJDsnervsi9Qudze2PqRmord8NSHIlN4LFM0zdJW3so=;
 b=hT14fF5gnsiQQyCfxW4j2Biw2AqUHLEMxscbPfndyDC40dJ0k982TwMPeMIoH9kMOX
 wDsukCpwrrUtOBqwcIkAjOD+9l3KEMlfAwvzftceQs/O4oK1o2syrO4FOtWS+3f+fQwX
 gxxteXjcnKfws9YffMIt9ElfQdzQZA3WTWcESJBKyYrOgF28NNel25WOrGZQL1ytvokC
 90ZYzTfwXJaciZpUnX5Q+OhnIh5NfUMynw5wQXuIop0mfl4k0ElSNe1uUHhJMlkRLwyT
 uL86/ttORIlm2+Xn8dcXBL46rpymdGWs1jsA2+ywbsXOB5+2j+Y1Qys3z8jl6YC+eR7U
 IICg==
X-Gm-Message-State: AOJu0YxCx+PPrkli8zPLwHVnqKM7tADHGxZIsHjRm6Vcv9Au6JHG5PZA
 XeelX41qLBGcIg5TTlscxiVU+wFfQJ1iDw==
X-Google-Smtp-Source: AGHT+IGYExge32beakjdplPPekBA1pBDAVAMN6s5zL9LA1HB1q2hfz3BqFtcIXaIMrV9IxVbp1AXnA==
X-Received: by 2002:a05:6e02:1947:b0:35d:5790:ec8c with SMTP id
 x7-20020a056e02194700b0035d5790ec8cmr13509571ilu.9.1702548118388; 
 Thu, 14 Dec 2023 02:01:58 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 y7-20020a920907000000b0035d09c30a90sm1113977ilg.51.2023.12.14.02.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:01:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 03:01:56 -0700
Message-Id: <20231214100156.121408-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702548118; x=1703152918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BJDsnervsi9Qudze2PqRmord8NSHIlN4LFM0zdJW3so=;
 b=eqQr8fXBNxjcW4nqowvCoHaYoYPMjKxsYgntZo0i8DW5oWuId/fx2vVw2VowDUmnMI
 wUVA1qGQf5nEFEvZd4kWUUig63N/nuwDZcm3xYjGX5/xkVed2uhb2GEtOEGdIhcd/pRT
 LfTk+YS/Us5VfjjU/0mR5tNWGXuYlh654HMG+aYHFG05FEkyIYQJuKMoDxyD3Zqjm4ek
 HewzlOqki6msVTzUHMqrTjM54xJ3ra4v3T1ijob/39DwKJqaMadJ3k4cq2YW9Xj30Cnd
 fSuklREot1tvKyp2gmnRH7dHGfVDey7fU6npQlPeqdnIVh/3IvNqahs8QRb57INXsNii
 EvmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eqQr8fXB
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-multipart/Config.in             |  6 ++++++
 package/python-multipart/python-multipart.hash |  5 +++++
 package/python-multipart/python-multipart.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-multipart/Config.in
 create mode 100644 package/python-multipart/python-multipart.hash
 create mode 100644 package/python-multipart/python-multipart.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..3751679b7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1171,6 +1171,7 @@ menu "External python modules"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
+	source "package/python-multipart/Config.in"
 	source "package/python-munch/Config.in"
 	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
diff --git a/package/python-multipart/Config.in b/package/python-multipart/Config.in
new file mode 100644
index 0000000000..07002e1018
--- /dev/null
+++ b/package/python-multipart/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MULTIPART
+	bool "python-multipart"
+	help
+	  A streaming multipart parser for Python.
+
+	  https://github.com/andrew-d/python-multipart
diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
new file mode 100644
index 0000000000..9b2b6d3d82
--- /dev/null
+++ b/package/python-multipart/python-multipart.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-multipart/json
+md5  a61a045b7f5e64d44dc53c73522ac4d2  python_multipart-0.0.6.tar.gz
+sha256  e9925a80bb668529f1b67c7fdb0a5dacdd7cbfc6fb0bff3ea443fe22bdd62132  python_multipart-0.0.6.tar.gz
+# Locally computed sha256 checksums
+sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
new file mode 100644
index 0000000000..7ffb05fa92
--- /dev/null
+++ b/package/python-multipart/python-multipart.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-multipart
+#
+################################################################################
+
+PYTHON_MULTIPART_VERSION = 0.0.6
+PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/2d/23/abcfad10c3348cb6358400f8adbc21b523bbc6c954494fd0974428068672
+PYTHON_MULTIPART_SETUP_TYPE = pep517
+PYTHON_MULTIPART_LICENSE = Apache-2.0
+PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
+PYTHON_MULTIPART_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
