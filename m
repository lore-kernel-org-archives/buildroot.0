Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6ECC4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 08:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B604187D;
	Fri,  4 Nov 2022 08:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B604187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnbZvGH-xSdX; Fri,  4 Nov 2022 08:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0959D41878;
	Fri,  4 Nov 2022 08:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0959D41878
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22CA91BF973
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1D0741878
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1D0741878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDzKMD6TNmcj for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 08:14:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4AE84185E
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 08:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4AE84185E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C301D87DA5; Fri,  4 Nov 2022 08:14:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Nov 2022 09:06:47 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: bfabad7e35003b6fcc08420624b1196735d1146e
X-Git-Newrev: 36222e99f43b2c6cbcac73942d75b5c6b22d6691
X-Patchwork-Hint: ignore
Message-Id: <20221104081438.C301D87DA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8723bu: fix
 build failure on PowerPC
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

commit: https://git.buildroot.net/buildroot/commit/?id=36222e99f43b2c6cbcac73942d75b5c6b22d6691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Add local patch(pending upstream[0]) to fix build failure with PowerPC due
to a package re-defition of get_ra() that is only defined in Linux PowerPC
implementation.

[0]: https://github.com/lwfinger/rtl8723bu/pull/192

Fixes:
http://autobuild.buildroot.net/results/99571b055e6185d57f89b90821b76099ebc766ed/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9833f110bb7e2b85a362f8c49246ea7349a36bcb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-build-failure-on-PowerPc-architecture.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
new file mode 100644
index 0000000000..06cf2d64c1
--- /dev/null
+++ b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
@@ -0,0 +1,47 @@
+From dde7bddfddddb7212f2d9671391e2096d770c449 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 23 Oct 2022 22:57:41 +0200
+Subject: [PATCH] Fix build failure on PowerPc architecture
+
+In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
+that has a completely different purpose. So let's rename local get_ra()
+to wifi_get_ra() to make it different from Linux's get_ra().
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/disassemble.h#n49
+
+Upstream: https://github.com/lwfinger/rtl8723bu/pull/192
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ hal/rtl8723bu_recv.c | 2 +-
+ include/wifi.h       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hal/rtl8723bu_recv.c b/hal/rtl8723bu_recv.c
+index a2fc82b..39e5044 100644
+--- a/hal/rtl8723bu_recv.c
++++ b/hal/rtl8723bu_recv.c
+@@ -288,7 +288,7 @@ void update_recvframe_phyinfo(
+ 		!pattrib->icv_err && !pattrib->crc_err &&
+ 		_rtw_memcmp(get_hdr_bssid(wlanhdr), get_bssid(&padapter->mlmepriv), ETH_ALEN));
+ 
+-	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID && (_rtw_memcmp(get_ra(wlanhdr), myid(&padapter->eeprompriv), ETH_ALEN));
++	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID && (_rtw_memcmp(wifi_get_ra(wlanhdr), myid(&padapter->eeprompriv), ETH_ALEN));
+ 
+ 	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID && (GetFrameSubType(wlanhdr) == WIFI_BEACON);
+ 	sa = get_ta(wlanhdr);
+diff --git a/include/wifi.h b/include/wifi.h
+index 5dc32eb..23578cc 100644
+--- a/include/wifi.h
++++ b/include/wifi.h
+@@ -373,7 +373,7 @@ __inline static int IS_MCAST(unsigned char *da)
+ 		return _FALSE;
+ }
+ 
+-__inline static unsigned char * get_ra(unsigned char *pframe)
++__inline static unsigned char * wifi_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
