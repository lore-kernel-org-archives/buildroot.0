Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B950C3A59D
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F38081402;
	Sun, 23 Oct 2022 22:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F38081402
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ki-FUpDMzZZ6; Sun, 23 Oct 2022 22:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782938139A;
	Sun, 23 Oct 2022 22:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782938139A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D18001BF3F9
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 22:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8714403CC
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 22:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8714403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipWd2ktDFK65 for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 22:14:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98C294038C
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98C294038C
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 22:14:27 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mjEfoYayHJpY4mjEfoOKdt; Mon, 24 Oct 2022 00:14:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 00:14:25 +0200
Message-Id: <20221023221425.395087-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCJG5/GiHcfj3zIHhuwgY0PwHxy/kYOS+N6ms1qfna4RyENfD+D6qp/bwLR9Rqg2+HM97vPLGFvRlq4FMHkF+lo2XLYWUaLwNehp+hcvA7BUqI4H0qh1
 +3w4/m/7LbAOsxlcTafEDkhC6xwtzXK3EuGFS76nFNYgKrVFKOQzAyK18WFWIgP9VVrsqcdPk3cQNMvVIk30+0a3G2i+QtdT/vpEFqTbgqgSXEd9zp/dYBuO
 5w2Opg3V9yBcMZhtcUZgGxwX2P7+rHjgJFGU+aTy+lALbpDBvreCYX07/d3rtB+X
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666563266; bh=H5d+D2ZudxNZo484PQInOzW1eN67KCn7AqG7Cma2nQM=;
 h=From:To:Subject:Date:MIME-Version;
 b=oF90gYX/VAC1A9Q4Nd+Tmgwwd2bWBh8PvOioMEbwx7SP6QxXgSU70muz9o7MdJnEQ
 hTB5q5kSejc6ftSbQ7A3AWgLWAlgFWnF964QVPahJcKsstorn6BDnY0IyyRATaXyzS
 XL+Ij3B/VhE6tY21P9SDG77VUEmztkXoUtCyjD+siUG5emW8mAgWEorw8Gyveb7m1q
 05Tl936U0ijYbHssZmoLwpfsvGDXvdrmfviFvtFnMmm20dQXXDWlg9nA22+rFyYP4H
 1AZgv5GkOl8kH/inhYKARkwfGK6cCkCSRt4t1GWcZjL0P0NsDPUMa9rbT9LfJvH2eZ
 tCMM+safJilBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=oF90gYX/
Subject: [Buildroot] [PATCH] package/rtl8723bu: fix build failure on PowerPc
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

Add local patch(pending upstream[0]) to fix build failure with PowerPc due
to a package re-defition of get_ra() that is only defined in Linux PowerPc
implementation.

[0]: https://github.com/lwfinger/rtl8723bu/pull/192

Fixes:
http://autobuild.buildroot.net/results/99571b055e6185d57f89b90821b76099ebc766ed/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...uild-failure-on-PowerPc-architecture.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch

diff --git a/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
new file mode 100644
index 0000000000..2665a6d031
--- /dev/null
+++ b/package/rtl8723bu/0001-Fix-build-failure-on-PowerPc-architecture.patch
@@ -0,0 +1,46 @@
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
