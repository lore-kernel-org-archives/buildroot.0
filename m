Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E384C43217
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 13:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15EA340B6D;
	Tue, 18 Oct 2022 13:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EA340B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3dlexxIAh4p; Tue, 18 Oct 2022 13:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B66D40B64;
	Tue, 18 Oct 2022 13:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B66D40B64
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9B041BF5E9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8543240B62
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8543240B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XobojXFsEvVi for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 13:15:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BB440329
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2BB440329
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 13:15:09 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kmR1onX9WaWj1kmR1o9Jy1; Tue, 18 Oct 2022 15:15:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Oct 2022 15:15:06 +0200
Message-Id: <20221018131506.123350-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAAcm0Yd+wXDtOtqYFEWKlA9XAtpDWS9j4RTnKa/MNsof0r4HsxkRj/CWGKWN8yyBTTDNs693tmsKxHBx7BpyYfb9YIvdNzP20u2ffMuFRTuHKg+oF9T
 toaFpEsK2q3KjINgvX+uFa4ci5zfs0DncVXoR2AfNVBR9OLbsiXZ3hhladd2MQFEbO+CRHjBod34Riw3dk04qPVSQwgFMtJT7EzMeSJ+GSpzrIj7v+ZLO771
 F0J0z0H/ogz0EGveNYjduJJ07Ln81UeKZqVpwIzU+ba1x1A0OmGUE6gCiKqOOFFNgouDTbJ4Q0XTNS30Pc5+oCR6GaliNJkeNfhokQXOKm4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666098908; bh=MRHRkRUlPHr81ld1Kq9ftdLlkfDoi0PZsFwW09Qnd8Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=VbuVY93fsinQrst1sUaETmy6SNHklFBec0IcVnOytS+KTHIOrLP6aMCHGokhLk/g4
 /H5Bdxc7oK+sVaMewUaYQ1PX9W8ccTBEZVuN+RKDnMs7LwxmMt4Dx7IY7YXAEEh2k5
 aDlSidVtVALJe/PhdXViQ1FGCIZ6mhbJhBcOHF9TzCd/YpYfNqUBnn/FC2GJdZc147
 UvjcurneEyhOfnPaNUTv68cwT76Oc4ktMecBy2qDjKUdev5bhn2Yp87Jdhb4Auv04z
 QmghNkF5ArZ3eKDVAVF3hJMGRpP1NfLqkK3IcAsi+wybRuUfbiZ5VItrc+tZxnviSO
 024Tetg/AEjYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=VbuVY93f
Subject: [Buildroot] [PATCH] package/rtl8188eu: remove wrong description in
 Config.in
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This rtl8188eu driver is not the same as the one in mainline Linux that
still has pending work to be done that in this driver is done, check:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
specifically:
* Switch to use LIB80211.
* Switch to use MAC80211.
* Switch to use CFG80211.
So let's remove the description that is not valid anymore.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 76d9085297..8d68d104c8 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -4,9 +4,6 @@ config BR2_PACKAGE_RTL8188EU
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
-	  This is needed only for Linux kernels before 3.12.
-	  Since 3.12, there is a (staging) driver in mainline, with a
-	  similar codebase.
 
 	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
 	  config option enabled.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
