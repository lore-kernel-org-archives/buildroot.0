Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10D3F9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8218842B2E;
	Tue, 14 Apr 2026 15:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMl3MOjC6SdG; Tue, 14 Apr 2026 15:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17F4E42B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181378;
	bh=vj2L5A8ogxVKbcnElH5IitVG7joZBK0hTOBYgQ1wBMc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TkT52J+UXPaqlOK2qzE3OQk3T9ZDBUF4INLfMQW3OySZyJ/7+9Npsk9ZAGlqO/eGb
	 qFIuvCqXORwzbL8/5+Sg0j1VuohUyGQ4Sm9TXbQiWHmDd1tjdxoDw2dPC01Ot261TW
	 kgnYLEe8Wxr6PsPOjC4jE/Zq7SyEJ4O6xAvNbxmwc/e5E3X0C3O8vGZ6TgEzeT4z/h
	 wDe9LPhq2x/BKygSmQ13wykuS876RVcRRKPIZgFmnMZ6w2RBgbdkfgP7rfuYWkM3N+
	 vxMsPy0BOMJs/FMvh5qL1NCX0xyoaxLIndozGPXGw6EcV1Sazy1vdwulPhh8K8Ox0H
	 XXbQbNA/WXYXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F4E42B4B;
	Tue, 14 Apr 2026 15:42:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2DF283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E38584D45
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jd4Y1sys5v0v for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D7084D47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D7084D47
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73453814A9; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:11:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 93916077d27748dad475e43300f40a154393823b
X-Git-Newrev: aa76f2b1edea1a0208fcecfb9781dacdb5db6842
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.73453814A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/leafnode2: fix
 build without pod2man
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa76f2b1edea1a0208fcecfb9781dacdb5db6842
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes a build error when pod2man is missing on the host:

  pod2man ./tools/lsmac.pl >lsmac.1 || { rm -f lsmac.1 ; false ; }
  /bin/sh: line 1: pod2man: command not found

Fixes:
https://autobuild.buildroot.net/results/999/9996e81429f90f4615755827ac182094d416c467/

Although the build error only occurs since 2026-03-05 it should be
backported to LTS branches because the last change to the buildroot
package dates back to 2024.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ec621099904b6e8d8d16bac3b9d31954faeb98e4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/leafnode2/leafnode2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index 566aaf3d55..8c44071209 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -11,6 +11,12 @@ LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
 LEAFNODE2_DEPENDENCIES = host-pcre pcre
 LEAFNODE2_AUTORECONF = YES
 
+# pod2man doesn't work when cross compiling
+define LEAFNODE2_DISABLE_POD2MAN
+	$(SED) 's/GENERATED_MANS=lsmac.1/GENERATED_MANS=/' $(@D)/Makefile.am
+endef
+LEAFNODE2_POST_PATCH_HOOKS += LEAFNODE2_DISABLE_POD2MAN
+
 LEAFNODE2_CONF_ENV = \
 	PCRECONFIG="$(STAGING_DIR)/usr/bin/pcre-config"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
