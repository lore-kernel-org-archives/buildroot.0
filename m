Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D2CEB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 05:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9825983A8C;
	Thu, 22 Jun 2023 05:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9825983A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXhQpPXOZWh5; Thu, 22 Jun 2023 05:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AF083A8F;
	Thu, 22 Jun 2023 05:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AF083A8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9238F1BF288
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C03383A5F
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C03383A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JX3i_qAH-7b for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 05:36:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7506783A8C
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7506783A8C
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 05:36:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (21)
Received: from zm.lan (pub-44.182.29.194.multiplay.pl [194.29.182.44])
 by server220076.nazwa.pl (Postfix) with ESMTP id 0470A1BC0C6;
 Thu, 22 Jun 2023 07:36:22 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 07:36:17 +0200
Message-Id: <20230622053618.3230837-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-dbus-fast: drop
 python-async-timeout dependency
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

async-timeout dependency was dropped upstream for Python 3.11 (see [1]).

[1] https://github.com/Bluetooth-Devices/dbus-fast/commit/1b5c9e1cb94d19925776d91196cf1b657264c494

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-dbus-fast/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-dbus-fast/Config.in b/package/python-dbus-fast/Config.in
index c9562fecfa..b7168106d7 100644
--- a/package/python-dbus-fast/Config.in
+++ b/package/python-dbus-fast/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_DBUS_FAST
 	bool "python-dbus-fast"
 	select BR2_PACKAGE_HOST_PYTHON_CYTHON
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  A faster version of dbus-next, a DBus library for Python with
 	  asyncio support.
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
