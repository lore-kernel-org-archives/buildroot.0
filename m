Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D5CC53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 18:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4685980D50;
	Wed, 29 Jul 2026 18:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TFYfowPd8gP; Wed, 29 Jul 2026 18:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6544280DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785351222;
	bh=FuQ4JzJVxTgp9VG0et5F2Ea2cvv4wiB0cqAqGXZ7zuM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ksh+CdUIFpdWf98ZdiXnk1zglfT6uk6tIANmg+lJWUzAaHkksa2ES/fdX+S2EG9pq
	 HAJtNu3BHmHvSLcd8jbJjMLASbuN63LMyGLLvfaL2pJHG398G6QDRaT/AFuY2ylcaz
	 BqODCAktNEQhaaB0b7PaFaRB8+mC4zm0zocdHA8bY4TD1QxU5DHu2cqZSnS24drgMA
	 Gocy/2WNIT0ksK6RYIWAP8a9Q1/sQu6X8N2Z+dLoYfPM7cT+eBERdtvfWshFA/xY99
	 Yw3PjbBSmlypWIBVA08zlisoqFJPX4wuA8soROEELMAIaso64FW4AxpLuXMFXoRlO5
	 P7mAb/lRUkpJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6544280DE8;
	Wed, 29 Jul 2026 18:53:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3993E27C
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B4EF80DE8
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvQogtMZ5O6X for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 18:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F4080D50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62F4080D50
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 18:53:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18FEF8B517; Wed, 29 Jul 2026 18:52:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 20:51:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 928cc5dc5cb82e6f2cb43f853488309eb806ef89
X-Git-Newrev: b85f82a11ee1a55d995e8f315b6c8a9f5ef7fd47
X-Patchwork-Hint: ignore
Message-Id: <20260729185258.18FEF8B517@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-dkjson: bump to version 2.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b85f82a11ee1a55d995e8f315b6c8a9f5ef7fd47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

see changes on https://dkolf.de/dkjson-lua/

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index f2ca354b5e..cafa8989e8 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  41d6bd91e8ae0802f98b3685635dd03e14ad99ee3f3d6fa56d5ecc217623f60c  dkjson-2.10-1.src.rock
+sha256  ddf3444076d3cf9a63dd797e56cbcf764e0d121de8456bc23a7d7acb4dcb1506  dkjson-2.11-1.src.rock
 
 # locally computed
-sha256  5998e1e7bd6b53efff746d02aaedb9646ce9cf965ea54f1bc812b5e750222cfc  dkjson-2.10/readme.md
+sha256  6932e5407e763eaaf4fc7fef07c28b4db0bc36433f14c0bd92d4a570a91c865f  dkjson-2.11/readme.md
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index f41edf5116..0af7dda9a8 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.10-1
+LUA_DKJSON_VERSION = 2.11-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
 LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
