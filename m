Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D6EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 04:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A142140124;
	Fri, 14 Jul 2023 04:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A142140124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1i6iSHGQj5hZ; Fri, 14 Jul 2023 04:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF42B40150;
	Fri, 14 Jul 2023 04:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF42B40150
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5731BF384
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 04:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB6E40124
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 04:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB6E40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_SwQLfLhmJP for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 04:54:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76055401C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76055401C2
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 04:54:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92CC4A4C00C8;
 Fri, 14 Jul 2023 06:54:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45654)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKAop-0004Yg-15;
 Fri, 14 Jul 2023 06:54:15 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 06:54:15 +0200
Message-Id: <20230714045415.2365259-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689310455;
 bh=AkiX6GUBqYpOvnUJ4C9E5YHadrUEGzgvC2HfHm5ml04=;
 h=From:To:Cc:Subject:Date:From;
 b=ZJvJPZtcSIQWuUl6X4H24zvgOvy4MAbvVInSXqo/Wvxdd4H6dcBK9Xwhsq+4+uF3T
 tUT+3PDHPHgaph+LFS/NVBOn4DYXgkJzKiOt2ejhsAnZLwOIciifKHIL0SbrSsj2Tq
 sAtv3U4FDRFdNYp03bFJJAe6ONrLI/zJh2bU8xYd01hF7RI/fxJvwzmylo+WQLhvvf
 cZQbD3kkhDQjalfRQNnIW31l6kopVh9ED2YfOhsSCPbBLLI8YNmk6QdBGs1AFaErAJ
 dwZVROBuaQB4qb/55o0UYqRuOa4a0SM5UmVuvtpFiOqCU3QvaY9pOHd2E8uOLUO++g
 Y7Mk1+2qhf2AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ZJvJPZtc
Subject: [Buildroot] [PATCH 1/1] package/intel-mediadriver: bump version to
 23.3.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 81fa5ba027..d22732b99f 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dfcf2facc4f8bf3df6b147222786032be195874adacc2f4071fc6c91a0abdf0a  intel-media-23.2.4.tar.gz
+sha256  2d0e8892199f1f2365fd8729776bdfd9968a97a63ce1e759b3724bff57e9fc08  intel-media-23.3.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index daddf9f8a9..77de031a45 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.2.4
+INTEL_MEDIADRIVER_VERSION = 23.3.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
