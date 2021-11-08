Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2BDC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:47:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE5D61105
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAE5D61105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E5480BA3;
	Mon,  8 Nov 2021 22:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnbJDHIa3oMc; Mon,  8 Nov 2021 22:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B970580D86;
	Mon,  8 Nov 2021 22:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F39EF1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E316180C20
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Dj64ak5I16s for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:29:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E4E880BEF
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636410543;
 bh=GEIDugDlMSRCIf7oPpcDyAKy0vL3S5VuFE7kOLp0MTI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=e5T+IPVdxlecCktUMtddqkyNP+soKQTJKzPudMpZDKG+JVluNMYM1nPWNHIs9Jv7+
 JdPoR3/2tuU7LDygRtAaxUvD1OJ4keygMD6eGlJxbACzr4kkaz3JeW2ucXP+/X647E
 bWV92un+P0uorjtrmMAKbHIxLutWiyvhkV0UDdVM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.202]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MdvmO-1mCWTZ2tug-00b6ki; Mon, 08 Nov 2021 23:29:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 23:29:02 +0100
Message-Id: <20211108222902.29000-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108222902.29000-1-ps.report@gmx.net>
References: <20211108222902.29000-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xgt/CufaZvIWpez5bfY+KuinJnQrlBrav4CTBmEVD/rN0x7Xmsh
 m7VC2lJJYwRHDjJDD0GwZqTOlV0aVNtZSraKkRHp263PPKfO0Wo1bbtE1zex2lwd1ExfAKi
 rbPFa+t55TRgbDTQ6hrIyGaYKPU/lUAQxV9FNG8npy2fNvcj6WCGfXZrY/VCJldtromEaVn
 pSQyLHGkP4RGwCblfZy+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GfEE7vTiZ7w=:1Xpq7GISBBa4hU3+6ARooB
 IoYO4u7UNm+mfg/USnLg2yUMttzCueMtJkZcLD+BzaLgCcWCzWV/I70FV6GLt4tkjaCBTicTA
 2yQhgeag4wqzUX4pysTb8uM/UxuNKsfU0BpUh0TGdQOaAh9D8Z7FOgvTIOmfcDG1UOj8Qq+WE
 r3CWN50nn3t9M8azk8ji9EATSA2SrBrZ5TIPjNpodK7P2q6M1w4WcRnVq6aDOCiB4zjdpjNeP
 C25Ic/HChgoGWES7bhQ7ZhPNzjp9LWycFRWtlC2y5nCOWOcfihuLiEDqeqrk+c2uFquP+rIK8
 XgiXLEVmf3c4NAxliGMAVTQ1I7/uTqY1fwqSTtRRnTLCV4d4oT2Pqdu7SxQn9ePbcuf0NH2Az
 7k6XmOyBsyuiUHQdfNvz6yDwgwaPeonogaFfgsdyUc1gTCMg1h5wfoHv6K3zAvassXNWC4TLQ
 oF9KQijwRiLV+EYVF9tkSM1nz3X3E1mr5ILgBCtfuqK11ojS/l/brioWL7Y2vX9LOTjzLzAb7
 g5+REtX99bfPrI3wqOb9SgGovRsgoWEskSdje11fmjSaPqhagQC5z07V2SMRmq1PEvWUraWdp
 9OMyef9KSuTRGcf298EYkf4gKLpQiJuxKk4LBWQQcDxJlNGzNnKLo/YOptYx/9uYao3BDWR3u
 iGFgMK1AyXSdLoZSX2LC8sRre/Te1C6L3PNWvNcQaIrDtk+kUUvdEFH/pUEH7gSYpxnv10WMX
 FIzMz7Sch8JAHV6nOXYMjFlrOwD8fJKsA9f+53VZNW4b+o5/LRCtOAlGGVsvGvw6aFys/lGJe
 +CDhNirZ8jBUC96Asw9Cgt92uud54gc2Q++hfnmBR2mzFxDGK5Xi2vCdaVzPTBKzV9rg4IgcD
 +ZjOGanaHn/d/nOX2SIPaM2+AQeQabkLaDefw1TKiCY0gA5a9ZwBYs61q2Dggnr0yllN3aLVj
 iZkCfCNRjSLX/3aSOhJ3TcL9ZxlwQAKxn2SM/E14kuREkAQc6wOxmh0XlnmgKG30CcrqRzpjl
 R5TivorZbd59OD0dwtYTig78edemQIMbXQC4QRW2RVLkiVTQEb6Zt5HtiLgmT/sLobYCVfXwa
 NVbmk/ShhXS49EiYUAEHeHJ/wJunoY1Efvrtbbf/0ZRpjnfm+Lc0AeyLmRIeabQdrep8D2TxJ
 RACuudQq6SVNPmbEjazvuUh2EJ
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.19
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- removed 0001-build-Add-reallocarray-to-missing-h.patch
  (from upstream [1])

