Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D8EC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 15:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4DA4055F;
	Tue,  2 Jan 2024 15:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B4DA4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqFf1z_CIdu1; Tue,  2 Jan 2024 15:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C50540A6F;
	Tue,  2 Jan 2024 15:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C50540A6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 415EC1BF38E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 15:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A67560F51
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 15:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A67560F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywp72Sd__MEq for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 15:56:01 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E38D560F45
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 15:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38D560F45
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 402BV4DR011799; Tue, 2 Jan 2024 07:55:58 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vak3p1tb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 07:55:58 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BEAFB4052A;
 Tue,  2 Jan 2024 15:55:57 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com
 (us01arcgnu3.internal.synopsys.com [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 4136AA0085;
 Tue,  2 Jan 2024 15:55:56 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 07:55:52 -0800
Message-Id: <20240102155552.1902447-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Proofpoint-GUID: ivnCC9tu-MAr_UUET4W5JdSJdOtImuAZ
X-Proofpoint-ORIG-GUID: ivnCC9tu-MAr_UUET4W5JdSJdOtImuAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=762 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401020122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pfptdkimsnps; bh=7wbq4rotEpN902/rg
 gQuxUsil9wYzQ82YMX4gSmJyPw=; b=ULw0CLIU+1X37eXUPnkRvpXrOKphLtp0E
 JKYPpXb58Bjn3YC0MF+nBFnA8VHqeuxC4dDzNnmcyxFTeJSWr8h7MTHfb5iuhCi3
 7nO4VjcUTXLHYjY2yUH84xCW0rRsJNZoa37knVP45oe6ZGOXjxSuwP/9dUN/Iq41
 InnNzXmp8Gm/HwSX2TwQkJu6pH1pBkGEamHpZ08KnlC4R8za6qJJ7/nRQc34yP3Y
 ytjIs3N4L36nNv6HXBv3TavRWgIP4ffdBHOrz+CXIcALY5ycn8ZDlMw0jnzo46Ek
 gCHlaW7Jf2w+yF4jhGNA+3ZT8odEq49TxSg88Yx37Gm5bl9z112hg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704210957; bh=xZcn/071w93Y3L4uu0a8xO0lXQCrfeeUPp3C226VXgM=;
 h=From:To:Cc:Subject:Date:From;
 b=CT+g0saTIzYysSJKe9Br+N9x9ux9I50NwDmDi9YMD6tMWHyPNk72B6woRefse3WSP
 l4qSykAfTo41aCl9uwlIMLriOUqoApPMrFXP0lI1jWVEjmcuVWVKJIowSVXIOPCV6X
 ANuGRyS+T5gb16jiGQOqpevCgm/Rm9MmjIv/5x/3uB6hnYWpkt9II2VUGAV6uxkON2
 bN6z246mN4zuotIuzshdXOULZYP7bBYoVPEpHENnsf9Ka9Qe4VdWsE4w+P3dyfLGFr
 FsnKppx48xPmB+9bIge2HGiz4CmiOPTQR8i3+VcRssLeQdx/ot8XrC/UzBtulcI3n4
 s6+s7h42qBb7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=ULw0CLIU; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=CT+g0saT
Subject: [Buildroot] [PATCH] package/gdb: Remove special handling of
 libstdc++ for ARC
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Effectively that's a revert of a very old fix [1]
which is no longer needed.

[1] https://git.buildroot.net/buildroot/commit/?id=ca99d0ea925e5a8e42bd270402b0171a39d1d955

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/gdb.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d677c6bdb1..f96086eed2 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -180,13 +180,6 @@ else
 GDB_CONF_OPTS += --disable-gdbserver
 endif
 
-# When gdb is built as C++ application for ARC it segfaults at runtime
-# So we pass --disable-build-with-cxx config option to force gdb not to
-# be built as C++ app.
-ifeq ($(BR2_arc),y)
-GDB_CONF_OPTS += --disable-build-with-cxx
-endif
-
 # gdb 7.12+ by default builds with a C++ compiler, which doesn't work
 # when we don't have C++ support in the toolchain
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
