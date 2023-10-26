Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6A8C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 18:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12BDC424CA;
	Thu, 26 Oct 2023 18:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12BDC424CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwjUWfhDPvAl; Thu, 26 Oct 2023 18:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16E80424C8;
	Thu, 26 Oct 2023 18:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E80424C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E8741BF59D
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42A466FA7A
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42A466FA7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIhATr0HoJlf for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 18:04:19 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EC176FA79
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 18:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC176FA79
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCFFBA4C09B9;
 Thu, 26 Oct 2023 20:04:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35294)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw4iO-0003Af-1l;
 Thu, 26 Oct 2023 20:04:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 20:04:16 +0200
Message-Id: <20231026180416.3147682-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698343456;
 bh=38ewROMk1f8ZO7yXyme4uAwIBCBUy41eADnJmLw1xdk=;
 h=From:To:Cc:Subject:Date:From;
 b=DafHmyaJMpja0qNWxjUjgmtTof/LWxlRKwdyuvFhXZveZxUs7pKCQMyhojmbBZUDO
 Wx9V+Fd/nMoypgUJ1fuPhKgyo6lTW44V6l8UsVPEbEdL06FW4XOIitknbdFZhgixzn
 kcGd1oXl2FyI9LeDhy3VJbm/8Qy8AKztSgP2bL/uuxWYAxvhm9pgAeszNtYvrY683M
 /jI3K8hgsk+wNPXATTd04WJcRnQIJwK9inBy7ZUPcCtoJqk0En/cyvhT0FN5XCx1UV
 YTQT+u9pdWBfUQI4ZvC4dCd9O5syKTm1mZzQvOxdoisMjVnMGES5ShEEFocq7n6Iye
 gk4Ds+PMrkEig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=DafHmyaJ
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 5b021edcc3..5a9ec3df23 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9d8e68d1442403709846b93e7994652a1eca0f03924924d3a4dd31b882851375  tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a.tar.gz
+sha256  98a27a6a5ce2fc800df6d154534f494582418f6b24b3a1c30267785d191e50df  tvheadend-62adbebfd062d7b97829268274aad92df2033784.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index f9303ef2fe..1d4e6ee30c 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a
+TVHEADEND_VERSION = 62adbebfd062d7b97829268274aad92df2033784
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
