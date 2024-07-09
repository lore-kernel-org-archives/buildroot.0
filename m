Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C05BC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D883440BE7;
	Tue,  9 Jul 2024 09:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPXIy2yXraqX; Tue,  9 Jul 2024 09:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D1C7402E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D1C7402E1;
	Tue,  9 Jul 2024 09:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0631BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 069CD40BE3
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owE0RR9p7ka0 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 088DA405C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 088DA405C8
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F14B181882; Tue,  9 Jul 2024 09:49:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 11:47:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b86f076c3fb3683dd9ac0a75457176b1e7c9d5d
X-Git-Newrev: 91952568b0b1b3477ae573f8e3277d625965b923
X-Patchwork-Hint: ignore
Message-Id: <20240709094959.F14B181882@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-dkjson: bump to 2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=91952568b0b1b3477ae573f8e3277d625965b923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-dkjson/Config.in       | 2 +-
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-dkjson/Config.in b/package/lua-dkjson/Config.in
index 9c5dff1928..e550fdfb85 100644
--- a/package/lua-dkjson/Config.in
+++ b/package/lua-dkjson/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUA_DKJSON
 	  dkjson is written in Lua without any dependencies, but
 	  when LPeg is available dkjson can use it to speed up decoding.
 
-	  http://dkolf.de/src/dkjson-lua.fsl/
+	  http://dkolf.de/dkjson-lua/
diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index 2f210e497d..710879da0b 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  f6101a0e77ca857ec20799f6b998a600b04c8dd09b27c445ea09f29695bfffb0  dkjson-2.7-1.src.rock
+sha256  3d8de09cd43a60a005ac769ee1cedc515952c892d63cba9ac925ed02afc98091  dkjson-2.8-1.src.rock
 
 # locally computed
-sha256  9d46e06db7feb8fd68f73bd024c8a2c04807629e16f396880860d151b60a3ed1  dkjson-2.7/readme.txt
+sha256  9c60064047b0f41092ee714d205b4b915f1da147fdf9afc4b3ee7bcf028a2238  dkjson-2.8/readme.txt
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index 2b110f8f1e..a148fea86b 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.7-1
+LUA_DKJSON_VERSION = 2.8-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
 LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
