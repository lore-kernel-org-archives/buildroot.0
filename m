Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8468C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA5161152;
	Tue, 21 Feb 2023 01:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA5161152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ze8G0LWaUi8c; Tue, 21 Feb 2023 01:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE18C61780;
	Tue, 21 Feb 2023 01:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE18C61780
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43F181BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96EFB6FBA9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96EFB6FBA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ppsaaa4R6vSy for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBF2F6FB98
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF2F6FB98
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7AC98648F; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:58:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1d7e304648ffa8f4d88bfd540176e492fcafb015
X-Git-Newrev: 4b1114e5799cbb10396962c0f447ba076562359a
X-Patchwork-Hint: ignore
Message-Id: <20230220205238.C7AC98648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgtk3: switch to
 https download
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b1114e5799cbb10396962c0f447ba076562359a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk3/libgtk3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index f277fce2ed..4c93413fb2 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -7,7 +7,7 @@
 LIBGTK3_VERSION_MAJOR = 3.24
 LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).35
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
-LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
+LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
 LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
