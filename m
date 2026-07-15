Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFF2C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 448C94067A;
	Wed, 15 Jul 2026 19:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyowaXlAIOPy; Wed, 15 Jul 2026 19:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 674CD4067F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784142919;
	bh=r4MpUFZdzas4Hoi9wQycUYrK6IvvOqZpxCeVcvBZ2pc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R3iPt1pEibs7FbWr6HCHFxYItRf4dZ+x9N0zkeYFVDiiDELOZBMKjI97h26Y9J4Z1
	 0iwmx+WDRCACHhSis9CwidhC6dzfrm/W2byyPW1x5ZBT/dXhFJodPDBDtpAfT1XXhf
	 SLzc3sWoSVUiTPVqd2plH6+IomG7smx5wFcUI56pl77BZ/6whAkRbZ+tgvrzIw0ZKG
	 EwmzOamUrfWkJ1Y777FK8LAukfAqrewjleUchqLMKFkLCscXZzClNyhNMUmEXuV1Up
	 l/d2aBZTvNxRfY5m9bUix6nERufM94tlE8b4uj5Q3yRwiNUNCYtJvIIlyl1yHZWpIZ
	 tdIFdp7Mh3UKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 674CD4067F;
	Wed, 15 Jul 2026 19:15:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28053203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D3F80D2D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iub6mThWa6pI for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B70580D1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B70580D1D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:15:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0F3488980; Wed, 15 Jul 2026 19:14:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:07:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96aac440dd79aeb7e1492247a59b01e52456280d
X-Git-Newrev: b28a6ffe13e837c49a714c9630029071a10bd650
X-Patchwork-Hint: ignore
Message-Id: <20260715191441.F0F3488980@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cifs-utils: bump version to 7.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b28a6ffe13e837c49a714c9630029071a10bd650
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.samba.org/archive/samba-technical/2026-July/140952.html
https://lists.samba.org/archive/samba-technical/2026-June/140908.html

Version 7.5 was not announced separately:
https://wiki.samba.org/index.php/LinuxCIFS_utils
"December, 2025: Release 7.5
 - Various fixes for utilities"
https://git.samba.org/?p=cifs-utils.git;a=shortlog;h=refs/tags/cifs-utils-7.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index e6a5eefeaa..bc90ae98bf 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  cifs-utils-7.4.tar.bz2
+sha256  2f8aae9aa5ddd73fbaf4d61e2e5e19ef54124cbf2810b626820050e7bd2f6606  cifs-utils-7.7.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 58ac594b20..7ff3531117 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.4
+CIFS_UTILS_VERSION = 7.7
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
