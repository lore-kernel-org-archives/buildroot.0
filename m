Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992CBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40AED4033C;
	Mon, 27 Dec 2021 21:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3xCLhBSs7EI; Mon, 27 Dec 2021 21:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B813F40363;
	Mon, 27 Dec 2021 21:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3661BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD4434032A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvCr-a85VTn2 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:22:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21ECE40275
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:22:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3E5C082ACE; Mon, 27 Dec 2021 21:16:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:22:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5563a9c7c95e23b2ef008db785f6ae74ad366c41
X-Git-Newrev: 9892fd8f06e51be6b838e99dce5075aceeda1142
X-Patchwork-Hint: ignore
Message-Id: <20211227211653.3E5C082ACE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: add iwd support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9892fd8f06e51be6b838e99dce5075aceeda1142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IWD is a runtime dependency for the connman iwd plugin.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
