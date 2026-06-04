Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A4BCD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A3B60AA6;
	Fri,  5 Jun 2026 12:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bt3q3pMM9fmF; Fri,  5 Jun 2026 12:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D05C60AD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663095;
	bh=0nyEsJfNOIr6j4hK7hkZTTVXuVsgUp69O7y7OoiUrSk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GKn4/cpZo4Pp0sM8wyt8jdltIkYMtdTwfCxwKkTL0Sil8EwNJirkC+En9Aema3rqs
	 BDOPyE+q7tF+u+nSBHy4ZCb4x3IpewYMpmpFPcdzsMwm004aKevuk72A/yJfi4CyrV
	 okQRjV0Ag9tw+i1v2DBAmFGL4aC7wAOHRemoaKlnMczcqLmKKErptpViVzdH8cljjd
	 T7xjk0gZ5Pra7+hY2asPqPplzSQeVagNKZFHJvhBTtaEswK54+uH4H6torHbMUXIbv
	 1Yoj6IBUj8oZeWKrAUv4eKaefLV43vgf4fu1EPN0FVduki/Mf+r7IeL4dH9/sk0Xqm
	 nQF9qziSDj5PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D05C60AD9;
	Fri,  5 Jun 2026 12:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 131CB388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E120C81E52
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heHrPr0OeKf8 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D6C81E55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3D6C81E55
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE60E87B41; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:01:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9e7e4eb543af74a237054eead81fa4389652fb0e
X-Git-Newrev: 4bc28f81f9a266e0323c9dead2355abc893dc357
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.EE60E87B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/kconfig: fix
 compiler warnings
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
Content-Type: multipart/mixed; boundary="===============4618541302632418727=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4618541302632418727==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4bc28f81f9a266e0323c9dead2355abc893dc357
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 324612d68e09d0db44c51c451bc6b87466f7f874 fixed several compiler warnings,
but actually introduced a new one by increasing the buffer size in confdata.c that gets passed
along to file_write_dep in util.c, because buf2's size wasn't increased along with it.

./util.c: In function ‘file_write_dep’:
./util.c:86:26: warning: ‘%s’ directive writing 10 or more bytes into a region of size between 1 and 4097 [-Wformat-overflow=]
   86 |         sprintf(buf2, "%s%s", dir, name);
      |                          ^~
./util.c:86:9: note: ‘sprintf’ output 11 or more bytes (assuming 4107) into a destination of size 4097
   86 |         sprintf(buf2, "%s%s", dir, name);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by increasing the size of buf2 to match the passed buffer size.

Signed-off-by: Devreese Jorik <jorik.devreese@barco.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1f5095c1d304b38f014f9da0bf4351218f44a4b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/kconfig/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index 8665f5bb89..c2e7979ac1 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -35,7 +35,7 @@ struct file *file_lookup(const char *name)
 int file_write_dep(const char *name)
 {
 	char *str;
-	char buf[PATH_MAX+20], buf2[PATH_MAX+1], dir[PATH_MAX+1];
+	char buf[PATH_MAX+20], buf2[PATH_MAX+20], dir[PATH_MAX+1];
 	struct symbol *sym, *env_sym;
 	struct expr *e;
 	struct file *file;

--===============4618541302632418727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4618541302632418727==--
