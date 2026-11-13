Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39EE606A334
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ggd+7W/i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=JpwkDQ0H
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09CB581395;
	Fri, 13 Nov 2026 19:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpx__Y64pES9; Fri, 13 Nov 2026 19:36:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 796AA812B9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794598584;
	b=QbTFYTAFuWU1bhjf2ApAiW6NuDh780+jKk+5H2c++oOBLx+wVXRSjNdABIefieZfc6ir
	 hvVNb3Zi8mvRps8lxoISwwmHRxaWtNP821ia/QG+FRA6D9kwBv24v5Dn9wTR2AmguCLLX
	 ner1cP5JC8/6qcP/yypdgZLOU19CjIpfAedH+zltktMks05/fwon42GfSoJx6RTzxCqvk
	 OAFuen58fOZ+ZB4rSbJ448p4g0zGj+c39ojyEmUhzFC5rKQ/PV/rJ7fVtkBFvsNm4nF4o
	 Ju2mAbxucrzCTDhK/VH0SwTBTpBhfgW10sI5VNFKjbkRYbN6u77de8lchfg7J84PJOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794598584;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P8kEqRZeG5w/kcS5PqTrKkY7t8rWWvFH9GOuVFSYimI=;
	b=HbTZOnrq5CMK5+zlGjDosWj8IAe1xtN6QBWJE/7b5INlhDsLW+VRPC3jqN4C7LC5zehO
	 Wa1wru1DbhWrV6QWOxGxhK23rqBxZuX1KPaypiDSVGGPPZAqpgV5eH9ZirktK4vLRKXg2
	 MBtLdqfFufW+8GXa+D29UcCNoN/5qSsoWW41xmd/rlQ2iOXZbdkWNmBIEhCrwtBpt/LWX
	 zAZm8lK76sFBt/4pQgQgmVUyUxwGVp2hSKdRMj6WnCfwvskeeAGmuuc6dqL2VsVHvQHvU
	 il/oNntwM5kIWJqxyw/n7+ANMGuGVBbvZStZeQlBNC7yobvoF5WS7G8HKGYNSOOHDZw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794598584;
	bh=P8kEqRZeG5w/kcS5PqTrKkY7t8rWWvFH9GOuVFSYimI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ggd+7W/iuw3DMigbq0X99khZVyqandRVhvAB9R7Hrn6UjirPaRFN9o8XCd1uArWca
	 C09jNCgTz8net1GBmM2RRbHntXAUO6s0ZM26CS82G6A73d8MCfmGLB2knAJDR7LTZX
	 33nbr3ra4jmx4H+t4h0ci11uxXcjFQxVYZEMSHW+lHTqx6ebEBCWgdUXtEBjfwK3B9
	 Uhm3HCDRUQx6zTus0GQBgXD+S/JChSCN/YCKQrzoGFQzfkRcvZ4gfzUeVXuHVpwsmk
	 VEk+GKX6VFegGUzLUTZ8eqoD75yEjNGntfPd/Blyh/t+QSq7PcltPQIV/JFrFamy0S
	 4Z7r0LhBjyNMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 796AA812B9;
	Fri, 13 Nov 2026 19:36:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CAF6286
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB64608B6
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nnW1LWKB4aO for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 19:36:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EB71B60669
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JpwkDQ0H
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB71B60669
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 19:36:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JpwkDQ0HanLzkzZvcUwkvw34pnJYkh6x2YcCVXVui5RvbEPV48UKJ4LinVBn01Is65OZ9cf7wahooQvmg8V1Pw7WoVKN2NxRQbb1xHc6x/uoIRsFAfopyUvqsX/8TuIfkVexrO+kuvaKb3jYEHiEZ+ji3k1lysJH4mPag3IyHM5jnljzpJOnbIi5EImXpL+ONmXGOtZ4X2PxVx2EcpARsRiTgQalAHYa2dYXTw8TyfbmSiVajcA3GhqO6nreE+Odl1O0tsKDVFQVsne1v3ssWxFS2vsyGo6rytDt38nfgTlBvlIkZK+KT2iALHRw9HGWAtZYnNNQSS7QGAWpVQx4zA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=yfOP4YqAleq1AZk4nfMH/2kWocyldcPDgtCjZ+UmMWQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1638611915; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 13 Nov 2026 19:36:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xRx4I-000000059oE-0Nks;
 Fri, 13 Nov 2026 20:36:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Nov 2026 20:36:10 +0100
