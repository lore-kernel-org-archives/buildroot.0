Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F50CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1FB5406EA;
	Sun, 11 Oct 2026 13:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nmc4hul-cHBH; Sun, 11 Oct 2026 13:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 134A9405B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724181;
	b=m0V4kfikwRbJyAA94C2h22ayZXvVZE1bO/mHQDDe+wiqwOsPkphK17RcW5QVePAyAt/h
	 BXMv14p0neP3la9N1GxqOajyTJ6Ff/LFkjo/Vyx/dl2BuxAbEq/g23sMUhPx8hMBXcwey
	 5Tb0BbGClKbSTdM/ExVVZir+n4CeC0km5fEzeYPD0BY2+B1NeYyz85Sy3FiquJZYN4TPK
	 Emk9srEKS6Dgdhx1fnN0MAQ6aOgYKmehQAZBQVLV1WuLMJdOrdynyGypAUGU59yLHne2Y
	 V+F6UijHj/9ijRQhzfrMAWqMlSxGphl68GZJIXGuyc59BL+IyJRVBPzAAQPMPMNxk8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rjtgo/ruUfKyK5evXQbgICXfnaDULXoa9/vQgqN1c8o=;
	b=PJXQyJFSKu6XDEdWIoVCrGBfkXhCIWJdbvfW1HLk35umhs7ThgWubunujSoOKJimdJRQ
	 Wnca9yk6t0B1/pa9C8B7rA6crDDYHU0D4rwV2cX6HpS/GNVbGCAnlOnxBpkpGj7WZFy5r
	 GRHLyN8ujhgqRvkulNA0Km4y+gzeMOnJoem4cyOBWKbm3rNhsrq4UX3tagBYcJxkulMws
	 CxXz+zRGYd0iXH5g1FmtC7sPv+wPL+SJ55pXceGxfE922098Sbf8nVXX2nwCnpFfhzddT
	 6wPqL9IDx9xXwfKBMurABmK1YPd8iFrAamjZetONbp4vZxVLHXakn0lAR6MHuEooKyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724181;
	bh=rjtgo/ruUfKyK5evXQbgICXfnaDULXoa9/vQgqN1c8o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwGoi3MJZzm32ampsofq/AnAFedzeqljmEWwcJLUm8wanLFBBhr0Ww2FzU7AuVD4f
	 zhRiI5mZ82yjxISWPSGNQ4GVRbLUNZXRQbohIBrg6un4PfZdBb+wwtXQcAEeiYt8HZ
	 pmYKR3ppstuf6o7auZwRIacxchZN8qZPTq1ZRMGZNPCO9KWQxdJH04k34l+t3cLbv7
	 bftIegeroE4e6kV8X8tTMtsaqrmsayZoGEcHy56jwYFkxUPU/HHlGn+GKqh/P2q+gW
	 4rHrfaxlzhfWQXwHf2ZUM33HprrTJazCmDAx8kpw8XokVLMrH0CJW/7PEK6KWFWhSy
	 fVfqQIExmAIUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134A9405B3;
	Sun, 11 Oct 2026 13:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AA442E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 816164008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3eqzM48ASbl0 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:09:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8F2FD4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724178;
 b=ZNO6bjMs9OjXttSGcdyANcvs+ujbIKJyBk0/8oY/5iv3HjCg+tmj+Gvj6O4tRCZSFAyR
 FXn0qQmZXwjPCnDS7Lkv5Hfjshfi5ygI/KioUOGMcFyDk7sE4aFd1kKxf5EIpuho4HhSB
 JS+Wta8KFKmvXEcPKWu/ge+68nLGXN/1qyW+Ae+NnMzL2aZ88d/gc503PexntGhVvdZtH
 st5xXo2nmeklWB6zPu6+5kieieeQAQ+MVBKmgYgoaxhZh1WDO8d2OSJyndsYTMxuFI6cs
 1cgks3tncU5mCJrWrp8QXIB5smoaT9ptrC7w7eqcCIkJ4iHwoX94LjAihgncCd87jJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724178;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=biqH+mpGL41G/pJc4ksvqxNy8cAd1TWozr5zrkoG/No=;
 b=IvoDk4IRevEEFQm2J7Fyq9GhEMkQcX4T/DuluDHDKvsnthgB4varGDZIsl7+Grcqw6Y6
 9cuR6yNQI7ze6880sMK3PYbtfnYBqJTa+m9CC6g8pie1KmGiR9ZrAzhR9SBI2J2zL4fbg
 Oe4yEwJCLvU3sUknNZfKlqlk/t4knVcVhGCBvTG0O75flgGIleOmlyGBYMyZkj6whFV39
 UAN2VQs4k1zAEBQwS896GTDnZ5ZrsxiEjlhE+g4hiZfi07FOp5pzpl0NkkEliyJzhVK/x
 F5CXCQ/12RQtuyadTqzIQ+K16Xi0rPFOtfW1lz0PaaQ/O/AQLPlz8YOuhswC4ErPYxw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=F5mZc06F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=F5mZc06F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F2FD4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723683;
 bh=biqH+mpGL41G/pJc4ksvqxNy8cAd1TWozr5zrkoG/No=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=F5mZc06FLbMNrytJHxorwL7EyS1YBbEasFrtyBcLDr4k1NUYAJYU46p2gnStNbzLN
 mzrZbKB1s/r2qWw5p7PmAV0CQ7r0dxEF5U2gRaAPcQ5SzwRz4euvDc0IVSTb2UrhjQ
 vyh9sGTn34IeAahGXapvQt4SaoDsymfTE2stfBIoY5uka0wtqiZ5zu5BXwQNMiNieF
 HS+tgInTEB+VMe0PG53LcNP1P2dps1O+YlaQAqX1lleUq18uqlz4nSwytg0paA8drT
 13wBL93bHT3h9/pNsWpiZEg//7qbnqWv1iDjEkU/vzbKZ3uz3xxH4IzVp94tIJ9m3X
 VKT7fNt4Y0Nww==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 k+r+SeMlFMBqvw3mndD7YGUeibEA9H9u1DkWuZ0QhzqjoN7glgd6GVJ09VsVrign/1oJI6JzeET
 +YPyOUKIOlR5T1wv7Z5qWqeancrl3QOJxjWHLo+iPIlRzC7/yq8pdCUPoEnIquxJsVxNXxsVvBB
 8a5wofR9E2mXPbXot4FDe2jK9YDuqBq8V0kiUn/36gYDVOtQkHElCM39a/yNsrEZMX6KqxfkB65
 dJoamiltqGDTk0eqbH2a8G+vqBkVbVuueJlnyWD1hQIvzYZgS84WPx4kaviFd6549BfTKNOMInx
 vhV1CMjtUiWHFr+MhrQGzW+JOhbFIw2wJEy3i1sjy2KKMMEUJMbmR9Lnj66BPfKt9gyIzRdd3Ex
 e3DTe3Ah83v7idW2Ni/JJtvfMlTlHGdBRu9/t8+BntGedSNNQ+p0SlOhmPBhoTpMshspyHMgCDA
 H+Jk3kce4BIqjBe1eN8z61KLeJEAK2/chKqmyVIeuPGF1mYfJgcYihT9tf6yWNXWBuTy4k0BCj9
 K5+H2c/GrLnXOskFoSAPS5kYxnNzY+5j1tmH/rQbxSe7rdjghhePzLpM+ZJQ5vME3d34nrEBATr
 We6bfso=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B163CA4C5898
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-2c8q
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:45 +0200
Message-ID: <20261011130058.3443432-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 40/52] package/kodi-pvr-hts: bump version to
 22.9.2-Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/0001-gcc15.patch  | 26 --------------------------
 package/kodi-pvr-hts/kodi-pvr-hts.hash |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/kodi-pvr-hts/0001-gcc15.patch

