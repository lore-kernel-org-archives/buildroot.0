Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DECC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2CE2403EA;
	Wed, 20 Dec 2023 20:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2CE2403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ef40CHctJNnb; Wed, 20 Dec 2023 20:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE17436E6;
	Wed, 20 Dec 2023 20:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE17436E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAB0C1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D12839BC
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D12839BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5psaihc4moq for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E9D2839A4
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9D2839A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F155A87C46; Wed, 20 Dec 2023 20:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:35:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 259de5cff6841346dc39cd7eb64a58ccd78c8cd3
X-Git-Newrev: 898941a0d78600971c69e688773c5cdbe35ced96
X-Patchwork-Hint: ignore
Message-Id: <20231220204216.F155A87C46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-compat53: install compat-5.3.h
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

commit: https://git.buildroot.net/buildroot/commit/?id=898941a0d78600971c69e688773c5cdbe35ced96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this file could be required by some native modules

note: compat-5.3.c is included by compat-5.3.h
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-compat53/lua-compat53.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 0cfbe2d795..12ac5c011b 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -10,5 +10,13 @@ LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
 LUA_COMPAT53_LICENSE = MIT
 LUA_COMPAT53_LICENSE_FILES = $(LUA_COMPAT53_SUBDIR)/LICENSE
+LUA_COMPAT53_INSTALL_STAGING = YES
+
+define LUA_COMPAT53_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/$(LUA_COMPAT53_SUBDIR)/c-api/compat-5.3.c \
+		$(STAGING_DIR)/usr/include/compat-5.3.c
+	$(INSTALL) -D -m 0644 $(@D)/$(LUA_COMPAT53_SUBDIR)/c-api/compat-5.3.h \
+		$(STAGING_DIR)/usr/include/compat-5.3.h
+endef
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
