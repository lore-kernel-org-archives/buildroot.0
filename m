Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FFCFA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6ACA60AA7;
	Sat,  3 Jan 2026 11:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZ7LxTADLfLe; Sat,  3 Jan 2026 11:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36068605DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439200;
	bh=uNBIL4CcNf0N++bYKSPhyeGNEfC/8Sf4Ng4C8dDijm4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nKO31qvq28nvY7V/ZmXjdSLIJ8QWCYJb9UvVfvk3XZWIuOM7vESEcwFXCqyYhihUB
	 YQplKIIlnLdXNSqVPCsNVssKZU4L6/hhPDWnOulU3BikTPXSNXH6Hni/gbV/YLVNi7
	 2jDtWFojl4qboAaW+6Kj57hJh8AIQBQYrVrWn+sPJaTlOSZK1l5e9u+nJnkK06FK5E
	 k0Ica4RrTz7sfI3AMyIPrx07PUdpYhyr5D94dpLpoQftKsbrY2wRsTnHFkqFOb1Wty
	 7EianEdRyFQFUGxNqxRUAQX8W4og371v90JlngJ257IfSee/i/vEM9IkYwmoQI9AwJ
	 xrtXMm756Tn9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36068605DE;
	Sat,  3 Jan 2026 11:20:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E97440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D6E605DE
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZXO1RStz99k for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22E34605AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22E34605AD
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1383987F25; Sat,  3 Jan 2026 11:19:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:19:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71a35f9ca7353517d7446250d9b5d4159ab4a570
X-Git-Newrev: 4e0e91028c0a50b69c5489a523dca2b509c9a817
X-Patchwork-Hint: ignore
Message-Id: <20260103111958.1383987F25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: bump to version
 3.54.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e0e91028c0a50b69c5489a523dca2b509c9a817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.54.5/NEWS

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index be19fc1900..191b74b1e6 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.2.sha256sum
-sha256  03cffeb49d8a1879b621d8f606ac904218019a0ae699b1cd3780a8ee611e696b  pygobject-3.54.2.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.54/pygobject-3.54.5.sha256sum
+sha256  b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585  pygobject-3.54.5.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 0d96c299cf..9386b6fed8 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.54
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).5
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
