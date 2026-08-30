Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54AEC61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 16:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D85C4058B;
	Sun, 30 Aug 2026 16:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCKIR7R3C_7M; Sun, 30 Aug 2026 16:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788108611;
	bh=9ga0Jk8GCPVic19fw3XHSpVVp+FCUGs4GNjnR/ELEE4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMa94++d3z2sLY5haq+Xy/lYN6cYWHOhj+ORnNgtQhXf7n2Z/Yk5dJOOUuLNwJ8/p
	 XX4hESICJFAS07o7H3pXOQTB69MFrWYtl1fcn2y+RC7nlDa1FsCHlc253/F31Lg0eo
	 nrxAh5bm6u2TI77R+7jqEyG3vMGsOaD/spGSFIKUP4/WsJE8kzn7CNP8d2TcrhJyL9
	 X3YrL/A+k7cMzPWxFanhbFv2d3wsxaFrrVscnpzE6tPxUw7OsHqFR92ovzRkaaW8V8
	 gtEY4oQL1yx7xYmBsA/QyP3dU+asF2XHnnTFqHfl+4SzNlYKSq5vBPl/wui8c7rqCM
	 mtuilhJnu37pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DAE44058C;
	Sun, 30 Aug 2026 16:50:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A8E334
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 16:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7CE14058C
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 16:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HI-ArQkgeh4e for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 16:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D42E94058B
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 16:50:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0E9A923CF; Sun, 30 Aug 2026 16:49:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Aug 2026 18:24:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ec936cf732e50bddb588985a8d6738b43da3ac
X-Git-Newrev: be382f6061216ca82a735d0992894c4e6fe5173a
X-Patchwork-Hint: ignore
Message-Id: <20260830164910.C0E9A923CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-36-g2d5421ffc
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be382f6061216ca82a735d0992894c4e6fe5173a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following CVEs:

CVE-2026-19499:
https://gitlab.com/gnutools/glibc/-/commit/63b53df549451a5d69fcba6d7612ea99f517e8e3

CVE-2026-77117:
https://gitlab.com/gnutools/glibc/-/commit/6f9b2bfa500bf5d1cff5d990adfff4b71298dadd

CVE-2026-80489:
https://gitlab.com/gnutools/glibc/-/commit/cb61572ea3f773e1e1978f6c412cc36a30acdb0c

Added GLIBC_IGNORE_CVES for CVE-2026-19542 which was forgotten in
buildroot commit 58f31377389dd2f5090e4dd69deb4d5f994f88c0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 14 +++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index bfeb5ab6bd..8d69de7b2a 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  028aa13d6c0737aecf0ec6ac0fa842e3a18c82bcdaeeb800d42a65a76dcbfe91  glibc-2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032-git4.tar.gz
+sha256  39f6808e31a02da42f774912c6754ea22d5f076c4e935b1e233f3602d4d772c0  glibc-2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e0332dadc4..f39e959c29 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
+GLIBC_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -25,6 +25,18 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
+# Fixed by 2.44-26-gd6ff274313d79feb864cc10eb775b91c817a67e9
+GLIBC_IGNORE_CVES += CVE-2026-19542
+
+# Fixed by 2.44-29-g63b53df549451a5d69fcba6d7612ea99f517e8e3
+GLIBC_IGNORE_CVES += CVE-2026-19499
+
+# Fixed by 2.44-30-g6f9b2bfa500bf5d1cff5d990adfff4b71298dadd
+GLIBC_IGNORE_CVES += CVE-2026-77117
+
+# Fixed by 2.44-31-gcb61572ea3f773e1e1978f6c412cc36a30acdb0c
+GLIBC_IGNORE_CVES += CVE-2026-80489
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c88f3f1fa6..048891724d 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
+LOCALEDEF_VERSION = 2.44-36-g2d5421ffca8893534d5e02ad38c28acd8e778fa3
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
