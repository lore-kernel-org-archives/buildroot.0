Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD1E9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B8380C50;
	Thu, 19 Feb 2026 17:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiS7iO76gkPG; Thu, 19 Feb 2026 17:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A37880EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521946;
	bh=PjnCqN8mYwlOKeDSkECiAMlnBCsh0OSgQMB2WVSqV5Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DRz6/blYafkfuKBQuwocrbQHhlzQM9vWTZgFxv4NPR7wWGHgPqxXIKQqm4uuERZAk
	 wXkt6bIP2TcXV3AhZMLlm6HpKS62hggkCGmC6XskH5CtmOJ9MDsnsXMUCn3/OV4nqk
	 gzCrkxYNRzpVY7SrhZbX7AUvre+2JHDyZ3/rMa8YzM43D7wUuMb5OVOvibNlFdFlbf
	 ERSqjn81KrXdJCMYh/GoLtWH0aG58PaTixEX7OSFxUu8dlkXo1yVdhI+MKncpwjf50
	 xi1pKs90JilxV3QPWiTK97+zPS2wF8Q9dcS1xsKvwBEq7sMtL+1Nxz9XVgYTwkHnl9
	 tnw5czWtsTqiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A37880EC3;
	Thu, 19 Feb 2026 17:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26A8F355
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4523140CF7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNQ-XyYl7Asj for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E29B40C78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E29B40C78
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AD7C870DB; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:10:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f3107dda1e01417cd0d0d3c7c3a97eb08e8f831d
X-Git-Newrev: 4f157b57e75492020a9269ce9acf488b3ca51174
X-Patchwork-Hint: ignore
Message-Id: <20260219172537.8AD7C870DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wireless-regdb:
 bump version to 2026.02.04
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f157b57e75492020a9269ce9acf488b3ca51174
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.infradead.org/pipermail/wireless-regdb/2026-February/001830.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 5bd15ee7d488a8192ed0a12440ea49feee9c695b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 4b2c67965f..39fc1a78d5 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3  wireless-regdb-2025.10.07.tar.xz
+sha256  0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6  wireless-regdb-2026.02.04.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 055238be5e..31bc9e9a22 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2025.10.07
+WIRELESS_REGDB_VERSION = 2026.02.04
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
