Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95A6C44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D7D081129;
	Tue, 14 Jul 2026 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lNOMRZrPsis; Tue, 14 Jul 2026 10:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9453C80C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784023220;
	bh=KBhJ7571ilUUgAbvA0a0u9OId378Cua5m48YahWOSPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=odP+5417ZzkLYoj7zxiXCqkQZQCdzN9151bm8H73eU8G8LFzcWySCZKPiT/5W4Ql4
	 5NMHgUzlZ2J14fLQqArcPHVbKugU8yM89C32Jecre9K/Q/ID4P02SYYktC4tIzHt6c
	 1fqUXqmDSfUKz5qhwKidHe1HrujYGGYnnD/3xppboqpUE+KYqNqX1e12RLlVhi3olu
	 zrLOnLdVTioTr4iCYTJBXNdKeNBLeMJ1E0V1zZO23EPHvZdYGkWoEfKn2IYq6Amwwy
	 vsgANB0fuOx+4dF/A+LTULIukocB03CB/SNjIgATg4n1Ggwav8aniVFhqs1geybiAE
	 LUC/q10S427vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9453C80C06;
	Tue, 14 Jul 2026 10:00:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D6E9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C5240536
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ThNPfNqwk7q for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:00:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB2C64096D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB2C64096D
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AE7588840; Tue, 14 Jul 2026 09:59:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:58:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f7c484b4ab0190765dc81fb79083ae8e2be211b
X-Git-Newrev: c1aa7228e661fe82489d12ca8272c31138f252ed
X-Patchwork-Hint: ignore
Message-Id: <20260714095943.2AE7588840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloudflared: bump to version
 2026.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1aa7228e661fe82489d12ca8272c31138f252ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/cloudflare/cloudflared/blob/2026.6.1/RELEASE_NOTES

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to release notes in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index 407d24ccdb..89110ffe3f 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  803d3e162dc91da6b3b4f7961f57c113fa818d45517758511f72d254d68a46ba  cloudflared-2025.8.1-go2.tar.gz
+sha256  c3619a29cc529a5bc43ba99e1b298483ac0b8d8c412f69575c089a6bd4a7867d  cloudflared-2026.6.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 03b6a8fae6..44ddc82226 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2025.8.1
+CLOUDFLARED_VERSION = 2026.6.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
