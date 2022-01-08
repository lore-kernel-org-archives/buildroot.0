Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28604C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9DA81391;
	Sat,  8 Jan 2022 23:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvCYbBPJUYf3; Sat,  8 Jan 2022 23:04:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F085A81320;
	Sat,  8 Jan 2022 23:04:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC0001BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA19860A9B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVVfsmDjIgfe for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E136560812
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:04:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a5so14902241wrh.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 15:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IopkAMq7J7qRE7756zn2rGxQbDTg8VqfwjN+D2Kdv4g=;
 b=TgEgqyzADe65HTmd6AbkVYQmMBLm0x4zASgZZoPzOTEvJ4XrF8lSzO8cuoCio6R5yg
 EdzYcfhXYYcB5QcRFhgxxwCg6EWuk5yvfpDs5Rf9iWAUznqMUjgcKHV9BNnMdiFXD4hM
 9WxQzdWVU6ElYJcwGI0F/+OxCFqN+v/D8OrHE+QA61bX9zwNX287k1AoKJ4DQ3mBNgFZ
 GoIlmkk/2uJjUaw0lKdvPipRLo0NMlAXo9gozY691oWA+KVWmsVdYrD2iBFkEmc6/7qB
 waumbvMbv7UemN4qqOheUvoana0uM+L+LMR2ZjIJWr4ROWrcebVcMSJ/0dpcb00e5hq8
 WZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IopkAMq7J7qRE7756zn2rGxQbDTg8VqfwjN+D2Kdv4g=;
 b=peC6kJJTMF4CAn+CE+SEw1ycpHqhtL1ux7AT8Evw18D7Bckz8ewZUF+klonnl3ZkvO
 0hoJk4nqiLshWjltS5olo1b1Y3G1XYywlc8yTPmR97Glsv1KE/wC8HFA1+NelssE9ZXj
 lupJ/GNjERIlu+o5Pe82tXlBHADA1PtFQkzrnQ8qWqe+42P1+kY3X19yXVxDye7D+8At
 J18FhmEvOKrdQThlX11ZCW4pns6qofynRVvCMvEsj/G1kU2ThOhiLVqVvZgU8c21rPgB
 nqIpvU1girGhkbUnRCDcJtxtOPljcPCqIC4xntiYt9FgDhlCaXEIuVydhTPdSj3V35VF
 TCyw==
X-Gm-Message-State: AOAM530T2O0pdlzVbl3MHd6Tz4OaFOF/ApeB+t6FYHyx/Fh4mzCiVVzI
 lhUHytdetzWc2zXV1xj+06Sf5LDCWYM=
X-Google-Smtp-Source: ABdhPJxd5KNRjOjo66dZxh+bJD/nEfn56Lbs1FLyLZew4iBB4T/Q+B+13bS9Loltx5pc6Mj93p22sA==
X-Received: by 2002:a05:6000:16c9:: with SMTP id
 h9mr3880106wrf.508.1641683048122; 
 Sat, 08 Jan 2022 15:04:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id v13sm2554473wmh.45.2022.01.08.15.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 15:04:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 00:02:59 +0100
Message-Id: <20220108230259.3703237-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix C++ build with
 glibmm 2.68
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cxx bindings are, silently, disabled since bump of glibmm to version
2.68.2 in commit dddb65efbdf2c7952f22a1e51009f17f1676db4a resulting in
the following build failure with pulseview:

--   Package 'libsigrokcxx', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/ebb73892fd7471de4f0c109554dfdc65b93d3dcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libsigrok/0001-Support-glibmm-2.68.patch  | 129 ++++++++++++++++++
 package/libsigrok/libsigrok.mk                |   3 +
 2 files changed, 132 insertions(+)
 create mode 100644 package/libsigrok/0001-Support-glibmm-2.68.patch

