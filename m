Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFCAC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE7341BAA;
	Wed, 30 Aug 2023 11:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE7341BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78C4o0Uj31cN; Wed, 30 Aug 2023 11:05:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF4A417C6;
	Wed, 30 Aug 2023 11:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF4A417C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 33CAB1BF282
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19ED941C60
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19ED941C60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZbZD4Fm8SO6 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB5041C48
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB5041C48
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1622D86586; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 10:19:06 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: dbf9f01f0c768cfe78c16990fb79cd247a76dc89
X-Git-Newrev: bb17fd587c5f73f16a3b5c56b03a767c0f73580d
X-Patchwork-Hint: ignore
Message-Id: <20230830110347.1622D86586@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/crudini: add host
 variant dependency from python-iniparse
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb17fd587c5f73f16a3b5c56b03a767c0f73580d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dd194540a1b8e9f70a01c6bf9c574863168e6778)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/crudini/crudini.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index c376c5f777..48e0ebde8f 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -9,6 +9,9 @@ CRUDINI_SITE = $(call github,pixelb,crudini,$(CRUDINI_VERSION))
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_CRUDINI_DEPENDENCIES = host-python-iniparse
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
