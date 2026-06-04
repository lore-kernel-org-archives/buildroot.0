Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D95CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D1181F4A;
	Fri,  5 Jun 2026 12:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr51kBDTdEfV; Fri,  5 Jun 2026 12:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F163281F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663097;
	bh=Ff+vGINizzmXt6RERt0T1FD8/e2QBZwAHET3ogt0hWY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kDV5lNK3oyFr+/STebMBQ6ceOs8JijyQpE+NwMBCPahz+gOmtr8R9AeX5aIygvEBY
	 f5Sih1SHdhYq5IYcrpKl3gIYWfuAGh62syy0ZpaE+IX6UUGUeKf+inSwtHEovibbtU
	 s6MlI8sPcmgvP/epaOjFZBsckQr9Ps7tgcMBNHCbmjI3+nPF7j9gfuijDKzIKtHEVO
	 1sMYeyN5vNlN/tz54bDSE5XgU05SAT+9tKsViY1B+f56Be14wQTpClMYS/CoNebtUH
	 uKCh86oYzMs8Y62rIxasHQuo2CrVMw1C5E9YpL/bhgDs6CNanbdSdLMxf8P737lmbZ
	 BjkqW8szQjeTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F163281F1A;
	Fri,  5 Jun 2026 12:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1242C388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EADEA81E89
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-0SYQcSy-Fw for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C346481E79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C346481E79
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED8FF87B3F; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:46:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a51b577cecff333c0886479b95f5c2fc27f5c51
X-Git-Newrev: 6d3ada40a8590af5769636e612f7c794f6b50f59
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.ED8FF87B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: drop Mauro
 Condarelli, email bounces
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d3ada40a8590af5769636e612f7c794f6b50f59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fdd94cac1b737df4303cfffe24247e5b905979c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 28cfea7dd8..d73e28239c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2290,26 +2290,6 @@ F:	package/gtkiostream/
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
-N:	Mauro Condarelli <mc5686@mclink.it>
-F:	package/mc/
-F:	package/python-autobahn/
-F:	package/python-cbor/
-F:	package/python-characteristic/
-F:	package/python-click/
-F:	package/python-lmdb/
-F:	package/python-mistune/
-F:	package/python-netaddr/
-F:	package/python-pygments/
-F:	package/python-pynacl/
-F:	package/python-pytrie/
-F:	package/python-service-identity/
-F:	package/python-setproctitle/
-F:	package/python-shutilwhich/
-F:	package/python-treq/
-F:	package/python-txaio/
-F:	package/python-ujson/
-F:	package/python-wsaccel/
-
 N:	Maksim Kiselev <bigunclemax@gmail.com>
 F:	package/ledmon/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
