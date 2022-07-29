Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27696C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8025860D69;
	Fri, 29 Jul 2022 12:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8025860D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJ_CjIPOg95e; Fri, 29 Jul 2022 12:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E94960B77;
	Fri, 29 Jul 2022 12:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E94960B77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49F371BF3F9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 247FD40154
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 247FD40154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5Jq9YrwmuUF for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:11:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C8240412
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C8240412
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:11:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HOpUo2cqebMeiHOpUoNXux; Fri, 29 Jul 2022 14:10:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 14:10:54 +0200
Message-Id: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLPW4qiPa0F2pl7iBFnArImyOpii0y4wNdq5k8oFq5MJbCkTu6h8nh1cjGtPq1kXG242M5lagnaQvTlIljxqZ4/4dsKHR+WwVQsZg1aJrsueRGgGqW+m
 d2BiVjwHZlncKhM5SDM39BZpMwF7rZP3pGW5bSgSzBM/s6rBZ4nFsr7sh5zT0FrpYGWUhFVF++yPpE/JcVIBIwo7kWV2lJ1Ztq1rVOSGmtXkQJFCbimfDn38
 rGP1F7vOmHc+QpeCrZy4yI/KUDAwO5VMtwJI0qsSNxV4w/vtK2bcJteDy81qe1r2kf6EizhkIPGG4vXsn8725WfvcUSeH/SSU+TV5kMskry/GFbM+76jPGW5
 YRJZfo0MztyCC387e6FxOwB/CoSB7cXaAOXbZAObtsPkab0oSZisDirE6m0bHETClta86XXz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659096657; bh=WspfLGYFjfkwKIk5am6Hn8IxFJFTL+RAY13nugZGcJQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=F1+aduUFxgCL0eyZj7gjQ09aQCMpWjg6950DhgAGd1A3fLhEWd61M+JnU9N7RM+nk
 yzL2HR9jk8aOnIu44P0addJl9O6OxglVaBopcM6uFpyqfkyEeSpzuaajzPjBGUQgkp
 w/P2GTOrFW2LQ0suzNE5JVK7jKnVnorHNVVsn/0dEMkd8Nu8t0zHaJ+pnZGCj2B6/Q
 v1AqYr/KS32AGSwgOmLs4cr2kQYjXq4P+77sub3gnkDVRReKpgMrSxFoucYfthknw+
 LptmA4PWbC9cm+vZQLHAJWvdSSFIGIvUuvAvqfp6QZ3H90929KIS2yPDfYGMCkbSGG
 XkqRY4cEIdC4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F1+aduUF
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc version for
 gcc bug 68485
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index e6fabbfc74..6d12b6fed7 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -139,7 +139,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
-# exists in gcc 9.x
+# exists in gcc 11.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
