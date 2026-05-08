Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A77ECD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3D761BA6;
	Fri,  8 May 2026 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJXjWGLBSoUF; Fri,  8 May 2026 20:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC3761BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778271358;
	bh=PNkC5TKxOMwaCwcHgdRu37C+rgP/rUyqhPQney0g030=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nDTDR2ek/WQzpL6AGb89LMs44acW9cK2WJch5Q6mIyy+dbc0tiPlbbQTl/9Lt9KPD
	 4eq9SjYjheaQ7FzF9dL7fjtXji79AO3LoGMNKu3VYcjJAn+uMDtIb1bay8f7z7Rxod
	 vKyeS2fHhHCW45s/cDP8aYoBhxzYLHf7i0w0yQR73HIjHAOezXsra5NQnCHy4/4YPV
	 LFcjFuqtcwyLEI4riPjG2qOXqAt1u7ggkee2lIjgH6Rnt0+4kNdzqpKI9cDwseASSw
	 pvyzLW7ZQeFwvHUioGPv1QKSX/THof4lVDQAVjPFX9tyVVZRFmkuivs9Ah9soTYJOs
	 ZeHcPbOAdpTkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC3761BA8;
	Fri,  8 May 2026 20:15:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E2422F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CB941207
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5u4WkkQqI7n for <buildroot@buildroot.org>;
 Fri,  8 May 2026 20:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 225EA40464
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 225EA40464
 for <buildroot@buildroot.org>; Fri,  8 May 2026 20:15:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1D1885A7E; Fri,  8 May 2026 20:15:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 May 2026 22:12:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d951a39010573bfa751da97544ef04dfd69104c6
X-Git-Newrev: 98a3912165d0a65138295897e956254a15f02e9b
X-Patchwork-Hint: ignore
Message-Id: <20260508201553.B1D1885A7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.6.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98a3912165d0a65138295897e956254a15f02e9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/fetchmail/mailman/message/59332343/

Updated license hash due to upstream commit
https://sourceforge.net/p/fetchmail/git/ci/389729194921d7ccc7054819678657a5b2054876/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 0dfe404f93..60c950476c 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59316921/
-sha256  246e5fc0e35c93dde1a3fb66778e3ab700e16809232e4959c508b91214374bb2  fetchmail-6.6.3.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59332343/
+sha256  efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70  fetchmail-6.6.4.tar.xz
 # Locally computed:
-sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
+sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 00c816cdce..d021c2c7bd 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
