Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B79EC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 18:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED408417A1;
	Wed,  5 Apr 2023 18:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED408417A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1VvAYfi86xi; Wed,  5 Apr 2023 18:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA12B41774;
	Wed,  5 Apr 2023 18:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA12B41774
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34ADE1C2B98
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 18:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E35440376
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 18:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E35440376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4uip4ti5DLR for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 18:39:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76A6040132
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76A6040132
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 18:39:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.40]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MIMbU-1pegWS2LGG-00ENwK; Wed, 05 Apr 2023 20:39:28 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 20:36:12 +0200
Message-Id: <20230405183613.18906-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:CU2jq3M6o84ZvaeC8Z//R7LleGzga8MEjl6ve/vx4A4U3ZRlVG5
 JR+AdouTz+9nhnjSGPJ9+g7NWzhYWsdHvh3iSgZbswlwbotnP6vVhBbAkvO0pxstwijAHiH
 kWaqzkTSZ/YIwQbXXf45uD2gavdmbtWZgTYwqFsvJAjc0D4NP5S2lceW+T3p1MJ/IwbmCE9
 1Cn31AJRd9sfN+hIoFrVQ==
UI-OutboundReport: notjunk:1;M01:P0:TR0b1YY4NRs=;XxxbVBiMscSuO1a3nM1rEcURq4Z
 w4aLquE0aaEC9P4/x21QWSw8+h3G7sxMWU1hcXVH8GFbBn4k9g8fl+gCV/CWZ7WYdga8NFoYT
 Cys+yxc4jDdl0anbB4oCBMKQJPQegHwPTtcbZhIjMlYNpvw7x/Mxabv0BnhCegYCeIweJcy6C
 w8gn5cyP7df4NSPfcqvW7233oyKVuz3W6D9llZXl0JnJUVk+TFtFJO+5Z4UJJZanTE85gk2P3
 pb882PXOFPiIdMffz8CnfhQscIe3D6gz1Zm9G1uSSTgTxnQ38097zgCLjYm5tGR6Btg3t92qZ
 vA3PiH+DWrnxjkzWxmuP5VCPoBP3s02BTadVxEuRd0hOh7c6J0NUrcz1KhqVlsPc7HPa2L/3H
 1kFMjiMGp1vZ+ZkAMXQWR8jCNk62igWGkh7jNuzZfUnAz9EE5ELyFq7gR141tKLp1gJEgtAqX
 worBOGGXwIyVH5KUR3lzNIT5o2h16mN1A0OKMegYBRQYxuYJaF1L+pkK3GIGskPeehTekZxCW
 W2b7MWLisBpEksZlsdE3TkIgVpmGm85gi5TQry7Rs0mRU3aEiCYbdAnT8Pe9enb2C6d9Wz9tY
 QWYAw7BLPwo8rdi1/5rpGb36e5QQKwj1ziv+ZTEX/rmhBw3Kzl3S7DIjTzUmcauP6rR7+NhVp
 0Z7rCbHHbuEejYT8K7atzbrDC4aVwvxiHygMvyXUFLgIPzKzUH1DGsZ3ZnV7Fst+NR3lY13yY
 eWwjtFn5KGvM5brhufV/TF8bh3SyqVERorGHPuyygm4WmIdneX1pyDnRAVOkQ62hElQ7He/aA
 LkC4FvmzZEEysXZ6gHqv/rAUOPU4Sv6jbMAc6MhzERa0F2zK3NLef75OkZVJ3lqkL59b0EW7J
 n7aYimmr7VO8URYUPTknVrFbGFqwPpJTgC8cleQ+5mtA1o81cdTZEHQ/WVkGMcU7iZ2iYBwv1
 H0NszdSUgDJk++E5fCORKNTcRus=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1680719968; i=dalang@gmx.at;
 bh=GrqqGjkOXEPVWfF8pT+oZSUag4nz+IdtwIWx2MW9+nk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=LzjDEdv7OZhzX9GLDtGzSM2K/XTDo0lQGK3Im2u1IN6RC5QadjB+cnWgcg+srnPcG
 sTVCeOegFaXPrVLWOLCWxIdq33EUyKVpCOWQ4N+C96hci4WgPecV7O2gCU9ehzEKZB
 IRBBNHpcOnD2TICnRmiSfi7SFZeZZR5h3dh9QJDW2gmZU4s5CTwURrSP+NS/eJ3Ur0
 RLVTTgoAZVEVEw01NKsg/TQB6crliUhZOUS9vBKVM4oPMZhLwIRozqy0LAtJ2P3sno
 Dl/gWM97xltFKdtlSZWSdVm67iHmzAz07J1Whwr/WGtinVCfvz48RaN1Kt1NbpYoOY
 cxrKRZMDMJg5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=LzjDEdv7
Subject: [Buildroot] [PATCH] package/pangomm: bump to version 2.50.1
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.50.1/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/pangomm/pangomm.hash | 4 ++--
 package/pangomm/pangomm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index 0fb40e6568..dc606c5de9 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pangomm/2.48/pangomm-2.48.2.sha256sum
-sha256  e1d75522c53f462799875cd247f9b49c91ced4b1abe68387ac35b271392d4ea5  pangomm-2.48.2.tar.xz
+# From https://download.gnome.org/sources/pangomm/2.50/pangomm-2.50.1.sha256sum
+sha256  ccc9923413e408c2bff637df663248327d72822f11e394b423e1c5652b7d9214  pangomm-2.50.1.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm/pangomm.mk b/package/pangomm/pangomm.mk
index e5b237197b..64ac625b7f 100644
--- a/package/pangomm/pangomm.mk
+++ b/package/pangomm/pangomm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGOMM_VERSION_MAJOR = 2.48
-PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).2
+PANGOMM_VERSION_MAJOR = 2.50
+PANGOMM_VERSION = $(PANGOMM_VERSION_MAJOR).1
 PANGOMM_SOURCE = pangomm-$(PANGOMM_VERSION).tar.xz
 PANGOMM_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM_VERSION_MAJOR)
 PANGOMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
