Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E262C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 02:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1DB60E3B;
	Sat,  1 Oct 2022 02:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1DB60E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFNy_rWRseR8; Sat,  1 Oct 2022 02:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE63560C29;
	Sat,  1 Oct 2022 02:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE63560C29
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61D0B1BF281
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 02:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A5C41965
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 02:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A5C41965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuqfDtvPR1l9 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 02:05:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB1241953
Received: from xtrwsqbh.outbound-mail.sendgrid.net
 (xtrwsqbh.outbound-mail.sendgrid.net [167.89.100.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAB1241953
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 02:05:20 +0000 (UTC)
Received: by filterdrecv-549888dc99-92z4f with SMTP id
 filterdrecv-549888dc99-92z4f-1-6337A05E-2E
 2022-10-01 02:05:19.037666835 +0000 UTC m=+274835.741933844
Received: from athaariq.my.id (unknown) by geopod-ismtpd-canary-0 (SG)
 with ESMTP id FD1ezX2KT8OCrFajQhjzrw
 Sat, 01 Oct 2022 02:05:18.333 +0000 (UTC)
Received: from athaariq.my.id (unknown
 [IPv6:2404:8000:1015:179d:8909:4a3c:8b10:a97a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by athaariq.my.id (Postfix) with ESMTPSA id DB26C1053AB;
 Sat,  1 Oct 2022 08:58:51 +0700 (WIB)
From: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
Date: Sat, 01 Oct 2022 02:05:19 +0000 (UTC)
Message-Id: <20221001020445.1458953-1-buildroot@athaariq.my.id>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?iwEO1kVhUXaWaYvxfXXvBV=2F1Fo0xvv4Xx00290SD89LhbjIh9fYZVxq2H7yHHE?=
 =?us-ascii?Q?F0=2F8vX15aFtJF6VrmsuLc+KLC1C1zDWqH1FIslD?=
 =?us-ascii?Q?c2g+Grg2AoA3MHJev8q3Z5N=2F7T4PVFfY7AzMhLt?=
 =?us-ascii?Q?4jO4OHNWnf4oRVwZLiHjEQvfKlojV2QcMNS4ia9?=
 =?us-ascii?Q?L1OyGo6Udp0LNAezMk2ZrVXVFu0GX0fIbcOiFSO?=
 =?us-ascii?Q?I9rdiUOBFZaLQyDp1suAlYnTgtfVEwmee5vsb9J?=
 =?us-ascii?Q?UGgm4rrNiSS1innpr1FFQ=3D=3D?=
To: buildroot@buildroot.org
X-Entity-ID: 8hTT1BSDhM31GKM3tJ7/LQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=athaariq.my.id; 
 h=from:subject:mime-version:to:cc:content-transfer-encoding:
 content-type;
 s=s1; bh=nqL5Bq42P2QcgP0CILTsdajIVeP1U6kr8c5SG1vzcNU=;
 b=VdFcEAHP5A+xWqEW6Hly1+XHClxoBKnSJv5E3gMP5nwT6eBJMUhjj+rvzxqE+fqLTrgN
 lcCcdC5hdWjLBxgZF5PM9+CKprZenSWn6WDdsYsXtV2LMLpYXOg74hmYVXtH2Z/ilV2NXW
 ioSTtKGPB1PLqvoyGKEhyINiNDn/0rfppABT1TFB1IT6nWx5n7DAYwjLjmVMRLjNvpPDjm
 2fRZw9uca+2ndpAf+fwKg/DwFEr4+kuQnHGqd/uW3gfJz8fLd0k0rtV+z/MNxIjyoY1REt
 mT5GE0cty21HBQPiSL0GUc+/G0HQR9ds5cDIhP7QcIBuSl42sg5IG8+jr2A1Xd1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=s1 header.b=VdFcEAHP
Subject: [Buildroot] [PATCH 1/1] package/glibc: fix fsconfig_command
 redeclaration bug
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Temporary fix for buildroot-specific bug. Ideally, we should install linux-headers first then glibc. Is this actually possible on Buildroot? If yes, then we can also fix bug #15021 simultaneously if linux-headers being installed first as possible.

Signed-off-by: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
---
 .../0002-fsconfig_command-workaround.patch      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/glibc/0002-fsconfig_command-workaround.patch

diff --git a/package/glibc/0002-fsconfig_command-workaround.patch b/package/glibc/0002-fsconfig_command-workaround.patch
new file mode 100644
index 0000000000..27dd25b244
--- /dev/null
+++ b/package/glibc/0002-fsconfig_command-workaround.patch
@@ -0,0 +1,17 @@
+diff --git a/sysdeps/unix/sysv/linux/sys/mount.h b/sysdeps/unix/sysv/linux/sys/mount.h
+index 19841d0738..43a681d097 100644
+--- a/sysdeps/unix/sysv/linux/sys/mount.h
++++ b/sysdeps/unix/sysv/linux/sys/mount.h
+@@ -27,11 +27,7 @@
+ #include <stddef.h>
+ #include <sys/ioctl.h>
+ 
+-#ifdef __has_include
+-# if __has_include ("linux/mount.h")
+-#  include "linux/mount.h"
+-# endif
+-#endif
++#include "linux/mount.h"
+ 
+ 
+ #define BLOCK_SIZE_BITS	10
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