Message-ID: <20261113193612.1229303-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/drm-info: bump version to 2.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

And drop now upstreamed patch:
https://gitlab.freedesktop.org/emersion/drm_info/-/commit/154d17ec47baa9f66528d81d73788ddbde5000e1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Revert-Find-drm_fourcc.h-in-sysroot.patch | 47 -------------------
 package/drm-info/drm-info.hash                |  2 +-
 package/drm-info/drm-info.mk                  |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch

diff --git a/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch b/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
deleted file mode 100644
index 3e70f3d1cf..0000000000
--- a/package/drm-info/0001-Revert-Find-drm_fourcc.h-in-sysroot.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c94d00730d0c25a4a4c46abfcf27823919ac9854 Mon Sep 17 00:00:00 2001
-From: Kory Maincent <kory.maincent@bootlin.com>
-Date: Mon, 16 Mar 2026 18:50:09 +0100
-Subject: [PATCH] Revert "Find drm_fourcc.h in sysroot"
-
-This reverts commit cde94140f08775dc4df7eaac766556218d9e1321
-
-When cross-compiling, pkg-config's includedir variable already returns
-an absolute path that includes the sysroot prefix (e.g.
-/sysroot/usr/include). Prepending pc_sysrootdir to it duplicates the
-prefix and produces a broken path.
-
-The reverted commit introduced the double-prefix issue. Drop pc_sysrootdir
-and use includedir directly, which already carries the correct absolute
-path.
-
-The workaround was only needed for the legacy pkg-config 0.29 (2017)
-project, which did not apply PKG_CONFIG_SYSROOT_DIR to includedir.
-The actively maintained pkgconf project handles this correctly, and
-the legacy tool is no longer in widespread use.
-
-You can verify the behavior with:
-  $ PKG_CONFIG_SYSROOT_DIR="/bla" pkg-config --variable=includedir libdrm
-  /bla/usr/include
-
-Upstream: https://gitlab.freedesktop.org/emersion/drm_info/-/merge_requests/114
-Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1f80024..e4ce03e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -68,7 +68,7 @@ if libdrm.version().version_compare('<2.4.130')
- elif libdrm.type_name() == 'internal'
-   fourcc_h = meson.current_source_dir() / 'subprojects/libdrm/include/drm/drm_fourcc.h'
- else
--  fourcc_h = libdrm.get_variable(pkgconfig: 'pc_sysrootdir') + libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
-+  fourcc_h = libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
- endif
- 
- # The DRM_BUS_FAUX bus and its information is included in libdrm v2.4.127
--- 
-2.43.0
-
diff --git a/package/drm-info/drm-info.hash b/package/drm-info/drm-info.hash
index de852cb5eb..e53a98d807 100644
--- a/package/drm-info/drm-info.hash
+++ b/package/drm-info/drm-info.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  53ef974ac657a0b4b9d7424a65b7f92e6ca26c15e8356f4146ae8bb9cae2db44  drm_info-2.9.0.tar.gz
+sha256  4841dad87b00d9760430c9537dab7ff8102828878d972ffc25f48f6b7a16173a  drm_info-2.10.0.tar.gz
 sha256  05a54b690d8851143a8b923cfe8ac48f49050f9d2166e7eb0c1d340242d7f46a  LICENSE
diff --git a/package/drm-info/drm-info.mk b/package/drm-info/drm-info.mk
index 25deb18f00..25e96445aa 100644
--- a/package/drm-info/drm-info.mk
+++ b/package/drm-info/drm-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DRM_INFO_VERSION = 2.9.0
+DRM_INFO_VERSION = 2.10.0
 DRM_INFO_SITE = https://gitlab.freedesktop.org/emersion/drm_info/-/releases/v$(DRM_INFO_VERSION)/downloads
 DRM_INFO_SOURCE = drm_info-$(DRM_INFO_VERSION).tar.gz
 DRM_INFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
