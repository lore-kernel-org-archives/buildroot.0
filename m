Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E1C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5528140C;
	Sat,  9 Dec 2023 16:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F5528140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bY14nBLYwL2B; Sat,  9 Dec 2023 16:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA4F0813F7;
	Sat,  9 Dec 2023 16:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4F0813F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF131BF42E
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 16:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33EB740280
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 16:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33EB740280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVA2O8vDDiyz for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 16:30:40 +0000 (UTC)
X-Greylist: delayed 543 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 09 Dec 2023 16:30:39 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2F340253
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C2F340253
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 16:30:39 +0000 (UTC)
X-QQ-mid: bizesmtp66t1702138880tbn91jpd
Received: from localhost.localdomain ( [116.30.124.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 10 Dec 2023 00:21:19 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: znfcQSa1hKZ1OQVbZm+fYYPn3C3aURwYRDNWqo5hHLgAQeIW4ESwVYgclQYTq
 oPOCjX7IgYUB/q9OWTOF4zTXx1JhdWDSp1RM0e9ovxwpl7QSspMV8MTlW/HJf4M2UJruBaF
 9fHO+229OsgsgU2Wnqhp0x+ytt55rIEpA6CDZ+xqTuthrrkuh2ZJ0n5twUBwLgx2PHRv5tz
 qRXyQ3Kktj9ItcXa+Nno0oUJ/8OmwmV/m2JduYQVU90gm22x0wONSYXnALEJk61Tac7p3HJ
 WkTMnq8YPpjqGgrPBY53BjRtfs30Bw/uS8B7M+oY0K3d3nzSzE+goucQKwB3Tqm5nA1yMzv
 cEF6nhHeYgbVts5gjkKnhAKvV0LFg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15761143615525294577
From: Zhangjin Wu <falcon@tinylab.org>
To: buildroot@buildroot.org
Date: Sun, 10 Dec 2023 00:21:18 +0800
Message-Id: <20231209162118.190035-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
Subject: [Buildroot] [PATCH 1/1] package/mpfr: Fix GNU Mirror Path
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
Cc: Zhangjin Wu <falcon@tinylab.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replacing http://www.mpfr.org with BR2_GNU_MIRROR variable

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 package/mpfr/mpfr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 8d12c7502b..a5e26404d1 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPFR_VERSION = 4.1.1
-MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
+MPFR_SITE = $(BR2_GNU_MIRROR)/mpfr
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
 MPFR_LICENSE_FILES = COPYING.LESSER
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
