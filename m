Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0D6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F0744191A;
	Thu,  8 Dec 2022 10:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F0744191A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UouZGzc8xV7G; Thu,  8 Dec 2022 10:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130B841915;
	Thu,  8 Dec 2022 10:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130B841915
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEDC31BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F8AB40283
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F8AB40283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-ckbfgb-Iqb for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBA4C403E7
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA4C403E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D386785E67; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:55:37 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 57ba62490307f802ad201d9af9ce0c43587ce7d0
X-Git-Newrev: 773f4246bd6637c7d9e9755c31d86915b7c3190d
X-Patchwork-Hint: ignore
Message-Id: <20221208100118.D386785E67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/optee-client:
 rename S30optee
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

commit: https://git.buildroot.net/buildroot/commit/?id=773f4246bd6637c7d9e9755c31d86915b7c3190d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Commit b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff forgot to rename
S30optee in optee-client.mk resulting in the following build failure:

/usr/bin/install -m 0755 -D package/optee-client//S30optee /home/autobuild/autobuild/instance-0/output-1/target/etc/init.d/S30optee
/usr/bin/install: cannot stat 'package/optee-client//S30optee': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/21fc165933e6d226de277b62d4ce99342cef0ffb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cac489ce1dc9f280a76dce92960ea7807a5e86c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
