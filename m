Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FB2CCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FAFD60DB0;
	Mon, 19 Jan 2026 09:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skTkBPG78rZ2; Mon, 19 Jan 2026 09:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001EC60D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816744;
	bh=2ahM8fqhXume6S0VQhpClLeGJVUo6Hq5DyYi6cORPD8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lbfs/26F4+0o2kbiP+IsHSER07khOK5sq3T+1Sfn4fjF7PZjGX7469U6vR9JTSUUm
	 MU/NmWizyuK0XVGJRF2G2yJj0G84QkXv9oTAQVl08pqFzE2QTOpArkSkN1Q2eEpINH
	 qnp6dpAK/y3XBOwwVpE/ErHWytQX24jIveYTFLDRnEQWL/19hKk8cYGq6PxwECL3Hk
	 xJMLPQjCm9GSQ1u0WM3cIDcjFUg997Cz8oKy6VezaGd/rZcv5dFs/ExJQC3jStvvpb
	 dJS09TCQ5qltcGuHyf8cDGh57dUwYIEXjf7P09t3nr3kbXz/zJU39aCdgE4jHwzBGb
	 Z65qHFjwFkpNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001EC60D88;
	Mon, 19 Jan 2026 09:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 354D6160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0262340CE5
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 231-EieSiBHX for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3269440CE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3269440CE7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 304DF8408E; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:20:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7eac8a96bc4a3b04a5e28ac1b320322f2ce41dd5
X-Git-Newrev: 79d25e28df7dae7ad50d5e1bedc0ea1a5a853837
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.304DF8408E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: Drop support
 for some packages from Francois Perrad
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

commit: https://git.buildroot.net/buildroot/commit/?id=79d25e28df7dae7ad50d5e1bedc0ea1a5a853837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0a1f5fd5925c73640475722ca2c405a5dc42c23c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82dcc729ff..2308af08d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1131,33 +1131,25 @@ F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
 N:	Francois Perrad <francois.perrad@gadz.org>
-F:	board/freescale/ls1028ardb/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
-F:	configs/ls1028ardb_defconfig
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
 F:	configs/olimex_stmp157_olinuxino_lime_defconfig
 F:	package/4th/
 F:	package/cgilua/
-F:	package/chipmunk/
-F:	package/cog/
 F:	package/collectl/
 F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
-F:	package/graphene/
 F:	package/janet/
-F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
-F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lua-inotify/
-F:	package/lmdb/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
@@ -1166,16 +1158,11 @@ F:	package/lua*
 F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
-F:	package/mstpd/
-F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
-F:	package/tekui/
-F:	package/wpebackend-fdo/
-F:	package/wpewebkit/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
