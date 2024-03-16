Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA67C54E60
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 620C3410E0;
	Sat, 16 Mar 2024 22:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQMyZjStA7Ia; Sat, 16 Mar 2024 22:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ED4341692
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ED4341692;
	Sat, 16 Mar 2024 22:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 132161BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C0DE410D4
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vYc5Dcd3Fnd for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87EB410E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87EB410E0
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C41FD82569; Sat, 16 Mar 2024 22:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 23:27:20 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 05c92a568ff37d3333fc0011f2155e75ccdf24eb
X-Git-Newrev: 98a1b886bd115c7a01801119255e0fc36aa9c4a5
X-Patchwork-Hint: ignore
Message-Id: <20240316223332.C41FD82569@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libmodsecurity:
 security bump to 3.0.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98a1b886bd115c7a01801119255e0fc36aa9c4a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The project has been transferred from Trustwave (SpiderLabs) to OWASP, hence the
change in URLs. The upstream CPE vendor ID will likely also change in the future
but the upstream is still working on this [1].

- Fixes:
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-1019

[1] https://github.com/owasp-modsecurity/ModSecurity/issues/3083

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d4b065e35c47efa9a347abad0a8cfbf024a12e60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/Config.in           | 2 +-
 package/libmodsecurity/libmodsecurity.hash | 5 +++--
 package/libmodsecurity/libmodsecurity.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index 69bb0494cc..da14b21669 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBMODSECURITY
 	  SecRules format and apply them to HTTP content
 	  provided by your application via Connectors.
 
-	  https://github.com/SpiderLabs/ModSecurity
+	  https://github.com/owasp-modsecurity/ModSecurity
 
 comment "libmodsecurity needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index b0a1bf33f3..2221a8a37d 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,5 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.11/modsecurity-v3.0.11.tar.gz.sha256
-sha256  070f46c779d30785b95eb1316b46e2e4e6f90fd94a96aaca4bd54cd94738b692  modsecurity-v3.0.11.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.12/modsecurity-v3.0.12.tar.gz.sha256
+sha256  a36118401641feef376bb469bf468abf94b7948844976a188a6fccb53390b11f  modsecurity-v3.0.12.tar.gz
+
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 548eeb8602..d8c10b98b2 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.11
+LIBMODSECURITY_VERSION = 3.0.12
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
-LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
+LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
 LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
