Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF2DCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA6445AC9;
	Tue,  9 Jun 2026 13:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6NWlf4ysDmc; Tue,  9 Jun 2026 13:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5FDD45CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010331;
	bh=tvhqqMf3zItf8mjOLpCChm65vbaqh8bAUJeQh+SJydU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IsvkyZs+O/y3/mpiMWPm6qEkz/rQUQJrRjejntx32OBvQm0SMv3xuX13ylvbq+NCm
	 wyrHEB3EK8VpGuA+0sLLOvw2cLjITAQykseUtfYTo92SFu/Xac2Ov+ZyyAQGpyoBkf
	 gDfxV0VYp3RN0Y7BQbHWjyNCgYoazr9gAhsIAc2ZUAD2ZFDoiDQGD2OFFlARrpeFat
	 /DT2A9CSFTLJrobhVgxnFa5NxoKptsEB+th9mdrgNz+u57QkdU0J/BgpvNp8wKd5oo
	 CPI3gRgrDElc14XGzAO6wgEHpiykJqA3/zuhpYeNA81XO6bqvoCluCZ7e139wuqYAf
	 mLAEXbhiEXhFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5FDD45CE4;
	Tue,  9 Jun 2026 13:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50452196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE164272A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QFUf3HTE-JL for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8787B426DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8787B426DE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C426E87E87; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 17:40:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bf73cbdd7a073774e33b84195cb2c2e92737143
X-Git-Newrev: 51d8351e286a6528b88ddb9f2dbfd1c5c86aba7b
X-Patchwork-Hint: ignore
Message-Id: <20260609130125.C426E87E87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: bump version to 2.8.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51d8351e286a6528b88ddb9f2dbfd1c5c86aba7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated license hash due to upstream commit:
https://github.com/networkupstools/nut/commit/d5b040b2a9e7eb86d819b534a0ba274f76616dfa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nut/nut.hash | 6 +++---
 package/nut/nut.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 0d78324818..43560d5028 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,7 +1,7 @@
-# From https://github.com/networkupstools/nut/releases/download/v2.8.4/nut-2.8.4.tar.gz.sha256
-sha256  0130ba82ea79f04ba4f34c5249a85943977efd984ed7df6aec1a518d5a3594f8  nut-2.8.4.tar.gz
+# From https://github.com/networkupstools/nut/releases/download/v2.8.5/nut-2.8.5.tar.gz.sha256
+sha256  18bf32e59eb764b13da3c4fa70384926d7fa584cb31d2fe7f137a570633eeec1  nut-2.8.5.tar.gz
 
 # Locally computed
-sha256  40885775f43463c404d74bbd00a59fac6c0fe73f838d4520472d721917412577  COPYING
+sha256  a6c3d535c77fbfcecb33a3545668cfa0354a5ad517930c255eb39f135f7213db  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 4fc461a993..3b4aef28ce 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.8.4
+NUT_VERSION = 2.8.5
 NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
