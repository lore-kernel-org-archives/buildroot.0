Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348ACD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD7481FD9;
	Tue, 26 May 2026 20:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAgJ-CJBogLm; Tue, 26 May 2026 20:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF5381CBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779827693;
	bh=v5y7x6OnyfEFCfQFiIkFcdJLs+t8L8qLMFrYGZRVEs8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BAl3cK29hiVxX0a7b8gwXiMjPrG3MK28cjvlCNtHjk0OZ0c89OLpmVR1VUlqetPYY
	 Af2nLCQ9+qAysZLH/2RowmIjXWBwIELbznOFTU+el9wVYpFu481Vo97g4fbTHHSBo6
	 RMYIqosXu/pxwtDIRihS8xQyJ+hQj6lKxvFwn9RvKX4UFxJFBd3hqGJR/uYNFcEAz9
	 C6jFGMAf8imEdToiIx9YXJN2WcdVYSA9cW6y693RclCN9FGsiipl89NRoie4hQZZpZ
	 /ze6yuBrU5I9yHwa4rbNLzoMhIOImc7SAbWKqYwnv9VtQLoHIJklMd0kHc98rXRyIH
	 /sbcnhDH54+9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF5381CBA;
	Tue, 26 May 2026 20:34:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D776A21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D49F2419C5
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpsb4S33-4uP for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACC5419B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ACC5419B3
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:34:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4AF286F77; Tue, 26 May 2026 20:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 22:22:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 26628470ffd7bc0a38e5e884f61999dcc74206d8
X-Git-Newrev: 6547d32302c74fdcb587a8b956dfe9b964958d8c
X-Patchwork-Hint: ignore
Message-Id: <20260526203439.E4AF286F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/less: bump to version
 702
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6547d32302c74fdcb587a8b956dfe9b964958d8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

For change log, see:
https://www.greenwoodsoftware.com/less/news.702.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/less/less.hash | 6 +++---
 package/less/less.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 5f0b0f3846..8eafceabce 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# using DSA key F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-692.sig
-sha256  61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14  less-692.tar.gz
+# using DSA key AE27252BD6846E7D6EAE1DD6F153A7C833235259
+# https://www.greenwoodsoftware.com/less/less-702.sig
+sha256  242a64c00f02d96f8ee208cf638ae1728b727c7f5fdf82a7d4f4cae32fb084e2  less-702.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index 49156a805b..91c853009a 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 692
+LESS_VERSION = 702
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
