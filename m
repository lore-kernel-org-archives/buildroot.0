Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DAFC4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 11:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C4A440322;
	Sun,  4 Dec 2022 11:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4A440322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_3wjfKx4VEn; Sun,  4 Dec 2022 11:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50CE34027B;
	Sun,  4 Dec 2022 11:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50CE34027B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0AE1BF3B0
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 671FE60E63
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671FE60E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXcivflK6_0M for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 11:43:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2AE8608F5
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 11:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AE8608F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F416851FF; Sun,  4 Dec 2022 11:43:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 12:42:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3781e4efc52f542f58147b2de5f599b4e729bcbb
X-Git-Newrev: cac489ce1dc9f280a76dce92960ea7807a5e86c5
X-Patchwork-Hint: ignore
Message-Id: <20221204114314.8F416851FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: rename S30optee
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

commit: https://git.buildroot.net/buildroot/commit/?id=cac489ce1dc9f280a76dce92960ea7807a5e86c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff forgot to rename
S30optee in optee-client.mk resulting in the following build failure:

/usr/bin/install -m 0755 -D package/optee-client//S30optee /home/autobuild/autobuild/instance-0/output-1/target/etc/init.d/S30optee
/usr/bin/install: cannot stat 'package/optee-client//S30optee': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/21fc165933e6d226de277b62d4ce99342cef0ffb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-client/optee-client.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 252841ba10..3fbbe9484c 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -27,8 +27,8 @@ OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
 endif
 
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
-		$(TARGET_DIR)/etc/init.d/S30optee
+	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
+		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
 endef
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
