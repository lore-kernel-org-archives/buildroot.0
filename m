Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF4CCDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 11:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF24083C8B;
	Thu, 19 Oct 2023 11:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF24083C8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnh5JN2RZn9m; Thu, 19 Oct 2023 11:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA3C8215F;
	Thu, 19 Oct 2023 11:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA3C8215F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 580D11BF5A2
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 11:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FD91414A1
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 11:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD91414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6EZIXpyvLtH for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 11:21:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C9BC40332
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 11:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C9BC40332
Received: from methusalix.internal.home.lespocky.de ([89.245.58.193]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsqMq-1rmeEy1eDA-00tAaZ; Thu, 19 Oct 2023 13:21:28 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94]
 helo=falbala.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1qtR5d-0004wq-CD; Thu, 19 Oct 2023 13:21:27 +0200
Received: (nullmailer pid 1814 invoked by uid 2001);
 Thu, 19 Oct 2023 11:21:21 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 13:21:10 +0200
Message-Id: <20231019112110.1802-1-post@lespocky.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Scan-Signature: 816bea67802c9628cbe8afd1e6255274
X-Provags-ID: V03:K1:sAlRmd/+GUrYAH3weRj48K2gRj+uS9J9VFME65ljOoWP4qhqvOK
 j3pK9dRg0w0VaKlSAluvj/r6kP1Ae7DRNTUVkWndMs9Kic1go10XbtBw0A8P8rYAE9oroW4
 fx9yHiB2+NRB9tUxkMfTtIDoduInxLZk+/BiXCsyTCt2Kc0QA3nEm9mMxAoJuG1u+xI+ngY
 qyxY6vVMmXRGB4nW4qRug==
UI-OutboundReport: notjunk:1;M01:P0:DShxEP3oqQc=;IliSCGsd5mEVsLSoMetDgBdKSm7
 Cqm8E7QU61jHcHj+SZgRtN8mtzRPuQ3ub3hqsCs4lQhidRiYMsi8S0ur0kpjTcJIg9CP4c/fE
 dMvI9MXiDrLtpkzKn6h8znWZK1rD+frSVbigQM5W9BuDELcWWocwGEuIRQ9YGBInIpNIYngVO
 8kjltIazETxxJMc3cr5JwW5XzDzEa2A9Dkv04TeY/rlhzz+KixPrD8vJkG0a//b0pxBipfI0m
 qT51kg+zWDb6UcODTDK0wdlWM29iwxy9FtK2xJ+LUducX/cHhyQQ4zk4zZpVU2v9dxpjWfwn4
 BHbxRG6vKjrQBPnx4WNt//0mcWA6xHWx/GrsxegCVMKhHi2mQjG5wx+FrFUvdby+z0Ob9Z6/O
 yCQz9ZvakxI+1Mn/2hfBla953xMCrtMxznM5upUz8mCFCLpIzdOPBVW7byPgrt6E+9Zg6Na8b
 +HfUwqDjWKuC0qViZHJdTwwIMbwd7SBBhWV0xJFQiBqVEwcEEOhKhUDdWbC3lVWSYo/X07te7
 M6cPKM1g2nUx6NsWpTLqvrtArFb/OUOHuuq+heEHkwXLZhKiwAGgZTSZTF3qlfonysO05Andm
 JysP5mFEvycYsUkrGWNmxyQNUHEx31emrexHfoRQs+49qpehjXd5wUFNGGFpGTtpRRBzbLs8O
 keTeBoFKh7ySUXj9KW9WOwRdo8wVt6eC9Qa/O52CxtKSkxGlwH05SQdmjH1RlY3i4dLJ1LlK1
 27P05cwoiS66nxQB2VJRflDdBwu+H6yU6eBH94pA6zRquSzE4GdfoKym0/TGEmpv6rq7yOyXz
 s4yZs4SZCj7X9H9pclaXWJSvnpneAPzH2nEtBOm/KFyeX30irFas+N3eioktIxvwpwuSJIt2F
 yJQ0VlbBY13cB1Ojs8hBcVYUdORxK+daEFQU=
Subject: [Buildroot] [PATCH] package/lighttpd: Bump to version 1.4.72
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link: https://www.lighttpd.net/2023/10/6/1.4.72/
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/lighttpd/lighttpd.hash | 6 ++++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index a86ebf2f68..3c114c05a1 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.71.sha512sum
-sha512  c1388b563b9cf9dcab0a57bec42b09b2cb5e1932bc137ae5f957d1bf3932ddd8f5f188002a7b9a00f0a92ba3779b21ecbea2ccffa91e686b6660c9cc455d6598  lighttpd-1.4.71.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.72.sha512sum
+sha512  5becb57915e3548a1b9b980014be22b3c08dcf0e9be524f9cd0093886aaf6d00b20986e8b1fb10ecdbdffd8e42dd18e4a227b03d562c91bef9490ea6d5c480e3  lighttpd-1.4.72.tar.xz
+# From https://www.lighttpd.net/2023/10/6/1.4.72/
+sha256  f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec  lighttpd-1.4.72.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index bc0dbcbf45..af104de078 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).71
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).72
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause

base-commit: 3f23277c41ec05ccd13389fb806d83deafee8d22
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
