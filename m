Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A80C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58D1560035;
	Wed, 18 Jun 2025 20:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXJaDZkCzxkH; Wed, 18 Jun 2025 20:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97ED560B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97ED560B5B;
	Wed, 18 Jun 2025 20:08:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C279E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DAEB40B89
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iw4zzIpptTLY for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2F1E40AC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2F1E40AC6
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:08:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4B6C83D31; Wed, 18 Jun 2025 20:08:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 22:07:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03be706382dc03ff800c6dbd3363a4746f97d6c2
X-Git-Newrev: 6e2b109e9682b733c1e779f01e50dee694e1db6f
X-Patchwork-Hint: ignore
Message-Id: <20250618200842.A4B6C83D31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rapidjson: bump version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e2b109e9682b733c1e779f01e50dee694e1db6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes compatibility with cmake 4.x:
https://github.com/Tencent/rapidjson/commit/ebd87cb468fb4cb060b37e579718c4a4125416c1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rapidjson/rapidjson.hash | 2 +-
 package/rapidjson/rapidjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
index ca5befdefc..c0a9b78716 100644
--- a/package/rapidjson/rapidjson.hash
+++ b/package/rapidjson/rapidjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39f96f17b40f7201042c9b45d6444cb7eae1b7adfb7455412a86f6140450d32d  rapidjson-ab1842a2dae061284c0a62dca1cc6d5e7e37e346.tar.gz
+sha256  2d2601a82d2d3b7e143a3c8d43ef616671391034bc46891a9816b79cf2d3e7a8  rapidjson-24b5e7a8b27f42fa16b96fc70aade9106cf7102f.tar.gz
 sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 3091edeab9..fcd6393b64 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = ab1842a2dae061284c0a62dca1cc6d5e7e37e346
+RAPIDJSON_VERSION = 24b5e7a8b27f42fa16b96fc70aade9106cf7102f
 RAPIDJSON_SITE = $(call github,Tencent,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
