Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2E1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E89401F2;
	Thu, 20 Jan 2022 17:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvpo0T3AqPww; Thu, 20 Jan 2022 17:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA827401FE;
	Thu, 20 Jan 2022 17:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 871591BF40D
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 17:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73326414CD
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 17:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5jqUkFoE2Os for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 17:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F47410C7
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642700980;
 bh=xZ//a2REZ4FE+8bApoppci/+SMlhKTiUy0JQLH/RXJw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=F8DWjiZCyraiZzp4WR70l7u8rjYmXYlTgWRP+vehhR4mkGpdgN7Oo1CX0wJ4KgocI
 WCBXSei3XGloHP77bl4ohyofkTcK3p8cEwU60a+f91bX3JowFmWX9cAI2L2kfjq1Wj
 BtT8jBXy1VWA6Q8v2Sz5NN3b1T6WErP5Qfut5DZY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MnJhO-1mTXVI0cOy-00jFkf; Thu, 20 Jan 2022 18:49:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 18:49:39 +0100
Message-Id: <20220120174939.27055-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:v42nSGUqGf0EPbaFABDWQDRfsFXsPQP1+I5bbG+Jg+E5gIeeey/
 XpygaAaoFr3ANLrFxXAI9045prt6TovV+vuZDkQo9Jc910lHC2YKsZIkPidoKGtIwxbETdN
 8FTmOs9V3HHACpySPL/Bx/5VWvYlCz1ibocncHp5/PrlTpFs34Wvsb1KYWDETXWdrrAaDnA
 zuXH9E9Sw/C9vLPlXYxMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TgU3N7TsyTk=:6RQq8pJqHgj0uuOyxWzqYf
 ljuMvAhPxubd+xkIVbXqmW8ouWJFkG9khoimcj2iSLsb4d+X61ZNVt+omTDAhSs7gyFvueWdc
 XRXZswiQo6wOEKkdyHXoxUqqWO77a/Pn5E+BUto71b6/PIyGM4C17rFUblPaxePQiOmvLM1eB
 2QSF5ujqjpqzUgq4JS1A/Oqd3Uxbvg03RwsNRpTWx00lxIhcUPGd6ukzs0VtZkCCwA+JrCadU
 priUcT5iOTDVfG7ihP7SmAXnT8cDXv2AKc0pmD04oHa4utAl3Z3MWng0QYSwYkhxLtNWf5AQc
 BTaCYXBpour66r2ADtOORgdhTLx+DeEcoIwGgBz8B8kLEXKErb+3jxL9rYUzSm/6vURvzQere
 yr7lt3vOCb6+U9whAV/D38D2632bDVvMlnph5SSTW/ByTPltaTN+Tli2lr9p4rpdSRcXOmFqJ
 /SnCJMDMW6iOrECbMWx9URePcehgvR7c8HRN+2zIy4MnFys8OUaMqmz0/VpLDMRGjef9LF7tG
 9ycVH/ys44oEME90shwZjqyg/kvX8p86n295K7rdzaDdxF6Dqqcer1zJAqJqWEcGKessiKRH9
 mQcNJa6jccPjW0eZmsftZVUcsDsEfNTT9dM2pRQCVaXX2/bypUp3fRFyWBuxpi4/AkO97bO87
 pp/zW0VZhlnvRp5c7ialu4UuUaJQXt2XvOZyjJk2p5/pc4AX3H8Ovq+UviXG2nDwJVjKa+tSf
 bfz0GuZGCodN8LnI+sIQx/3Ool+97qMLtUQ+oIkOOL9oPsCtfOeiIA+4+Phz51VOVucdy9vX/
 ky30tmpOcFyEm40kOG/CkCwLH4u7c8DvvwTJai/MdbvuCy22mFaFp81xxoJSFBjbcquYiu0z0
 8u44on14AIBaMdl8pLRzLVbMPufmzvPXPm0n9qaLROHyzv+SvAwS9q2l+pfznENj/iSjbWu0z
 s/WRiL6JmZ9g/Ff1omfBY6kE5aluBKhBGludYgFiPbyU/MmlZhn5w9yEJicF9680TZZJTmeBy
 ipqRyPusSu11Agicawx2s9ugtZBZiAPz40MN539PoHokYQbHVK4F4NhlKyQcEgfqLNmoru+FB
 P0rvW7fletDjNc=
Subject: [Buildroot] [PATCH v1] package/hwloc: bump version to 2.7.0
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
Cc: Steven Noonan <steven@uplinklabs.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/open-mpi/hwloc/blob/hwloc-2.7.0/NEWS

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hwloc/hwloc.hash | 4 ++--
 package/hwloc/hwloc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index e207a6bb1a..ca77e3301c 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,4 +1,4 @@
-# From https://www.open-mpi.org/software/hwloc/v2.4/
-sha256  392421e69f26120c8ab95d151fe989f2b4b69dab3c7735741c4e0a6d7de5de63  hwloc-2.4.1.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.7/
+sha256  028cee53ebcfe048283a2b3e87f2fa742c83645fc3ae329134bf5bb8b90384e0  hwloc-2.7.0.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 2a5a82cea4..04543a7e64 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.4
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).1
+HWLOC_VERSION_MAJOR = 2.7
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
