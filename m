Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054FCC55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 23:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C904065C;
	Mon,  3 Aug 2026 23:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQqYzXZO_cg4; Mon,  3 Aug 2026 23:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B93F40650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785798755;
	bh=ButvRS+09LRIMrht5RHYV+F8aYOUyNTAtF58YMs7glg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X9Gr3YQKoidxHZyAgiQ/JVHBkDs84LX6skhiT9KgE6RmF9sji/CvTludWHzyw+hsR
	 1K0aUbg5ARpf/isEq4YQX5vBu+uEnLoua0zU13kHVfzj8Wr5VFUKDtC7MLbW4Lkfnr
	 ugEikjb5Kh+zWSn8FA6Rtge3nPG6pKCr+cuV1SHe8DTtLMgy4JtxqgCKbzst4gfR4C
	 GOH59g9sbJFPdUMCEy5u9ZkhqoHbDxiP/ufODdkRFfXj6BmJJG/S8736ikUNXj13Pt
	 xOuiGHX2nKXDdwRzfhvgTuY1xXm6CXM14g+5RzEc3oDuDZRph8P2SdX0rjAuZ2Z+Qc
	 ghsYUMbEKOjSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B93F40650;
	Mon,  3 Aug 2026 23:12:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F193123F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36AB606A8
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 275quBQHALhu for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 23:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4DB606A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A4DB606A3
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:12:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 429168B874; Mon,  3 Aug 2026 23:11:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 00:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 716ec5a8c1e1bff16697f8bf748cc44421ed7203
X-Git-Newrev: 20d816651cc8b15f43bd4c95fbe8d8babe9e8dc9
X-Patchwork-Hint: ignore
Message-Id: <20260803231147.429168B874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: bump
 version to 1.86.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20d816651cc8b15f43bd4c95fbe8d8babe9e8dc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.news

The hash for giscanner/scannerlexer.l changed due to small code
additions [1].

[1] https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/2f6cbac54550f4f11fb5bc555037748a58b083ee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Fiona: add link to the commit that changed giscanner/scannerlexer.l]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/gobject-introspection/gobject-introspection.hash | 6 +++---
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 044216c65f..866b12c5ee 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.84/gobject-introspection-1.84.0.sha256sum
-sha256  945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779  gobject-introspection-1.84.0.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.sha256sum
+sha256  920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae  gobject-introspection-1.86.0.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
-sha256  60cf20b6532aa2f5622f753a55672630b789c04174acca361033e6f1ad29f8ab  giscanner/scannerlexer.l
+sha256  2596a580b8be710642b734a4ef459b9593db5f148b204a9ce65415e2db4fc87f  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index dbf0ee3fa8..0e8bf11954 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.84
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.86
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
