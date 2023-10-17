Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E5CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 17:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2477082035;
	Tue, 17 Oct 2023 17:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2477082035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6drShAbQ4-hq; Tue, 17 Oct 2023 17:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B3AF82036;
	Tue, 17 Oct 2023 17:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B3AF82036
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0657F1BF32B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B5E82034
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B5E82034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDGIPXDQJztA for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 17:52:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3DEF8201F
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 17:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3DEF8201F
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22F3AA4C0F13;
 Tue, 17 Oct 2023 19:52:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qsoF6-0003gL-1r;
 Tue, 17 Oct 2023 19:52:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 19:52:32 +0200
Message-Id: <20231017175232.71780-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697565153;
 bh=BKMM3ti7NRg+HlN3EyWb6f7v6E11fNm0GNFsdtKkJaw=;
 h=From:To:Cc:Subject:Date:From;
 b=HqMy8f5Do8HOaCkjagOMrEyTysY/4ECG7ldaK1Flklo1ZK0njU4+t6raTu5VTVls8
 +N120eqEHRvWQONbPwmExLIfPGkht5r2bkwqImhCmjT70sBUNgEnEENvyVEwVS8EkY
 SDBp1JKK3lFuhVRKDo354ylV7+CTr2foJBqwf4hl08s2O1HepQGZVBTpoLa6/rhkwh
 89Qz4CPOBEcocXyXsj7xpmjRhcHp68F7CcLRptoVkpr1+6KESFqRhEykijw6fsjaT7
 bXXVBhDHOwdkewmMa3waj8Bh/j+SMNv/QhglJBjkHSyHp41gJ3yS+37PmK/URZNULl
 WMtHVGeWhID2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=HqMy8f5D
Subject: [Buildroot] [PATCH 1/1] package/eudev: bump version to 3.2.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eudev-project/eudev/releases/tag/v3.2.14

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/eudev/eudev.hash | 2 +-
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index d91bc761c9..c41bf5992d 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5eacb9ad8  eudev-3.2.12.tar.gz
+sha256  8da4319102f24abbf7fff5ce9c416af848df163b29590e666d334cc1927f006f  eudev-3.2.14.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 235a71967e..33cc638291 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.12
+EUDEV_VERSION = 3.2.14
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
