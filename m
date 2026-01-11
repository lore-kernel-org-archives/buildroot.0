Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FD9D2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336CF405ED;
	Sun, 11 Jan 2026 20:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRgpbdMVlgRv; Sun, 11 Jan 2026 20:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C5640544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768165123;
	bh=SKs+Ht/LZSRfRvNZyWnO86BSb2SHmqdKrl+mbWCQE+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=glKMGt0mjVyszm+z5e5ha8YAHCfX4Tc4jwiOT1Bq6sk4Tz8CcbJ5iDAT9gIcz+gws
	 cMB3dDHFwmR5+jWZI4XOcbHDv6cSi56/3fC6LsR2oVGMR33KXQGa6M/dzB75bPr3aV
	 fRJFUnMxbuFD7aCgsXRyC4CZOYVmWB10tPjUmqk4hPKjS1PudgH46Sj6s1Znag9wFq
	 2eVLN+8CaYgsMedb0GkFHEqCJGPR7neJjBLyG/7ppzWehZ2ioWR2AgWju2A0xJtRk+
	 jLtZuYWNLjptlf/6E5pDuQk6WWbkRKB9rn8ikwdY7Y26cssdRGhb0XhCgWosiJypul
	 dlzFhFXHTR14w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C5640544;
	Sun, 11 Jan 2026 20:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D410318D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 20:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA46681212
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 20:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgWyXzzcK592 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 20:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F2781203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F2781203
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 20:58:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A39C2884A4; Sun, 11 Jan 2026 20:58:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 21:48:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71f2cc70025e30883152ff7b8899fec8dea3d2f6
X-Git-Newrev: 5eac154044c4976fc504d7202d766817d0a1d48a
X-Patchwork-Hint: ignore
Message-Id: <20260111205840.A39C2884A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: bump version to 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eac154044c4976fc504d7202d766817d0a1d48a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release-notes, since 2.0.1:
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.1.0
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.1.1
https://github.com/osm2pgsql-dev/osm2pgsql/releases/tag/2.2.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien: add links to other releases since 2.0.1]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/osm2pgsql/osm2pgsql.hash | 2 +-
 package/osm2pgsql/osm2pgsql.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
index 9f119d9c7d..6c04d4e989 100644
--- a/package/osm2pgsql/osm2pgsql.hash
+++ b/package/osm2pgsql/osm2pgsql.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b9d5c95ccc928aafc3c6caccb8b5bc19c4d48a5d1640cada07388d0dbf171ecc  osm2pgsql-2.0.1.tar.gz
+sha256  567dad078f8a66d6d706ac1876b5251b688109d16974909d89ce2056d6e9f258  osm2pgsql-2.2.0.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index f968a159d2..10e64e75a6 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OSM2PGSQL_VERSION = 2.0.1
+OSM2PGSQL_VERSION = 2.2.0
 OSM2PGSQL_SITE = $(call github,osm2pgsql-dev,osm2pgsql,$(OSM2PGSQL_VERSION))
 OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
