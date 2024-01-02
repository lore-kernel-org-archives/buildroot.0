Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4358CC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF33D408B4;
	Tue,  2 Jan 2024 20:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF33D408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeYe_ccHaBKI; Tue,  2 Jan 2024 20:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D724E40948;
	Tue,  2 Jan 2024 20:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D724E40948
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C53551BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB69D414D1
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB69D414D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66SuVLqBYasG for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B012E40510
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B012E40510
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96AD283CE7; Tue,  2 Jan 2024 20:33:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:24:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b25c3dad2e340f944a977a5ea51ee9d1f8a63f6
X-Git-Newrev: 6257fa486013538a47313f16e51b8515d189c17b
X-Patchwork-Hint: ignore
Message-Id: <20240102203324.96AD283CE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vala: bump to version 0.56.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6257fa486013538a47313f16e51b8515d189c17b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following libsoup3 build failure raised since
commit 9cbffdf9be622c8ddad3b28106851b3101b3d201:

FAILED: libsoup/libsoup-3.0.vapi
/home/buildroot/autobuild/instance-1/output-1/host/bin/vapigen --quiet --library=libsoup-3.0 --directory=/home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/build/libsoup --pkg=gio-2.0 --metadatadir=/home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/libsoup /home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/build/libsoup/Soup-3.0.gir /home/buildroot/autobuild/instance-1/output-1/build/libsoup3-3.4.4/libsoup/Soup-3.0-custom.vala
Soup-3.0.gir:6877.95-6877.95: error: The type name `GLib.TlsProtocolVersion' could not be found

https://gitlab.gnome.org/GNOME/vala/-/blob/0.56.14/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/732fcd20c2998e7d7b6b8f61871ad104f8d243df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 7f3a099940..b3716f0854 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.52/vala-0.52.4.sha256sum
-sha256  ecde520e5160e659ee699f8b1cdc96065edbd44bbd08eb48ef5f2506751fdf31  vala-0.52.4.tar.xz
+# From https://download.gnome.org/sources/vala/0.56/vala-0.56.14.sha256sum
+sha256  9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557  vala-0.56.14.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 94e18d349b..415d996faa 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.52
-VALA_VERSION = $(VALA_VERSION_MAJOR).4
+VALA_VERSION_MAJOR = 0.56
+VALA_VERSION = $(VALA_VERSION_MAJOR).14
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
