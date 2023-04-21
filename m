Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DEBC77B75
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 11:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B62842EB;
	Fri, 21 Apr 2023 11:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B62842EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKuLfOL4jrzp; Fri, 21 Apr 2023 11:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1C7842EA;
	Fri, 21 Apr 2023 11:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1C7842EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36EE31C275D
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 11:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB0A4057F
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 11:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CB0A4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkkJ-NSn1VDt for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 11:36:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 524AB404C4
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 524AB404C4
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 11:36:48 +0000 (UTC)
Received: from pwmachine.lan (63.red-83-59-168.dynamicip.rima-tde.net
 [83.59.168.63])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7757F2174E4F;
 Fri, 21 Apr 2023 04:36:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7757F2174E4F
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 12:36:27 +0100
Message-Id: <20230421113627.20594-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1682077005;
 bh=GF9w8i+9chC8SAMRzPzu5XQcbsALWsoer6WvxhiafkA=;
 h=From:To:Cc:Subject:Date:From;
 b=TlK614hshGTqneaSc1N6T6jFX3K1C5EhA+lyREMmM0bBcSGP9HVZW/q7Ldl9Ou7xh
 TZ2hASUcreOoSAFs8+7lv/E1pAtHbDy8qWU+YWwi9t1ygiBBITVbvYZeytZO9DdLmF
 0iYJ/VpTcHqZDiVGy0vdjtFecQI9CLPTzoJk/cUA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=TlK614hs
Subject: [Buildroot] [PATCH] package/pahole: bump to version 1.25
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.25

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 5610b252a3..9dc676d9f4 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eeb88a62c3aaa1f4c389117b7e7cc08a49acc8a0e7f165f76dd9c5ab9af2c266  pahole-1.24.tar.gz
+sha256  db31d13c3dad8d9f4e38296bd35c4586e98b9c950e07dabba212985e6d051631  pahole-1.25.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 82bba2f777..1a3e156ebb 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.24
+PAHOLE_VERSION = 1.25
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
