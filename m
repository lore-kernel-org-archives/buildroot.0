Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5A7C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5187781B0A;
	Sun, 19 Jun 2022 12:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5187781B0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fne6ETw9CQoR; Sun, 19 Jun 2022 12:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0958C819D2;
	Sun, 19 Jun 2022 12:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0958C819D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 729E91BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D227607D0
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D227607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMjIXpc5bzKb for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:56:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5106260648
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5106260648
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B0DB8716F; Sun, 19 Jun 2022 12:44:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:47:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30d94d4a3c39aaf251f2e7afcddb3d8d8ca2900c
X-Git-Newrev: c79d8cb72c9042c950336a3978504925570bd759
X-Patchwork-Hint: ignore
Message-Id: <20220619124431.5B0DB8716F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qdecoder: security bump to version
 12.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c79d8cb72c9042c950336a3978504925570bd759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
