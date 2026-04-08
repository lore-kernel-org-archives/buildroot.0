Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8CB10FC443
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 21:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C817E41068;
	Wed,  8 Apr 2026 21:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zz1u8tRglveI; Wed,  8 Apr 2026 21:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6648041032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775682412;
	bh=PojGt+bPJrWhWXlndflkPMn/apJnV1pYxpcP5CmA0MY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qs79NkGob4vMisgt+uiYKB/xP5ajrnlWWoWDah7oxKYtJOwKvMA0uhw+wPH03Hxcb
	 2vt66JcoYIhvDBiH4ecN1nn8zG9a5FUxs5Z5DExSR+8nw359f8Zufor7CfAbjChDV9
	 DZDfYseK1qckPf6Sroq2UFrFLjyHz39zztqQZbD72fgiWqn7PdMT2mQASfHvUjxwFz
	 I1IqbWnQ5ZuI0UKtx/5jJz8YTBvBZECyZDV75V3PQbxEVRxL8Oo5fUJdZOy627RGAu
	 b3SSkYFGja7j8YiCx5X3hN+SclC9KBnM15z2bZUsb1G6u/00og82F/5/pCMe+sMGE9
	 beAbWxy6yiIsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6648041032;
	Wed,  8 Apr 2026 21:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0072C7
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02FDF827C5
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr-DvFa8iZOi for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 21:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F51E82796
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F51E82796
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 21:06:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC63B80DF0; Wed,  8 Apr 2026 21:06:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Apr 2026 22:59:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4b8a42fb253116befe539e5529ac4efd97ab421
X-Git-Newrev: b9ea86b26a84b193a782007d559c899761364b21
X-Patchwork-Hint: ignore
Message-Id: <20260408210649.CC63B80DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: security bump to version
 2.86.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9ea86b26a84b193a782007d559c899761364b21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix several security vulnerabilities of varying severity.

Release Notes:
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.3
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.5

Fixes:
- CVE-2025-13601
- CVE-2026-1484
- CVE-2026-1485
- CVE-2026-1489

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Julien:
 - fix URL in hash file comment
 - add "security" in commit log title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6698db8389..09cd8e9979 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
-sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
+# https://download.gnome.org/sources/glib/2.86/glib-2.86.5.sha256sum
+sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 1c5109f4ec..cae8a85a28 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
