Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671F1ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 15:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BFF812A7;
	Sun, 30 Oct 2022 15:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3BFF812A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrcYBT0i4cLz; Sun, 30 Oct 2022 15:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC49D8129E;
	Sun, 30 Oct 2022 15:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC49D8129E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20C741BF47A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01C1D8129E
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C1D8129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4J_Mr3YBAEv for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 15:56:07 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8556981297
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8556981297
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:56:06 +0000 (UTC)
Received: from uxmal.fritz.box ([151.71.224.230]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.17.189]) with ESMTPSA (Nemesis) id
 1M3D7V-1om8Bb2jID-003eRt; Sun, 30 Oct 2022 16:50:58 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 16:50:32 +0100
Message-Id: <20221030155032.197144-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:5y2hYbf3TFKwMarciGTRpcdgelhgs+MjkIH6aItfT4gzRa/YWiP
 MVWAZA5H7RinekJUP1Ec0+qM/HPo9+pacnngZzrh8bgQ2H7ZZZPnJLysErpbePaOndjnBOc
 tAIo91NgwO0YlmgGCZVpZUsPloZoMy/hmc5lkAPcfZQafmG0mHQjqTfDZt3MRK2b0zcgGcg
 MJRVLza9FNHdRzkEU3/0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7yWR4pCf2GI=:B6adcIIVBkDbk4smdGgJO3
 HkqzBe1MFZXT7//zMRq1YMN20/Jb0a7fPLdmN9LTPux2zMfcMyw3mEAKjQePgbel5bBJL8pJf
 KzYnqEGvuigbCdfMRhvynmFKOoXnmi8/VKTdPx7DQMABljCmmzWsUR/N+lINi3PlGw7fXvI0l
 L7Tm3sqoKojjSPsAmmM0wyQtGAFp+Qll2Fgtzi7A6yX9ZNzx3antKrfzIWj2UEb0nXoIB6bH4
 5253xxSWo6ApORhjqUzWj4fZbeoTiICeX0SvUoz/gDxycI36h0/3y5uPzy7olyyF250H7ez1S
 gmCopGPJMCIPw/heVxaCrjKmfFq87MBSdcFien7xYRWcKRgHMGH0MxSCdnU9JKlHroOP3pIU9
 yc5sAWCPkxfWxri+dBdsiiblWmPDMXZ5SXFuSjMc2fDTSsDGushFe3xQvO4YS2DBigSz6z+6T
 DvyCiMlKEOuYNRyZEVn1KbuByld3hReujsbYD6Ip6x6xBoMr7WXHiKgw8qBxJ2yuL7OertRa0
 NtzOUJFHLCqf68b3PHzJN0wo4tny/0mnQ6kA5nkGVZawJws28SRzLR2WkZwxX8pzzH7zSkp+2
 NPPB5dMHwKp5BUHXXe+GShlEBKmvce97sgiirajNub8Xy/wn5vJNn2N1EKWBJOo/8cMQKBdyM
 5Rrt1dqYhH0GuVtbZkgtlDyoXaBRfqNk82Pvxg6hiXQAOufoySXBrxxDpakXKZWpbjYa34fD7
 vVIOfOm8zvcO2Z4+NU8g+2HtUytwNvXXN/AVBJCuGjAHHFyhO9HOfP44vKnKb++RK5TrkOmNA
 d5RmXIJdR8z5UoeF2cjKmeHyin8hw==
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump to version 8.2.2
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/bdwgc/bdwgc.hash | 2 +-
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index 4276939083..ca094549c9 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
+sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
 sha256  0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index cefa975998..e776fb7458 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.0.6
+BDWGC_VERSION = 8.2.2
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
