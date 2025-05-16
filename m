Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE0C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0C540B9F;
	Fri, 16 May 2025 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwcSVcr1EGnI; Fri, 16 May 2025 14:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF5940BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CF5940BA2;
	Fri, 16 May 2025 14:30:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D7FA1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12C554044F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvaS38dONTit for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF8CC4025F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF8CC4025F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF8CC4025F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:30:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2489343875;
 Fri, 16 May 2025 14:30:28 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 May 2025 16:30:26 +0200
Message-ID: <20250516143027.237233-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetleethfdvueetgedvvdejjeetffeggfdvieegueevvdeuvedtleeuvdfgueeutdenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747405828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LGJljxt28TYXjFfDkxxLMSkxVTBi7Gidg7ywVqxW39o=;
 b=krwqBsOgTuB0+8WslF7hCHVlZ93+SlTN6mlLRDW9FfUzF/9MQtxmhILDiqMU9+LG13c2ji
 OJl5RgDCNpJFwDUx9iTITjjd/09VBNiNnw3xzXtNmPyAXOBunSG47IdOnWAgAABFVcPWEk
 y5vjfk9roXe0o7VuQ6kr0K4B+Crro1KI6xyp/83HEHxxuVpKekIRdCOzcGKHWcOD4WPm04
 BuLqEtK5TpkrSghhRRnvrndrkpRfzZegMLNFLfEb40tnVJD99tFmfAc4Yg0BFmctoIRFzu
 qmItFUx0MVL4JBFpsCPvmuRu0p4QFjAip/pi1vMTey+xUA52i8yw8E2hmFWOTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=krwqBsOg
Subject: [Buildroot] [PATCH] package/cdrkit: add patch to fix CMake 4.0
 build issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CMake 4.0 requires to have a cmake_minimum_required() in
CMakeLists.txt, which cdrkit doesn't have, so ths commit adds a patch
adding the missing statement. We have chosen version 3.18 because that
the oldest version that we expect is 3.18. From
package/cmake/Config.in.host:

  # The minimum system cmake version we expect if 3.18 as provided by
  # Debian bullseye, that we use in our reference build docker image.

The patch cannot be upstreamed, as cdrkit basically no longer has any
upstream.

Fixes:

  https://autobuild.buildroot.org/results/3412e47836b54928a55c12b46549d6307ab623e7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Lists.txt-add-cmake_minimum_required.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch

diff --git a/package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch b/package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch
new file mode 100644
index 0000000000..bbb652ae32
--- /dev/null
+++ b/package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch
@@ -0,0 +1,25 @@
+From 055130476b2ae349ab00b5cc5958d02da2fc2983 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 16 May 2025 16:12:03 +0200
+Subject: [PATCH] CMakeLists.txt: add cmake_minimum_required()
+
+Using cmake_minimum_required() is now mandatory with CMake 4.0.
+
+Upstream: N/A, no clear upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57edba6..70c6993 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,4 @@
++cmake_minimum_required(VERSION 3.18)
+ PROJECT (cdrkit C)
+ SUBDIRS(include genisoimage wodim libedc libhfs_iso libparanoia icedax libusal librols libunls readom netscsid 3rd-party/dirsplit)
+ 
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
