Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC1C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2992B419A7;
	Wed, 11 Jan 2023 09:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2992B419A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bC1atHFWVLP; Wed, 11 Jan 2023 09:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029E84021D;
	Wed, 11 Jan 2023 09:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029E84021D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4226A1BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C7F340134
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C7F340134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrnX6yyQMgnS for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E78240C8C
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E78240C8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A71B87817; Wed, 11 Jan 2023 09:25:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:22:28 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: aae31cf4f5a821b6f4f3b6803a136a073169ca65
X-Git-Newrev: a2322a1fef8ccc94bdbd37d4831c7d53821013bc
X-Patchwork-Hint: ignore
Message-Id: <20230111092534.3A71B87817@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/policycoreutils:
 drop bogus INSTALL_TARGET_LINUX_PAM_CONFS
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2322a1fef8ccc94bdbd37d4831c7d53821013bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit "cb328f77f8 policycoreutils: new package" added a define that is
never called: POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS.

The build system from the package already install these files to target.
So just drop the bogus define.

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9a4e154c9c583e74846f7ec80ad01d78811722b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/policycoreutils/policycoreutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 60575ac644..8505dbca3f 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -16,10 +16,6 @@ POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLICYCOREUTILS_DEPENDENCIES += linux-pam
 POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
-define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
-	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
-	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
-endef
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
