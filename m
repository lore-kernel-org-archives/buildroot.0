Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873A6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bfoyaLOw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D8C18118E;
	Fri, 30 Oct 2026 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWFFW8L9zSek; Fri, 30 Oct 2026 20:06:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D2EC381188
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793390795;
	b=JfOZgbIk8mFFSizBZ5JCnelIODSWx3RVTxBuEKRsAdQkKJLpuX54wHu3JpFMTeyi2T3D
	 CJGFlRLQxpNE+DIbuLFi1TKcV/J/TIuzOrYfKPiuPLh8bkyBzrZFAI966/B1AruLs8Fjc
	 U6AgLBzocwp+Safpwd1DPmJZmFvlmD6jOPQeAv4eQrQzTfFaXQq1kfj1BKoNtioLNPy0p
	 xp+vIZWwu/FNlJDKMJUNmJ2efuU3JKFsP4v/cEJz6akXUih67fcWKRCuBqKBU8A8ofYCH
	 KXYSC9PGRpuJHxUPBmjG54k8t4AC3eISHFyvl1c4yPG0O/I9GbmXe+Jme2i2FKbcp+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793390795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AAptltxmnELr0Kgw2k4dyjcD3oPICG/jrxJoM5imy+M=;
	b=h+WG7zPsOn/bP4oAOIZZwk5SwtefOecowDvnTqfmvOvaWMnSph7x2sXJptxUIUG+qoPH
	 BmBSZNsrWHf2mqYPTnN4B8LwINmkxpIJyYq94IvNtiwdwHjCqNCcdx6/+oAnQq12LuUFd
	 VOZmHSdTx6AhGH+2vaK1XnnQYGgbODYu3sr3DBerUA0iO4EFGoB88rX8Df3Di3Y+lkq5x
	 RwY8KFf7+yh7PaNuYFXgklbU3lu8WLSUSVTmoENAG1wkUJ3L262cpbIzAOYWJPa659/vG
	 pAsoM1OR12Rbv49dEHEWaV0I4YREggxY9fNEY4NmQGOfE3t68SeuSf082qr0d9k+tKg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793390794;
	bh=AAptltxmnELr0Kgw2k4dyjcD3oPICG/jrxJoM5imy+M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bfoyaLOwSnA5U6MlDhswfnnWDawXVPjeZ/u+gKl1QpSVG7+OLBZTk8FObgTaJNuz0
	 AF722oZtW1r3QvWfSDaNhggzVhFcs/NDt7L3FCUhsTomllmvzdKOZOKRpNQaP0wzwL
	 c5mrUpB/kM2QoK553ij+Qiz8d0tXgpH1H4Yz4D+h581v496SV5BIif7XHR0w8puipa
	 TH6j+CzaI86OtCc9r5zIPSvLSb0T6Od0E/HvrkSu2GNnxfrzagx/vtMdvsr5M06bMg
	 6VmnW1rcUhNRO7utgvPQIbtHS6VQaL0BQaecG8z9qJ7CBZqBbFlrrOG+VSbJpvMnt1
	 QfpiU0Novqesg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2EC381188;
	Fri, 30 Oct 2026 20:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F2F24BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BFDE60AC4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOChzwssjCdW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:06:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD6F060AB1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793390788;
 b=KU9/+N40x5shtDAiM9gpSk8C6n3ArpBimPU2htmYWnf+zvVsXmneCVlCkmH3pLwjLv0w
 TFyNymEJD4HxlESb0Hf2biPtnD5+G7CBO162asQIHO6Pzj7XkncunhsvaSdZzVZTv0jnO
 J5J5rMihfoKCDNjAff6ny4oU29oi4iB7BC8zQx0F8/iP06YcpPja7cLrFMObRov1MW81t
 QVuQuDmSQm69CLnx6s4cYRvFtraCAl5T6qtVZ8gA5jSdotgj515RGAddkvox+o1u4N+Sh
 WIe1h0rVdPN8IGMphqTp2AvNyzxKsGyOhuqJSdIGLvgUtqq0oT2YPHQ3IE1WIQZ//4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793390788;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rjlM91OsDdUzSx6tVIO6AwSlC9LHvlab3fP59mMA8V4=;
 b=YmFr2bz172Fk+FLDzqEe4i/KdTjRhv4jdYu12JsnMlYfsf4Nuab/AlpMy6J5Ox+IOO2p
 dYtoZBvaUkvVuuxjdWh9NwTb1MxErOEiXBu79MYpOg5wNSQNoxDrllznQ7YvBr2aSVeiq
 HcOdsEcCbCWHla/JNb4Ku79TJBIZDLpP9qItXUI6KFF9h4kar4pu6u9CuNKkZ0Ndji0rs
 srYAtVg8BtmMgulLeL2+ApB692b4NyYJ+pqGcCl1gDAar8QMf1ZRxbGhxtbfts7D2mQID
 uLGFYxU4uAu4QWhqYAb8wBS5+0bzX6eBYD2XP4y4XiqKPjOna47BDUpMLIiAzJvHH+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NnMPEtZ8; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD6F060AB1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26rD-1xPLqK10bR-002TzZ; Fri, 30
 Oct 2026 21:06:25 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:05:49 +0100
