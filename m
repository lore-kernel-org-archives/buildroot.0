Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CDAC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 23:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 846B14167D;
	Sun,  7 Jan 2024 23:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 846B14167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stqF5upHs-g0; Sun,  7 Jan 2024 23:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C25C640944;
	Sun,  7 Jan 2024 23:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25C640944
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC4C41BF870
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2384404F4
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2384404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0nQsQ0s0sBj for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 23:22:46 +0000 (UTC)
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACFA3404B6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 23:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFA3404B6
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id McTarVOj11f5IMcTarANbX; Mon, 08 Jan 2024 00:22:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:22:39 +0100
Message-Id: <20240107232241.666769-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
References: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJF5yGA/U8pcHh8uzbtdH5sfecyG/e7GcOqwlVO3/vBIUay62BeMhHLjWpzT3fI8aeFggvzfspfKVxI20KAkZz05UKpvDEXJUZdwVKUosZPSUeUJjvw7
 SRjEz4B6JKS7pe3X/78aN46/ihoeC42SFSnWKWfED9hD4H1vKcjOC/hIjbYDGpkdThchzb+D2c4NsFXU8ZD1WnkqFvaa6MgsFEbjpcDob6CWz1laIPbz1LsB
 ymWnPaX+shSFNikL7jcSKh2IUeYoYZ88OvpJM9Hf5MaZ/3Vwdl+H2bzotpa3+J84XbF4HiYe6NiiMfr04VCHPlH+8s38fYrv+6JjKCuCJq3B22kdqwiPHx06
 WnQOC0E6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704669763; bh=dL65Juou3bmCaA22It9IrUNNaED0WQjyd7aaeOYND+U=;
 h=From:To:Subject:Date:MIME-Version;
 b=aYq/VSZgRCMX0nHAh5mLRWAoAnhp5MYaRbWPRdCMR3TZ36ot7FCNRcGhFoqYWb3Wx
 AqekzeNY8vNdcaB+NCZYBflN0CKZpwxtqFItZ+ubSiShFxO6UuAdmNjF/7hfPH5R4n
 whm22evzLGK6BXiakFkUQTyJtdj9Iu8sCLdj5ED7wMLzObZBOWTsJfGCFr2gULFDDD
 wiwe/utAj7GtpRV4rErHEY9rTovqZy/kQ9MjAGPGw2cRXccUEx5soOYLbretQUOTME
 YQfQIKtfGJUkdt1woC+c6gSDJTFBU9BPXa2RDWmJOiulMlJLGpCsPfYCJzlZScrQus
 S9f4zkk+3XZlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aYq/VSZg
Subject: [Buildroot] [PATCH 2/4] package/libtraceevent: fix build failure
 due to missing -ldl
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream that adds libdl to libtraceevent
dependencies to avoid build failure due to missing libdl in the linker
library list.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...eevent-add-libdl-dependency-to-meson.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libtraceevent/0001-libtraceevent-add-libdl-dependency-to-meson.patch

diff --git a/package/libtraceevent/0001-libtraceevent-add-libdl-dependency-to-meson.patch b/package/libtraceevent/0001-libtraceevent-add-libdl-dependency-to-meson.patch
new file mode 100644
index 0000000000..18dbb09796
--- /dev/null
+++ b/package/libtraceevent/0001-libtraceevent-add-libdl-dependency-to-meson.patch
@@ -0,0 +1,37 @@
+From 9dc36e74067e96b664e5297be51f29c3d26695dc Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Jan 2024 00:05:55 +0100
+Subject: [PATCH] libtraceevent: add libdl dependency to meson
+
+Libdl is mandatory since it's used by plugins, so let's add it to meson to
+prevent build failure where -ldl is not implicit.
+
+Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20240107230753.461368-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/meson.build b/src/meson.build
+index 20b1b7b..cd48de7 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -13,10 +13,14 @@ sources= [
+    'trace-seq.c',
+ ]
+ 
++cc = meson.get_compiler('c')
++dl_dep = cc.find_library('dl')
++
+ libtraceevent = library(
+     'traceevent',
+     sources,
+     version: library_version,
++    dependencies: [dl_dep],
+     include_directories: [incdir],
+     install: true)
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
