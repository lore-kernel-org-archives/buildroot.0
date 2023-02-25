Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23D4C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8280140913;
	Sat, 25 Feb 2023 09:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8280140913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYNTuk8oUdYj; Sat, 25 Feb 2023 09:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0624070F;
	Sat, 25 Feb 2023 09:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF0624070F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A31361BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D6CC81EE3
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D6CC81EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJyVaRE7nZae for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4A3781EBC
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A3781EBC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FA9986A88; Sat, 25 Feb 2023 09:50:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:41:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5215f56e5bed387575b35de65b78d815b96ba6f3
X-Git-Newrev: 7243e9394c53c7e0e6e10c3d149a2afa999635ab
X-Patchwork-Hint: ignore
Message-Id: <20230225095001.9FA9986A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xtables-addons: replace
 XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
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

commit: https://git.buildroot.net/buildroot/commit/?id=7243e9394c53c7e0e6e10c3d149a2afa999635ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace XTABLES_ADDONS_DISABLE_GEOIP_HELPERS by
XTABLES_ADDONS_REMOVE_GEOIP_HELPERS to avoid the following build failure
raised since bump to version 3.22 in commit
53f2999edfa5e67923d4d8a102c15fa3200e089c:

make[3]: *** No rule to make target '/xt_geoip_query', needed by 'all-am'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/f2d596b510f027b94a6b1fad10c363922c50cbec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xtables-addons/xtables-addons.mk | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 77dcfd741c..e794538956 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -16,12 +16,6 @@ XTABLES_ADDONS_CONF_OPTS = \
 	--with-xtables="$(STAGING_DIR)/usr" \
 	--with-xtlibdir="/usr/lib/xtables"
 
-# geoip helpers need perl with modules and unzip so disable
-define XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
-	$(SED) 's/ geoip//' $(@D)/Makefile.in
-endef
-XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
-
 define XTABLES_ADDONS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
 endef
@@ -30,6 +24,15 @@ define XTABLES_ADDONS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
 endef
 
+# geoip helpers need perl with modules and unzip so remove them
+define XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
+	$(RM) $(TARGET_DIR)/usr/bin/xt_geoip*
+	$(RM) $(TARGET_DIR)/usr/libexec/xtables-addons/xt_asn*
+	$(RM) $(TARGET_DIR)/usr/libexec/xtables-addons/xt_geoip*
+endef
+
+XTABLES_ADDONS_POST_INSTALL_TARGET_HOOKS += XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
+
 define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
