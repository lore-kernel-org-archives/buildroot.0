Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723C9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC08F4017E;
	Fri, 28 Feb 2025 17:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVjCoRJD1Lx6; Fri, 28 Feb 2025 17:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90CE650489
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CE650489;
	Fri, 28 Feb 2025 17:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C3F1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ECF949999
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkO5cGgnoWkR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0475A42E59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0475A42E59
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDD5B818ED; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Jan 2025 15:13:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d4fa17f44128929970632e6703a49bc40eb0492f
X-Git-Newrev: 12ec5d5059ea107a960b9e20dd11b9f7affd1070
X-Patchwork-Hint: ignore
Message-Id: <20250228163015.EDD5B818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lighttpd: fix missing
 conf install
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