- removed 0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
  (from upstream [2])

- Changelog (since 1.18, from [3]):

  ver 1.19:
    Fix issue with handling OCV if offloading is supported.
    Fix issue with handling SA Query on channel switch event.
    Fix issue with starting FT-over-DS actions after roaming.
    Add support for OWE transition networks.
    Add support for extended key IDs.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971
[2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7
[3] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-build-Add-reallocarray-to-missing-h.patch | 55 -------------------
 ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 -----------
 package/iwd/iwd.hash                          |  2 +-
 package/iwd/iwd.mk                            |  2 +-
 4 files changed, 2 insertions(+), 89 deletions(-)
 delete mode 100644 package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
 delete mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch

diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
deleted file mode 100644
index ef6114f1af..0000000000
--- a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Sep 2021 21:17:44 +0200
-Subject: build: Add reallocarray to missing.h
-
-reallocarray has been added to glibc relatively recently (version 2.26,
-from 2017) and apparently not all users run new enough glibc. Moreover,
-reallocarray is not available with uclibc-ng. So use realloc if
-reallocarray is not available to avoid the following build failure
-raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
-sae.c:(.text+0xd74): undefined reference to `reallocarray'
-
-Fixes:
- - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac  | 1 +
- src/missing.h | 7 +++++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index c6250401..51d9da93 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
- 
- AC_CHECK_FUNCS(explicit_bzero)
- AC_CHECK_FUNCS(rawmemchr)
-+AC_CHECK_FUNCS(reallocarray)
- 
- AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
- 
-diff --git a/src/missing.h b/src/missing.h
-index 2cc80aee..a5b92952 100644
---- a/src/missing.h
-+++ b/src/missing.h
-@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
- _Pragma("GCC diagnostic pop")
- }
- #endif
-+
-+#ifndef HAVE_REALLOCARRAY
-+static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
-+{
-+	return realloc(ptr, nmemb * size);
-+}
-+#endif
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
deleted file mode 100644
index f6b3d24516..0000000000
--- a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
-From: Andrew Zaborowski <andrew.zaborowski@intel.com>
-Date: Thu, 16 Sep 2021 01:58:29 +0200
-Subject: netconfig: Remove usage of in6_addr.__in6_u
-
-in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
-the headers shipped with musl libc for example.  The POSIX compliant and
-universal way of accessing it is in6_addr.s6_addr.
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/netconfig.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/netconfig.c b/src/netconfig.c
-index ce95db0b..421270c9 100644
---- a/src/netconfig.c
-+++ b/src/netconfig.c
-@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
- 	struct in6_addr in6_addr;
- 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
- 
--	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
-+	memcpy(in6_addr.s6_addr, addr, 16);
- 
- 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
- 						INET6_ADDRSTRLEN)))) {
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 7c010ed891..008a2db011 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  0225ab81579f027e0fcbf255517f432fcf355d14f3645c36813c71a441dfab55  iwd-1.18.tar.xz
+sha256  dd65a8795f6127fb1b9e29f2092686b0590a0d3738c2b90c792ccd320deaf966  iwd-1.19.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 96bdc56e93..afa6e3bdeb 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.18
+IWD_VERSION = 1.19
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
