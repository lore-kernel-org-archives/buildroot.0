Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4ACC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:44:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CFF61381
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5CFF61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B460A415B1;
	Tue, 28 Sep 2021 20:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgURHNrV8nJF; Tue, 28 Sep 2021 20:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD83415B2;
	Tue, 28 Sep 2021 20:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9C91BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76A78405E9
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XH8LT_VGWTup for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:44:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BE1405F2
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:44:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6E2C68D46D; Tue, 28 Sep 2021 20:42:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:44:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89f20c1c3f9d667ec0a40bcfe17db94ff098e6c0
X-Git-Newrev: 3b1659107d8b0e80e2b19ad83b5fa7e564c411e1
X-Patchwork-Hint: ignore
Message-Id: <20210928204214.6E2C68D46D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add md4 hash algorithm
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b1659107d8b0e80e2b19ad83b5fa7e564c411e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the option to enable the md4 hash algorithm and default it to 'no'
since this is a new option.

Since md4 is required by EAP-MSCHAPv2 it is selected by
BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2. See
https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf for
further details.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/strongswan/Config.in     | 4 ++++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index f6e78db22e..4f02efb79d 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -57,6 +57,9 @@ config BR2_PACKAGE_STRONGSWAN_CURL
 	bool "Enable CURL fetcher plugin to fetch files via libcurl"
 	select BR2_PACKAGE_LIBCURL
 
+config BR2_PACKAGE_STRONGSWAN_MD4
+	bool "Enable MD4 hash algorithm"
+
 config BR2_PACKAGE_STRONGSWAN_CHARON
 	bool "Enable the IKEv1/IKEv2 keying daemon charon"
 	default y
@@ -125,6 +128,7 @@ config BR2_PACKAGE_STRONGSWAN_EAP_GTC
 config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
 	bool "Enable EAP-MSCHAPv2"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_MD4
 
 config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
 	bool "Enable EAP-PEAP"
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index a23ac8af22..2967682767 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
+	--enable-md4=$(if $(BR2_PACKAGE_STRONGSWAN_MD4),yes,no) \
 	--enable-systime-fix=$(if $(BR2_PACKAGE_STRONGSWAN_SYSTIME_FIX),yes,no) \
 	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
 	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
