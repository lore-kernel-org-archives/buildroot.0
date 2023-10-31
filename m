Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C94C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 20:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554EF41553;
	Tue, 31 Oct 2023 20:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 554EF41553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ql61sX-YNqsO; Tue, 31 Oct 2023 20:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6CC9415FF;
	Tue, 31 Oct 2023 20:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6CC9415FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDC541BF2E3
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B72E0415C8
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72E0415C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMB4RweP6U9C for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 20:49:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D9541517
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 20:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D9541517
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E24E18627E; Tue, 31 Oct 2023 20:49:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 21:47:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9705d300266d9b0332f898b2517fad67b586e9d6
X-Git-Newrev: 6e000dba5f050b1e1fb32352e722a209b9be94c9
X-Patchwork-Hint: ignore
Message-Id: <20231031204918.E24E18627E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: introduce option to
 enable WebSockets support
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e000dba5f050b1e1fb32352e722a209b9be94c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alisa Volk <aolvolk@salutedevices.com>
[yann.morin.1998@free.fr: drop "default n"]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/Config.in  | 5 +++++
 package/libcurl/libcurl.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index adab1ca3e6..0e52bc69c2 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -31,6 +31,11 @@ config BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT
 	help
 	  Enable support for cookies.
 
+config BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT
+	bool "websockets support"
+	help
+	  Enable support for websockets.
+
 config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	bool "enable extra protocols and features"
 	default y
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index bd331a55aa..2c87821a48 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -154,6 +154,12 @@ else
 LIBCURL_CONF_OPTS += --disable-proxy
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT),y)
+LIBCURL_CONF_OPTS += --enable-websockets
+else
+LIBCURL_CONF_OPTS += --disable-websockets
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES),y)
 LIBCURL_CONF_OPTS += \
 	--enable-dict \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
