Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6933BC05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 12:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC0A2408E8;
	Tue, 14 Feb 2023 12:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC0A2408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gyjSnijLIBpT; Tue, 14 Feb 2023 12:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B8F408AD;
	Tue, 14 Feb 2023 12:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4B8F408AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 714E31BF424
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 12:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B483408AD
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 12:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B483408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVfAPuobrBqj for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 12:15:19 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5386840888
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5386840888
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 12:15:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ru6TpAP8mZOVXRu6UpYCeh; Tue, 14 Feb 2023 13:08:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 13:08:08 +0100
Message-Id: <20230214120808.1282621-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJSo/JeBH20QTMeukvAl8WRq3eruMwhLQEaqIG046+C1Es/SVMLZSp9jE2hf66/RdvFIKeSg8fW305i9DaRxURvWiYZ21dISyARoCvDp91egcxgO4xs+
 V2duEJuL6ZbbBbg6bSI1+X8lfZqzdR2UH7OyBrC3wW985Gz5YTL+TTFTNPuky0JJaEdnXoGYZ2fDgVBDM7APo332LWdqvuu8xCNgLWAm0owZOsxFyTzgHS2i
 o27yEtYh0kTEJOD3ZaiugNP1OzFogHDl+Oqul89WgzGXzywlBs9mB8lA2HCslMUy
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676376490; bh=LwBIrs6tyxGzJc3pFwLYnKGRUxgr6x7HD77GZAFMTyk=;
 h=From:To:Subject:Date:MIME-Version;
 b=MpZRjz3naydBpilv+XrvKpSfJAkOXdq4CkwBGjF8+jDrJlGbBRDKi0+qs/i3Sjpzo
 a3g3xDqPW9iKSyn4xtIvhrfpLVwDj0plNqDWbSt5uSmIyqGG5+2PDFJx+69JVpnvy/
 lbRKuVdlkL92vHOIVzLo8Wi2y4hFxeVTmp4u1ERRNeWeq/nJWHHS6srWYBXHxqUA2n
 fkzxUTPI9HK2pIZ5mGyZggAsl1lifmrnxeu/eHHYE85XCC/NqszgmS0lfW0cXHgDzx
 KFoZaVVg+8REPCQHH6P87zCGx0dRAgXJoUIt875vMmVFvD/6edFIuVa5l4v1ikIYen
 7jCL41Y5Z27Tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=MpZRjz3n
Subject: [Buildroot] [RFC PATCH] package/Config.in: move all Wireless Driver
 into a separate menu and enable them only if architecture s390x is not used
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/Config.in | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e0792bda55..a70a45f50a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -582,16 +582,6 @@ endmenu
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
-	source "package/rtl8188eu/Config.in"
-	source "package/rtl8189es/Config.in"
-	source "package/rtl8189fs/Config.in"
-	source "package/rtl8192eu/Config.in"
-	source "package/rtl8723bu/Config.in"
-	source "package/rtl8723ds/Config.in"
-	source "package/rtl8723ds-bt/Config.in"
-	source "package/rtl8812au-aircrack-ng/Config.in"
-	source "package/rtl8821au/Config.in"
-	source "package/rtl8821cu/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
@@ -632,12 +622,26 @@ endmenu
 	source "package/usbguard/Config.in"
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
+if !BR2_s390x
+menu "Wireless Drivers"
+	source "package/rtl8188eu/Config.in"
+	source "package/rtl8189es/Config.in"
+	source "package/rtl8189fs/Config.in"
+	source "package/rtl8192eu/Config.in"
+	source "package/rtl8723bu/Config.in"
+	source "package/rtl8723ds/Config.in"
+	source "package/rtl8723ds-bt/Config.in"
+	source "package/rtl8812au-aircrack-ng/Config.in"
+	source "package/rtl8821au/Config.in"
+	source "package/rtl8821cu/Config.in"
+	source "package/wilc-driver/Config.in"
+	source "package/xr819-xradio/Config.in"
+endmenu
+endif
 	source "package/w_scan/Config.in"
 	source "package/wf111/Config.in"
-	source "package/wilc-driver/Config.in"
 	source "package/wipe/Config.in"
 	source "package/xorriso/Config.in"
-	source "package/xr819-xradio/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
