Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B09CEBF91
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16F1341503;
	Mon, 17 Nov 2025 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrDqhMD5Ja4t; Mon, 17 Nov 2025 20:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2892E414FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2892E414FA;
	Mon, 17 Nov 2025 20:08:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B52E5158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F7A83DA7
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RN147Td5J6qL for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BD183D13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1BD183D13
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E030B84000; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:49:53 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: cff6724a9ab14b8fca5ced499ed6e517b48376a7
X-Git-Newrev: e28f5f0f374efcd70aa1a57a2cbb093f47611b06
X-Patchwork-Hint: ignore
Message-Id: <20251117200752.E030B84000@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/bind: drop
 unrecognized options
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e28f5f0f374efcd70aa1a57a2cbb093f47611b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Buildroot commit c9515c8b63bc9bc84b52b731c2c72031acd240d2 bumped bind to
9.18.28 which removed dnssec-keymgr:
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/doc/notes/notes-9.18.0.rst?ref_type=tags&plain=1#L187

but forgot to remove the configure option --with-python
https://gitlab.isc.org/isc-projects/bind9/-/commit/98b3b93791777218c04a67ddaef22619162249f7
https://gitlab.isc.org/isc-projects/bind9/-/commit/305ca032a0d3afd779b2b97bb36971e1072f0453

Configure option --enable-epoll was also removed upstream in 9.18.16:
https://gitlab.isc.org/isc-projects/bind9/-/commit/6b6076c882a00028197b04a827f6cf8e7a5369de

Configure option --enable-backtrace was also removed upstream in 9.18.0:
https://gitlab.isc.org/isc-projects/bind9/-/commit/e847591867cfe542c9e52d6176e0a2bb6e2ca875

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9c0f6d2379b67a65e78359118cb7d2025b13d85f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 11730b6e7e..d137245ef9 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,9 +30,7 @@ BIND_AUTORECONF = YES
 BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
-	--enable-epoll \
 	--disable-doh \
-	--disable-backtrace \
 	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
@@ -95,14 +93,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-# Used by dnssec-keymgr
-ifeq ($(BR2_PACKAGE_PYTHON_PLY),y)
-BIND_DEPENDENCIES += host-python-ply
-BIND_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python
-else
-BIND_CONF_OPTS += --with-python=no
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 BIND_DEPENDENCIES += readline
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
