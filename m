Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447FCC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE45460E5B;
	Thu, 18 Aug 2022 21:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE45460E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZzjRdRpl87z; Thu, 18 Aug 2022 21:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF44D60DCB;
	Thu, 18 Aug 2022 21:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF44D60DCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A08EA1BF9B4
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 863D4419C5
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863D4419C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtAxwe4Jl9WR for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:51:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3B6E419B5
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3B6E419B5
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 21:51:46 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OnQWoAtVDlHojOnQXo5ckv; Thu, 18 Aug 2022 23:51:45 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 23:51:43 +0200
Message-Id: <20220818215143.935665-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJZI98ajNLM0WGHoRP076yuf9upfotHm2taQV933HRvxjiYJifuK3hW1z14CaKFZcj/9dp6WjibhFFNNzFE64iFzfG6oB83C7dwrttQlLo4iEzIp4/iJ
 jxs+uopgHx794bbiPFpok6KLaEB89LngNMsoYXbb/o6q+2uN8wLsOuNkB0F2jQK/+nQdNXjoG32bMEJbIeWiWRI3FvKVndvAT7e4K4dX94CbIJz10eIF/xuR
 JBp5s1zFUelyLLnov5IYm6wLI8nQ/qun5MzyOtmoBEi1pJ5sORcqrWaXUF0HQeWjJFKsQHYnbA5GiUbvVcgUjg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660859505; bh=3kdQwPiNtta/oBKUOwt9ksD7NOtoArrAfOEpczMJBNA=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ctr+i+BaP2WVBZeG/grbyKFs3kt2T7DktCRnTR817quKAtYvPUPUefVRB94WZ/XE/
 J+B74IMoxoH/rgaHMKlqXbKzQ73Xzf+EVUjSN3k4k5kbj2NeLmVEkuU58NfJVAZAAM
 LpUkdXgvVkOJ18cK72zWIleajj4ph0QHj/vHQ36pS+gulvSvPDZkvTRpeI0DiNY4pb
 3W5EOrGCRSn4z1kpZfqwVjLoJzRTPtD5T8OppDQbVK2HSLwSwVwYFlirIjgA7tfCQf
 Vh2c4HCqS93MmDeGUgYDnVoYoKtMOQW3wj25ispi/ZJP2FvjtCsSAW/gBwm+OoJgmh
 6JLtJvfmKFr8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ctr+i+Ba
Subject: [Buildroot] [for-next] package/libnss: bump version to 3.82
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 8330d255a7..2133113a4f 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_81_RTM/src/SHA256SUMS
-sha256  a8bf5f3bb617068d57e7b15f3d9d528f109af0d57df2eaab0519b6423edccca6  nss-3.81.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_82_RTM/src/SHA256SUMS
+sha256  32bf673b72c2f9953ed3b4c7033abf5a6cad302854a24ae588c575a6567c1573  nss-3.82.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index bc878adc35..6e839cced6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.81
+LIBNSS_VERSION = 3.82
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
