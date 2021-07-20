Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3546C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A4FE60FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A4FE60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 605334238C;
	Tue,  3 Aug 2021 23:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOunTlV2Corx; Tue,  3 Aug 2021 23:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7BC94238A;
	Tue,  3 Aug 2021 23:57:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 656EF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ED4040EFC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TW6su788LrSL for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C38340552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 60E3685583; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:48:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7801a85c137785145d2268a7a40152c48adf62d1
X-Git-Newrev: f94347880701fb4fa8ffa844ff9ac683f2f8f4e4
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.60E3685583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpcbind: use upstream
 systemd service files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f94347880701fb4fa8ffa844ff9ac683f2f8f4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The overriden service files appear to have compatibility issues
with upstream rpcbind, don't replace the bundled service files.

We need to build with --enable-warmstarts as this is required
by the systemd service files.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpcbind/rpcbind.mk      | 10 ++--------
 package/rpcbind/rpcbind.service | 10 ----------
 package/rpcbind/rpcbind.socket  |  8 --------
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index d9f25e698e..725075f962 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -17,19 +17,13 @@ RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+RPCBIND_CONF_OPTS += --enable-warmstarts \
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
 RPCBIND_DEPENDENCIES += systemd
 else
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
 endif
 
-define RPCBIND_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.service
-	$(INSTALL) -m 0644 -D package/rpcbind/rpcbind.socket \
-		$(TARGET_DIR)/usr/lib/systemd/system/rpcbind.socket
-endef
-
 define RPCBIND_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
 		$(TARGET_DIR)/etc/init.d/S30rpcbind
diff --git a/package/rpcbind/rpcbind.service b/package/rpcbind/rpcbind.service
deleted file mode 100644
index e41931df4a..0000000000
--- a/package/rpcbind/rpcbind.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=RPC bind service
-Requires=rpcbind.socket
-
-[Service]
-Type=forking
-ExecStart=/usr/sbin/rpcbind
-
-[Install]
-Also=rpcbind.socket
diff --git a/package/rpcbind/rpcbind.socket b/package/rpcbind/rpcbind.socket
deleted file mode 100644
index d63c1d9720..0000000000
--- a/package/rpcbind/rpcbind.socket
+++ /dev/null
@@ -1,8 +0,0 @@
-[Unit]
-Description=RPCbind Server Activation Socket
-
-[Socket]
-ListenStream=/var/run/rpcbind.sock
-
-[Install]
-WantedBy=sockets.target
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
