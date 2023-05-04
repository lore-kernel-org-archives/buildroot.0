Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71D6C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 08:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 551B783D2B;
	Thu,  4 May 2023 08:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 551B783D2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwB72dX1bB7I; Thu,  4 May 2023 08:34:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D69C83CE5;
	Thu,  4 May 2023 08:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D69C83CE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2D5F1BF3D0
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 08:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98597614CC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 08:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98597614CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0r0JKyJoTnsX for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 08:34:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76351614CB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76351614CB
 for <buildroot@buildroot.org>; Thu,  4 May 2023 08:34:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MKKYx-1pfHi43SKV-00LnA3 for <buildroot@buildroot.org>; Thu, 04 May 2023
 10:34:00 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 10:33:32 +0200
Message-Id: <20230504083333.3966-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:BIP/x5UjF+vuVQSAstmQg9Qxwn1uR19RRJPo6f/zLwe/QiofSz/
 DsY5Pz8vbGCWF0JS+aOf7DUZu80gVYqfcfbTyeVhmjk7gTMZGfKnlW6xZMZhl3feee8pJV1
 3ucbRpBMK7ZHZCGWV1wqJLJH4dcQtICSw7ltLUladR+Xhy3CFDKPmyxoO7GhbnljAi66Rkf
 UoaumBTrvK90Haq+v57pQ==
UI-OutboundReport: notjunk:1;M01:P0:QUI65zqtDUc=;NbeJxwewMEygqd1obdTgIK8j/CW
 lvIAwgXaWXVkxpjxi2xsP4uh/HFPa+YXLYNvhhtmyXh0SlaaSu0OE/jh8llB7ASnORLwZPCoG
 h9d+6a6f4gEt9HjxwOsOS8w+CKemKikeL51+zbGVx3oIVllucMb3f3+PfG+f8pBFd1+t0YEoI
 6Qb17dQ8Y1qaFfs5NaPURHhGu+dKYNEd9hFzpl+lfbQufIbQkDjeoPhw5g0+U7+GsAL3PhXSY
 6qYnpz13Adzvpi2FsDhBmoB7o8UtNHGcE67/tcQcgYT3U3uY4EyWkEJbd5GdNvLdi78YVTMTk
 MH0W0M/Ii6YIdGN/FggT4CI+JNtNvHAstP5iwVNVjf/aUEzLeaVcoa4ORwjVxMIIqfB4XGxID
 voofFjnP8xRWs1TJRk+/jIGDt9iNrCWMU23J3TGgiN24eTc2oqw67g2k58Kn5YJ/IFvjzDS8Y
 Kfy67iPmj7+DDWcvJ5LlWt8FrlrC2TW5tPPHBAJ7H3+h0/ef/uIsEPagVxlodPsbv/Vm+vhkC
 D0HVfas4ncQvYlOLhQJj/fxaR4CeucOIgEkm8ZFCiBlFRtIN9OndOGQthoGsDSmpJ59mLr49u
 K31WnLGvSuZPt/r0rZp/iDpY3vHy2O1nACdiBjJS2MLGtMD4fqvSiKldFhTFAdhUmaM2pxDHK
 7d6gGAtYrd1KeXRw3bJzHrw87ozIioTBOM78so9JBLhzWPgxswVCYSeG6NhJ/ALEEZSYmH3ms
 YQChkW9QI4SIxAnafQt+VIU3Gz+gaGUNAxlSokSqTLfaL50vCXeQ99pIkNtoplEhLvEiH9LP8
 MZ3gYMyRAp8e8YnfLlATOnEPUlMbZu2QJpEF53kwxgaGE9XKsQXrq6C1xY40ixF328eLQ1T+I
 Xw0BGcxIYYI+3wthU7kfxm2Ss0V44om2aB6c27qvjnNQlkOypWwEjMrZng5P5wpbD84U3OvKn
 Yr5hzZM+QF93t80QWupjHjdKqAU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683189240; i=dalang@gmx.at;
 bh=KXWmr8TYCoO+jmxzxtuamSiR7GvWQZlDeIU0E+pXxG0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=rnfFa3cxKO/efEJVfIqptrSjXFZo7JLMsO5XSJflfNkXK+ZV77k+skEjF9OG7cckW
 wItvenIoniJUP+LQiHN5ypJfekJZs0MVUbJIgr+Egavd0RevEg5gmV4JeEx7t/ebNi
 9yRWOfLzmdK1TKpYHU8phIB8OgwScaEuz1qxRUK2D5rqAG0KGEKHDY14fEcskpQKML
 W4oF914v8zsbDgmnQhfycmJH7OpggNxYMMuodcpH752ejTZi2+kivgw/QnlmqW66DK
 DU/zmONegbnPqh96SThK+TrTtAAAKUNCZVUIMZBSYD4/NOs39kW+fD6CQT7gadiQ1V
 RMQT/KOl//UIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=rnfFa3cx
Subject: [Buildroot] [PATCH] package/dnsmasq: fix CVE-2023-28450
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds the upstream patch that fixes the CVE.
No new release so far.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...default-maximum-dns-udp-package-size.patch | 64 +++++++++++++++++++
 package/dnsmasq/dnsmasq.mk                    |  3 +
 2 files changed, 67 insertions(+)
 create mode 100644 package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch

diff --git a/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch b/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
new file mode 100644
index 0000000000..4dd17ec069
--- /dev/null
+++ b/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
@@ -0,0 +1,64 @@
+From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 7 Mar 2023 22:07:46 +0000
+Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
+Upstream: https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5
+
+http://www.dnsflagday.net/2020/ refers.
+
+Thanks to Xiang Li for the prompt.
+
+[dalang@gmx.at: backport from upstream]
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ CHANGELOG     | 9 ++++++++
+ man/dnsmasq.8 | 3 ++-
+ src/config.h  | 2 +-
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 3af20cf..52d8678 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,3 +1,12 @@ version 2.90
++version 2.90
++	Set the default maximum DNS UDP packet sice to 1232. This
++	has been the recommended value since 2020 because it's the
++	largest value that avoid fragmentation, and fragmentation
++	is just not reliable on the modern internet, especially
++	for IPv6. It's still possible to override this with
++	--edns-packet-max for special circumstances.
++
++
+ version 2.89
+         Fix bug introduced in 2.88 (commit fe91134b) which can result
+ 	in corruption of the DNS cache internal data structures and
+diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
+index 41e2e04..5acb935 100644
+--- a/man/dnsmasq.8
++++ b/man/dnsmasq.8
+@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
+ .TP
+ .B \-P, --edns-packet-max=<size>
+ Specify the largest EDNS.0 UDP packet which is supported by the DNS
+-forwarder. Defaults to 4096, which is the RFC5625-recommended size.
++forwarder. Defaults to 1232, which is the recommended size following the
++DNS flag day in 2020. Only increase if you know what you are doing.
+ .TP
+ .B \-Q, --query-port=<query_port>
+ Send outbound DNS queries from, and listen for their replies on, the
+diff --git a/src/config.h b/src/config.h
+index 1e7b30f..37b374e 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -19,7 +19,7 @@
+ #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
+ #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
+ #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
+-#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
++#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
+ #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
+ #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
+ #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
+--
+2.20.1
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 58c5390433..9c05857f22 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -17,6 +17,9 @@ DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 DNSMASQ_CPE_ID_VENDOR = thekelleys
 DNSMASQ_SELINUX_MODULES = dnsmasq
 
+# 0001-set-default-maximum-dns-udp-package-size.patch
+DNSMASQ_IGNORE_CVES += CVE-2023-28450
+
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
