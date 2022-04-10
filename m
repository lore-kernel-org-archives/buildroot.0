Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2F5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D97584031;
	Sun, 10 Apr 2022 21:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jnjp8Mp5-3VS; Sun, 10 Apr 2022 21:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F49783F58;
	Sun, 10 Apr 2022 21:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16F3B1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBEE660B95
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=email.cz
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rfs1r8ShmKGy for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:41:34 +0000 (UTC)
X-Greylist: delayed 00:12:58 by SQLgrey-1.8.0
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7568160AB5
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:41:34 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc26a.ko.seznam.cz (email-smtpc26a.ko.seznam.cz [10.53.18.36])
 id 20e7aaa9a000c034229394c7; Sun, 10 Apr 2022 23:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1649626892; bh=BZJXU07mduroiOhcKCX952wybJBzymwa36DGJEl2a4k=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:X-szn-frgn:X-szn-frgc;
 b=BjxdCPzettGhkGWWvLzgc26Y7OimDCvhn8+o3y6ueJJA/sO4PaikUQZAZk8aK+qO+
 v2XtmCwZkQZp/XMldaKDyjlhBuyB9hMhI4vO19I+9Bzq+JfzG50zxtY2+XbEoaicoE
 3foc27phjSj++8o/llJeVvCC9eX2WGwYf8SIj6Sg=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay17.ko.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
 Sun, 10 Apr 2022 23:28:28 +0200 (CEST)  
Date: Sun, 10 Apr 2022 23:28:23 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <YlNL99jqJBlcX+tM@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-szn-frgn: <7d89f28c-0887-4969-baad-9c26d5dd8c8c>
X-szn-frgc: <0>
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump revision to 73f826f0
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update out-of-tree driver to make it work with Linux kernel v5.17.

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index a7c3641841..f9772f2a89 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2350a15f866ac82a33c11f9505f2deb0f4aa819b9ac1f4809f8d6893412e73fd  rtl8189fs-e10294d2ded27586149fedee1f834d75477b8b40.tar.gz
+sha256  fd74248b8cc62e54a954502228be221ace6051832a972b8b3005cc05e9c87761  rtl8189fs-73f826f0fa74b2fc1ad67eaf92bf9787947ae673.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 83c7f3ee0d..40b735c21b 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = e10294d2ded27586149fedee1f834d75477b8b40
+RTL8189FS_VERSION = 73f826f0fa74b2fc1ad67eaf92bf9787947ae673
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
