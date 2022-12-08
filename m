Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9112C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 09:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 494054185E;
	Thu,  8 Dec 2022 09:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 494054185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bz3fLr2wAOVC; Thu,  8 Dec 2022 09:58:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E8D4183B;
	Thu,  8 Dec 2022 09:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E8D4183B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2EFF1BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 09:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A991B82010
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 09:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A991B82010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IftuVwWl842l for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 09:57:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7CB082019
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 09:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7CB082019
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5A7E85E42; Thu,  8 Dec 2022 09:57:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:55:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 096dfb90eb02b4e4772b3ebc58044a2bb0597168
X-Git-Newrev: a69856d9024c8334b361ef5702cab6e8685907f7
X-Patchwork-Hint: ignore
Message-Id: <20221208095741.C5A7E85E42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/optee-client:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a69856d9024c8334b361ef5702cab6e8685907f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index dda9a2855d..13a9eb6b20 100644
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
