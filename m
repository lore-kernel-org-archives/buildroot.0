Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92BEC30653
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 08:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B5D60017;
	Wed, 26 Jun 2024 08:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HTo1qXBID6W; Wed, 26 Jun 2024 08:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B3D600B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B3D600B9;
	Wed, 26 Jun 2024 08:51:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D33FE1BF41B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE53781397
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esLdAnu5WraV for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 08:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 336E58138E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 336E58138E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 336E58138E
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 08:51:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1spwM42F5w-00fcKL; Wed, 26
 Jun 2024 10:51:00 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 10:50:59 +0200
Message-ID: <20240626085059.21075-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:8ZxdHQfkAuZWidT9ov2XSFEuuzirvyx7jQFRf82C8KCCfo/1Khw
 LXcFBYEL+kh79aOQXqHrLstq9FOifJWQkvLIq+LjlE1tqwKx3pAj4uCAqLE9cBTkqQaQJfV
 4N/hl+n5syQ+YpMNyW7oMDiClvyauvaARXQ/e0A9H7FiGiMfccSUVDVFTJukVgf6B4pY3y9
 qNhyOOba7acQElN0w0vXQ==
UI-OutboundReport: notjunk:1;M01:P0:4RAh7o01FvE=;gR+F8ln7KYyDCY6cZs8trAcLzH5
 YkSwPYEGSGUbF6sSUGIZJe+PyMdbG5YbWKH2/cMYth9QFj9S6NAy9zY3EjToFgwuKRJ8WzwME
 iUxhsVeOr2PGSVrsQ7C75WSyuU/4vBcovA+9odbAUCj+lBbrwAtyc54S480EiykBm0S5sO/Ia
 6tu5QWNKjfZZx2GFhLDeQDmnaf+f34mFBkbGAlaYQOzK5xJyAGf9sMn1Sfw2nHMTSJCEwkQry
 oIAyriAQuJokS9IJy1vsCSkiTgOcN74tWabzZfZ9zJ0MtulzB19+NDOhP3xUuF5PIrTAFx7Ds
 sW9abLB8zT9UbxzIX0CvWYwC7luK5TyolKkY9sQu3IefQ41CglWPaabn/Bpq3NcGTxj5l8rvy
 8LIvoh9NvD7c8bQ5Irff18+ImOfFP7KMRd+uGytyfQuwsMxqAi732YJbpYY+cBCSUg27WZZhD
 fHMeFhZhVpBetnBxeGMONCoH/KNrDcZfE2nZzz4bi4B8Dhyj9u7AFL1rE7tQwTYQdO7hVGQ2B
 rk5B4xTPXzphaAY4dQUDhOvwnOUC3GP+MLqSHOrdJXQsSfNZo82lRlB6vSz6YTUYcLBcyc6F+
 eHgy1WlzwLxX5n51ILcCffjwVdLrRhB+pHRpG9Pz2YDdfaTkeHPkIWeupNhb3ECMthg16FZ+b
 minzU13w6SgUOdvyl1HWyJBhzH55Om43MuzY5hacJT3YxRtm4m2GPq7PQd6h3Ktkh7TYgLZ3T
 2mq7qo/903K/8Ne7wICB0CxU1LbiXIymN7v+VR64m7kuFjRDD+2URHTtbw0XtzZb38D/gX0qm
 1LUgRo9Buo4ZJ9HFaUtaOxr7T8sVoLo2cndDRjg7zsrJ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719391860; x=1719996660; i=ps.report@gmx.net;
 bh=TSELeH/6MIvPOd2lHLdhLIzbzJioG5xY8mIsQXkTg+w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pBWEEdwLQQdUKFviaHXSsmaByBmxVPN24QVUn7phExrkkdmojNiYJ87vPP0fiwbH
 6B4gy+x6W9hhxzjiFyiP5Wmw4zewEdKBRvGbZSVRXAISq0nDguDWghq2Pe+mF4FqS
 E8ERGY5829AYF9C4LPv8bvZXKWflSh8hHau/XtwmkZICPjMoWrZvKFpSTZbFCd/Il
 Nvrmpo3mwYzrm3jcjZpIjLOvKseKIclVvB1I9VtQh/ysrc6izDXOnM+f5kLKNH0+f
 EaiO4Doab7RVbnm4x3as0jH+91ixQF0B2SOyFcE9zEkNGy3c6CNkFELZ4X94xLFn3
 McF1iOvHTTD1werURQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=pBWEEdwL
Subject: [Buildroot] [PATCH v1] package/strace: bump version to 6.9
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/strace/strace/releases/tag/v6.9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 68b9cc5f93..cdb085def7 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.8/strace-6.8.tar.xz.asc
-sha256  ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149  strace-6.8.tar.xz
+# https://strace.io/files/6.9/strace-6.9.tar.xz.asc
+sha256  da189e990a82e3ca3a5a4631012f7ecfd489dab459854d82d8caf6a865c1356a  strace-6.9.tar.xz
 sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 908aed6653..c92f85917b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.8
+STRACE_VERSION = 6.9
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
