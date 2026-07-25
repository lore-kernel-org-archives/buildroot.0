Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B9EC531D0
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 21:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59F66066B;
	Sat, 25 Jul 2026 21:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1b2AT0OMSsan; Sat, 25 Jul 2026 21:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D246560649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785015702;
	bh=QOg5E7L3ud3fcL9KcHvi1Q7ooa49Q7MlOo9UZRcIQVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=li45carP2RRxdAwQYnCFxQL2iy3zpRRRqbqZnfLEvsjcvPYB4T7n7krjocMfvIZuS
	 Ffo43kACpZPN580nEHR3y5Sadlat+0B9oi3qLfFPq1LaPpRbQWRStZDY+ksVHdYju4
	 H4Gae6MO+Z0vOJJrlOl5YNhlRB4EMvhjT0LkUe3ghl1Ni1LoTQE/sLyLRog82Xi/o6
	 YtscMjOtE+D25UWhSeMZnD+jHhEi/bGpVXz3+V9X+5IDAkdLZh9QU0zmvuOQTUU4mv
	 nDC6HjgFMBctsC7ovT+GMGTvDqkaSbCLiGTL1QU5j9pvMHTmr7iDx6cpQf/u1wdNT9
	 KSukB9/xlbMCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D246560649;
	Sat, 25 Jul 2026 21:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA5C347
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6397140105
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GC30ljwy7_G7 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 21:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE3E400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE3E400F9
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 21:41:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 008DF8A609; Sat, 25 Jul 2026 21:41:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 23:33:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 882c35f7388a71f976cbc4a3396866533743368a
X-Git-Newrev: 235e78caca94d8b6b5b6447a3c6158ed693929aa
X-Patchwork-Hint: ignore
Message-Id: <20260725214101.008DF8A609@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-dkjson: bump to version 2.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/235e78caca94d8b6b5b6447a3c6158ed693929aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

homepage switches to https

readme.txt becomes readme.md

see changes on https://dkolf.de/dkjson-lua/

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-dkjson/Config.in       | 2 +-
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lua-dkjson/Config.in b/package/lua-dkjson/Config.in
index e550fdfb85..9e02ae654e 100644
--- a/package/lua-dkjson/Config.in
+++ b/package/lua-dkjson/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUA_DKJSON
 	  dkjson is written in Lua without any dependencies, but
 	  when LPeg is available dkjson can use it to speed up decoding.
 
-	  http://dkolf.de/dkjson-lua/
+	  https://dkolf.de/dkjson-lua/
diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index 710879da0b..f2ca354b5e 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  3d8de09cd43a60a005ac769ee1cedc515952c892d63cba9ac925ed02afc98091  dkjson-2.8-1.src.rock
+sha256  41d6bd91e8ae0802f98b3685635dd03e14ad99ee3f3d6fa56d5ecc217623f60c  dkjson-2.10-1.src.rock
 
 # locally computed
-sha256  9c60064047b0f41092ee714d205b4b915f1da147fdf9afc4b3ee7bcf028a2238  dkjson-2.8/readme.txt
+sha256  5998e1e7bd6b53efff746d02aaedb9646ce9cf965ea54f1bc812b5e750222cfc  dkjson-2.10/readme.md
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index a148fea86b..f41edf5116 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.8-1
+LUA_DKJSON_VERSION = 2.10-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
-LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
+LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.md
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
