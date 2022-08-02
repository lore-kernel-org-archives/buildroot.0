Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BC8C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 17:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BAC40982;
	Tue,  2 Aug 2022 17:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BAC40982
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6YMF367yb-R; Tue,  2 Aug 2022 17:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7ED440949;
	Tue,  2 Aug 2022 17:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7ED440949
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF6FB1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA58F60D9C
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 17:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA58F60D9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYD0g6fi0D6Q for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 17:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C462E606E6
Received: from mxd1.seznam.cz (mxd1.seznam.cz [77.75.78.210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C462E606E6
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 17:43:54 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc1a.ko.seznam.cz (email-smtpc1a.ko.seznam.cz [10.53.10.15])
 id 5e06eca3e82653f85e0152d4; Tue, 02 Aug 2022 19:43:44 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay25.ng.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Tue, 02 Aug 2022 19:43:40 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 19:43:34 +0200
Message-Id: <20220802174334.285384-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1659462224; bh=xc56Faji/IxOy6X46MNPlkgAAHlq1Fw4nq0Mz3LQWTM=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=QUVJssZo7a1PWLDpgvcemsVcDCqz1kYUbXjdmxwzOPkbH9PBDGmIzCrQWvdT7Ca6c
 HIDmHsRi7/sPuLA9oFENTEHhHntGmSiS1hbNQ4H347PfT8Ya6Az6OhP+ZFug/Vjsg0
 XxP2ecFKfayVSMOCdltAVdz9CNMe0G9rDqOo9au4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=QUVJssZo
Subject: [Buildroot] [PATCH 1/1] package/bind: bump version to 9.16.31
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

Build tested via test-pkg.

Kind regards,
Petr

 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2c10a0429b..171edc8806 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.27/bind-9.16.27.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.31/bind-9.16.31.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  90902aaf104c81019d75d6f8b2f7ec40fcd249406f894b44e4a9c6b5e08bf566  bind-9.16.27.tar.xz
+sha256  8ca2cb6c37b605c70f7a25f0cf8a94d2040e025824db2341b92625efd96e7cfb  bind-9.16.31.tar.xz
 sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5eb3e69bed..e5bf2be318 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.27
+BIND_VERSION = 9.16.31
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
