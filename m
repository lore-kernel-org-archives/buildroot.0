Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F30CCD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E1681510;
	Tue, 12 May 2026 20:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCwuT_Iyb5xx; Tue, 12 May 2026 20:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 591CD8164B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778618284;
	bh=BJJJAEouD4VngmxEOrF3Ot59b5Ki3ifrH30Akl/I8Os=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I/EaBwBpwNBomYKI7JAuUuPxyczdYse8v6n9VeKzfE+pe6EIUJOqjvhIBXW+mSAxv
	 2KARotnkekXoOPNLYuLffRtoE3WzPdLJiVGVAtm1XIs/jlCTWvB4pA4FDwmYfwnRIp
	 FdqOleMS9FtmI+h89gYuzJk4hpxKlQVVzz4y7vYrx/r6NwziOxxdEdDm59ZyDtG7Nt
	 syuEtB03FCVB3MfR2bUuyUz6nKwHYHoAHuK7R9197+FjAXzfEQFC6FBK5phh4/Cn4W
	 vV4VMibZlM0DaMAoHlQfOcNj7domG1TITBmnZcaVKsjy35F/F4XVB1ADPo3mnJuGO5
	 VqUvVYjKB+9sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 591CD8164B;
	Tue, 12 May 2026 20:38:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C48315F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4244D41077
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kmg_1qOb3HRq for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D3A41071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89D3A41071
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:38:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A77385FDA; Tue, 12 May 2026 20:37:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 22:22:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9684cb9b4406e01683a9b5136100d81040d56aa0
X-Git-Newrev: c6be4815e494aae813124db54f6ba2fab555a372
X-Patchwork-Hint: ignore
Message-Id: <20260512203757.2A77385FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mutt: bump version to
 2.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6be4815e494aae813124db54f6ba2fab555a372
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

http://www.mutt.org/news.html
http://www.mutt.org/relnotes/2.3/
https://gitlab.com/muttmua/mutt/raw/stable/UPDATING

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 4fd71fd6ab..40965d21fd 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d3109a743ad8b25eef97109b2bdb465db7837d0a8d211cd388be1b6faac3f32  mutt-2.2.16.tar.gz
+sha256  9b4f7a442e41c057774ba7c36fa41aba2edd2e7a12a86031e6ebb113bab2c79e  mutt-2.3.2.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 503f2d283e..1be1f8b682 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.16
+MUTT_VERSION = 2.3.2
 MUTT_SITE = http://ftp.mutt.org/pub/mutt
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