diff --git a/package/kodi-pvr-hts/0001-gcc15.patch b/package/kodi-pvr-hts/0001-gcc15.patch
deleted file mode 100644
index a62c5f836b..0000000000
--- a/package/kodi-pvr-hts/0001-gcc15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 9 Dec 2024 00:19:15 +1100
-Subject: [PATCH] Fix build with gcc-15
-
-Backport upstream commit to fix build error with gcc-15.
-
-Upstream: https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/tvheadend/HTSPVFS.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tvheadend/HTSPVFS.h b/src/tvheadend/HTSPVFS.h
-index 1fbf9d18..80f9fea3 100644
---- a/src/tvheadend/HTSPVFS.h
-+++ b/src/tvheadend/HTSPVFS.h
-@@ -9,6 +9,7 @@
- 
- #include <memory>
- #include <string>
-+#include <cstdint>
- 
- namespace kodi
- {
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index db2c69e67f..b1555a2794 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c98e29433bf4a007662b20279748dccd95da7817ab73b7e78c0b45fbe31c22b1  kodi-pvr-hts-21.2.6-Omega.tar.gz
+sha256  af9e9adce1a96073280f49b19adac4cdc0145a0e2889a530b067ed2a9708ce43  kodi-pvr-hts-22.9.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0e34a4bb09..addadb740d 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.6-Omega
+KODI_PVR_HTS_VERSION = 22.9.3-Piers
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
