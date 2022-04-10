Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B42C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A4A60F60;
	Sun, 10 Apr 2022 21:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bF3N85JiULJW; Sun, 10 Apr 2022 21:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0BCB60F9B;
	Sun, 10 Apr 2022 21:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E20B1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E772E4160B
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=email.cz
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97TW7RxBR4Zs for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B17241608
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:22:19 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc23b.ng.seznam.cz (email-smtpc23b.ng.seznam.cz [10.23.18.31])
 id 03f6ec7f831186e20182d211; Sun, 10 Apr 2022 23:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1649625738; bh=loH2XOAhVaeQ0NBCYtYGK2L3njHYZ/AcdCP76FWoLSM=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:X-szn-frgn:X-szn-frgc;
 b=Wr+yVqnQQ2IvCyvtwedoiIYv4uKpT0mqkZV+jzbmiS74uWeZRGgka+i0Uhz1NlnD+
 JeCNOLvy8OVMiWYEaD8zEJs4RbfUgwC4mTSfOrQtisu3aLkK4kX1d4GYM16L3B487D
 AVYbbPA9AfJnAv2rDlAA3ZrTYFNNq67I+bYXBdnI=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay7.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
 Sun, 10 Apr 2022 23:22:13 +0200 (CEST)  
Date: Sun, 10 Apr 2022 23:22:09 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <YlNKgT95suqPFum7@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-szn-frgn: <a54ef8a7-a038-47f9-93ce-590efaadaef6>
X-szn-frgc: <0>
Subject: [Buildroot] [PATCH] package/rtl8189es: bump revision to 39c17661
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update out-of-tree driver to make it work with Linux kernel v5.17
(and older kernels not compatible with previous driver version,
like v5.15 etc).

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 624c51ac0d..d897e5e6c2 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  bf972b6494844c66885dc6846228994fac6075477cf9a7122ffd521e25ac791c  rtl8189es-2c8d44ae26485052f39d933a3a132b3ff395803a.tar.gz
+sha256  74325014c1a8503b3a7e48ad06997baddad8c1dae86bb79f4368532cc3e75fb2  rtl8189es-39c17661136da48f8e9c644194dce6a7f5076896.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 9e4053ae83..51477ccc97 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 2c8d44ae26485052f39d933a3a132b3ff395803a
+RTL8189ES_VERSION = 39c17661136da48f8e9c644194dce6a7f5076896
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
