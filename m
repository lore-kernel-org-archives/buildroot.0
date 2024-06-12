Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0E3C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 13:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A42A829EE;
	Wed, 12 Jun 2024 13:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCZtJx7rxohu; Wed, 12 Jun 2024 13:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBBD882EFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBBD882EFC;
	Wed, 12 Jun 2024 13:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13CE81BF371
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42A8F811A1
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzpGzT9ec-hH for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 13:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B8AE81123
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B8AE81123
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B8AE81123
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 13:57:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.77]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1smrl71WkP-00qN4g; Wed, 12
 Jun 2024 15:57:28 +0200
To: buildroot@busybox.net
Date: Wed, 12 Jun 2024 15:57:23 +0200
Message-ID: <20240612135727.11811-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:tdx0yoUZ/ykEBUgGTkD4qTuleqiValEyqy3TKUmmtMxAR41AfpY
 KJpVpgvsutUovXH2W2mG+naLMCL7skDvXa0VGmQTZ1B6SpOi4J5WUYRv25q7KysO4VO/4cP
 p8nozmgq2zVI7xQqeSac2VxPURsCKKRySDLKGeaNSKrofkPzl5+64HUHZ3bgm1knFAoR4ON
 nkKzKcCXE7fjCvHHAmSbg==
UI-OutboundReport: notjunk:1;M01:P0:X/W3JM53LlU=;L6OiPFYA3mTWOUK0IkOWBE97Xjo
 VuI2XiRLVGtJv28B23I+qr5dO89d6+Ufux5lOSfsxxFCPH6R4cknHVmWL46mQt+vNc6z3cQhl
 XzIjkzltZ8lAqtVHBxmDdIODLdO9MkzMdD3hrX8twAAabvPmhRU62zV31GaBiDYed0Ke1ZXFp
 YSyVzwbKfyjC6FW/x8wZvzfc3vgp1tPpy0KzN51x2QF4RLDGn0IsB1wbMrEIA9uGNr+JbyDvz
 Ay7s2gQbk7y1dAZiT50749HLOTu/qWKehKSdqgjugyZHwHAeBUQ9ituBD1NgFtgTOL2KWNYWH
 xO8uU+GnBrK++raJ3xjMHmeZ5nSCLJCXZ8xRenKt+yhVMD7QYjzPt/7tqj89da7jiQSsYVgtm
 LmgwaOQi/6cKiUBZ/czjT0Z1djOFAxp7N9jnqXgW2L2fa/qyQs+nU006DK1y5r2dk/wR7oUZB
 ju15NpVKc2g9KkN29Wa6izO4fMCWvInrheNdT+cSS1eVZyASalP19//eeBrWiLB+IR4/Iyup3
 f9rI+5lEL4fcFae4+wp6Fnx1aBJ/e9A7XJ+2e9N/VKmkudF36Db/lMabRc/gAcSTBTYUPS2mY
 ZXUB8cWhnMj+c2cMrJR99vgxIVVrY0jYuD5occ+b0N02xyyCclEPsF55v6lxMAee5yY5HOq2R
 aiF8tLHNG8vNs3lcShb5WgCjCDDPFDqANgRwUZNUOyq+q0XzlC9wOynt48CNXufKicYvQxtm0
 Scua7d/5EOHW3zn0hKoCamy3YoZXtrYKUa/0t6Q7u1prbqtVGhKBpE2vZOCKwijfUM6PQxDTk
 PA4VoW6X5UF2Af5Npz6Yd04Af3ayQHXkCJbX6aJO2xzT8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1718200648; x=1718805448; i=ps.report@gmx.net;
 bh=47oJ/wTIzz5EXLMkqBK1J+CBRgWLNpZtSp3D0u1hnC8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=d+8Eoy4JqqnwHn/YB65fVCEdLOnHQSUNQoHf+AQ+vjRS9hnJKS/aD8+oIcXB8nIm
 kXZHPa4rTW3UX/eC8Vp7F0r/+RbLXlwCk0NIuUqVWdRfi+V2A9SaRzHH4GlWjQUBr
 cQGkyEzF+IQalTZLMKEEKqfKFNtOl9ffM+MZtdoICYS+bHgFHfqny1NuhhdrkVKz2
 mHMBDnojYLVGwH17uf5/bOtLZPqAnOHKo2G90BFNxqvGZUR/YbPcao4Vbu4kWlWIj
 b2YpwnDf4duySWp8vQPLXJar4FobdO7xZpVvrtCDwpXzyejehB3yxrxhJKANgIMAM
 g7J9x3MEEPwP6DWRRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=d+8Eoy4J
Subject: [Buildroot] [PATCH v2 1/5] package/xz: bump version to 5.4.7
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add key hint for download signature check
- update COPYING hash due to [1] (change of home page URL)

For details see [2].

[1] https://github.com/tukaani-project/xz/commit/c5c091332c6953a0ce940cb355ea9e99491429fc

[2] https://github.com/tukaani-project/xz/releases/tag/v5.4.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changelog v1 -> v2:
  - new patch, bump old stable version
---
 package/xz/xz.hash | 8 +++++---
 package/xz/xz.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index e8025a8065..ff070f6775 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
-sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
+# https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
+# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
+
+sha256  9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  xz-5.4.7.tar.bz2
 
 # Hash for license files
-sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
+sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 40fa59ca7c..d5dceb0eae 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.6
+XZ_VERSION = 5.4.7
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
