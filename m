Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D9C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF3CC60BC0;
	Mon, 15 Aug 2022 20:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF3CC60BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEc9ieia4R3A; Mon, 15 Aug 2022 20:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17B0360BB3;
	Mon, 15 Aug 2022 20:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B0360BB3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4497E1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E8B04088F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E8B04088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-mgAEDyA8lg for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:21:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFB3440893
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB3440893
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA6B1876E4; Mon, 15 Aug 2022 20:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 22:21:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7652817c93a02715e0d334d70118a0d8b6917ca6
X-Git-Newrev: cd2e82b581f0926c3856d84df51ec52ddcc1277b
X-Patchwork-Hint: ignore
Message-Id: <20220815200708.EA6B1876E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: fix libkrb5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd2e82b581f0926c3856d84df51ec52ddcc1277b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following libkrb5 build failure raised since the addition of the
package in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:

configure: error: in `/home/giuliobenetti/autobuild/run/instance-2/output-1/build/freeradius-server-3.2.0/src/modules/rlm_krb5':
configure: error: cannot run test program while cross compiling

Fixes:
 - http://autobuild.buildroot.org/results/3968d611458060480d341bd60f7c50209a0ace15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 2f4c118da5..5b74a3b01a 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -15,6 +15,12 @@ FREERADIUS_SERVER_CPE_ID_PRODUCT = freeradius
 FREERADIUS_SERVER_DEPENDENCIES = libtalloc
 FREERADIUS_SERVER_AUTORECONF = YES
 
+# We're patching src/modules/rlm_krb5/configure.ac
+define FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
+	cd $(@D)/src/modules/rlm_krb5; $(AUTOCONF) -I$(@D)
+endef
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
+
 # some compiler checks are not supported while cross compiling.
 # instead of removing those checks, we cache the answers
 FREERADIUS_SERVER_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
