Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD31C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 13:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C45141BC3;
	Wed, 31 Jan 2024 13:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C45141BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RO8wWsrsXpup; Wed, 31 Jan 2024 13:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A460041BE9;
	Wed, 31 Jan 2024 13:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A460041BE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6399F1BF325
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 13:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C42941BC3
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 13:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C42941BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIAXEnJIVnvO for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 13:09:27 +0000 (UTC)
X-Greylist: delayed 341 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jan 2024 13:09:26 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9F6B41B77
Received: from mx.msync.work (mx.msync.work [62.182.159.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9F6B41B77
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 13:09:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05B8ED0984; Wed, 31 Jan 2024 13:03:38 +0000 (UTC)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Jan 2024 16:03:14 +0300
Message-ID: <20240131130329.142721-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1706706221; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=WUQWn90Xaqg9CQRGp5mFeQMn3NZjFqxDZ9MnJ8GW2PI=;
 b=Uo8XODzahKwyO+dCn/nLqcqIFjMcPoWv7ReNMFrZWNzWi2zDMzDbQxTcTyxANItteG+N9x
 ipihMOcnD+g+EKNrzb7rBcxVNjB+JrQwpD/8iLkOvR2Q7O7Xx/YpJnUzJWJQQbxjrfXBIN
 a4UtZtknzb2DkRSOFb+ajNeEyAkKIsobOp4qyNUymMsnTtbUZyaeyjhV+ZyXaJvfREXkXZ
 3iVfjnQ9+m1h1dnmio+bJXYu8H2RcZU4uphnBSnUZIRu6BQMVXHmUOJ7Y1HeVkqXPSDosc
 +MAAFpd9dolJtKrOxYccCafHeWYZ5wHWhW1yJ8f5M2D/yj8giyGDypr3o2iIZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=lexina.in header.i=@lexina.in
 header.a=rsa-sha256 header.s=dkim header.b=Uo8XODza
Subject: [Buildroot] [PATCH] Bump driver version. Update driver for kernel
 6.7+. Fix build failures: x86_64
 http://autobuild.buildroot.net/results/b4f34e622410a59943fa763148da1115cea0932d
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
From: Vyacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Viacheslav Bocharov <adeep@lexina.in>

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index 4b44512913..34bcc412ce 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7  rtl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz
+sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 6036acb864..dbdc7d84bf 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = 2e4e99ae1502b173a938357dc1087e49475b26ed
+RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
