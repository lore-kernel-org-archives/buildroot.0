Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DDAC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 923F182E22;
	Mon, 20 Feb 2023 23:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923F182E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJlAEL6qLFFz; Mon, 20 Feb 2023 23:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8640E82726;
	Mon, 20 Feb 2023 23:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8640E82726
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F14B31BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39353612C3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39353612C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GiD_sL23AnAl for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B8F561774
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B8F561774
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 398448648F; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 20:53:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5a21d2f356fbcb76dd8f96c8c9476401be104e90
X-Git-Newrev: 030cbe37033a3c179c5c51dbd0427cc443efb330
X-Patchwork-Hint: ignore
Message-Id: <20230220205217.398448648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8723bu: bump to
 2022-12-28 version to fix build failure with Linux 6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=030cbe37033a3c179c5c51dbd0427cc443efb330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Let's also drop local patch[0] that has been upstreamed.

[0]: https://github.com/lwfinger/rtl8723bu/commit/dde7bddfddddb7212f2d9671391e2096d770c449

Fixes:
http://autobuild.buildroot.net/results/cc8/cc84b5f62ca59572f0f52086f157acc0409c03f5/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-build-failure-on-PowerPc-architecture.patch | 47 ----------------------
 package/rtl8723bu/rtl8723bu.hash                   |  2 +-
 package/rtl8723bu/rtl8723bu.mk                     |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
deleted file mode 100644
index 06cf2d64c1..0000000000
--- a/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From dde7bddfddddb7212f2d9671391e2096d770c449 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sun, 23 Oct 2022 22:57:41 +0200
-Subject: [PATCH] Fix build failure on PowerPc architecture
-
-In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
-that has a completely different purpose. So let's rename local get_ra()
-to wifi_get_ra() to make it different from Linux's get_ra().
-
-[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/disassemble.h#n49
-
-Upstream: https://github.com/lwfinger/rtl8723bu/pull/192
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- hal/rtl8723bu_recv.c | 2 +-
- include/wifi.h       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hal/rtl8723bu_recv.c b/hal/rtl8723bu_recv.c
-index a2fc82b..39e5044 100644
---- a/hal/rtl8723bu_recv.c
-+++ b/hal/rtl8723bu_recv.c
-@@ -288,7 +288,7 @@ void update_recvframe_phyinfo(
- 		!pattrib->icv_err && !pattrib->crc_err &&
- 		_rtw_memcmp(get_hdr_bssid(wlanhdr), get_bssid(&padapter->mlmepriv), ETH_ALEN));
- 
--	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID && (_rtw_memcmp(get_ra(wlanhdr), myid(&padapter->eeprompriv), ETH_ALEN));
-+	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID && (_rtw_memcmp(wifi_get_ra(wlanhdr), myid(&padapter->eeprompriv), ETH_ALEN));
- 
- 	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID && (GetFrameSubType(wlanhdr) == WIFI_BEACON);
- 	sa = get_ta(wlanhdr);
-diff --git a/include/wifi.h b/include/wifi.h
-index 5dc32eb..23578cc 100644
---- a/include/wifi.h
-+++ b/include/wifi.h
-@@ -373,7 +373,7 @@ __inline static int IS_MCAST(unsigned char *da)
- 		return _FALSE;
- }
- 
--__inline static unsigned char * get_ra(unsigned char *pframe)
-+__inline static unsigned char * wifi_get_ra(unsigned char *pframe)
- {
- 	unsigned char	*ra;
- 	ra = GetAddr1Ptr(pframe);
--- 
-2.34.1
-
diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 9119abad76..6a28c34773 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  07fece152704f4b5dbd0fd3af842816f95824317f3158fea774f15a6eddac009  rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2.tar.gz
+sha256  21372b654886c6d100f46636d7807428698bd618e00db1b8b49cfc3037e46d10  rtl8723bu-f1dbe1c8ccc2c5b2cbeb84da6b9f0e547a84a255.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 82c487b4e1..af1ac9454e 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2
+RTL8723BU_VERSION = f1dbe1c8ccc2c5b2cbeb84da6b9f0e547a84a255
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
