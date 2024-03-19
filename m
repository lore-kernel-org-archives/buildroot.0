Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B44C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EFF406FC;
	Tue, 19 Mar 2024 12:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLfCqhlkL0pj; Tue, 19 Mar 2024 12:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60401406F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60401406F0;
	Tue, 19 Mar 2024 12:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80F071BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64E4181E6B
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id brEx3LDDr5ks for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8219381E70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8219381E70
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B6318354E; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:19:32 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 7d54815f236396c689a7aad0aff413a6f05d05d1
X-Git-Newrev: 9e976c46a656b059ebc102fbab03dfd0a46878cc
X-Patchwork-Hint: ignore
Message-Id: <20240319122222.7B6318354E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/strongswan: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e976c46a656b059ebc102fbab03dfd0a46878cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index ebd2c5d8d4..4b26714974 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
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
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
 	depends on BR2_arm || BR2_aarch64
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
