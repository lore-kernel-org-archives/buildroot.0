Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3182DF9D0DC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 085D761C48;
	Tue, 14 Apr 2026 15:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vB6TfL5L5zFd; Tue, 14 Apr 2026 15:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1543E6F4AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181782;
	bh=tzVyy4smCnbqd2E9o77XDrqEtP+eDS381ewXU8sIOsE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DRY4MDeEFu8pkhUMWRMT1ip7IHUCxoL/OCTf1WTu9nnFMi49lPIWA6AfEbxEM40q2
	 DmDheIVs/8rJTwi8tFJ2KY0LFUQFb0BVAYg+0uoaWjHDDAcJ/+H3ljD1R9UUK2zjgf
	 TLPDFD3N/IiLhhTSn7yUL5Z0CEnRssyMyNACbe7Mb7a4DFGKdIK/OvFdlkVMPmXT70
	 DLxuiRUVUGd5c+aA+u+l9eYLnshkUFuW1Szt2YBa6GJ7W59Gj9U2eHwZyW3oEHo//a
	 BlCHmTRmpYHZfBNgzek2BZE4/nThEt5z+wManYM14uGKdVicyyfj5NC8cTPwFDFGrm
	 WFKLpqIfapvIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1543E6F4AB;
	Tue, 14 Apr 2026 15:49:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10568283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 580A242B06
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceK-CvO22KFz for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA9842B26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DA9842B26
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D432C81510; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:11:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8c4c363e563965f6016216adac69853c3ff51732
X-Git-Newrev: 8f19b5b8096f5a919707255a7c4d5f046ac1ba10
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.D432C81510@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/leafnode2: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f19b5b8096f5a919707255a7c4d5f046ac1ba10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
