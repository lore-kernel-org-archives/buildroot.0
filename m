Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE816C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1E860DB2;
	Wed, 11 Jan 2023 09:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1E860DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pF6oRDkcQEiy; Wed, 11 Jan 2023 09:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D4460B45;
	Wed, 11 Jan 2023 09:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D4460B45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7DE81BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C37D581FB7
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37D581FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OW6e3eM8NH2d for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:41:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B77ED81FA8
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B77ED81FA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6021878EB; Wed, 11 Jan 2023 09:41:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:41:24 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 9c7a8bcb48ee4809e12f8aee5a18b5b8424b27d0
X-Git-Newrev: 801968f3af0c9448f99d68da43146c7d3972b4b1
X-Patchwork-Hint: ignore
Message-Id: <20230111094149.A6021878EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/check: disable doc
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

commit: https://git.buildroot.net/buildroot/commit/?id=801968f3af0c9448f99d68da43146c7d3972b4b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

documentation can be disabled since version 0.13.0 and
https://github.com/libcheck/check/commit/8ca1f79a73c374e9e9172937938947584c921659

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d7d48b9840d242acf1b8bfb141c89904e53301fe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/check/check.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/check/check.mk b/package/check/check.mk
index be82539469..ccffd08ee3 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -10,6 +10,7 @@ CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
 CHECK_LICENSE_FILES = COPYING.LESSER
+CHECK_CONF_OPTS = --disable-build-docs
 
 # Having checkmk in the target makes no sense
 define CHECK_REMOVE_CHECKMK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
