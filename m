Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1501BC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D48DB81458;
	Thu, 24 Sep 2026 18:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zqrm5E6taXK; Thu, 24 Sep 2026 18:59:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DDD8C81452
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276361;
	b=IW98ocQ11DmSdl31938cQHSmkz2WA9g1a9mMR+TG010MSUVpWbhXr1+472yb/H1sj3qQ
	 yj9KbVX/4Wgnn0VEcS+31ElgkYYHNzwJY2O0hOHuAiHwaYdaL6NTr+a+CTbxoIgdc1HNE
	 yZ775Dk1Zg1RLHccIO99dPjS/dqMfWVjjJ+06iKtKwDRHQeTzO6kExbFch/Sq0KT2FeHt
	 QQ0J3dnHz00Pwho79rbnptfDjVC7+3ewflklMXqoYpKb/6fIqnPhfThvdyxGkzA/vTRhw
	 GfTvecsU1IUpAHWdnPaOoZ0HwSey1QCNtXKdLyAMSZvP4XwLbnQpBT3Bhwf+UNNiNVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276361;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2/I2EASCKXsIKDY/sCokTXMgLt/+1mB3k3G3SdVMncU=;
	b=shGKOxv1e4abaeqP/vBuCxJvdZLqlXzZfOnCscUTwgZfc/Jvi1Njq+RD5dr7PoM6n7ir
	 HBow4gVBjArb6CUMLZxxpPhUIssMQNdTBhmtAcL1QhM5DrFdz5F2iByEL0CufJu6G9xQb
	 aVHNBkAE8D0/Fp23Qww60I5HanE3exi6eSX/kPe44riIdr7ylcT1Vsm3EjZQlWNnIKNCa
	 dlOPIIUC6wTrXq4t7Fohf5NcCU0j8cUSmr3RY0A/0sC8fPvdIgG0G92rTcvzF5upnRCDr
	 RfxQuYeRpmq8/PmlZKzKl+KNrJDj7wKzMwLT+Itc5wkhBiFwlrYqV4wBgIlyzIJJn9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276361;
	bh=2/I2EASCKXsIKDY/sCokTXMgLt/+1mB3k3G3SdVMncU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eflRiVEc68o5IvmhyRX1qJXFUpwJogp89qJz55I7DIxLTGkFf3n1c19hBvRHQ354X
	 ijEXEJ9GHC1wsG1vxkBAkRpJ1Fg8eiKOR9c7hx5XVWeBgAL1TdV6IwLSm+dqOY8r0Y
	 2iTORSh5gSqOYISwy/JmGZEcqKwXkH/5LejgvFbcyIa7sdo0i/U5JAIXIJZY1gQViz
	 GlNdN3XkmkTCqVC/YeR9oJlBRA+kYYLD2GzZjwXROIPqyQbtXzD10OyDrmO2EQJLJS
	 K0gxMAJpQFLDq8jwfXvltxj3LQcFqiRU1s7NRQ5CBB1kFgzH2gxD73XqSXbejbGBgw
	 1c+hQJcKSiOcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDD8C81452;
	Thu, 24 Sep 2026 18:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB4E9328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF05881248
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7fwGYmEj42f for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9DF058123F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=QLY69Y/o8yIjQT+g6WOXrcmbI/PXJH2xqsFWnSkenhdA65pbpdAY9OZo9HRX2pEWhBi3
 B84mFUWY5VDNmgjj4OMXWrdwj6Lbh/2cKEWKsM0hJfXQgpkU8gyk4giQMTd8iRlb1n2rZ
 Ojnb0enDCfAocSUlPUbLaKEHVYUP6MNH8No8IPa/iUSAcPLMfPswusuCFCbY7qzOyqxi6
 tX6X6lLVMHjdaXHC0DEVQWZhrA04YVBAgH95FhS6RV00ZDVnR0MdUk85xlOcVGM/ANENG
 2iW0pqY/hiieiBaVtV1BjKk1cJBmWW5Ko60rTZWWFVmsfbnd6CSg5iYMDWQWFkPjvxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4+2JIopUbUat1UGdPhb2vnPx8ItnaJdGbFywJGeJmiM=;
 b=aZqPnj914JzapNI33jCEp9vM2r/w8fMX8J+y/3iz0IkTGEWce+IS+TJAZEs+tJ4kzLGs
 mXsmGzBTDmg/RZc2iZbJ2BIQMA9oNBl3y8yw0L06B1GHRI49xLadQwFGsMx+Loj5QUyD0
 EhnE7krKXMLo6O5MNaf6yFvFU6+mjLpUd+dJrJxX7ImmWg+vIz/ukTzuUwdsH5BOc+kfB
 gdDzmyBWUkcIWxC1XvqT9JexmHl5xbkx6fwh5zHCehHcfIozGkMX7dhng3dfxP27nHbpy
 gRwQ8quTYW2w5ragn4/TgG7iF+KUoIwRgy2O32B/N0oLO3DSR/LZJOQtR7mTyKuydAg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DF058123F
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4190A98323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:18:10 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c5d82647ffab64ae0fd05ebea99bd6acdc783440
X-Git-Newrev: 4c96ea868e3191e9bea84554b800d62678e65d66
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.4190A98323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sofia-sip: needs
 OpenSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4352901036333620251=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4352901036333620251==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4c96ea868e3191e9bea84554b800d62678e65d66
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit bb254e2304274dc308e3d8699e92ea77e4189fb7 bumped the
package to version 1.13.18 which includes upstream commit
https://github.com/freeswitch/sofia-sip/commit/8081a1a6d05f174cb902664f73182c32fd2eee0f
that added the unconditional usage of OpenSSL.

Tested with both LibreSSL and OpenSSL, the latter with all suboptions
disabled.

Fixes:
https://autobuild.buildroot.net/results/afe/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ea18394dd71f2deb21792918500b1928e96177b0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sofia-sip/Config.in    |  1 +
 package/sofia-sip/sofia-sip.mk | 18 +++++-------------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
index 2ad1940833..37961273f3 100644
--- a/package/sofia-sip/Config.in
+++ b/package/sofia-sip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SOFIA_SIP
 	bool "sofia-sip"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Sofia-SIP is an open-source SIP User-Agent library,
 	  compliant with the IETF RFC3261 specification (see the
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 1d47b43fe8..b8679f6961 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -9,11 +9,14 @@ SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
 SOFIA_SIP_AUTORECONF = YES
-SOFIA_SIP_DEPENDENCIES = host-pkgconf
+SOFIA_SIP_DEPENDENCIES = host-pkgconf openssl
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
 SOFIA_SIP_CPE_ID_VENDOR = signalwire
-SOFIA_SIP_CONF_OPTS = --with-doxygen=no
+SOFIA_SIP_CONF_OPTS = \
+	--with-doxygen=no \
+	--enable-nth \
+	--with-openssl=pkg-config
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SOFIA_SIP_CONF_OPTS += --with-glib
@@ -22,15 +25,4 @@ else
 SOFIA_SIP_CONF_OPTS += --without-glib
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SOFIA_SIP_CONF_OPTS += \
-	--enable-nth \
-	--with-openssl=pkg-config
-SOFIA_SIP_DEPENDENCIES += openssl
-else
-SOFIA_SIP_CONF_OPTS += \
-	--disable-nth \
-	--without-openssl
-endif
-
 $(eval $(autotools-package))

--===============4352901036333620251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4352901036333620251==--
