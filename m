Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08371FEE4C9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 12:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A34D583C45;
	Sat, 28 Feb 2026 12:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwYSdymdQSem; Sat, 28 Feb 2026 12:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F7483C48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772281831;
	bh=7mw7jMB2DsyRKG0V+uqT8fy239s+3GG0AohHjyCJ7BU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l+IqFuPUiNNrC/JJFBiouLTudsjhubMGrMLPOXz389w6IWFZccWFuWgyHq6EhAH4u
	 VCD7j2rAF4LbdZBYSf/z9TMMoe0iSt48O9d8vb5hgBgVRx62rQ+E7gEmt+uwP3wex8
	 7Jyg7ZFstQv1vO5wYYQbKAa4sRjv+AWWYNsVEUkHUuustBlmdN82QXJCno3I5IZ7pu
	 MEYKeTQtRhIT7oXkViYBWmnt4gnBn0Nr6stAFoo5XdvJZIUs5rb6kYTQXZypjTg1ai
	 OX9rzKUANT0CySKx3IpyZS1aF6ozXt1/iHEiDb5XQd9eVuho4L50UhxbvDRhTZGIQz
	 WTzMbJhG0wASA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4F7483C48;
	Sat, 28 Feb 2026 12:30:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 166CB2C1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08A8F83C45
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slxlykAacjOu for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 12:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB2983C46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BB2983C46
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3825E85B41; Sat, 28 Feb 2026 12:30:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 13:16:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 658662b2465c56603d168194270516b20200ab04
X-Git-Newrev: a64d520ccc3b65f2c479b7ba79e830a378b8acc7
X-Patchwork-Hint: ignore
Message-Id: <20260228123029.3825E85B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/oath-toolkit: bump
 version to 2.6.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a64d520ccc3b65f2c479b7ba79e830a378b8acc7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://codeberg.org/oath-toolkit/oath-toolkit/src/tag/v2.6.14/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: remove sha1 from hash file which is no longer
  published in release announce
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/oath-toolkit/oath-toolkit.hash | 7 +++----
 package/oath-toolkit/oath-toolkit.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/oath-toolkit/oath-toolkit.hash b/package/oath-toolkit/oath-toolkit.hash
index d44b7bb742..c45923926d 100644
--- a/package/oath-toolkit/oath-toolkit.hash
+++ b/package/oath-toolkit/oath-toolkit.hash
@@ -1,9 +1,8 @@
 # After checking pgp signature from:
-# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.13.tar.gz.sig
+# https://download.savannah.nongnu.org/releases/oath-toolkit/oath-toolkit-2.6.14.tar.gz.sig
 # using key A3CC9C870B9D310ABAD4CF2F51722B08FE4745A2
 # From release announce:
-# https://mail.gnu.org/archive/html/oath-toolkit-help/2025-07/msg00000.html
-sha1  62807099befb8141e429d3e38750772041ea9056  oath-toolkit-2.6.13.tar.gz
-sha256  5b5d82e9a4455206d24fcbd7ee58bf4c79398a2e67997d80bd45ae927586b18b  oath-toolkit-2.6.13.tar.gz
+# https://mail.gnu.org/archive/html/oath-toolkit-help/2026-01/msg00000.html
+sha256  8b1da365759f1249be57a82aec6e107f7b57dc77d813f96dc0aaf81624f28971  oath-toolkit-2.6.14.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/oath-toolkit/oath-toolkit.mk b/package/oath-toolkit/oath-toolkit.mk
index 37b00a8241..8dee1feb00 100644
--- a/package/oath-toolkit/oath-toolkit.mk
+++ b/package/oath-toolkit/oath-toolkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OATH_TOOLKIT_VERSION = 2.6.13
+OATH_TOOLKIT_VERSION = 2.6.14
 OATH_TOOLKIT_SITE = https://download.savannah.nongnu.org/releases/oath-toolkit
 OATH_TOOLKIT_LICENSE = GPL-3.0+ (tools), LGPL-2.1+ (libraries)
 OATH_TOOLKIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
