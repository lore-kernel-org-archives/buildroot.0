Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825F5EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22BB40631;
	Sat, 14 Feb 2026 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zu7S0cP1WM28; Sat, 14 Feb 2026 20:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1116401C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771102266;
	bh=X8GHuhb50kdqgBYI+ISoWLV3bndjvfS9LT5fY10I7Gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gsjC8mQ1bZo7T/YDpcZvEjFOS3AKcTR+ELcfpHujSXZqFtZ5xGzhNTLxyx8FZokzB
	 d3ZRlMTnI1X8r32iHueXUhQpUoli3f8lYmb8XL8bo0Lf5QDCBFLXEcxwyVO23k7J7E
	 axjaCgwxs3TTUa6qzEf94BdtMIXvq3VUBCE0m391guULvZYwr5VVikilP2uu1r7/t/
	 BbBokF2NTknQKjRQGIabkfYwkbDuh/qjU3uRd1wI/hCNe7IcgqwOoRUv5PdqhCEAJ1
	 i8Rp3PRvWTF/uo4xkstdahusdumyYM52+0eFGT7fyCbDGvWpqHkmCt1MHQPTbjv7Rt
	 ovfbmEkCCq4Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1116401C3;
	Sat, 14 Feb 2026 20:51:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A9731F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35DCB40B9A
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTqbC4SRdGjZ for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA5240B90
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA5240B90
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:51:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C48486D97; Sat, 14 Feb 2026 20:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 21:31:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b53bd87d3421d13e5b1055133c64e074d45792a
X-Git-Newrev: 0433c8d02af803de90b41c42bb41bbc9f2d436ff
X-Patchwork-Hint: ignore
Message-Id: <20260214205103.2C48486D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.31.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0433c8d02af803de90b41c42bb41bbc9f2d436ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lore.freedesktop.org/wayland-devel/aY56u6fqOsHIZJXx@quokka/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 230b29b12b..a942bb069c 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c5169568f337c4a3bda927c42afef3a9d4c891e48a405cba39d57cb4631b9fb0  libinput-1.30.1.tar.bz2
+sha256  af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5  libinput-1.31.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ee7c2146ab..e018f87f00 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.30.1
+LIBINPUT_VERSION = 1.31.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
