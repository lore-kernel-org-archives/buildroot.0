Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195C2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A70FE840D1;
	Mon,  6 Jun 2022 14:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Yt_oT3ynnXQ; Mon,  6 Jun 2022 14:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C56D840D4;
	Mon,  6 Jun 2022 14:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4C31BF363
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 14:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF5F840D4
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 14:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qy_t71avnoOF for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 14:24:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61EA5840D1
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 14:24:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so8008494wms.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 07:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0H6mxfeCTx8IXT0QCa2bRSU1hALR13sby6wzMpFQHU=;
 b=B7PTPpDt4TO+KhqbDjocXcB0wwyPimbfumYpND/8iFS3J5cEGpjnwZjJK+IiN0Q09a
 R1+2ZTqf+yRY5KI3OK32fKNkEVbs1dbE24mDnszOsGwHYREVZfOiDGj8uB0YtZfTxzB8
 ZY0q0CA6/z+y7IXaE4Sx5luS3HmPgQ3DoVeDWfLm019koXxA4+f71OzkZAT32ft0G+SU
 s0Vwb23xfesnexnJk2NhzJCbZpE2ASZZITDFI9bCn71DBTqq064QbwLyMAH2B8Lf0w0M
 CFxHCAu2yjplqusx5BvgGt9+kGG2z1jXE9QknM9QaT8OLW/Ij6Lfst8NcLwM4900hbvv
 0AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0H6mxfeCTx8IXT0QCa2bRSU1hALR13sby6wzMpFQHU=;
 b=B//vKCLm8b+fJ5etimN8hpuS118L+uAs4XYGYFSJ93Q0rE+dOBZ4yaMAG/+3pvuUDe
 InPhIKD/FkNrRIZuxp7tyUgeZa+snNbuTEDdQoTrrbji/BFv676/dlVtQ/WgVGHugsEp
 QUzm4OCMuc0SbULsqzn4kRqokjbWhV7xzAYOD4KRwUj6pHtBy1frxetJBULqxEU487fN
 WdQfY+D/cGZL7yihmTIKff7rfbtFBVuhXWJhw2def8FU+JWjyAly+jwFffqNdY0XRQGK
 jQPyX4zWIQ/V9r/AL7kr3UMTv2VJZOUGFtoLa+P4TDcWDVG6c8ru5YxOUJkWMWBQBgN7
 gbuA==
X-Gm-Message-State: AOAM533Ic14cgzoVOTQWOSUqDK1LgM8AYUpfnHDU/b2gpjmZnyTFG/Gw
 8LXllQQByQpOJ1t1wly0TiiyB2z+e5cTnw==
X-Google-Smtp-Source: ABdhPJx6klotFn1jJV4auF6x7HkoVgeXFIHTVlCwEuJcHLCiElZonK5XJULAzND+e1DqfWoRGgCrrw==
X-Received: by 2002:a05:600c:4243:b0:39c:5538:52ec with SMTP id
 r3-20020a05600c424300b0039c553852ecmr2139426wmm.98.1654525465841; 
 Mon, 06 Jun 2022 07:24:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b00397342bcfb7sm18218863wms.46.2022.06.06.07.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:24:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 16:21:18 +0200
Message-Id: <20220606142118.1055501-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openssl: libopenssl needs atomic
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 Sven Haardiek <sven.haardiek@iotec-gmbh.de>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Norbert Lange <nolange79@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>,
 Lionel Flandrin <lionel@svkt.org>, Pierre-Jean Texier <texier.pj2@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
libatomic):

