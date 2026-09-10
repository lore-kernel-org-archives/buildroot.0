Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1954C79FB9
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 09:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0792B60869;
	Thu, 10 Sep 2026 09:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSLLoafHpd50; Thu, 10 Sep 2026 09:52:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E9D7608AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789033956;
	b=NcdkDU6N2tIpSp2Df6mDJKgKs74iGDo0xHms8wXw/eglx6I/OOXaX7Coz5rauH78T8yZ
	 8x6nXSH2YsfiqTRhjJx02w0vwDs2GPdydx61JSSZlhFq7ue07cY4qET7zIEo4Z/uF31OI
	 xLPO8WwwhfY7FQ45sd9Fm8uy9xWy09qGO3T9dNMhFvn40DQU2DfktJ3qsaaqjR1jrYDaC
	 QhhSVwcKm+C0gkMcsuQvAzfgkWEP/Ki4wgPNxRI+vCnAMZiF4SJOk6FzVa1QHQWaG+8T3
	 DXpU9C0T2FuTNijAGknSfdpLS6BCxaYT/e10xGRRI8YsLFrpte4wO/qdvI3YlACRLpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789033956;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ICnGMXWR4YuGeobA2XJ5zNoa2p/KBhg6ccjrZENWcHU=;
	b=k9zlDTuBDsDjTRyQ6sN2bWL0nuxazor4+Lvk5MAvrHHqsnBgsF7yDpHpT0I52RVIwTj/
	 qUqBDLn9UL8C8TbFVjCAF0e6YMVEEZwFCPa6p/mFZDdGjHgTYmMKCg5ENqlbItJggUpjN
	 ZhQlJSrQ6PMme/fcMn3QZVZWvi+cISjFCymdldvpw1Kv93kXCtEyR0NwcTQXRx1M8ZAD/
	 8nn5jwGIOCv3jhJRYWuaqlUpzNjm+nfhcLW0qmaBJe3oBw4IVlIC27L9wH9anJLVFSJBv
	 WSemo3PM7HZ+7mGalNfSxzU22gWuwl8itgbRilc1xg2wT1qWHD0sDivKOYvhONGnXyg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789033956;
	bh=ICnGMXWR4YuGeobA2XJ5zNoa2p/KBhg6ccjrZENWcHU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aqRTZVP9RbzHxRSCYWP6BbsHGIYV1vSuMjCCmdMIv/Q9ng0SHxNIa45NDrTa7QASJ
	 JJDCeRfGipvz1vddq0/OIrucE7eYchWrXvSJNq5QTtNyB7un5EWYmsOu6OChHPytOu
	 F4zHX33k6PrYXz64FUc8+DUJvTtzx2bFqzWmRdfQYmp4u0ZLLSH2TwkDffPsBDd+Va
	 Y0KD9DQoVnUePqbTqacJicGcKMNI6yxrlYCv5q+uZOPWN9301gjy4sl6enUPS39kQC
	 AW3bBFzT+Vyvi/ZRXikE0UiF71E+UuQy8my+Yr9KwyKhpIAF8H0mHUJAI5Xk0NMV6m
	 TY+hCv6Hc2nhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9D7608AA;
	Thu, 10 Sep 2026 09:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 038A03AF
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F59401DA
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J2DKTqA73Xbt for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 09:52:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D24744006B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789033953;
 b=GoNL5kTmOkYfYkW7EFoBsJ4GMeCjKb9iy+QnLP2A3cMZ++n5zuZD3sITrnfikclho304
 GeHLtU0ofE5MTYEtS4GV0xA7Bd+jCNRjNqE4S8JDADwo+/uIKIJhQCXx4/v3SaPxnNmLb
 bFB7DRkhTPLMyOU8RKFIka+MpBMtPZHP5eZiu/vOQm+bFHAxywK7j9IpIoU5/5bjkp/f8
 xNI01t3cCUpnE/DYj0oa3jLxbJclFdNbdb1VaT8B1IafYlQ1H3GS2pongHJmYpBho+70n
 1QPZwWnfGoEF/C4WIZt8ocsagxDa/3c7WT9mj+axWgXrlBw5UlrhAF/xf85+v9uDs/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789033953;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=oPvljpnUk6sBtz0rKHtcE8JuElh+mx5K5RbOAOYO+wo=;
 b=WXBDeEQG+F4RWI2s/S0oOpGHTqYinDp1T3xPj9jdmrQD1FDS1uzsDuBuPjAltPMffCGz
 C1cPaiUylxOMN9pUvcYX9kqAHOTvL4G7SLgiL3MpCehYoFvnnl4EG4F4XM2MzwMOYeLje
 Mv/KP68rqQjWPFls0RR99+dqjYt9LIzPHl3Hwx3E3u4jbusfp3DyqMmS8eqwkMhn3vYNn
 eI3ElHlJNNGqFJzTi1NZfUcwNnPxpu+95vgw/AL0Pq81UdY37296qFEfCscIzvtqHu4oQ
 N8IfP3YKJyaAjIS1aN+1A4vmPaiXoOv5bMo93uJTSE7D8vVrMi/D/HsAfz+y7hzqPcg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=igalia.com; 
 dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=q1BA2i4Z; 
 arc=none smtp.remote-ip=213.97.179.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=q1BA2i4Z
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D24744006B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=oPvljpnUk6sBtz0rKHtcE8JuElh+mx5K5RbOAOYO+wo=; b=
 q1BA2i4ZlK5gs123waa1QhwfmIZp6+xrV3MPyZ7LZGdY+GT9H6NpG376Ij0T3x348qr4n6/5CaCJh
 sv1FKAoLsX56emoD6Zz5Z8jjgVbYp7KTB0iDlI5+EyNQFIi9iAuDJsdBL2nb4Vl+5GnFzW6R81/fD
 R6SXcORN++HrrVO+9JnoJhPXbHuT8glLh52u9Peut3mpA/fcDJY0PvwX5aQ0549OdgI6GQ6/3Act6
 BZ0wSKrTkkkqEiyLWpBrna7VoUGn3DjoE7W4gsikVZgeg5atO9Dx61gRpk/TnZf7iTCDaBAxEG+/T
 Qq5HjYzVZ6Ctj4ZEncBCRK4J8ELB8B4i8g==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x4bSC-0005Ml-51; Thu, 10 Sep 2026 11:52:23 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 373248c8;
 Thu, 10 Sep 2026 09:52:23 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 10 Sep 2026 11:52:19 +0200
