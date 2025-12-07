Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA851D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE6183B8A;
	Fri, 12 Dec 2025 07:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ian3nQuUNi0A; Fri, 12 Dec 2025 07:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DD8842A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526323;
	bh=izmOR3EX7Ce3jKQbeeenyTzGQWuZst57cXHcN+ea1Hs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s4GkhAyLGjRu82lv/SEcarGsKTt2mY/raTcZCcRmqF13Kk+ZXgLnUMpuMx+GKu/Zb
	 h+ggWEY5nUF9qkkrhwtJP02KPkCl1HfcB0nr0Kwo+wWLJtoiSBjFS31XMUXtkQcqn/
	 eSH1jfgHeK8Zs82j2X+l0dAWH2q3ipKvoNqGicinlYju3FIibXWmeQifl+4D9opu9U
	 Ffz3qtonhA5ZIA2tTx+sYN3Ig8LvHD4/gj2hkrIJrtb6a+fLeBEEPzUUle9thhlIR9
	 uV0XAGO4jbQiIq/e1T0YMzaRUzvHaeV5zmLYNWTAlqzQHylmflJ+OZYOIDNBNRYCsB
	 X/R83mUrUb3ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30DD8842A5;
	Fri, 12 Dec 2025 07:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC9D6E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91F6F4111B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwqk81bXhk9R for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C46DD4116E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C46DD4116E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A50869E8; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 16:17:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f41172f0d04710f165be3ef383b020919fc5c86
X-Git-Newrev: cdb731f2cf64decbc24081c033df883c109ee9e9
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.C3A50869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: fix cmake 4 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdb731f2cf64decbc24081c033df883c109ee9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mariadb/0002-cmake-version-REQUIRES.patch | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/mariadb/0002-cmake-version-REQUIRES.patch b/package/mariadb/0002-cmake-version-REQUIRES.patch
new file mode 100644
index 0000000000..6c776f5d63
--- /dev/null
+++ b/package/mariadb/0002-cmake-version-REQUIRES.patch
@@ -0,0 +1,25 @@
+From 726cc3684b4de08934c2b14f347799fd8c3aac9a Mon Sep 17 00:00:00 2001
+From: Leonid Fedorov <leonid.fedorov@mariadb.com>
+Date: Tue, 30 Aug 2022 22:41:44 +0000
+Subject: [PATCH] Proper external_boost for storage manager, cmake version
+ REQUIRES
+
+Upstream: https://github.com/mariadb-corporation/mariadb-columnstore-engine/commit/726cc3684b4de08934c2b14f347799fd8c3aac9a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[partial backport for 10.11.15]
+---
+ storage/columnstore/columnstore/CMakeLists.txt |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0be025103b..15f0eb0f48 100644
+--- a/storage/columnstore/columnstore/CMakeLists.txt
++++ b/storage/columnstore/columnstore/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.12)
+ 
+ PROJECT(Columnstore)
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
