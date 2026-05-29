Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D86CD6E43
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 10:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D436143C;
	Fri, 29 May 2026 10:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ov4raarzATA9; Fri, 29 May 2026 10:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4286A6131C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780051437;
	bh=O3pCoRH+NADnaQp8PooEVyAR5vEIxiCrjwrvCYPZe0A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hcEmIhVF/Uox2xmuSrPdTgETu6KvKn2vayQxBlVc5ahaxuoBouEVu1YuarXJ9tjuH
	 yEyMSP4Ahh17SuEYQwVMpzVhlEsW9dh5SZklDRNjvHGMeN5EjEoh8HGHsMRcE0mdCb
	 eNLhMI8ED+xxG3o/yz7ehnn9V7P8ikX2thHwhfII8yXm2hb97PWbHUPFieG72S3slg
	 2CzAw4HbxPFpcI3clJaCYhZJIpXlnnOucPGWw0SnKlVSIdsKc/3uLg5kRfXbHLJ2gV
	 KaAetA+Tjp/6pIQPi1lfeWNLhbdx9JA0lTbJt+6t+64wOPvBDIBQFOeBinx3G+1eOX
	 dMxOdugLVdTng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4286A6131C;
	Fri, 29 May 2026 10:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31198F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E10B41201
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7DzakrlNex4 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 10:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29EDA4112C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29EDA4112C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:43:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A07528732F; Fri, 29 May 2026 10:43:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 12:43:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 948f819d955cce4917c12a4d65ccc55c29f5e501
X-Git-Newrev: 1f5095c1d304b38f014f9da0bf4351218f44a4b8
X-Patchwork-Hint: ignore
Message-Id: <20260529104342.A07528732F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/kconfig: fix compiler warnings
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8726295182787744666=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8726295182787744666==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f5095c1d304b38f014f9da0bf4351218f44a4b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============8726295182787744666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8726295182787744666==--
