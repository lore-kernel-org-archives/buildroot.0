Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A5EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F2461007;
	Sun, 19 Apr 2026 19:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VM7ztwinIm-J; Sun, 19 Apr 2026 19:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05E4C60FF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627996;
	bh=5BDfkUH6m0Yo1f+oHJjiyKlcWqFQqH+ezD5DnwHXVLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f9wAj76+IyBDPI6UibjM6BKA5BZx2vLvke/Yxlm4JoMPZO/MFoozHsSM+q6fHnVeb
	 N4By/+kZe1qyKj0v+DM9wwd96Z3AVcxlzHoRu7Zt9mLvxteKVqpeN+TbRLoXHfr+JP
	 alGc+MWW0tmNTF89O2EXiox2Z6ar7Ej7/rjCSjywGJ7wp1WTO2qhGUWsK4rKdUmeDx
	 R7x2qgvQLmayHuULjXcbKD5euWILNgpggM6T8aQo6orjvq/Blv8qpPYg9hmuaGc/td
	 rgf3g1fH3i2GAr/a3kvLJ7rbfAPTPNaFak8Dkv1Cv59ZzfmgqU8FkEpRO4L0M2ilGO
	 J+XW0X6rDbMwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05E4C60FF5;
	Sun, 19 Apr 2026 19:46:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF311259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC16E407B1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIWqKR0EuDS4 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEC3D40448
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEC3D40448
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:46:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8799281F7F; Sun, 19 Apr 2026 19:46:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:45:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76786207ef9a3ac05af248dd8a6a2b656d0e7b41
X-Git-Newrev: c14e3a247d2526a1cfba8fd4f6ce354b50bb3b6d
X-Patchwork-Hint: ignore
Message-Id: <20260419194633.8799281F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.7.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c14e3a247d2526a1cfba8fd4f6ce354b50bb3b6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenVPN/openvpn/blob/v2.7.1/Changes.rst

Added static_assert fix for older uClibc needed due to upstream commit:
https://github.com/OpenVPN/openvpn/commit/6768ef1dab5cb6c1dbc210c20cf92820a64dace3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d172689685..d01cb73c98 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  13702526f687c18b2540c1a3f2e189187baaa65211edcf7ff6772fa69f0536cf  openvpn-2.6.19.tar.gz
+sha256  9858477ec2894a8a672974d8650dcb1af2eeffb468981a2b619f0fa387081167  openvpn-2.7.1.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9dc4ef4714..3bc42f2db1 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.19
+OPENVPN_VERSION = 2.7.1
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
@@ -16,6 +16,9 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+OPENVPN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Dstatic_assert=_Static_assert"
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
 OPENVPN_CONF_OPTS += --enable-dco
 OPENVPN_DEPENDENCIES += libnl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
