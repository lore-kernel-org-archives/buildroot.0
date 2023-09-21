Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061EACD494B
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 04:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9795060D94;
	Thu, 21 Sep 2023 04:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9795060D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cg8SUyYGBP5o; Thu, 21 Sep 2023 04:20:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0178360C22;
	Thu, 21 Sep 2023 04:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0178360C22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D33461BF34C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC67041FAB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC67041FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiQ0awZzUCQi for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 04:20:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7900E41DC3
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 04:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7900E41DC3
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MtOGU-1rY7tf1Nd8-00urxJ for <buildroot@buildroot.org>; Thu, 21 Sep 2023
 06:20:09 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 06:19:54 +0200
Message-ID: <20230921041955.72520-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:82i01A2z6wyic9Zatg0PqQrFav+ja4LilQ5Qo0NGkRTj/GRu9hr
 2IYMGX58WCXQikmTQ7ZoxySurbKC2gPRlc7o+JqPALb+UCliobVcnKd1uMeeeLXPRjIIaJB
 RDNuliHyOEVmo5Tz+UUHaLpXi7XXWP2Lj3eVw1A6ebXChRs7DzeN9ummHLWT7oFyPmcxQgM
 +bV8aGDhiT0/dR9QgYsdQ==
UI-OutboundReport: notjunk:1;M01:P0:GLhE06KaIak=;lGAKMDWc7W3TUTzs35HipOxmTwz
 R3BKVkaAVg6yHDYYnhKbPD5UF4mANVy3kJ7mjCeI4PCK5KDiQDwcltswvDvWHBTXmBHVP1KpK
 GN5B6my8mlHFk+ub75K5FrJFfQS+R8Bjy7pt7Vi8po4vYZpsTOjj7+ezEdex+Db2MzmCe4xtT
 QO49+uG/Ow7d+ri5tl7gEJE+4VThqzLR2C7oKhkwTzyxywiX6DP9WnNZlMYr6uOVh4/Kk33VL
 dSC+Qq5rIZWgWSiP6icHljOcHkKJBoCeDbjaa8gJn85K0Mnec1Zq/x8NcSHaH/So1rF4S+ZhG
 alxYtpvMUmTBgDOqHqBz3jSj9jLj3INavo0tHL+zf3pp+g4HaR66M/KAuOfvDJE+P+F8yqzn6
 zlJZLZtPcD45mB9hs0tQYgT1fTw2JO/2XK9jq+ZMJBm8G4+hvmTRtZI1S+uH/uUKYlgEcG88w
 j4uqC6vqhyergs41r81rBVIFQA5TERMVEDSRgkJowcAK+CLrS2sJVfOhmLAhgx1+qg769mwFx
 FqbCrhR8hIYJDiVux5qi61qI2WOlseqy7gsaKafeeX8mzvwDOQyllOQ3E7CjR/gLDpX4g6tUi
 tTGNg8KdZfMy8SADtDqCHQKs3aMgmRhbLeoQFwdWJG9mvNeuHyh7i8ZbTHmju60qHtYtPtFTu
 VFdJ8nQLaeZPltDzezXA0MMVVIN+slz02DIYs9shQYHZhYx+xRMvweLVvgryjgVHuBAjb0b4d
 8iXML7//yCwW8l7mgc3Ad0NnBOaMvgGGjqGKa+HiC4RXiOZEl6LVP0eKpB6fBs7+llexOjixi
 I/maJRmc4+Y5DZOnFx5gdao6Xi0iGaH/Bo2UX64IW1KrEMx1lJgrX659biwcnV9y9xUZoM2tZ
 KSDpld7YhNSRpm1Ef70VxYm9kbnzxPFn+ehHXf8Y8xwhvUUEKjPyLwSoJiUwSH5v/RgVQmcLW
 p0Pis25ufNKem8AzCDxH5BaYCKc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695270009; x=1695874809; i=dalang@gmx.at;
 bh=DUgEKq4Sg0P79JwgyMZNKJzcWTPVKoIOmCU7acWqxcE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=uELUzOnnE7C5kgbZASwzP6PSTf/ZszKUyinz+v2AEmmgYHOhn2QQqzC/tyyCjmyCV/LAPpjHcCC
 ZVwXStk1/Ns1ralIZ80HWgz+lk3Bbug4aIOwFq4+7+cpvCSu/npjqjnQvvQMororgc4bd5JDPgipE
 /tQVOyCrKbM+JDN+59LMt/7xMwnK899ijCCwurIZbqZt1LnFOSuKvfZY1Hsh3vx4yRmbmBq+QRQyZ
 hftz3Y1MTeJBlthk2b7b4dhdAMJ9IH776piMmHyhcpZMiCXtLrD66OFlFZ4Aoria9GDolYjr1j2os
 cBWuI/BWTgDEA0f53KG4l7cOFeemWU753Hpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=uELUzOnn
Subject: [Buildroot] [PATCH] package/tar: drop CVE-2007-4476 from IGNORE_CVES
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

As off 2021-05-17 NVD added 1.19 as the first version that isn't
affected by CVE-2007-4476.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/tar/tar.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 80d7495b00..690a5952ba 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,8 +13,6 @@ TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
-# only tar <= 1.16
-TAR_IGNORE_CVES += CVE-2007-4476
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
