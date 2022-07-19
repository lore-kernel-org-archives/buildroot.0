Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5282DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 16:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE5E540C74;
	Tue, 19 Jul 2022 16:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE5E540C74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcR2imyobdxn; Tue, 19 Jul 2022 16:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F328F40C72;
	Tue, 19 Jul 2022 16:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F328F40C72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D692B1BF283
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF05960B7D
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 16:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF05960B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bb-pyvUt1fy2 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 16:00:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F086F60AF2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 16:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F086F60AF2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E676283D4E; Tue, 19 Jul 2022 15:47:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 18:00:30 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4f8f9c1506bd857acc029b8387abd6b80d4d4f03
X-Git-Newrev: aee9de937dafe43d5520b2436c089db57605ece3
X-Patchwork-Hint: ignore
Message-Id: <20220719154729.E676283D4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qdecoder:
 security bump to version 12.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aee9de937dafe43d5520b2436c089db57605ece3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is a maintenance release includes important security updates that
fixes possible vulnerability in URL decoding (see the report attached
below). All the qDecoder users are recommended to upgrade to this
version as soon as possible.

Fix CVE-2022-32265

Update hash of COPYING (change in year and URL removed:
https://github.com/wolkykim/qdecoder/commit/51bdcc2c158f2a12a817e8ebcb18f56e3121a808
https://github.com/wolkykim/qdecoder/commit/745878212df963a7a8081f09a747730e74faae63)

https://github.com/wolkykim/qdecoder/releases/tag/v12.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c79d8cb72c9042c950336a3978504925570bd759)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qdecoder/qdecoder.hash | 4 ++--
 package/qdecoder/qdecoder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
index e3fb837597..05337777b4 100644
--- a/package/qdecoder/qdecoder.hash
+++ b/package/qdecoder/qdecoder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3911576ad8766697a9c8c767458edc953ae686eb53cd31d21e38edd7831ed9aa  qdecoder-12.0.8.tar.gz
-sha256  17e647523e5c5c75fd02861dcf3ea91a146d918ab303460ee58135c9dd70904e  COPYING
+sha256  edd32bd5119d276afa9e01cd54a1c23049cad4e96dc6a8e48ac324580e085ebb  qdecoder-12.1.0.tar.gz
+sha256  41f34ba1ed6e5d8d3488992311f474cd3f614b82bada88ae53216946026cfae7  COPYING
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 8cb5d3bc97..05ee657131 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QDECODER_VERSION = 12.0.8
+QDECODER_VERSION = 12.1.0
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
