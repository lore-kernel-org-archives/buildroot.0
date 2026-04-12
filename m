Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3A1E937EC
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F133422CA;
	Sun, 12 Apr 2026 17:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Vs1WNmvJGdj; Sun, 12 Apr 2026 17:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F3F422CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776013277;
	bh=wgh5fZ/ffdn5S6Dy01LrsWl5OuZgaw8F+3wT2UIJUeI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RGxHXYiRrZ1VtX6C9FP+u3QFfSMFqKykQlLIFDmz532DzUiHs/Z3e25VF37v7Fu4Y
	 o4gEYZCuqn/7TS7tpurvJ5UzE5uS80c9ZQ38AxmjikdDLbuqDus7K4GVEmu2vHpYDL
	 ZH1vpG4ZQzFIHVVWIBsmI+YDBfJP3wwtHirywA8TX1jZhrWsHgkGzA6wJBtfcwLnrE
	 4CGuL2kndxazpJzlN5YfBD4z5vZ8AutdxXNbmeiBwa3f6S6elPzPfJeRlY2XdbrWCf
	 fHNbfQvyaAK0pCDB1H5pB34d//7OHQJj3XanHgt9PxCVQAws160l0KxRB3fzA3Yih1
	 IrmmiYku5m5pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F3F422CB;
	Sun, 12 Apr 2026 17:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C05831F
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E9EB422CF
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGzxWeor-NGB for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1225B422CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1225B422CB
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C44F81137; Sun, 12 Apr 2026 17:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 18:53:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa6f9a922e5ca1562b1f5bdcef1ef14b6026f859
X-Git-Newrev: 6ac53518a0ceb0611ee08adef500fc8d2994d21a
X-Patchwork-Hint: ignore
Message-Id: <20260412170113.9C44F81137@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: security bump to 2.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ac53518a0ceb0611ee08adef500fc8d2994d21a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bug fixes:
- fix buffer over-read bugs when translating uAPI structs to library types
- fix variable and argument types where necessary
- sanitize values returned by the kernel to avoid potential buffer overflows
- fix memory leaks in gpio-tools
- add missing return value checks in gpio-tools
- fix period parsing in gpio-tools
- use correct loop counter in error path in gpio-manager

Improvements:
- make tests work with newer coreutils by removing cases checking tools'
  behavior on SIGINT which stopped working due to changes in behavior of the
  timeout tool

See: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.4

Note: this commit is marked as "security" update because it contains
security related bugfixes, but no CVE or advisory are published at
the time of this commit.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add note in the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 157e605ed5..a12752261a 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
+sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 8803a282fe..d83fdbd94a 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.3
+LIBGPIOD2_VERSION = 2.2.4
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