Message-ID: <20261030200552.779306-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030200552.779306-1-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:T52fiF1uHDMHE8FsURBfvwWf+3o0+LUdZWZHF9xPrZeRT+sAEz7
 jQiqpiXmjE9bLDnPYUIHWaii1+nieVuUNAtfOCNYiH50mAucJzPzX5TucPCplGFjJjRwJpn
 S3EseGwNoAyg/oyazWXHDaZ1M6OqtSHTSxvRoZV8pd+WQamOvIPeR+uUfHJknVJVzF3u10V
 yamqSE3K+7BTDFVMx71cg==
UI-OutboundReport: notjunk:1;M01:P0:8H9xiq6B/LY=;QMP7IsA1guRJnJ3A+Bl7986Tt5i
 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
 p1lVu185Q+Bdbyk
Subject: [Buildroot] [PATCH 2/5] package/systemd: bump version to 259.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Changes relevant for packaging:
* iptables/libiptc is no longer supported, only nftables. The libiptc
  feature flag is deprecated and has no effect, remove it and the
  optional dependency. Note that nftables support needs no dependency,
  only kernel support [1].
* systemd no longer links against libcap, remove the dependency.
* `run0 --empower` uses a new "empower" system group, which allows
  privileged access to polkit actions without running as root. Create
  the group if polkit support is enabled.

New meson options:
* swapon-path
* swapoff-path
* agetty-path
* journal-storage-default, note that "persistent" is the new
  default, changed from the previous (non-configurable) "auto"
* libc, set to "glibc" for now (see below)
* empower-gid, not set like other gid soft-fix options
* tpm2-nvpcr-base, not set. The default is based on a range assignment
  to the systemd project, also setting the default 0x01d10200 would be
  confusing because Meson does not accept integer options as hex.

Systemd 259 also added "incomplete" musl support, that is not enabled
as part of this version bump. Also note that while the release notes
contain a list with several increased minimum dependency versions,
these are warnings for version 260, not actually relevant to this
update.

Please see the upstream NEWS file for other changes [2].

[1] https://github.com/systemd/systemd/commit/715a70e7218710d6a6c033e9157bf97fdf5d8ede
[2] https://github.com/systemd/systemd/blob/v259.10/NEWS

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/Config.in    |  1 -
 package/systemd/systemd.hash |  2 +-
 package/systemd/systemd.mk   | 20 +++++++++-----------
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4c19a884b4..6b1298069a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -29,7 +29,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
-	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBXCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index cb652998cd..7164af23e5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  5062da9c9b0b6fd3ed0efaa2c6ec37be2e634c6e516abd6275ee42f85282c891  systemd-258.12.tar.gz
+sha256  f9a3f1e21e4dd78717bad0888638954467a55d73cab44a2c7a75c5bed47ef814  systemd-259.10.tar.gz
 sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
 sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4476b92886..5787decec8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 258.12
+SYSTEMD_VERSION = 259.10
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -55,7 +55,6 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-python-jinja2 \
 	kmod \
-	libcap \
 	libxcrypt \
 	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
@@ -65,6 +64,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = libudev udev
 
 SYSTEMD_CONF_OPTS = \
+	-Dagetty-path=/usr/bin/agetty \
 	-Dbpf-framework=disabled \
 	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
@@ -78,9 +78,11 @@ SYSTEMD_CONF_OPTS = \
 	-Dima=false \
 	-Dinstall-tests=false \
 	-Dipe=false \
+	-Djournal-storage-default=persistent \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
+	-Dlibc=glibc \
 	-Dlibfido2=disabled \
 	-Dlibmount=enabled \
 	-Dlink-boot-shared=true \
@@ -97,6 +99,8 @@ SYSTEMD_CONF_OPTS = \
 	-Dsetfont-path=/usr/bin/setfont \
 	-Dsplit-bin=true \
 	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dswapoff-path=/usr/sbin/swapoff \
+	-Dswapon-path=/usr/sbin/swapon \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysupdated=disabled \
@@ -174,13 +178,6 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_IPTABLES),y)
-SYSTEMD_DEPENDENCIES += iptables
-SYSTEMD_CONF_OPTS += -Dlibiptc=enabled
-else
-SYSTEMD_CONF_OPTS += -Dlibiptc=disabled
-endif
-
 # Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
@@ -539,6 +536,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=enabled
 SYSTEMD_DEPENDENCIES += polkit
+SYSTEMD_POLKIT_USER = - - empower -1 * - - - Privileged access to polkit actions
 else
 SYSTEMD_CONF_OPTS += -Dpolkit=disabled
 endif
@@ -709,6 +707,7 @@ define SYSTEMD_USERS
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)
 	$(SYSTEMD_TIMESYNCD_USER)
+	$(SYSTEMD_POLKIT_USER)
 endef
 
 define SYSTEMD_INSTALL_NSSCONFIG_HOOK
@@ -935,13 +934,13 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dkmod=disabled \
 	-Dldconfig=false \
 	-Dlibarchive=disabled \
+	-Dlibc=glibc \
 	-Dlibcryptsetup-plugins=disabled \
 	-Dlibcryptsetup=disabled \
 	-Dlibcurl=disabled \
 	-Dlibfido2=disabled \
 	-Dlibidn2=disabled \
 	-Dlibidn=disabled \
-	-Dlibiptc=disabled \
 	-Dlibmount=enabled \
 	-Dlocaled=false \
 	-Dlog-message-verification=disabled \
@@ -1009,7 +1008,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
 	host-util-linux \
 	host-patchelf \
-	host-libcap \
 	host-libxcrypt \
 	host-gperf \
 	host-python-jinja2 \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