Message-ID: <20260910095223.1597453-1-aperez@igalia.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bubblewrap: security bump to version
 0.12.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a sandbox escape through symlink traversal tracked in
CVE-2026-87766, which affects all previous versions.

Using the bwrap binary with the setuid bit set is no longer supported
and user namespaces are now always required, so a kernel config fixup
is applied.

A new build option allows indicating the minimum kernel version that
will be used, which removes code used for backwards compatibility with
kernels older than 5.6.0 when a newer version is specified. Passing
$(LINUX_VERSION_PROBED) seems reasonable here.

This version also changed the license from LGPL-2.0+ to LGPL-2.1+,
hence the updated hash.

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.12.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash |  6 +++---
 package/bubblewrap/bubblewrap.mk   | 17 +++++++----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index e87d3c81cb..e150e1495d 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/download/v0.11.2/bubblewrap-0.11.2.tar.xz.sha256sum
-sha256  69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6  bubblewrap-0.11.2.tar.xz
+# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
+sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
 
 # Hash for license files:
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 7838ab90b3..40a8148e14 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,21 +4,24 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.2
+BUBBLEWRAP_VERSION = 0.12.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
 
-BUBBLEWRAP_LICENSE = LGPL-2.0+
+BUBBLEWRAP_LICENSE = LGPL-2.1+
 BUBBLEWRAP_LICENSE_FILES = COPYING
 BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
 
+define BUBBLEWRAP_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
+endef
+
 BUBBLEWRAP_CONF_OPTS = \
+	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
-	-Drequire_userns=false \
-	-Dsupport_setuid=true \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
@@ -36,10 +39,4 @@ else
 BUBBLEWRAP_CONF_OPTS += -Dselinux=disabled
 endif
 
-# We need to mark bwrap as setuid, in case the kernel
-# has user namespaces disabled for non-root users.
-define BUBBLEWRAP_PERMISSIONS
-	/usr/bin/bwrap f 1755 0 0 - - - - -
-endef
-
 $(eval $(meson-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
