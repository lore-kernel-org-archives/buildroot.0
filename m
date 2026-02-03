Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BCBE87853
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E4F140B9E;
	Tue,  3 Feb 2026 18:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RO6mMlEw3z5; Tue,  3 Feb 2026 18:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA6A40BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142252;
	bh=9GIQ8v1dfhEf6HINJHtf9R496u2OD+bbrOkSOhspePE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X+SnHBbPhuPVTzVgTpDucL6IiA3KHyb2LMhj1gqn/HzWW49BENqolFFLWyNlTlaRL
	 ONkA9rbMGATM1VIP0PXKYKDkaKRzPwsY92hpbvSJcB+nYWtvqhlzw7ySmdu7GMD+Dt
	 FFQxBB/9uvxcjv28EwAKr8EgojIbVEVG+pztqwSQoRgl1EedqH9RNldwBf5bUWlRhH
	 AiggUBr2sW8ITY7dhwO8HtfnHS9pL13gyVJ9V5KfX+INe32uYxFBO0GF2gh8VRpwoF
	 NvVY1j/dCKLQLFKVTmWd1M9/sXn7K7wMZ0m2eSKOwnhM1m5UxJi0IaHqlVenDwrdiB
	 5+s3miAtn3mjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA6A40BAE;
	Tue,  3 Feb 2026 18:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DBEF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7806940BAE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BOBIto3Ir0Uv for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8484840B9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8484840B9E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:10:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 733FD8670A; Tue,  3 Feb 2026 18:10:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 18:42:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03a1732dea67e088ec85f92853ca14f5a3c0f7b7
X-Git-Newrev: 1d10e677b8fe8cb757dccba8c42b746f52c1a5a4
X-Patchwork-Hint: ignore
Message-Id: <20260203181046.733FD8670A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riemann-c-client: bump version to
 2.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d10e677b8fe8cb757dccba8c42b746f52c1a5a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Moved _SITE to https://git.madhouse-project.org/algernon/riemann-c-client
according to https://github.com/collectd/collectd/issues/4021#issuecomment-1218597353
(collectd is the only package in buildroot using riemann-c-client)

Release notes:
https://git.madhouse-project.org/algernon/riemann-c-client/src/tag/riemann-c-client-2.2.2/NEWS.md

Updated licenses due to upstream commit
https://git.madhouse-project.org/algernon/riemann-c-client/commit/9bada2fabff9124245426baf7beb18e1e9480b17

Added optional dependencies to OpenSSL and wolfSSL.

Fixes:
https://autobuild.buildroot.net/results/29d/29d03e9ba24ae9d17ff7ad57e4906c30413d8a6e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/riemann-c-client/riemann-c-client.hash |  5 +++--
 package/riemann-c-client/riemann-c-client.mk   | 27 ++++++++++++++++++++------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/package/riemann-c-client/riemann-c-client.hash b/package/riemann-c-client/riemann-c-client.hash
index 43d4cd45c4..9daefc9c19 100644
--- a/package/riemann-c-client/riemann-c-client.hash
+++ b/package/riemann-c-client/riemann-c-client.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256  568416d854d1c1e5eac743c9f56db6fa0d6a8144daa74a799d0556bb6b50e679  riemann-c-client-1.10.5.tar.gz
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
+sha256  468c2d6cb4095e581927005a1dab13656f5a9355e4c68a3a25fceb5c6798a72f  riemann-c-client-2.2.2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSES/Apache-2.0.txt
+sha256  6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665  LICENSES/EUPL-1.2.txt
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index f942d560c8..952962fbe6 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -4,18 +4,33 @@
 #
 ################################################################################
 
-RIEMANN_C_CLIENT_VERSION = 1.10.5
-RIEMANN_C_CLIENT_SITE = \
-	$(call github,algernon,riemann-c-client,riemann-c-client-$(RIEMANN_C_CLIENT_VERSION))
-RIEMANN_C_CLIENT_LICENSE = LGPL-3.0+
-RIEMANN_C_CLIENT_LICENSE_FILES = LICENSE
+RIEMANN_C_CLIENT_VERSION = 2.2.2
+RIEMANN_C_CLIENT_SITE = https://git.madhouse-project.org/algernon/riemann-c-client/archive
+RIEMANN_C_CLIENT_LICENSE = \
+	Apache-2.0 (lib/riemann/proto/), \
+	EUPL-1.2
+RIEMANN_C_CLIENT_LICENSE_FILES = \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/EUPL-1.2.txt
 RIEMANN_C_CLIENT_INSTALL_STAGING = YES
 RIEMANN_C_CLIENT_MAKE = $(MAKE1)
 # From git
 RIEMANN_C_CLIENT_AUTORECONF = YES
 RIEMANN_C_CLIENT_DEPENDENCIES = \
 	host-pkgconf protobuf-c \
-	$(if $(BR2_PACKAGE_GNUTLS),gnutls) \
 	$(if $(BR2_PACKAGE_JSON_C),json-c)
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+RIEMANN_C_CLIENT_CONF_OPTS += --with-tls=gnutls
+RIEMANN_C_CLIENT_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RIEMANN_C_CLIENT_CONF_OPTS += --with-tls=openssl
+RIEMANN_C_CLIENT_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+RIEMANN_C_CLIENT_CONF_OPTS += --with-tls=wolfssl
+RIEMANN_C_CLIENT_DEPENDENCIES += wolfssl
+else
+RIEMANN_C_CLIENT_CONF_OPTS += --without-tls
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
