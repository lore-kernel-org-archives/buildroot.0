Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038CBC87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA28641B3E;
	Thu, 24 Jul 2025 19:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jRndMT2AG8Q; Thu, 24 Jul 2025 19:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4180C41B4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4180C41B4E;
	Thu, 24 Jul 2025 19:30:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB9F1B83
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D221460896
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xnel__hro_0o for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D8AC608B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8AC608B3
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E46286AC0; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:28:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4a4b3a735e8913ad2407c8cfe8377ca982fb3ae
X-Git-Newrev: 802afc0b434389946726e06e35b9eb7b6562b434
X-Patchwork-Hint: ignore
Message-Id: <20250724193036.1E46286AC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openmpi: bump to version 4.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=802afc0b434389946726e06e35b9eb7b6562b434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 4.1.5, see:
https://github.com/open-mpi/ompi/blob/v4.1.8/NEWS#L62

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openmpi/openmpi.hash | 6 +++---
 package/openmpi/openmpi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openmpi/openmpi.hash b/package/openmpi/openmpi.hash
index 567ffe4833..78c60b2bf1 100644
--- a/package/openmpi/openmpi.hash
+++ b/package/openmpi/openmpi.hash
@@ -1,6 +1,6 @@
 # From: https://www.open-mpi.org/software/ompi/v4.1/
-md5  bb045df2d600744c2231c78b31a20da3  openmpi-4.1.5.tar.bz2
-sha1  eba2e6f9ee0c39fbca0a8cf53a79c9ed29643284  openmpi-4.1.5.tar.bz2
-sha256  a640986bc257389dd379886fdae6264c8cfa56bc98b71ce3ae3dfbd8ce61dbe3  openmpi-4.1.5.tar.bz2
+md5  72e95168a62a5b951da9afe4f48b0be9  openmpi-4.1.8.tar.bz2
+sha1  821df691e2c37ecc40b2784237cfdfda734bf13a  openmpi-4.1.8.tar.bz2
+sha256  466f68e3132a1dc02710cc2011fafced8336d98359fa2dae4dddcfd5719f12a9  openmpi-4.1.8.tar.bz2
 # Locally computed
 sha256  2db71de9577ebfe15c186605844c470dcecd3717f4ef0118c9440d801c0f58f8  LICENSE
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 82a4b3eb1c..eab87b5987 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENMPI_VERSION_MAJOR = 4.1
-OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).5
+OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).8
 OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
 OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
