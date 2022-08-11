Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63822C19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 08:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE81A417E5;
	Thu, 11 Aug 2022 08:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE81A417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktZ7_1lER6Kg; Thu, 11 Aug 2022 08:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC7E4177B;
	Thu, 11 Aug 2022 08:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BC7E4177B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B53C11BF85D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C82D815AB
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C82D815AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6nH-YKJRNlV for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 08:39:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09039814B6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09039814B6
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 08:39:18 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oM3il-0005lG-E4; Thu, 11 Aug 2022 11:39:15 +0300
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 11:39:08 +0300
Message-Id: <20220811083908.1604798-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD999D8F08CF16C6CA763527849D3D48064A02E71D87CB93F0800894C459B0CD1B9CD3846C799ACDBD2C937DDA7EA37CD3C8D50EBB1FB29A7D82BEE0536B1032EF0
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CB722B0DA92BDD91EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063748744D4CD6EC491D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D81C28D46DB9BDFCCE872B9C68218A106F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ECE82AE7387CF2AD9FA2833FD35BB23D9E625A9149C048EE4B6963042765DA4B618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E57F4578A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C46CC729E650C927943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B394E08B88321F52AE7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359A3485EE9140A7D39D21840F38DCE934C0360583C7422455C3F1055A48C272B0305B63D382EEF4D896C6CDE5D1141D2B1CD8A1E4703BF9AC2433DC59E2433F6D3AB29EE3CE58EF5EB6AD91A466A1DEF99B296C473AB1E1421878B0D43A06A4C936638A446BE3E5C627BF0CFE790FC11A72BA7CCD254A1CF5E849561FCEFED9105F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340FE9920E7E3E5C62AC81FEF493B757D360577246E21BD3BFE18898E1E1CBD9F49587263B1FFCCD491D7E09C32AA3244C47E84091328FFA187F8FA707534E863A7101BF96129E4011729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojfXJM3siCnCnsVP2rX2RDlQ==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284E5D0FF5A5D07FE3600A29131488B25A2198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=s/uT7VBPHMWutzp8TN+HG9Aa683c8TOM/rZNd8af5yI=; 
 t=1660207159;x=1660297159; 
 b=uV77nxeJG3F/MWhkrOCwv3cb3b+P0tVXoOWw8WtmJKX+MnLUbGRDmcWxxDN5sqbCt+Kw+ttFooMRxja5nP6+0aqtuJxyUh9zeN86hbYF/ywp/L0lZ7s+f8KAP4HHAo4Yogbv4kV1fzMCOhkjv+U5QrQso2RXDrn0+dYOvWzWIQjjaifbXCEgClMpU1EY/sC2xXGT+vx+jcdNPtpbzVGRjkoEqGHIOzEQwislmZ+HRfUPAJIi6COsBEjpvNf9KWMS+T1HVY6mtpAJm1P9eavQ1qo9SY9PNgjLfqOgLi1G6d86vAROJGgCeu5CJVa+rxFMfL66rGp4E7ABVKdob25sCA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=uV77nxeJ
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.11.0
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.11.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 3b913b750c..34b2b855d6 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c141b07d61958a758345d5f54e3c735834b2f4303edb9f67fb26914f0d44770  geos-3.10.3.tar.bz2
+sha256  79ab8cabf4aa8604d161557b52e3e4d84575acdc0d08cb09ab3f7aaefa4d858a  geos-3.11.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 443c884abe..55c975eb4a 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.10.3
+LIBGEOS_VERSION = 3.11.0
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
