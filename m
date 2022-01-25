Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECCFC433FE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 17:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6588960B0C;
	Tue, 25 Jan 2022 17:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3O9O6Y7YFHw; Tue, 25 Jan 2022 17:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B669360A7E;
	Tue, 25 Jan 2022 17:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46E0E1BF957
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3534182AC6
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 17:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coYAG7i5y2Bc for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 17:19:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C14B681DA3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 17:19:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EB97582785; Tue, 25 Jan 2022 17:12:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 18:17:17 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d039cb94b2c2cf1286419e490a4f7f40c53cd7e7
X-Git-Newrev: 123e8b59879bda71e29c6e6485a75e9fc10bfdf6
X-Patchwork-Hint: ignore
Message-Id: <20220125171239.EB97582785@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/connman: add iwd
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=123e8b59879bda71e29c6e6485a75e9fc10bfdf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

IWD is a runtime dependency for the connman iwd plugin.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9892fd8f06e51be6b838e99dce5075aceeda1142)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index e5e596c973..8c66a69882 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -85,6 +85,12 @@ else
 CONNMAN_CONF_OPTS += --disable-wispr
 endif
 
+ifeq ($(BR2_PACKAGE_IWD),y)
+CONNMAN_CONF_OPTS += --enable-iwd
+else
+CONNMAN_CONF_OPTS += --disable-iwd
+endif
+
 define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
