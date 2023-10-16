Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138E0CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 18:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546C260594;
	Mon, 16 Oct 2023 18:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 546C260594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVo95fr5SrFV; Mon, 16 Oct 2023 18:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 556E960838;
	Mon, 16 Oct 2023 18:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 556E960838
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC3A1BF28E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 18:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B518175A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 18:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B518175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKHe4zPAyrEj for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 18:09:00 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44FA81759
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 18:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44FA81759
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9E6DEA4C00C8
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:08:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59494)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qsS1P-0000SC-0K
 for buildroot@buildroot.org; Mon, 16 Oct 2023 20:08:55 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 20:08:55 +0200
Message-Id: <20231016180855.69848-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697479735;
 bh=EcceXu4vKUiuZX24NcaabIDnVc7NRbdgmF6RcSlYDbw=;
 h=From:To:Subject:Date:From;
 b=nD2arnH3KvxCmXjbPmkimABHeDnWiBBwVOs7DVRhi+HTTSWpgYliOrQ/xjwPQ9QcB
 nqzh6oJzFBGmgSgg7UW9wUM9rPSWOglkb94tfUMTFkW/AvoMMs8YBC+DQZBYhPhJQz
 ilFzrQbqxrO502sIBtdJCfJvxCxu6Xmn0x/anlst9bYdKkTt0W167PLts9Fo5tDlFy
 OBYcZBjzl+Ac20JiD7o01xC1jSMmZFKLClzLRLwESt096FUpfkS6RNZtGOaNJFhkNj
 /VmR0lBo1+rJok8pZT/nHLYoYBy47n2Rwl9eZLxW5leLYV89rMgyf0zrF0gtdlU9OK
 DgcXRLSW9McRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nD2arnH3
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.19.2
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

Fixes CVE-2023-5568:
Heap buffer overflow with freshness tokens in the Heimdal KDC in Samba 4.19

Release notes:
https://www.samba.org/samba/history/samba-4.19.2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 5e65295e4c..06b9cecddc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.1.tar.asc
-sha256  ce3b7f0d18bf91aa5fd646e8bb385a3b35375b703c6e5123b02b85a1abc81879  samba-4.19.1.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.2.tar.asc
+sha256  9e63f0505e1c631f1db0b7a9349a51e925c026ca03af3fd5d812228bb597d393  samba-4.19.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 124ce564d2..832b128132 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.1
+SAMBA4_VERSION = 4.19.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
