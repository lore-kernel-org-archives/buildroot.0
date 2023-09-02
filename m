Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7322FC001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB11760EE2;
	Sat,  2 Sep 2023 20:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB11760EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udbBZFrj9DTE; Sat,  2 Sep 2023 20:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE2E60D71;
	Sat,  2 Sep 2023 20:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE2E60D71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2A5C1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8AA781F69
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 20:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8AA781F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DkaJuPCm0XEK for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 20:27:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BDA881F63
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 20:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDA881F63
Received: by mail.gandi.net (Postfix) with ESMTPA id 4588EC0003;
 Sat,  2 Sep 2023 20:27:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  2 Sep 2023 22:27:23 +0200
Message-ID: <20230902202724.3498579-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693686448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=arkn3s/I/lct/gHaqFtZ7AfLZRBOlZrEuH8l//yzEoA=;
 b=Hbpgcu+1/McHYR1VTljMa10ASckHI08v+/b/EPAQMLqs7vAVjZWZ26OenZFl74R64ALPEX
 2IInp30yZeLjlbYCx3buyFajRn2Jj4DsyZAXF16k8KAQ3CrL7IlBCzvUbXZtU1+Gn/EJXA
 5Puu+oEHZAvEYavTTZbEojFODsSPEEIg+GRve/xNrt2QnwOyAQQx0ERD97K91XXbtQgA6/
 73HRvIYsR3CnIDJP5H0dFG1I16dp4Fjda+w882weXaMW6TY86CztDTqy5yTu4XabRdaCGA
 fBWW+gr30WMnNNERILZ+alfr3eaoKclwF+G96Yn6/rc21QlQLDsfVMpyCb13/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hbpgcu+1
Subject: [Buildroot] [PATCH next] package/polkit: bump to version 123
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

polkit runtime tests are passing successfully with this version bump:

  https://gitlab.com/tpetazzoni/buildroot/-/pipelines/989945901

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index ffdc2a7568..5eadc89753 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0d69656d60800835c3d7d1f0a8362b32e1ae3ace2875a35bb624296fc52d5dc4  polkit-122.tar.gz
+sha256  b69278f6ea0eac406350c45f5720e2fe5e4beaf9f53c16d9902e025965418864  polkit-123.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index dab5d542eb..f58dbe43de 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 122
+POLKIT_VERSION = 123
 POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
