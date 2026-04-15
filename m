Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340E0F428EC
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE3C42865;
	Wed, 15 Apr 2026 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgert-FCx8O8; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1B64287E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285763;
	bh=ArH4WuUDRUIOWtzC6II+weHs2fZdF9Cy74ERHpmabEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mRQhqwnnJxesVCMgmBDr2mTkFBFaSt3HvrqaYTnJQXd/Jk7KGI9f3wziJglHL5ssq
	 45t8Yr98TJPTiPwijKZTnTDmA4yhqVKn10A0uG6Z1U4lJeOipb/aZNd0t7Arp2/8sl
	 bJ7B3tEdD1JpvVc7ydA2m4rSfdUkTddfJ6KbNdhv/x8NmVnebKc7yn3X9y5qk+TjW2
	 zSak2CUVLF3p60LWeqXqfgQ/e3rrfxlZ6zEdhtmWSXS6KL8y7shG3SZKYs4jIR37Vo
	 GafQMjEO3HWnDmVE9rB1wM9NenQaZuPla1VBmEhFgLcXkmJLo5QXjtwuytwKwyB0hi
	 hBjw892w02dRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1B64287E;
	Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0796283
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B665484AE3
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYnv8QtFpcWt for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:42:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF64284ADD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF64284ADD
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8641B816A4; Wed, 15 Apr 2026 20:42:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 21:47:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1124bc4b836a0f16ce46088f0dd7e595a4d1b2ab
X-Git-Newrev: 63ef731ba3138f2ef78719869735193b4ccf02c3
X-Patchwork-Hint: ignore
Message-Id: <20260415204240.8641B816A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kibi: bump to version 0.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63ef731ba3138f2ef78719869735193b4ccf02c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/ilai-deutel/kibi/blob/v0.3.3/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kibi/kibi.hash | 2 +-
 package/kibi/kibi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
index 3ab58428cd..b206b7742e 100644
--- a/package/kibi/kibi.hash
+++ b/package/kibi/kibi.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  c65ab03df3c2f1b83b41c2074032edc6c0bc7ff616ff9116cee49ee36c462521  kibi-0.3.1-cargo5.tar.gz
+sha256  1fb9203d4d45efd7e0645f5a1dbeb14604dc7817d9db35c6f2bd650053877e59  kibi-0.3.3-cargo5.tar.gz
 sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kibi/kibi.mk b/package/kibi/kibi.mk
index 24f466ec30..99ac38f320 100644
--- a/package/kibi/kibi.mk
+++ b/package/kibi/kibi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KIBI_VERSION = 0.3.1
+KIBI_VERSION = 0.3.3
 KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
 KIBI_LICENSE = MIT or Apache-2.0
 KIBI_LICENSE_FILES = LICENSE-MIT LICENSE-APACHE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
