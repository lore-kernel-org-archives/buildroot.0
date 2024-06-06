Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2A5C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACD28104C;
	Thu,  6 Jun 2024 09:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGT37wpveLq6; Thu,  6 Jun 2024 09:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CF88104D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3CF88104D;
	Thu,  6 Jun 2024 09:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9581BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1951C4052A
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5-CmlaWOAzP for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28920401F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28920401F1
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:26:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D75687C6B; Thu,  6 Jun 2024 09:26:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 11:06:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 49fa6ebb71f89e3c9e13d12070bea41ccf6ed700
X-Git-Newrev: 1608313efff353b65d8f7b4606aa86a178938acc
X-Patchwork-Hint: ignore
Message-Id: <20240606092622.1D75687C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/json-glib: add host
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=1608313efff353b65d8f7b4606aa86a178938acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
[yann.morin.1998@free.fr: also disable doc and tests]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/json-glib/json-glib.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..e216af20b1 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -18,6 +18,15 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
+HOST_JSON_GLIB_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2
+
+HOST_JSON_GLIB_CONF_OPTS = \
+	-Dgtk_doc=disabled \
+	-Dtests=false \
+	-Dintrospection=disabled
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
@@ -34,3 +43,4 @@ endif
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
