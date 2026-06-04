Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DABCD8C81
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7CC14110C;
	Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6915-0wO9Lxf; Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066704111F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663157;
	bh=Db5kVxT7OPbnGpxlzRc3sMpUGOAeXn+dr0pZeq56pbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XKHSetnRZZXKGwY9KWF3n0Y++eMiXxmLhd+scSfVdA4bCbbZ34/SBDHpJw3PZ5hYb
	 WivwCFSG25+C4vyDtayI7kqn7L7OoC3qQUL21FJ3UIWi40E3aPicljWekUrkqzc/UI
	 O/aDiyRhvH5YjTHEgOp43+PH+QqAUCkq8hUZioayMRK1ZVycWz3DSnUEjJ8knuC2DY
	 ph2cUwJ4Z0eJkwmcTuckx1vWtFt4PdiLCKQh6UNZVc2yVv/E7I+rrO5+2reFecWRHT
	 p8Ym9uPHEOfdwdebGiYuiOoGnB4KwUYp5lEtNpuW4jWmca2+84Qu+PnjY4vpDNQgri
	 CgCPMLjxQjW/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 066704111F;
	Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B0A3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E37941021
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UQiSPEH0v8h for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948FE41012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948FE41012
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE9BA87B22; Fri,  5 Jun 2026 12:38:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:01:19 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8fec33c70d1be6cdba467470d22aca8d23cab520
X-Git-Newrev: bcee92838f831b54513ebf85a0cb4c9d21144e47
X-Patchwork-Hint: ignore
Message-Id: <20260605123834.BE9BA87B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/kconfig: fix
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
Content-Type: multipart/mixed; boundary="===============3454692102010337208=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3454692102010337208==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bcee92838f831b54513ebf85a0cb4c9d21144e47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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

--===============3454692102010337208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3454692102010337208==--
