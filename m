Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF635607216F
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ic8LQh9m
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9EF80F28;
	Mon,  2 Nov 2026 14:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kltu_Y3g9iuE; Mon,  2 Nov 2026 14:24:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A835980F62
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793629499;
	b=S9P7F+zkkwdYRTWJbkgJ50rFpWfjK2oELAsxMrlcMvwjgoHIxQ3Qc+uyLHHZqrSaD7+0
	 qhlCeUYFD+7pham4z/YLg3jZemZeyGbmVRBMBw8XEWL0dQoM4lygSpT9W324Aedbu19Px
	 /YB+DlJljCD20vaCMjn7Vn/Mgca8a3mKreCc7ghbW6guC0FoqvQX/yRryrGUkvGurLKLt
	 DxKZ5VhZTPD7HKj1T/jEA3QKKd0RzJuphtYP85xHJIFI0a0OEwRYwrnLYjJNCHVAJqbyr
	 zWrUpUF39k5D7LACc0jvAOtfxKBXRQl3WDPp6D0cD9QNxM9eaW3BwZfcHi0lbgnjYzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793629499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AAptltxmnELr0Kgw2k4dyjcD3oPICG/jrxJoM5imy+M=;
	b=otX7NlLEoBu/yiteggiRXXr/tuwP1l9zFFIvxShNFL3D8GzaTUkWTEK6tOoAf+yX2ro0
	 /PAynD/JOfUv3jqbpOXkaRtzVYc4RAj0KQOe0Wdj2s5o73++zKltPkdW8kMoa53wc60cm
	 fI+9feIFdbqFp4hkqFI71Wd1IxrwkwcKcIFlLx1OfCEofXLsOfpDtao5Wi2giK8IICRZ5
	 3U+pTqdrMBVn4dt2L6L+nHvRXUec2MmTJ7hEQ2F4XDeu/6a4+P8lEkR8nB+TzzBPQ6TMa
	 b5IB1xZdXGDUpf8zJSjPdHGVX44U0krN22GJdUjuGSIhv1kMrpAv1U4yiHMtX5W0QFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793629499;
	bh=AAptltxmnELr0Kgw2k4dyjcD3oPICG/jrxJoM5imy+M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ic8LQh9m+6IDYACCVqF8A2d9bs5POWIQpBe7+hZ9CEs9A7UAzHJXC1FHkj4TI21w4
	 0GV8NxAvTx81PKXK7MmMKbfnWiPxVLQXvm1Qy86O4XxNnIXcb1U696CCDGaLY7Twfs
	 jjoMYpX9xrp2q356dG2RIX+6kGjAk39IES36bbPxv30Gk9dZiV9vzxRMe4na6qG5Wn
	 0zvRd0sgcZnkDeGmBsAc4ClnC5krah3bcPeR4jBCi5PL282Eq6SXd0dvTPOnAxN/Hl
	 SZvYOvWBheGpiRUMJP/giIh4fGv04xWmr+5UShswkNiWi+NOIWNIQTGKLrqw1pFZO1
	 rB8l3m3ae1IOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A835980F62;
	Mon,  2 Nov 2026 14:24:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65FDEEF4
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C189405DF
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec5ahJzzcShm for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C514840533
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793629494;
 b=CUR7JlTTSUuYttrF6nZUCDJsXKE3XZ43JgyRK8BuUwo10TwP6rqx8R4MtIqqhX4rEbiV
 defIPFe/3AtG/FeMavWxGA6UUY3NKKqX+dK1gVO1QGyHCfWg65WmemYO6DvYDtJ9DGGp8
 jntgwjhhRVSnYH3nTB4NNoQxqHKDuREHhh8LzcgQhjdR+sDnuoojIRNEhJbtNtJjXy9ID
 njKHcuwjsW4f6rS9Rj1A5cRAPQ+g8PeSBXti60EaTQRhelk9KtZOgc2b/B+g1qLeLDhkF
 Rf3vVBVsYmkN6HqHNh1TNIKfDctUldi/1MATP6QkbP1o809pUHaIOFj/WkSL/KnL56w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793629494;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rjlM91OsDdUzSx6tVIO6AwSlC9LHvlab3fP59mMA8V4=;
 b=KrUG2ATwa+ToAUVYGbVs1fVP5twLmT58r56dl3xkbi1fZ+NCJ/WMqo8zvTxRplAqFJgB
 K+E33G9d+3NAUtTh6WnY9h1j8vuFuVCY6hMMooYqQjeIsJjPi4QiSVKHqYUYQcn5XWafE
 hRJQBMDyhBmHdoSn6+Vk2sIkwxR70AdGitezbBvV+pq6S98aNA2xH5JnCKOl+EIcAxrvn
 Q/POoUjVRmQKI+hDiRsnXcmpmBx7nhLfAtfKn5tHWZQnyryaxps6uygtTuu174eW3YeNj
 rCU5BR38Q7Oe87Y5PgCPKqLLTmWdpq0f5zEa3JLHU+PlyKG2OJk2ioEYGKiMkBaz0Eg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=OYCIFoN1; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C514840533
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiTt-1wwkeh2kyz-00VNG8; Mon, 02
 Nov 2026 15:24:46 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon,  2 Nov 2026 15:24:15 +0100
Message-ID: <20261102142418.2544020-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102142418.2544020-1-fiona.klute@gmx.de>
References: <20261102142418.2544020-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zLqCXObTDGWzVPOzDuYUsuY3N8K1Mji0qXYUmwkkPRqQ/N/1v1P
 sN+OWqNy7TpPfygSod0hQuJZczJTT1p31ysn+mhro313fOWF7ifh3Nxcyp/bbX2wsa4kgU4
 G0t2z52U4EWG2odwelJ0xS4pkiIH/qc03v5cFZVH8eK8gkDze+6mgwOY7IhLQe2rVVQCmT4
 mC1mtdj36RtY0iu/3CzMQ==
UI-OutboundReport: notjunk:1;M01:P0:uv/hgj2WJp4=;Jyo5lWjCzVVJ6lAwYq3s5CHvmnO
 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
Subject: [Buildroot] [PATCH v2 2/5] package/systemd: bump version to 259.10
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
