Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD84C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABE9406F3;
	Tue, 19 Mar 2024 12:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WymOR1tS8mvI; Tue, 19 Mar 2024 12:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A15406EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28A15406EE;
	Tue, 19 Mar 2024 12:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 944AF1BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8214140B9B
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeIclYTG6OcZ for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAADF40192
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAADF40192
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98D19835A4; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:20:47 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5ea4551d5311d5a1e7c5ceaf3c5ad59e37dab07b
X-Git-Newrev: 4160f33807287df7ffaf73f908d6d019542fd798
X-Patchwork-Hint: ignore
Message-Id: <20240319122332.98D19835A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/strongswan: drop
 BR2_PACKAGE_STRONGSWAN_SCEP
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

commit: https://git.buildroot.net/buildroot/commit/?id=4160f33807287df7ffaf73f908d6d019542fd798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

scepclient is unrecognized since bump to version 5.9.8 in commit
b79d735139282ecf052dc89d4c221bbd16447112 and
https://github.com/strongswan/strongswan/commit/8716f7c03c6193b1cb53837243177f36280ff4f7:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --enable-scepclient

Fixes: b79d735139282ecf052dc89d4c221bbd16447112

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ed2090717f657c1f19bb7bd62c97e17a7bf3ff50)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 | 10 ++++++++++
 package/strongswan/Config.in     |  3 ---
 package/strongswan/strongswan.mk |  1 -
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 64419a2615..10101d97b0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_STRONGSWAN_SCEP
+	bool "strongswan SCEP client tool removed"
+	select BR2_LEGACY
+	help
+	  "ipsec scepclient" tool has been removed and replaced by the
+	  pki subcommands "pki --scep" and "pki --scepca" which
+	  implement the new SCEP RFC 8894 standard that was released in
+	  September 2020 and which supports trusted "certificate
+	  renewal" based on the existing client certificate.
+
 config BR2_PACKAGE_PUGIXML_HEADER_ONLY
 	bool "pugixml header-only removed"
 	select BR2_LEGACY
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index f2e597e016..5231e69ca8 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -204,9 +204,6 @@ config BR2_PACKAGE_STRONGSWAN_PKI
 	bool "Enable pki certificate utility"
 	default y
 
-config BR2_PACKAGE_STRONGSWAN_SCEP
-	bool "Enable SCEP client tool"
-
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
 	bool "Enable additional utilities (found in scripts directory)"
 	default y
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 36cb72f6be..5521fb7dd4 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -33,7 +33,6 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-stroke=$(if $(BR2_PACKAGE_STRONGSWAN_STROKE),yes,no) \
 	--enable-sql=$(if $(BR2_PACKAGE_STRONGSWAN_SQL),yes,no) \
 	--enable-pki=$(if $(BR2_PACKAGE_STRONGSWAN_PKI),yes,no) \
-	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
 	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
