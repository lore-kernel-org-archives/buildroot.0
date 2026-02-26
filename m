Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C878FD9E11
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5956071A;
	Thu, 26 Feb 2026 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU8tQ8kQHiKM; Thu, 26 Feb 2026 20:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F58F6074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138660;
	bh=S6L/LFzy3eHpjAqies73vauds697bD0BPh1GQq3HuJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZWaGpclPsKWzn9uASgBtccQd4QdcQeNz98FDlD0Umlft4g6ckvr3Sg93Sj8L4vcWj
	 T4LZ/2/2b2NqAKOR/TerdVqnBO6UMTNsdec4J86OsI03HiE2HB9LdL55eUw5XUrYQn
	 uVdPPdfmxYJVhMh0bJTc18ZmWzl5NCLuHhnN6V/v/Wsuhq0zeebbkhpEdmrI7KOZ6b
	 k/flSTdXkKPQ/7wTzySoU88A8hGjlgkW+7/9M2WxK0DRYSU9HuysN8+4yde2PPs2Ld
	 j0xS5h68fiJ/CtFucGkQMj51Kn4BI6di+tSlgyrHqrHIbz3eJSmNYpdUdNA2pt5786
	 EMr5BX2o0+0oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F58F6074C;
	Thu, 26 Feb 2026 20:44:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0696023D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEB7F406CF
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypAMr8Ox7c2h for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D4340752
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0D4340752
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4F4A87511; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:25:27 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f0b69f7b3253492f4daf0fbe9dca8ab444041f11
X-Git-Newrev: 0f33d01f0f76baa0587e656169beb5c235d72c46
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.C4F4A87511@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libzlib: security
 bump version to 1.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f33d01f0f76baa0587e656169beb5c235d72c46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/madler/zlib/releases/tag/v1.3.2
https://github.com/madler/zlib/blob/v1.3.2/ChangeLog
https://7asecurity.com/blog/2026/02/zlib-7asecurity-audit/

Updated license hash due to copyright year bumps:
https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 06b964b362b1b30cc346145c38e2a4aad78d0eec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libzlib/libzlib.hash | 4 ++--
 package/libzlib/libzlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index bc5092d9a9..c73328deee 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.3.1
+LIBZLIB_VERSION = 1.3.2
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
