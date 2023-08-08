Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A02C04FDF
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B79882072;
	Tue,  8 Aug 2023 18:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B79882072
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQ-jovA4e26c; Tue,  8 Aug 2023 18:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882E382050;
	Tue,  8 Aug 2023 18:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882E382050
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B22AA1BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE4A60D80
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE4A60D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQzY5MfgFp9z for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:47:16 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34BE160BDF
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BE160BDF
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMGN2-1qCSql0KCE-00JM3f; Tue, 08 Aug 2023 20:47:13 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:46:55 +0200
Message-ID: <20230808184657.4041-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OjF1KWW4EU6ralkq+c0XXBkLn1NeqAJdzyiBncXCj3CUOnBzXpB
 YKQM/2G3ypgh7lVDcQ1p26kQY7dhnFDX4y9+mu2+R3jDStOAJ2FnBYhmwmsE9OIgusgRI+G
 fERl3nzW2jpnMVYn+WHgFf6jTprYI5DEa/Z0AcQe9ymnWIHDEvZJx6UzXfij28wMU8OL5wP
 ybUIUNRF8zSHWuN76SFQg==
UI-OutboundReport: notjunk:1;M01:P0:tHbmQZy8mj4=;y3qgM8/sGc+HN7Tqf8x4bNQEmgl
 Tp3u50g7mzQvRJK6JqSWGb8gxeKUA7EoXIMdQY0g/dTOL2Gt7gZudNWk475dzVDt0b2tKTflN
 kps8rc2YkgFMnoqitlLldkJXfjwbTmh17FOaQjG9nIiX0mCKRpbO6KqYu6U/11FIokwA1wNf2
 OhqFF18/XIcCulapFWEEvkCxXDx9lssN3JtTiUs/74naFTqpvUTrS/mwRcSJ1RU5YwabC026K
 rytrc7hhrdXoU+zyZW/oqtb87Hh+MOuWI7X+P5w4/+HQL+1aPoIo+adSLOSET9CMVBQel2o6s
 ro3nSy2CQIxv7lF0Ih3JsnOFxXxzKXTCIOlZrp6Hp7fTtZ26zr1XjmHp0tJdvO89U3SWin8D3
 Lj2RT+kkG6o1uOkFIcn1q3TO2sjjv7U3mFOt3/dhXQUwDox/HLwU82tUD2/1ktmXnvzeqoLhP
 xYV2hGn0Zbu848QhuyTrAEwTV5/2qJFiqKVgIaCt4JMTDtuOdhuT37+7ErSPaaGVqhUjEdFv4
 I5K7I2ZNM9OVBDzZxTXXxRRKVKSit9oq2is27hV0OVajHHCjc58SiW2Qo8Ax4dqe2YzWj8DHV
 NoCtQ7p42u3EnlFekgquPQxwfVw/jlTsJDFokkQd5cV+pIqV+MC+fwR49V/7OtAJxqJEdn7tM
 UHgv33zFadaM2bsx+FtJsPkqFBMdxw+KmfDfdRPWyc/2BOtQQ59mKnIhxPezublHMazk654Sx
 KWT6Z6d16x4LQrtUwYrwfngURGAsHvmRyw3diTJqLIvBDDFBa8tPQ6GfvPHkfBfCLuPlUyfgf
 tY6Mx6X8CghQBZ3QbcvUkGwm7ILGDQepPQ2spwh/3UiU9NglWE8g8vy3I0CA+yucrbDrut6/X
 OS1jSDha0lNP9SkJffUxfwqnmgodN+9UqCsE1JftGy9fgAExqTtoUfQV12PNY/+SgG7sJ2LK6
 ukZZby2NTIZOdb74MzBmhP328Os=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691520433; x=1692125233; i=dalang@gmx.at;
 bh=cOheL+pSTaFBF21rLEcNflCoZK00tKhCRUQQDCBjEoo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=U83pzf48fXlDEb6JrpuqlpPdWOdmWMHmgXRkfX1x0aAhSJ5OT9fswTlq+BhncRmzYs7/WHw
 /UCEWy2iYY4XL773+pm73YeSFq/vmruy7gQJhGueeDy2j1qmEDNNFr468SRl7Pw4rBzUUOBRi
 H6sOcQUmZXeldxgbgVRkGWtKi/Vg05ZJ83pmmLtcPe3sx9zbl9OfNoN2TVPHvWaVie3gh667x
 yNSELc0z1IHNoPBF6o2RPZZWf59LAa4moB2NXs107F5hxQ/n7ZIcoqd5x78vUUTFzAyuCwp02
 2WuQ7KSb6IaTUlUZC+n70lx5l6T9Pi/ub+BrLvoeba3bvM2rjS0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=U83pzf48
Subject: [Buildroot] [PATCH] package/dracut: add CPE ID
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
Cc: Thierry Bultel <tbultel@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dracut_project:dracut is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/8050B12A-93FB-453E-8459-9B8B9CC7544E?namingFormat=2.3&orderBy=CPEURI&keyword=dracut&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/dracut/dracut.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 597492bc5e..3eb9bcc474 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -8,6 +8,7 @@ DRACUT_VERSION = 057
 DRACUT_SITE = $(call github,dracutdevs,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
+DRACUT_CPE_ID_VENDOR = dracut_project
 
 HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
