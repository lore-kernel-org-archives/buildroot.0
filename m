Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29197C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEAB341BD5;
	Wed, 30 Aug 2023 11:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEAB341BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjz5Rr41IPiA; Wed, 30 Aug 2023 11:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F7040570;
	Wed, 30 Aug 2023 11:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F7040570
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 325CC1BF980
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02ACB41B9E
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02ACB41B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWnxtAtvwepk for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:02:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BC0B41BA7
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC0B41BA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF20B8655B; Wed, 30 Aug 2023 11:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:31:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d0af5a6ecf7048119d287d8601ab4c101fb2089d
X-Git-Newrev: 4d654340b69c165949472afe3819f8c972215709
X-Patchwork-Hint: ignore
Message-Id: <20230830110241.EF20B8655B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/crudini: add host
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d654340b69c165949472afe3819f8c972215709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
