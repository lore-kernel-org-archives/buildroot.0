Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C3C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6493980F28;
	Wed,  7 Aug 2024 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqmWo2OciK-I; Wed,  7 Aug 2024 20:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794688117B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794688117B;
	Wed,  7 Aug 2024 20:26:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED24D1BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E779040630
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENfWosCISpbg for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0811A40570
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0811A40570
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:26:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8797846B2; Wed,  7 Aug 2024 20:26:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:14:06 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: e0cb58f1ca9b53526707c1ddf43f4f81f49ce2e2
X-Git-Newrev: 5703b1a03ea1c21eace4e577040407847b5c8ff8
X-Patchwork-Hint: ignore
Message-Id: <20240807202611.E8797846B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/systemd: enable
 required oomd kernel options
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

commit: https://git.buildroot.net/buildroot/commit/?id=5703b1a03ea1c21eace4e577040407847b5c8ff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

In order for systemd-oomd to run CONFIG_PSI and CONFIG_MEMCG must be
enabled in the kernel config.

See:
https://github.com/systemd/systemd/commit/e7b3f1a6c358dd3eaf0b50547bd52130ad4126ae
https://github.com/systemd/systemd/commit/aa329b89223a79793cde8288b1bc6e93db174938

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit be5f14657a5540fdabb03ba8b5ff64c0da804e32)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6b3553723c..52fa344807 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -480,6 +480,10 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_OOMD),y)
 SYSTEMD_CONF_OPTS += -Doomd=true
 SYSTEMD_OOMD_USER = systemd-oom -1 systemd-oom -1 * - - - systemd Userspace OOM Killer
+define SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PSI)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEMCG)
+endef
 else
 SYSTEMD_CONF_OPTS += -Doomd=false
 endif
@@ -804,6 +808,8 @@ define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
+
+	$(SYSTEMD_OOMD_LINUX_CONFIG_FIXUPS)
 endef
 
 # We need a very minimal host variant, so we disable as much as possible.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
