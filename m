Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E163C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBA1613E2;
	Sun,  7 May 2023 19:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBA1613E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYwwjRkRZRbk; Sun,  7 May 2023 19:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CE460F4B;
	Sun,  7 May 2023 19:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36CE460F4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA0361BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A26E60F4B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A26E60F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRyQe73zvD77 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:56:56 +0000 (UTC)
X-Greylist: delayed 00:06:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FB9760F20
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com
 [136.143.188.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FB9760F20
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:56:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1683489045; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gi7uPGzSs33FDsn1MLOA71BCZ3yxP5QEl3t9j5pje7B8qxOiuuyin73pNK3LlR+lJmQIpsDsY7aq2U7xQREdDnnudkMUGoDlCpH/+5Ye+Si6M44sz++cZFCR0Rfqovjnu9RVF8tnvGj/ZG0lCU5PPql1r/LI7Gl7KH9B7pI56rs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1683489045;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=OB7VeQrUe63rkAGFObhA2/fizi3OmlQNPPwrRbYtMl8=; 
 b=hbVAhbbwiL/jMOALcZH4McivhZFTAFlPhdVyD2qaEC6Xy0Pad4bTMdmpN2KJRxGH2Tf80IsfQVteD75tpocGOviWpgAcJHdFIeibDqDY5VhJt/6tJC0trPJzntpM+VROGAT3Wk1cki/WWpzmD8Q4fIFs9vuqm7goDrr762gck6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=leon@rinkel.me;
 dmarc=pass header.from=<leon@rinkel.me>
Received: from ubuntu.fritz.box (port-ip-88-150-40-22.reverse.mdcc-fun.de
 [88.150.40.22]) by mx.zohomail.com
 with SMTPS id 1683489044266399.98499107665043;
 Sun, 7 May 2023 12:50:44 -0700 (PDT)
From: Leon Rinkel <leon@rinkel.me>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 19:50:31 +0000
Message-Id: <20230507195031.163142-1-leon@rinkel.me>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ZohoMailClient: External
Subject: [Buildroot] [PATCH 1/1] package/bat: bump version to 0.23.0
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
Cc: David Pierret <david.pierret@smile.fr>, Leon Rinkel <leon@rinkel.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Leon Rinkel <leon@rinkel.me>
---
 package/bat/bat.hash | 4 ++--
 package/bat/bat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index f4d3e32c34..a79cb8f9a3 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  7940641baaa61cd3bcd1c3db4804d179609d6ccd955868928a129bf3f853e0b2  bat-0.19.0.tar.gz
+sha256  b29af37f274019cf1a36d9483c6f30ff780d3be9d0a9e6a96a43737388b7e409  bat-0.23.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
-sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
+sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index dc29a85429..395134df17 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.19.0
+BAT_VERSION = 0.23.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
