Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC6BD6AAF8
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF1441177;
	Thu,  2 Apr 2026 19:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6HUMGn1MzF1; Thu,  2 Apr 2026 19:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743B64117D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775158020;
	bh=zzmV9jaCD1lDUydLMvA8hR+PSZijOcZlxcwVAgiwMGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AgWxf6whMmZCUH5D8KYrEFRpbWdXMc/JP5WWuFoYHpEirA2O/WcKnaE9NZOhZKBWf
	 u92kTbg3QAQIKh8PhaRuVdlir6KF4b9XhX7BW7gMKLPklu77vT5IUQULcE8/haBW/r
	 4LyySodAr6EBt09uv7DUn17K6HkqS/sleD7TuSfNu73Tbuiw1NaU5FHRYvBKC0kTxJ
	 4uKVWuOAfcn0utKy+FH8PVJs5F9Nn6KtOWoxPJOGm5IWEg7rhNcuPdiMnfwg1Vu9ev
	 V7/rzNYPu0poPQ0uO3DbhgN8ogp73Z3kJ9PM8a7vwFWfK0WxVZgxaVLGYCpykVBXvy
	 M5IT39sEF4HgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743B64117D;
	Thu,  2 Apr 2026 19:27:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32B022D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E89401E0
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPrwh2r8lZeL for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69CF1400B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69CF1400B3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:26:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF657FF1A; Thu,  2 Apr 2026 19:26:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Apr 2026 21:22:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f42f5f4dbcc21d3119799d61112fcb4de0d24a68
X-Git-Newrev: b9ac6cce071b322119ba3d3bcd7d919c9cc3184c
X-Patchwork-Hint: ignore
Message-Id: <20260402192657.DDF657FF1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: security bump version to
 1.31.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9ac6cce071b322119ba3d3bcd7d919c9cc3184c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lore.freedesktop.org/wayland-devel/ac3BI2BjKx53LqmH@quokka/T/#u

Fixes CVE-2026-35093 & CVE-2026-35094.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a942bb069c..ec6e52e1e2 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5  libinput-1.31.0.tar.bz2
+sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index e018f87f00..8b930805b2 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.0
+LIBINPUT_VERSION = 1.31.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
