Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73063C433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD6A408F2;
	Thu, 25 Nov 2021 19:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pX-xNwXDNsVu; Thu, 25 Nov 2021 19:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811A3408EC;
	Thu, 25 Nov 2021 19:55:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B88B61BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6AE4605E7
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QASCijrfVM02 for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0471060633
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DDB268F537; Thu, 25 Nov 2021 19:49:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 20:53:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00b28cac7ad7c9011cc17aae06aebd67a0993c03
X-Git-Newrev: bffc7a477459c5ba7abb0efa8c3691abde0c5cb8
X-Patchwork-Hint: ignore
Message-Id: <20211125194954.DDB268F537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xtables-addons: rename
 XTABLES_DISABLE_GEOIP_HELPERS
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

commit: https://git.buildroot.net/buildroot/commit/?id=bffc7a477459c5ba7abb0efa8c3691abde0c5cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xtables-addons/xtables-addons.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index feed054e88..b3d1bf2d44 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -17,10 +17,10 @@ XTABLES_ADDONS_CONF_OPTS = \
 	--with-xtlibdir="/usr/lib/xtables"
 
 # geoip helpers need perl with modules and unzip so disable
-define XTABLES_DISABLE_GEOIP_HELPERS
+define XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
 	$(SED) 's/ geoip//' $(@D)/Makefile.in
 endef
-XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_DISABLE_GEOIP_HELPERS
+XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
 
 define XTABLES_ADDONS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
