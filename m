Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 18:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A749F607C1;
	Wed, 28 Dec 2022 18:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A749F607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_aoE8-pd_qS; Wed, 28 Dec 2022 18:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFC460BBD;
	Wed, 28 Dec 2022 18:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBFC460BBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39A011BF40A
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1058540188
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 18:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1058540188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNp902p5AbsP for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 18:42:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D05084010B
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D05084010B
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 18:42:51 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AbO5pQzWRU5qIAbO5peV1E; Wed, 28 Dec 2022 19:42:49 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 19:42:48 +0100
Message-Id: <20221228184248.3757329-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKemhivaZAZnU87JljpgztPyi15PKlqT06LAxClG00T4uuS7TqcZp7pDWaU5FmXgYEqh+Ssiyz8NgwKYRXiGbWFDYkphbZTc0hWBLyIIqV4JpB5/hXam
 9R3p5e4yb6grUAvwtby0RsR47fs90nX/RvPlLkwxu8eIxXlL++/4d357YbWQMjz4O0Gv6rBPPeQbOSObGMgFo4BPCcviVF4F2TskqReSVPwazBAyYxCWSDC2
 xANRE192x2WPAy2RAdQvWcAPLfrqiE3WpOYhJfl8TLg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672252969; bh=/WJFjHB/c8Lp50JwUKax+4ND3xnJZzESFYG3edtdvQ8=;
 h=From:To:Subject:Date:MIME-Version;
 b=UwqN8u9jNcrKLPpiDfvDp0aVisRBEOzkQ6/kPIV2h5Mm3StGes/VPz/xP5/0cinqn
 goU9gYaynHRdYUCS1eCyIVEVrFFrA5ErexZ1k5d736Poej5Ti0p1Ar1jip4RZDa4v/
 MoimD6Q9voRTVRVAIH+pg6wJAcSnG/YbGuO6hcwaI3L2EaoQXgpim5RYQMGigCk+MM
 a1G5kUdrpJRoqltbui0rjN16Sy5CIFMgiS5zd1UQQhDGihRUUswzL7jMUEyMOdLLxk
 NsH1E+qMH/XizaM/9ExhCHQCuh0c+4fxeVaUeKcVqV/ADvvtUIbS1pec2jfvTUv0SV
 OWUxJKD2ay+yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UwqN8u9j
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2022-12-28 version
 to fix build failure with Linux 6.1
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

Let's also drop local patch[0] that has been upstreamed.

[0]: https://github.com/lwfinger/rtl8723bu/commit/dde7bddfddddb7212f2d9671391e2096d770c449

Fixes:
http://autobuild.buildroot.net/results/cc8/cc84b5f62ca59572f0f52086f157acc0409c03f5/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...uild-failure-on-PowerPc-architecture.patch | 47 -------------------
 package/rtl8723bu/rtl8723bu.hash              |  2 +-
 package/rtl8723bu/rtl8723bu.mk                |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch

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
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