diff --git a/package/libsigrok/0001-Support-glibmm-2.68.patch b/package/libsigrok/0001-Support-glibmm-2.68.patch
new file mode 100644
index 0000000000..14d14ec406
--- /dev/null
+++ b/package/libsigrok/0001-Support-glibmm-2.68.patch
@@ -0,0 +1,129 @@
+From 31ad5ec50ec0c9cc7a92f009925c5f58aecdcce1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 30 Dec 2021 14:58:11 +0100
+Subject: [PATCH] Support glibmm 2.68
+
+Support glibmm 2.68 which has been released one year ago and is the
+first stable release in the glibmm-2.68 ABI series:
+https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS
+
+As TimeVal is not available with glibmm 2.68, use DateTime which is
+available since version 2.26
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/sigrok/mailman/message/37410614]
+---
+ README                                             |  2 +-
+ bindings/cxx/classes.cpp                           | 13 ++++++-------
+ bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp |  4 ++--
+ bindings/cxx/libsigrokcxx.pc.in                    |  2 +-
+ configure.ac                                       |  7 ++++++-
+ 5 files changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/README b/README
+index 768c8ca2..2515f059 100644
+--- a/README
++++ b/README
+@@ -63,7 +63,7 @@ Requirements for the C++ bindings:
+  - doxygen (required for building the bindings, not only for C++ API docs!)
+  - graphviz (optional, only needed for the C++ API docs)
+  - Python (2 or 3) executable (development files are not needed)
+- - glibmm-2.4 (>= 2.32.0)
++ - glibmm-2.4 (>= 2.32.0) or glibmm-2.68 (>= 2.68.0)
+ 
+ Requirements for the Python bindings:
+ 
+diff --git a/bindings/cxx/classes.cpp b/bindings/cxx/classes.cpp
+index f9f79273..de600d03 100644
+--- a/bindings/cxx/classes.cpp
++++ b/bindings/cxx/classes.cpp
+@@ -287,12 +287,12 @@ shared_ptr<UserDevice> Context::create_user_device(
+ 		default_delete<UserDevice>{}};
+ }
+ 
+-shared_ptr<Packet> Context::create_header_packet(Glib::TimeVal start_time)
++shared_ptr<Packet> Context::create_header_packet(Glib::DateTime start_time)
+ {
+ 	auto header = g_new(struct sr_datafeed_header, 1);
+ 	header->feed_version = 1;
+-	header->starttime.tv_sec = start_time.tv_sec;
+-	header->starttime.tv_usec = start_time.tv_usec;
++	header->starttime.tv_sec = start_time.to_unix();
++	header->starttime.tv_usec = start_time.get_microsecond();
+ 	auto packet = g_new(struct sr_datafeed_packet, 1);
+ 	packet->type = SR_DF_HEADER;
+ 	packet->payload = header;
+@@ -1154,11 +1154,10 @@ int Header::feed_version() const
+ 	return _structure->feed_version;
+ }
+ 
+-Glib::TimeVal Header::start_time() const
++Glib::DateTime Header::start_time() const
+ {
+-	return Glib::TimeVal(
+-		_structure->starttime.tv_sec,
+-		_structure->starttime.tv_usec);
++	Glib::DateTime time = Glib::DateTime::create_now_utc(_structure->starttime.tv_sec);
++	return time.add_seconds(_structure->starttime.tv_usec / 1.0e6);
+ }
+ 
+ Meta::Meta(const struct sr_datafeed_meta *structure) :
+diff --git a/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp b/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp
+index 97e54e17..d090c379 100644
+--- a/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp
++++ b/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp
+@@ -274,7 +274,7 @@ public:
+ 	std::shared_ptr<UserDevice> create_user_device(
+ 		std::string vendor, std::string model, std::string version);
+ 	/** Create a header packet. */
+-	std::shared_ptr<Packet> create_header_packet(Glib::TimeVal start_time);
++	std::shared_ptr<Packet> create_header_packet(Glib::DateTime start_time);
+ 	/** Create a meta packet. */
+ 	std::shared_ptr<Packet> create_meta_packet(
+ 		std::map<const ConfigKey *, Glib::VariantBase> config);
+@@ -711,7 +711,7 @@ public:
+ 	/* Feed version number. */
+ 	int feed_version() const;
+ 	/* Start time of this session. */
+-	Glib::TimeVal start_time() const;
++	Glib::DateTime start_time() const;
+ private:
+ 	explicit Header(const struct sr_datafeed_header *structure);
+ 	~Header();
+diff --git a/bindings/cxx/libsigrokcxx.pc.in b/bindings/cxx/libsigrokcxx.pc.in
+index 10a92f2d..7d2723fc 100644
+--- a/bindings/cxx/libsigrokcxx.pc.in
++++ b/bindings/cxx/libsigrokcxx.pc.in
+@@ -6,7 +6,7 @@ includedir=@includedir@
+ Name: libsigrokcxx
+ Description: C++ bindings for libsigrok
+ URL: http://www.sigrok.org
+-Requires: libsigrok glibmm-2.4
++Requires: libsigrok @SR_GLIBMM_REQUIRES@
+ Version: @SR_PACKAGE_VERSION@
+ Libs: -L${libdir} -lsigrokcxx
+ Libs.private: -lm
+diff --git a/configure.ac b/configure.ac
+index 424b0002..d70575b7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -407,9 +407,14 @@ AS_IF([test "x$HAVE_CXX11" != x1],
+ 	[SR_APPEND([sr_cxx_missing], [', '], ['C++11'])])
+ 
+ # The C++ bindings need glibmm.
+-SR_PKG_CHECK([glibmm], [SR_PKGLIBS_CXX], [glibmm-2.4 >= 2.32.0])
++SR_GLIBMM_REQUIRES=glibmm-2.4
++SR_PKG_CHECK([glibmm], [SR_PKGLIBS_CXX], [$SR_GLIBMM_REQUIRES >= 2.32.0])
++AS_IF([test "x$sr_have_glibmm" != xyes],
++	[SR_GLIBMM_REQUIRES=glibmm-2.68
++	SR_PKG_CHECK([glibmm], [SR_PKGLIBS_CXX], [$SR_GLIBMM_REQUIRES >= 2.68.0])])
+ AS_IF([test "x$sr_have_glibmm" != xyes],
+ 	[SR_APPEND([sr_cxx_missing], [', '], [glibmm])])
++AC_SUBST(SR_GLIBMM_REQUIRES)
+ 
+ # The C++ bindings use Doxygen to parse libsigrok symbols.
+ AC_CHECK_PROG([HAVE_DOXYGEN], [doxygen], [yes], [no])
+-- 
+2.34.1
+
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 8e7c355fd0..2a26518614 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -11,6 +11,8 @@ LIBSIGROK_LICENSE_FILES = COPYING
 LIBSIGROK_INSTALL_STAGING = YES
 LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
 LIBSIGROK_CONF_OPTS = --disable-java --disable-python
+# We're patching configure.ac
+LIBSIGROK_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 LIBSIGROK_CONF_OPTS += --with-libbluez
@@ -52,6 +54,7 @@ LIBSIGROK_DEPENDENCIES += glibmm
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
+LIBSIGROK_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
 LIBSIGROK_CONF_OPTS += --enable-cxx
 # host-doxygen is used by C++ bindings to parse libsigrok symbols
 LIBSIGROK_DEPENDENCIES += \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
