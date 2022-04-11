Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7805BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 08:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A794151A;
	Mon, 11 Apr 2022 08:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQ2SB7CQsM1z; Mon, 11 Apr 2022 08:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B53410A7;
	Mon, 11 Apr 2022 08:29:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E66B41BF3A0
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 08:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D45BD40961
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 08:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ARAYYBpR3ly for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 08:29:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gateway.work-microwave.com (gateway.work-microwave.com
 [185.170.114.92])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81E4B41505
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 08:29:30 +0000 (UTC)
Received: from mail.work-microwave.com (mail.work-microwave.com [10.9.5.20])
 by gateway.work-microwave.com (Postfix) with ESMTPS id 7149C40135;
 Mon, 11 Apr 2022 10:23:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.work-microwave.com (Postfix) with ESMTP id DEDD6F2280D;
 Mon, 11 Apr 2022 10:23:53 +0200 (CEST)
Authentication-Results: mail-wsvr1.work-microwave.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=work-microwave.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 work-microwave.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1649665431; bh=SEe5eOHFM2qa1YTc/rZ+Hi6UOcgP6B4xomjFIs
 qQQpk=; b=MmBk+XI3o3cY8LR6JGzpTUgEWfw0o2medAoOcblYt1f2EJbBZoD8CH
 yxI1oXFfZvzmRmLap3AqVNx7MLZn23h4jgybbifXcXCkAXJpJ33J09iTzlWF5DVK
 lwbJe6doYlveY5Zi4CenToXCXhEwafetFzZ9w++dupZmKE2iRuwqW7N4lRvOku4i
 xOn3JI9P+NQFXbRFIs5iSC7FiARTEIPIVQeb1dRaB23IKwBCRzXkdEJk/YpSorp3
 UWSN/9ARBtyuozpGxwCAnU5XBd1X+7EOuqkJpUuS6ioknwmPSbz3lhprdKua+lOq
 GVaqrkoRjkOAXi32I5pfQSj1DdjgmxRA==
Received: from mail.work-microwave.com ([127.0.0.1])
 by localhost (mail-wsvr1.work-microwave.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id XyIv8h68CnZG; Mon, 11 Apr 2022 10:23:51 +0200 (CEST)
From: Johannes Agricola <johannes.agricola@work-microwave.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 10:23:09 +0200
Message-Id: <20220411082308.1528455-1-johannes.agricola@work-microwave.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libwebsockets: bump to version 4.3.1
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
Cc: Johannes Agricola <johannes.agricola@work-microwave.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is quite a version jump, so there are a lot of individual changes,
see: https://github.com/warmcat/libwebsockets/blob/v4.3.1/changelog

LICENSE has also changed:

- More items with license "MIT" were added:
  - lib/misc/base64-decode.c
  - lib/plat/windows/windows-resolv.c
- One more item with a 2-Clause BSD license was added:
  - lib/misc/ieeehalfprecision.c
- Sublicense texts were copied into LICENSE

These should still be compatible with "MIT with exceptions" stated in
`libwebsockets.mk`.

Signed-off-by: Johannes Agricola <johannes.agricola@work-microwave.com>

---
Changes v1 -> v2:
  - Update LICENSE hash
  - Add changelog and LICENSE changes to commit message
---
 package/libwebsockets/libwebsockets.hash | 4 ++--
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1761a7658a..e39d6e1853 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6ece1f422c6d38aabedec2476f2ac12e9aede8691b08137068ad85545ce3ff78  libwebsockets-4.0.21.tar.gz
-sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE
+sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
+sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index c25686d385..152659cee6 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.0.21
+LIBWEBSOCKETS_VERSION = 4.3.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
