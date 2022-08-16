Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C23C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955764009B;
	Tue, 16 Aug 2022 20:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955764009B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1m5a1XB3pq3y; Tue, 16 Aug 2022 20:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D496408B6;
	Tue, 16 Aug 2022 20:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D496408B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 279871BF9C6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F4F460625
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4F460625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIITP6WVmmeU for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54EEB60B28
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54EEB60B28
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1EA8787879; Tue, 16 Aug 2022 19:58:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 22:08:47 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 7dd7331698d86cb8ef8fed796ed009901b64f382
X-Git-Newrev: 96417b5fb66e3298e451450023cc9d997404ac39
X-Patchwork-Hint: ignore
Message-Id: <20220816195805.1EA8787879@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/bind: add json-c
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=96417b5fb66e3298e451450023cc9d997404ac39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fbdcd551343a9cc6469f46d0066119cc182052d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 86049d3648..bd12f7ad31 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,7 +33,6 @@ BIND_CONF_ENV = \
 BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
-	--with-json-c=no \
 	--enable-epoll \
 	--disable-backtrace \
 	--with-openssl=$(STAGING_DIR)/usr
@@ -47,6 +46,13 @@ else
 BIND_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+BIND_CONF_OPTS += --with-json-c
+BIND_DEPENDENCIES += json-c
+else
+BIND_CONF_OPTS += --without-json-c
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BIND_CONF_OPTS += --enable-linux-caps
 BIND_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
