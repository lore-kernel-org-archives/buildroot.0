Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57307D5B15A
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115A180EF2;
	Mon, 28 Oct 2024 22:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOme8GJguHap; Mon, 28 Oct 2024 22:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3F7280EF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F7280EF4;
	Mon, 28 Oct 2024 22:14:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 720DFAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52753400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s47yaIJXMX78 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:14:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C02D40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C02D40015
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C02D40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:14:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DB7A7B00651;
 Mon, 28 Oct 2024 23:14:49 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 28 Oct 2024 23:14:42 +0100
Message-ID: <20241028221442.1128450-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730153691;
 bh=3wva20MuQuu538/tC2zBjKk4WvdIUIxspYcVY+5wXwk=;
 h=From:To:Cc:Subject:Date:From;
 b=sWPo/xmtHhDPk644qS92ZEoVRt7gWlpFXnxgRs4SxB7EM1wkalvdwtMEnXhGYNYA3
 diw7CDrp3xpOdRCZ16F9yCt/9i+Z1kax3vEcSogScaGx7b0tUbvAQfm5XVTQMfju4E
 hhSWZk5J7ZpRb7qwWSwc6PGrxdDR9/xqC3wg49ZsTUFql1JseN45yQpByQDajCmAcl
 ya6974xfVl2QANVT8EuMTLiFL8MtYfmC5bxAnA8GCpH8T/N3MaA2HVJwo9SL++J2WA
 72Lhd+3EmcMlUvCoxWqpb5+aWNXbw7eVvMUyomNp67mFZBJql6SgAGgUxqbRg4S5z7
 9lOxx5OPUdAjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sWPo/xmt
Subject: [Buildroot] [PATCH 1/1] package/swipl: bump version to 9.2.8
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

For change log since version 9.2.7, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.7&to=9.2.8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch runtime tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8209923112
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index 36e27cef2d..20278cfb8d 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  fd4126f047e0784112741a874e2f7f8c68b5edd6426ded621df355c62d18c96f  swipl-9.2.7.tar.gz
+sha256  b331637a57c913c49edcfcb10ddcf6c031278ce93d2411d54542778531abb5c7  swipl-9.2.8.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index ba33b1b1c3..ef9aedcd2d 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.7
+SWIPL_VERSION = 9.2.8
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
