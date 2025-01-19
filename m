Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A85C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 14:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860EE60E9D;
	Sun, 19 Jan 2025 14:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkE1nJvm5i0O; Sun, 19 Jan 2025 14:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C15D60E9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C15D60E9E;
	Sun, 19 Jan 2025 14:26:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87127D7
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718BA84B10
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkhfYUexHQor for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 14:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB9884B0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EB9884B0A
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 14:26:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 326EF85B50; Sun, 19 Jan 2025 14:26:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Jan 2025 15:13:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4fa17f44128929970632e6703a49bc40eb0492f
X-Git-Newrev: 12ec5d5059ea107a960b9e20dd11b9f7affd1070
X-Patchwork-Hint: ignore
Message-Id: <20250119142617.326EF85B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: fix missing conf install
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12ec5d5059ea107a960b9e20dd11b9f7affd1070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2c94ed37fb4d20d3a8e485e972ccdc2aef43e59a bumped lighttpd,
but forgot to include the lighttpd.annotated.conf file to the install list.

See the news: https://www.lighttpd.net/2025/1/10/1.4.77/
"doc/config/lighttpd.conf has been renamed to
 doc/config/lighttpd.annotated.conf, and doc/config/lighttpd.conf
 is now a simpler header which includes lighttpd.annotated.conf."

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lighttpd/lighttpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 985b9ca513..609fe3e3be 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -185,6 +185,8 @@ define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.conf \
 		$(TARGET_DIR)/etc/lighttpd/lighttpd.conf
+	$(INSTALL) -D -m 0644 $(@D)/doc/config/lighttpd.annotated.conf \
+		$(TARGET_DIR)/etc/lighttpd/lighttpd.annotated.conf
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/modules.conf \
 		$(TARGET_DIR)/etc/lighttpd/modules.conf
 	$(INSTALL) -D -m 0644 $(@D)/doc/config/conf.d/access_log.conf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
