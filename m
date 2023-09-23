Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A599CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 13:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B31060AEB;
	Sat, 23 Sep 2023 13:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B31060AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3n7pHmZZ02M; Sat, 23 Sep 2023 13:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47F360B38;
	Sat, 23 Sep 2023 13:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A47F360B38
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2244D1BF32B
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 13:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEC4E417CF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 13:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC4E417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JIoc22iinxI for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 13:27:07 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BE08416E7
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE08416E7
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD911A4C0980
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 15:27:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42122)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk2f1-0001UM-1X
 for buildroot@buildroot.org; Sat, 23 Sep 2023 15:27:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 15:27:02 +0200
Message-Id: <20230923132703.66338-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695475623;
 bh=HugSVAOjbhGE9Yf2zsCkyJZfCk4hfgscqZWnGOavAAw=;
 h=From:To:Subject:Date:From;
 b=pEh5h3rFQsl8vwG3ZlU6EBJwFxJ/iffddt/DM6Gd78dIA02CTTyIzUx8mG9Do6BDd
 IYRQT4AFbMXN3FXSBvEtKbIw5aS+76v/xpNdgYL1pSEdsSh5jllsxqF7t8u7QcvrbR
 vqPTV33pheNAgEW6AfhaK8L9q5tO2lPF8m8oZ1+n6baN4JLpPh5yUHMShksWGXpjUs
 YlUcX504R3Vvf4s84J0hlMinz5BAFuI24+OAFuxc2XeICngTAHTV1Vn+uGrGsk7rrl
 GIDTgvnNk7X/Nt4mtjzMWUsFmrk5gv6yU96a1lsSWTbqmBERpLfNV4VrRhQRj7j+Tt
 huUM4fLOg4RlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=pEh5h3rF
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.21
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

Release notes:
https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/KYDR7WWPEQOBZA3IA4NL5XDSLODZLG6N/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 7036df57a8..e42bb577a8 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  caa832eb968148abdf35ee9d0f534b779fa732c0ce4a913d9ab8c3469b218552  dovecot-2.3.20.tar.gz
+sha256  05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d  dovecot-2.3.21.tar.gz
 sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 4b17784f93..2933401cbc 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).20
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
