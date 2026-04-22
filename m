Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A67BFA1FE3
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 19:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DD040564;
	Wed, 22 Apr 2026 19:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2o5ueMLG_x8; Wed, 22 Apr 2026 19:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377AC40558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776886390;
	bh=cxDwToEFe93Utf0O3Mbqp5AYvcgG0ozXhY7Vvqv6IvM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ClDHIIcCBPf62ODRwnxFhfAaBbVHTSuGbEOURMEFDoDSpwUfAyARMNfrRp/U0WITe
	 MqM/E8kCK6r0d+9GMuuROmmiERzPE4YvLdN5cZHvBruXrqTBCt56ahKvNW+xQHdSlf
	 b4xCryR0hN7OxLo+ryjMLxG8l8+31XMpMrqDmleBujijmS5iVXVQ6FVSeAmojpOF6C
	 iqb+qpO3H6soy1S+OGFi6v5omPfzgrRILswBw+cNTh8l7b1brd0lIznadQJNebfyQH
	 NxgV1hb0SdFVHIPq3VxIMFS6bFiT1O4k8g7aPxUwPprdw0ePx7qgWOh522hVe4xPil
	 CsiFlirnqIVfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377AC40558;
	Wed, 22 Apr 2026 19:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBF4231
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 19:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F63440086
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 19:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UD1ZLzD6H3T for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 19:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABB84004D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ABB84004D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 19:33:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B8FA82648; Wed, 22 Apr 2026 19:33:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 21:32:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59906743401c57a551d7e198d8dc2a508a200ddd
X-Git-Newrev: 08d0c7617159020b0658a98a79b4de5fe69ce3e7
X-Patchwork-Hint: ignore
Message-Id: <20260422193308.2B8FA82648@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 v7.1.2-19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08d0c7617159020b0658a98a79b4de5fe69ce3e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-19---2026-04-12

This fixes a large number of CVEs:
- CVE-2026-28493 (since 7.1.2-16)
- CVE-2026-28494 (since 7.1.2-16)
- CVE-2026-28686 (since 7.1.2-16)
- CVE-2026-28687 (since 7.1.2-16)
- CVE-2026-28688 (since 7.1.2-16)
- CVE-2026-28689 (since 7.1.2-16)
- CVE-2026-28690 (since 7.1.2-16)
- CVE-2026-28691 (since 7.1.2-16)
- CVE-2026-28692 (since 7.1.2-16)
- CVE-2026-28693 (since 7.1.2-16)
- CVE-2026-30883 (since 7.1.2-16)
- CVE-2026-30929 (since 7.1.2-16)
- CVE-2026-30931 (since 7.1.2-16)
- CVE-2026-30935 (since 7.1.2-16)
- CVE-2026-30936 (since 7.1.2-16)
- CVE-2026-30937 (since 7.1.2-16)
- CVE-2026-31853 (since 7.1.2-16)
- CVE-2026-32259 (since 7.1.2-16)
- CVE-2026-32636 (since 7.1.2-17)
- CVE-2026-33535 (since 7.1.2-18)
- CVE-2026-33536 (since 7.1.2-18)
- CVE-2026-33899 (since 7.1.2-19)
- CVE-2026-33900 (since 7.1.2-19)
- CVE-2026-33901 (since 7.1.2-19)
- CVE-2026-33902 (since 7.1.2-19)
- CVE-2026-33905 (since 7.1.2-19)
- CVE-2026-33908 (since 7.1.2-19)
- CVE-2026-34238 (since 7.1.2-19)
- CVE-2026-40169 (since 7.1.2-19)
- CVE-2026-40183 (since 7.1.2-19)
- CVE-2026-40310 (since 7.1.2-19)
- CVE-2026-40311 (since 7.1.2-19)
- CVE-2026-40312 (since 7.1.2-19)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 90383c4d17..a308cd1f06 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bf646e7fffdf50b7d886eec6bbe51c3ced1c4d68fbabfcc534e014575359fe7f  imagemagick-7.1.2-15.tar.gz
+sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5a03fbfd8f..d88323ca2d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-15
+IMAGEMAGICK_VERSION = 7.1.2-19
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
