Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80906EDF161
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 13:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95A2740AF3;
	Fri, 13 Feb 2026 13:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvqVgZZsDhHs; Fri, 13 Feb 2026 13:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95D6940838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770989170;
	bh=6QdEx7/USdwWfiGaI4mMVm0neUUCBTxi1bY1L2AWF+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZluuXX7gv6gORJidea/gciNmyk6HecTLao70okI9YxXzfIF1MfqLTnlslCga8SVbp
	 6Bur/afAH4QsFO3rAqN4fBClZ2rMLoR+X9XZ0yqwDiviMvr1Z1b1IXrVkVZ3fulrPv
	 PUBCMLZ/5LlgMrr7ulhEUpepk8vfevRgKVxL1maYhbfv+qF2MJbQCeYvVptYSv4TOj
	 KIJku6MbGjAArbvBOwbim75MkkWZBb2f/X5Mpl/qnp1ihT9qZDK7WrVBGTR0LnQuZv
	 zzDi8IePjAWYR7IGirMgLy2OQdtP54sSfG0LTVHpzcz1qA2fHkz9YlQ+S5ONK59wBZ
	 uqvxxU6TyCPgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D6940838;
	Fri, 13 Feb 2026 13:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB519EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 13:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B4D840AC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 13:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrB9UXhJjYJW for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 13:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D7F83DC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4D7F83DC4
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 13:26:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D123F86D61; Fri, 13 Feb 2026 13:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 14:16:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cff850cfdbe1cd24fd427c3fe2239b61fca35736
X-Git-Newrev: 49d1ea93f7d3ad8f7113cea39be4c39b4d6faca6
X-Patchwork-Hint: ignore
Message-Id: <20260213132607.D123F86D61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gvfs: enable optional udisks
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49d1ea93f7d3ad8f7113cea39be4c39b4d6faca6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Optional udisks support is useful for mounting USB sticks via
pcmanfm.

gvfs meson.build has recognized this udisks2 option for quite
some time, since upstream commit [1] first included in version
1.35.2 (released on 2017-11-13).

[1] https://gitlab.gnome.org/GNOME/gvfs/-/commit/cdc33bf54f501a8b4574f86945628ab6c2036d64

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: add comment in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gvfs/gvfs.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 6eff3bd859..c92e91c8fb 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -30,8 +30,7 @@ GVFS_CONF_OPTS = \
 	-Dgoogle=false \
 	-Donedrive=false \
 	-Dmtp=false \
-	-Dsftp=false \
-	-Dudisks2=false
+	-Dsftp=false
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 GVFS_DEPENDENCIES += avahi
@@ -157,4 +156,11 @@ GVFS_CONF_OPTS += \
 	-Dtmpfilesdir=no
 endif
 
+ifeq ($(BR2_PACKAGE_UDISKS),y)
+GVFS_DEPENDENCIES += udisks
+GVFS_CONF_OPTS += -Dudisks2=true
+else
+GVFS_CONF_OPTS += -Dudisks2=false
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
