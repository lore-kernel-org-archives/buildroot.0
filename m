Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFB9C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 11:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EDFD60B69;
	Sat,  6 Jan 2024 11:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EDFD60B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RBWom1Kybaf; Sat,  6 Jan 2024 11:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FA760B01;
	Sat,  6 Jan 2024 11:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41FA760B01
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE7391BF2C0
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 11:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66B942036
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 11:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66B942036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rm7JPlWkTmzc for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 11:36:35 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 608E442028
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 11:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 608E442028
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e3b43173eso4924855e9.1
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 03:36:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704540992; x=1705145792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uhACx5hZEANSwLALGt2Qb273U6ZOhrKesKO3fSahz1A=;
 b=dKM9KC7sbsjroQd8FQsOApRCX0QfCRtosD1CGoFH5raAGw8KywpK+SAbeV73joqDoH
 dJ5hD3nHajGdluHnIkKu5RXhLkl0dlcAjeeEoyO4ed4iERkl378JuQik+xErhMXZxXLg
 Y8BiQJs+AK6l4R/NCP48s4f6Qc4o49d8fVQ4wL9Avb3TOZfuKTfQAFFqte+Zv0nln2qD
 WZj6YrS4P28tkRx9u7I+G0zkpOYv+gh9IoCDBq9a/z9W1ptrbSt+c31f7poEf0RQm3OW
 9V7NrWJRdPNgnpjwjclRNM0YBCmUMmwqt7DV/Y8X2YmIa/fZek3VwWdhvM7G3xhcxWpg
 8qKA==
X-Gm-Message-State: AOJu0YxH1xspunVahCzYC0mTV+0c8YEDfpAuwYBj06UAOOSQd7/qgjaU
 0xxLq2dgcjI0sWghlUE3FzyBG5nTDH0=
X-Google-Smtp-Source: AGHT+IFp+/GGgxzJ+qPszTfe31mEyw7XMaUv0adLLS2UK6JJyamWW2ncORsRR3UDDFcwVIZHmHZ3Pg==
X-Received: by 2002:a05:600c:2110:b0:40d:7c3e:cdb4 with SMTP id
 u16-20020a05600c211000b0040d7c3ecdb4mr328093wml.59.1704540992410; 
 Sat, 06 Jan 2024 03:36:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j8-20020adff548000000b0033642a9a1eesm3194360wrp.21.2024.01.06.03.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 03:36:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 12:36:27 +0100
Message-ID: <20240106113627.627714-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704540992; x=1705145792; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uhACx5hZEANSwLALGt2Qb273U6ZOhrKesKO3fSahz1A=;
 b=nPvsYyOaIw8RnJ3Zfjve2cIXcrtnDTgCWmjRGB77rAlRCoZ6w8aWUunXEbTDQSGiMt
 Pqu2hdeP9UcU+xE7FSlZgPLpB2xi3XCfKaOLjAFU9GZGLxL/hWaZIwkbknMdXJqaSP1b
 j1PZHyWuuNZ2ZdxFfBkefT+un99rdjraoUXNa6mtFA3JpNVAZxNfDBmJcbXg+UDOSK+T
 iQQ7IpUZ+kaSp9qq0uRtJF43X2stJVNj1mfW0GFPYBlKh6U/flx40IPSoAcAyjKEV4QL
 jBDAEz4Rh5OOcGxhfPG59cmaiwpblMIWH4LivAO9A8kezbzOVHjrFrzepN+51GP8iiTy
 OPLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nPvsYyOa
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: needs C++
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit ea45b95c0e54866134c63e88e60489a012b3d134:

/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py:40: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
  import pkg_resources
Traceback (most recent call last):
  File "/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py", line 289, in <module>
    if check_linker_need_libatomic():
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/build/python-grpcio-1.60.0/setup.py", line 223, in check_linker_need_libatomic
    cpp_test = subprocess.Popen(
               ^^^^^^^^^^^^^^^^^
  File "/home/autobuild/autobuild/instance-12/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/python3.11/subprocess.py", line 1026, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/home/autobuild/autobuild/instance-12/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/python3.11/subprocess.py", line 1950, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'no'

Fixes:
 - http://autobuild.buildroot.org/results/58ac25b4e426712269c5fc144121c955b714c760

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-grpc-requests/Config.in     | 4 ++++
 package/python-grpcio-reflection/Config.in | 4 ++++
 package/python-grpcio/Config.in            | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
index 3c266e5976..3a2740f0f7 100644
--- a/package/python-grpc-requests/Config.in
+++ b/package/python-grpc-requests/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	bool "python-grpc-requests"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
@@ -9,3 +10,6 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
 	  grpc for Humans. grpc reflection support client.
 
 	  https://github.com/wesky93/grpc_requests
+
+comment "python-grpcio-requests needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index d2ee039c5f..afe8988165 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
+	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  Standard Protobuf Reflection Service for gRPC.
 
 	  https://grpc.io
+
+comment "python-grpcio-reflection needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index e63ac2ae34..5242eb461e 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  HTTP/2-based RPC framework.
 
 	  https://grpc.io
+
+comment "python-grpcio needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