${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
	 apps/libapps.a -lssl -lcrypto -ldl
/nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'

It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
"this is intended for internal development only, to check the
refcounting is properly coded.  It should never become a configuration
option, hence the name of the macro.":
https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb

Fixes:
 - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/circus/Config.in                    | 2 ++
 package/docker-compose/Config.in            | 2 ++
 package/fetchmail/Config.in                 | 1 +
 package/hostapd/Config.in                   | 1 +
 package/ibm-sw-tpm2/Config.in               | 2 ++
 package/ima-evm-utils/Config.in             | 2 ++
 package/kodi/Config.in                      | 2 ++
 package/libest/Config.in                    | 2 ++
 package/openssl/Config.in                   | 1 +
 package/pcm-tools/Config.in                 | 2 ++
 package/python-boto3/Config.in              | 1 +
 package/python-botocore/Config.in           | 1 +
 package/python-couchdb/Config.in            | 1 +
 package/python-crossbar/Config.in           | 1 +
 package/python-docker/Config.in             | 1 +
 package/python-flask-babel/Config.in        | 1 +
 package/python-flask-cors/Config.in         | 1 +
 package/python-flask-expects-json/Config.in | 1 +
 package/python-flask-jsonrpc/Config.in      | 1 +
 package/python-flask-login/Config.in        | 1 +
 package/python-flask-sqlalchemy/Config.in   | 1 +
 package/python-flask-wtf/Config.in          | 1 +
 package/python-flask/Config.in              | 1 +
 package/python-gunicorn/Config.in           | 1 +
 package/python-httplib2/Config.in           | 1 +
 package/python-ibmiotf/Config.in            | 1 +
 package/python-influxdb/Config.in           | 1 +
 package/python-m2crypto/Config.in           | 1 +
 package/python-mwclient/Config.in           | 1 +
 package/python-mwscrape/Config.in           | 1 +
 package/python-mwscrape2slob/Config.in      | 2 ++
 package/python-pip/Config.in                | 1 +
 package/python-raven/Config.in              | 1 +
 package/python-remi/Config.in               | 1 +
 package/python-requests-oauthlib/Config.in  | 1 +
 package/python-requests-toolbelt/Config.in  | 1 +
 package/python-requests/Config.in           | 1 +
 package/python-s3transfer/Config.in         | 1 +
 package/python-tomako/Config.in             | 1 +
 package/python-tornado/Config.in            | 1 +
 package/python-treq/Config.in               | 1 +
 package/python-uvloop/Config.in             | 2 ++
 package/python-websocket-client/Config.in   | 1 +
 package/python-websockets/Config.in         | 1 +
 package/python3/Config.in                   | 1 +
 package/softether/Config.in                 | 2 ++
 package/softhsm2/Config.in                  | 2 ++
 package/stunnel/Config.in                   | 1 +
 package/systemd/Config.in                   | 3 +++
 package/tpm2-abrmd/Config.in                | 2 ++
 package/tpm2-pkcs11/Config.in               | 2 ++
 package/tpm2-tools/Config.in                | 2 ++
 package/tpm2-totp/Config.in                 | 2 ++
 package/tpm2-tss/Config.in                  | 2 ++
 package/uhd/Config.in                       | 1 +
 package/wpa_supplicant/Config.in            | 2 ++
 56 files changed, 75 insertions(+)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index 832b04dfa4..bf921604b9 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CIRCUS
 	bool "circus"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-tornado -> python3-ssl -> libopenssl
 	depends on BR2_PACKAGE_PYTHON3 # python-tornado
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
@@ -15,5 +16,6 @@ config BR2_PACKAGE_CIRCUS
 	  https://circus.readthedocs.org/en/latest/
 
 comment "circus needs Python 3 and a toolchain w/ C++, threads"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_PYTHON3
diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
index f82a0c4bc2..0a161f06c2 100644
--- a/package/docker-compose/Config.in
+++ b/package/docker-compose/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOCKER_COMPOSE
 	bool "docker-compose"
 	depends on BR2_USE_MMU # python3
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-docker -> python3-ssl -> libopenssl
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
@@ -25,6 +26,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 
 comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 1017df34b2..d86e69f58f 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FETCHMAIL
 	bool "fetchmail"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index f4206ceea5..d78520ca40 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -78,6 +78,7 @@ config BR2_PACKAGE_HOSTAPD_WPS
 
 config BR2_PACKAGE_HOSTAPD_WPA3
 	bool "Enable WPA3 support"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
index 179fa73951..94aef025c9 100644
--- a/package/ibm-sw-tpm2/Config.in
+++ b/package/ibm-sw-tpm2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IBM_SW_TPM2
 	bool "ibm-sw-tpm2"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
 	select BR2_PACKAGE_OPENSSL
@@ -13,4 +14,5 @@ config BR2_PACKAGE_IBM_SW_TPM2
 	  https://sourceforge.net/projects/ibmswtpm2/
 
 comment "ibm-sw-tpm2 needs a toolchain w/ threads, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
index 6c29c9de28..4dff04fdf4 100644
--- a/package/ima-evm-utils/Config.in
+++ b/package/ima-evm-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IMA_EVM_UTILS
 	bool "ima-evm-utils"
 	depends on BR2_USE_MMU # keyutils
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # tpm2-tss -> libopenssl
 	depends on !BR2_STATIC_LIBS # keyutils, tpm2-tss
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_KEYUTILS
@@ -13,4 +14,5 @@ config BR2_PACKAGE_IMA_EVM_UTILS
 
 comment "ima-evm-utils needs dynamic library support"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4c6e01745c..cab574da43 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 
 comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
@@ -50,6 +51,7 @@ comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
 
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
diff --git a/package/libest/Config.in b/package/libest/Config.in
index 6abe9d2848..728e69a03c 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -1,8 +1,10 @@
 comment "libest needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIBEST
 	bool "libest"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 7bf49b05f6..ed165569f0 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -16,6 +16,7 @@ choice
 
 config BR2_PACKAGE_LIBOPENSSL
 	bool "openssl"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_ZLIB
 	help
 	  A collaborative effort to develop a robust, commercial-grade,
diff --git a/package/pcm-tools/Config.in b/package/pcm-tools/Config.in
index ca9719dc5f..a1b07e7c63 100644
--- a/package/pcm-tools/Config.in
+++ b/package/pcm-tools/Config.in
@@ -21,11 +21,13 @@ if BR2_PACKAGE_PCM_TOOLS
 config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY
 	bool "install the pmu-query script"
 	default y
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_CA_CERTIFICATES # https
 	select BR2_PACKAGE_PYTHON3_SSL # urllib2
 
 comment "pmu-query needs Python3"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_PACKAGE_PYTHON3
 
 endif
diff --git a/package/python-boto3/Config.in b/package/python-boto3/Config.in
index 67b1420388..83ca59e0a8 100644
--- a/package/python-boto3/Config.in
+++ b/package/python-boto3/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTO3
 	bool "python-boto3"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-botocore -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
 	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
 	select BR2_PACKAGE_PYTHON_S3TRANSFER # runtime
diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
index cc5e32b504..c204dedffe 100644
--- a/package/python-botocore/Config.in
+++ b/package/python-botocore/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTOCORE
 	bool "python-botocore"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
diff --git a/package/python-couchdb/Config.in b/package/python-couchdb/Config.in
index 5bff75750b..2d93d5b707 100644
--- a/package/python-couchdb/Config.in
+++ b/package/python-couchdb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_COUCHDB
 	bool "python-couchdb"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Python client library for working with CouchDB.
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 60b60b1740..f5e36be4c0 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-treq -> python-requests -> python3-ssl -> libopenssl
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_ATTRS
diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index b2296f42eb..8f08d04952 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DOCKER
 	bool "python-docker"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	# docker-engine may be running on another host, so no other dependency
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
index 272d9ef1c1..f0eb7c5bd4 100644
--- a/package/python-flask-babel/Config.in
+++ b/package/python-flask-babel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_BABEL
 	bool "python-flask-babel"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_BABEL # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
index e2e84797f9..c396c19c1f 100644
--- a/package/python-flask-cors/Config.in
+++ b/package/python-flask-cors/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_CORS
 	bool "python-flask-cors"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
index 901234762e..dc148f066a 100644
--- a/package/python-flask-expects-json/Config.in
+++ b/package/python-flask-expects-json/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
 	bool "python-flask-expects-json"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	help
diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
index c8ecd854b3..3cc663c668 100644
--- a/package/python-flask-jsonrpc/Config.in
+++ b/package/python-flask-jsonrpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
 	bool "python-flask-jsonrpc"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	# runtime dependency
 	select BR2_PACKAGE_PYTHON_FLASK
 	help
diff --git a/package/python-flask-login/Config.in b/package/python-flask-login/Config.in
index 88c413e2a2..3baee27416 100644
--- a/package/python-flask-login/Config.in
+++ b/package/python-flask-login/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_LOGIN
 	bool "python-flask-login"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	# runtime dependency
 	select BR2_PACKAGE_PYTHON_FLASK
 	help
diff --git a/package/python-flask-sqlalchemy/Config.in b/package/python-flask-sqlalchemy/Config.in
index fa4a035110..f738cae76f 100644
--- a/package/python-flask-sqlalchemy/Config.in
+++ b/package/python-flask-sqlalchemy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_SQLALCHEMY
 	bool "python-flask-sqlalchemy"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
 	help
diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
index 4a8566a26a..cbeabe34c5 100644
--- a/package/python-flask-wtf/Config.in
+++ b/package/python-flask-wtf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_WTF
 	bool "python-flask-wtf"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-flask -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
 	select BR2_PACKAGE_PYTHON_WTFORMS # runtime
diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 8a44bf2db4..c0fc9c61ea 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 18f0c034ba..9375dc867b 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
index a029814f03..c525e97319 100644
--- a/package/python-httplib2/Config.in
+++ b/package/python-httplib2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_HTTPLIB2
 	bool "python-httplib2"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
diff --git a/package/python-ibmiotf/Config.in b/package/python-ibmiotf/Config.in
index 64362db998..ffcbddd57d 100644
--- a/package/python-ibmiotf/Config.in
+++ b/package/python-ibmiotf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_IBMIOTF
 	bool "python-ibmiotf"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PAHO_MQTT # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
diff --git a/package/python-influxdb/Config.in b/package/python-influxdb/Config.in
index 6ebbd4aa9c..a0ddfd7166 100644
--- a/package/python-influxdb/Config.in
+++ b/package/python-influxdb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_INFLUXDB
 	bool "python-influxdb"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-requests -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
index af710d5351..b5891595f9 100644
--- a/package/python-m2crypto/Config.in
+++ b/package/python-m2crypto/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_M2CRYPTO
 	bool "python-m2crypto"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
index dc93e6c0df..ae9af5e281 100644
--- a/package/python-mwclient/Config.in
+++ b/package/python-mwclient/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWCLIENT
 	bool "python-mwclient"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-requests-oauthlib -> python-requests -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
diff --git a/package/python-mwscrape/Config.in b/package/python-mwscrape/Config.in
index fc9d5223f2..b7c1fde209 100644
--- a/package/python-mwscrape/Config.in
+++ b/package/python-mwscrape/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWSCRAPE
 	bool "python-mwscrape"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-couchdb -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_COUCHDB # runtime
 	select BR2_PACKAGE_PYTHON_MWCLIENT # runtime
 	select BR2_PACKAGE_PYTHON_PYLRU # runtime
diff --git a/package/python-mwscrape2slob/Config.in b/package/python-mwscrape2slob/Config.in
index 6ced253451..cd3e96e726 100644
--- a/package/python-mwscrape2slob/Config.in
+++ b/package/python-mwscrape2slob/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	bool "python-mwscrape2slob"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-couchdb -> python3-ssl -> libopenssl
 	depends on !BR2_BINFMT_FLAT # python-slob -> python-pyicu -> icu
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # python-slob -> python-pyicu -> icu
 	depends on BR2_INSTALL_LIBSTDCPP # python-slob -> python-pyicu -> icu
@@ -16,6 +17,7 @@ config BR2_PACKAGE_PYTHON_MWSCRAPE2SLOB
 	  https://github.com/itkach/mwscrape2slob
 
 comment "python-mwscrape2slob needs a toolchain w/ C++, gcc >= 4.9, host gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index 805dc01545..f90c352d90 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SSL
 	help
diff --git a/package/python-raven/Config.in b/package/python-raven/Config.in
index d02232cfd8..e0715d4a3a 100644
--- a/package/python-raven/Config.in
+++ b/package/python-raven/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_RAVEN
 	bool "python-raven"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
index da2c2f4cfb..8b255cd0cc 100644
--- a/package/python-remi/Config.in
+++ b/package/python-remi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_REMI
 	bool "python-remi"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
diff --git a/package/python-requests-oauthlib/Config.in b/package/python-requests-oauthlib/Config.in
index 85283b209c..ffddba61d4 100644
--- a/package/python-requests-oauthlib/Config.in
+++ b/package/python-requests-oauthlib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB
 	bool "python-requests-oauthlib"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-requests -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_OAUTHLIB # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
index ba2b95152e..7be97de55e 100644
--- a/package/python-requests-toolbelt/Config.in
+++ b/package/python-requests-toolbelt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
 	bool "python-requests-toolbelt"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-requests -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
 	  A utility belt for advanced users of python-requests.
diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 94a44682f4..c876bff1bd 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_REQUESTS
 	bool "python-requests"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_CHARSET_NORMALIZER # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
diff --git a/package/python-s3transfer/Config.in b/package/python-s3transfer/Config.in
index a7f85b146c..d8a4a0e5e0 100644
--- a/package/python-s3transfer/Config.in
+++ b/package/python-s3transfer/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_S3TRANSFER
 	bool "python-s3transfer"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-botocore -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
 	help
 	  An Amazon S3 Transfer Manager.
diff --git a/package/python-tomako/Config.in b/package/python-tomako/Config.in
index bd6d29982a..ce78c9ad6e 100644
--- a/package/python-tomako/Config.in
+++ b/package/python-tomako/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TOMAKO
 	bool "python-tomako"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-tornado -> python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_TORNADO # runtime
 	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index b5c59e970d..30e7f03a8e 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON3_SSL
 	help
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 5d76a5cdd6..7ea66e9bd9 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-requests -> python3-ssl -> libopenssl
 	# twisted TLS -> python-{pyopenssl,service-identity}
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
diff --git a/package/python-uvloop/Config.in b/package/python-uvloop/Config.in
index b3fb275091..77f0ef5cf3 100644
--- a/package/python-uvloop/Config.in
+++ b/package/python-uvloop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_UVLOOP
 	bool "python-uvloop"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
@@ -12,6 +13,7 @@ config BR2_PACKAGE_PYTHON_UVLOOP
 	  http://github.com/MagicStack/uvloop
 
 comment "python-uvloop needs a toolchain w/ NPTL, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
diff --git a/package/python-websocket-client/Config.in b/package/python-websocket-client/Config.in
index 519e506615..a07e8693e0 100644
--- a/package/python-websocket-client/Config.in
+++ b/package/python-websocket-client/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT
 	bool "python-websocket-client"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
diff --git a/package/python-websockets/Config.in b/package/python-websockets/Config.in
index 60495b6284..1330f91772 100644
--- a/package/python-websockets/Config.in
+++ b/package/python-websockets/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBSOCKETS
 	bool "python-websockets"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python3-ssl -> libopenssl
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON3_SSL
 	help
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 761c38c850..346bc0fcce 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -88,6 +88,7 @@ config BR2_PACKAGE_PYTHON3_READLINE
 
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
diff --git a/package/softether/Config.in b/package/softether/Config.in
index f8933cdc00..9e43fefa62 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SOFTETHER
 	bool "softether"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
@@ -30,4 +31,5 @@ config BR2_PACKAGE_SOFTETHER
 
 comment "softether needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/softhsm2/Config.in b/package/softhsm2/Config.in
index 78fccc9512..bfabbbd355 100644
--- a/package/softhsm2/Config.in
+++ b/package/softhsm2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SOFTHSM2
 	bool "softhsm2"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -16,6 +17,7 @@ config BR2_PACKAGE_SOFTHSM2
 	  https://www.opendnssec.org/softhsm
 
 comment "softhsm2 needs a toolchain w/ C++, threads, gcc >= 4.8 and dynamic library support"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index a46e2f0316..fccc63f161 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d5d88404de..eacdc4c9fd 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -227,6 +227,7 @@ config BR2_PACKAGE_SYSTEMD_HIBERNATE
 
 config BR2_PACKAGE_SYSTEMD_HOMED
 	bool "enable home daemon"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
@@ -244,6 +245,7 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
@@ -416,6 +418,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 
 config BR2_PACKAGE_SYSTEMD_REPART
 	bool "enable repart support"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 4931641af4..e310069a7a 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_ABRMD
 	bool "tpm2-abrmd"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # tpm2-tss -> libopenssl
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -22,5 +23,6 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 comment "tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
index 5d45703223..4f88c288e0 100644
--- a/package/tpm2-pkcs11/Config.in
+++ b/package/tpm2-pkcs11/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_PKCS11
 	bool "tpm2-pkcs11"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # tpm2-tss -> libopenssl
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBYAML
@@ -12,4 +13,5 @@ config BR2_PACKAGE_TPM2_PKCS11
 	  https://github.com/tpm2-software/tpm2-pkcs11
 
 comment "tpm2-pkcs11 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 1a6698570a..26c5d401be 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # tpm2-tss -> libopenssl
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on BR2_USE_WCHAR
 	# c16rtomb() not implemented in uClibc
@@ -22,5 +23,6 @@ config BR2_PACKAGE_TPM2_TOOLS
 	  https://github.com/tpm2-software/tpm2-tools
 
 comment "tpm2-tools needs a glibc or musl toolchain w/ dynamic library, wchar"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
index dcadf5a5f2..c57d5c43a1 100644
--- a/package/tpm2-totp/Config.in
+++ b/package/tpm2-totp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TOTP
 	bool "tpm2-totp"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # tpm2-tss -> libopenssl
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
 	select BR2_PACKAGE_LIBQRENCODE
@@ -19,5 +20,6 @@ config BR2_PACKAGE_TPM2_TOTP
 	  https://github.com/tpm2-software/tpm2-totp
 
 comment "tpm2-totp needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 857987ae36..b42509c6e9 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -54,4 +55,5 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 endif
 
 comment "tpm2-tss needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 248e309dd5..51fa12dd7d 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -105,6 +105,7 @@ comment "uhd python API needs python3 and a toolchain w/ glibc or musl"
 
 config BR2_PACKAGE_UHD_PYTHON
 	bool "python API support"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # python-requests -> python3-ssl -> libopenssl
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..e517264dd6 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -86,6 +86,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
 
 config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING
 	bool "Enable mesh networking"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -129,6 +130,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WPA3
 	bool "Enable WPA3 support"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # libopenssl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
-- 
2.35.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

