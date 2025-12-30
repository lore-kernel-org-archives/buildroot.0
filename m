Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27ACE95A8C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BFF81BFA;
	Tue, 30 Dec 2025 13:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9myT0RC-t4uv; Tue, 30 Dec 2025 13:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4783581076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767100714;
	bh=dgLFCrVzb4H41jQbE1PU0mMN8qPVzXpEg2IaTvbDSTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bN1Y9bHz7Q44Sf4FGviiWUbHXaJUM09ccV62XEDpg50LnVShVWq9U+KMeMu6bGtZR
	 8tr8pvb4ohz3x4vONgh85FxoVp4hp6UqtP43LdGemh6QdLy/COHAzpOhz4/gmqvWh7
	 lfPXWHvGBbVxdCRsfqQIf09EkfNIBzUYoIH8SsYPs5rMoDnDn5+g6GS2VGD2Ap/O53
	 OcSyzHmqi2s47rnhHp9d4e/bvMMRxYiIVCaYcYn0ET6BZiG+cdEC/JSaNGvIbtlYne
	 SLs3arijx3xNehDd0KHlSsf8AUdS84bvOFsD3cMDqj5Z58Ax03P3H/G1MVXkSCRIQU
	 PThwQIvxp0QQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4783581076;
	Tue, 30 Dec 2025 13:18:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C928D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6369780F2D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpEpW_OTNZgj for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF7D80F75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AF7D80F75
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:18:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9BD387C2D; Tue, 30 Dec 2025 13:18:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 14:17:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe06ad0d9dfb98d06af3a25cccb0e926d5b65ab0
X-Git-Newrev: b11c90e1457e3a453e6c911a91a22f00dba5334a
X-Patchwork-Hint: ignore
Message-Id: <20251230131830.E9BD387C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: add config option to
 enable mod_md
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b11c90e1457e3a453e6c911a91a22f00dba5334a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mod_md allows Apache httpd to automatically provision certificates for
HTTPS via the ACME protocol (e.g. from Let's Encrypt), if configured
to do so. The additional dependencies are non-obvious, so add a config
option instead of only enabling the module if dependencies are met.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apache/Config.in | 12 ++++++++++++
 package/apache/apache.mk |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..6b21428c2c 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -41,6 +41,18 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
 
 endchoice
 
+config BR2_PACKAGE_APACHE_MOD_MD
+	bool "mod_md"
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable mod_md, which handles TLS certificate provisioning
+	  via the ACME protocol, and OCSP stapling.
+
+	  https://httpd.apache.org/docs/current/mod/mod_md.html
+
 endif
 
 comment "apache needs a toolchain w/ dynamic library, threads"
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 06f964b083..3b1574cb78 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -91,6 +91,15 @@ else
 APACHE_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_APACHE_MOD_MD),y)
+APACHE_CONF_OPTS += --enable-md
+# BR2_PACKAGE_APACHE_MOD_MD selects BR2_PACKAGE_OPENSSL, so openssl is
+# added above
+APACHE_DEPENDENCIES += jansson libcurl
+else
+APACHE_CONF_OPTS += --disable-md
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 APACHE_DEPENDENCIES += zlib
 APACHE_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
