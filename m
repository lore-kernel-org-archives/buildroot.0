Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FBFD10F23
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3BCE42C94;
	Sun, 17 Nov 2024 16:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cjosfvZBggA; Sun, 17 Nov 2024 16:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C9142C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C9142C99;
	Sun, 17 Nov 2024 16:56:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F6FAF0
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7E7D42C94
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cb-B6RBx0wTa for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 16:56:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15F3642C99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F3642C99
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15F3642C99
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 16:56:50 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C5ECB00585;
 Sun, 17 Nov 2024 17:56:45 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 17:56:41 +0100
Message-ID: <20241117165641.751301-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731862607;
 bh=d1OXhcza9Wscu9ceDKqBZlDi8lZZbNr4SbzuAH36M+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=hNfte16cOJKaYuo4sNkAuRuA5UOr3SAJDjUaMNin5roy6oTHYeVwZPEpTmV6nVYdx
 ufLhofp7EyMQyDNe/kZMBd97VPkeigXPlEbTdGfZCcr12Naug0/XTdlNxhTjyHOC3T
 rVLSDgiGGECtExphuDaJ+j2rdXaJuU/aBzmBDpAEiIQeZ5NONUynaJ1cQVdfOrKxIY
 mjj/cb6Q4b/XBwAh4Rqtgh2lgI8Vi3qYvu+HEQnUWj4qg48z2Ha4ZX3UqNm/0b/Qmm
 AHlygMLZagFkQACWpti0l9i9DJWaonx6whnqsfRvNS+FyGdprrej6DZqVSpEJ2Rx6S
 MmT85fr3VpYIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hNfte16c
Subject: [Buildroot] [PATCH next 1/1] package/spice: bump version to 0.15.2
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

For change log since 0.15.0, see:
https://gitlab.freedesktop.org/spice/spice/-/releases/v0.15.1
https://gitlab.freedesktop.org/spice/spice/-/releases/v0.15.2

This commit also adds a comment in the hash file that the sha256 is
taken from upstream.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1547982049
---
 package/spice/spice.hash | 3 ++-
 package/spice/spice.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index b228f213a5..c678f9b114 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,3 +1,4 @@
+# From https://www.spice-space.org/download/releases/spice-server/spice-0.15.2.tar.bz2.sha256
+sha256  6d9eb6117f03917471c4bc10004abecff48a79fb85eb85a1c45f023377015b81  spice-0.15.2.tar.bz2
 # Locally calculated
-sha256  b320cf8f4bd2852750acb703c15b72856027e5a8554f8217dfbb3cc09deba0f5  spice-0.15.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 608a9413fe..0997903791 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.15.0
+SPICE_VERSION = 0.15.2
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
