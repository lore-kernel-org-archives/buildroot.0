Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55758606ACDB
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JG9GmrWL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E39F811A2;
	Thu, 22 Oct 2026 15:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfDx14HpdCXK; Thu, 22 Oct 2026 15:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6773481205
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682066;
	b=fI3N+Pq5HMWWSKvXX6yTtoXCIr12IfIgrP5RW3o9YlcIsywdr7me9vgFnSS84zcjTyxH
	 flrLvZE/ZN0tSu7fTM02RVGGDBOVzoncWWZijPSBoAyBnUMl8stheNiVR0FegYYLohC8/
	 ocguYG1yylcIRvLSkIvtOcNTg81JN73q4vM61uEWmuIt1ICHrAu5sgYzbiZ19quNKyG6R
	 UUOPDbQlkqHwCrN0dG1vV69AkjwDYcJq2RBiN3KCnoTJjEsGhLK7GTZInPMBsu3oDg4mo
	 zC1ee52lq2beBbQ6e5dW6gmTB3tLZpFrfkHAhQn02X9cofB9M37n9SIRB4Bc6ONOYtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Uht0EsmlX+UahTEB76906MM8hycCjUDE0gkEddt1HmQ=;
	b=dBqkB3W33QRnWWM9vhSPaqFj9nbC0Ux/HBAwd051xX/QLk/GuNt2fs4sPgLfhThoW0uZ
	 awQlM9B3y5yfLO2dc+8Ul5HScTa0DM9CaCACI3tIOqntzd7X13/tNBed0GBVgGidvZF9V
	 6aXBw6SjcOqBOhpkdxzRO/xoSCFyfqv0whRqM2WEtTCln1kEwGgmzzxGLSB/UqPykqBBZ
	 Eh/nLGupfkIER5fwchusz+P5d9Ce1EpwEof3OmCoMxz9g0KuJJKb3ON4iTRIpt8SbR2tI
	 PCzAgR1rKT0Czc1ar9ZbOMosTlk6DQkfjuk+Gs63EqJphyQRmezzrSvKddW1MqQN++Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682066;
	bh=Uht0EsmlX+UahTEB76906MM8hycCjUDE0gkEddt1HmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JG9GmrWLIyf8bLeBBDFtIreuCmwJJmMiHJuHIs4LKnaOC9F37MrnR7PHV0cX+90BH
	 aDPhDetqikS4Jfq+4Jwx/bl7/Bm6qJbh3HdWpkX5X049AJ9QBkrLxXtwjCif40hzq2
	 oPie3e4yzOv8C1rJb1ogls5DPjDe5YqIYuDOYMTIVEwD8Ll4CViYzc/BlxxT0LCf78
	 /9qtsp01euo//UrIs/86qXYpCezwOm5dXW7uda6Z9WuT2G9G2kww/E6JQLt9lPpl59
	 Epv/g90JqDG78sv9c/4haoBszTl3bvRHO86rW2ib79Z0vzWM34TZ16BXJQLLF9QJY9
	 EhPvA7hBbDc+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6773481205;
	Thu, 22 Oct 2026 15:14:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 004AA95C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E694A40082
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrqShUmdbHGm for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:14:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 48CC440024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682064;
 b=CNXIz/eYSaBiG/71AVtCDpzEUwkyLKz/FRQkHlCNi+C05BlwjM1Thj+0o2U+1ZaENt/B
 otaxY6+k5AYmgFQCj2FMVUCelfVWmGoMOtvxZ8fjektMFJXw4P4HGIyHAPrbm8XhHbC8D
 BNFySivNSDIQPQ6/B4bndk2kShsPtD+eF2AYVY5hY7smILeSlB4jDJ7yV01X4yamAHYTl
 56DlM05NJBs8JMeJYrvA9tLy62iRBPbDg0lmQRrZmT3zWnooi3cW651lItfjoFp7yOvPM
 VDMqhbBnp3EtBm2TY0lPLQoogtUBvU3ysCOMxbuTJcsqLV0noEHNlthdgthLSYVzVAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682064;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pWGwPlj9NrqRgsuakfOM4j9R5OJygPHclBZpYFOjAnY=;
 b=T26824jqjLoCHUPz5K6jVn/OfUrMwfDGm9d7Cn8DAYN9XHTr38X8uNwMCpIkilM4/P/y
 t0Svp1zOA+6zfhie4Re4PqDRwaTTR5IUYYHPRMMh2x12PxK/yCJeQGy5g5N0GaR/7bWd5
 8XF5td6g4VRBQB0/xDClNjT2bw0DaF46+v1gtcAiDOn8ZKiPYrm5cwqkqpQjePtmHyCWa
 fGn88t/++JTaiBNSl6LR8mbR8hRDKOyfdr8ZkDJA4Pcl+WJ8eCvQvXZk0frIpOKSfdU6j
 J7Mh+qzIOkGyd4I8NK5/VLmqyjYoWH9tADcfJ11jBT77zowk2p1DTBKD0H3XFbh0ZFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48CC440024
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9331F9B9F9; Thu, 22 Oct 2026 15:12:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:13:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a62ab35ffc9d9a272ca78102fda2e808fb68126a
X-Git-Newrev: 7fdeadb3b9f12f78e5fccca914d7fef47090ab9a
X-Patchwork-Hint: ignore
Message-Id: <20261022151257.9331F9B9F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] Makefile: Update for
 2026.08.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fdeadb3b9f12f78e5fccca914d7fef47090ab9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 36fbd7b3e7..cba31144aa 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.08
+export BR2_VERSION := 2026.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1788535000
+BR2_VERSION_EPOCH = 1792682100
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
