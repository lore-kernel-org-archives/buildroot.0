Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC00C678D5
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EEDE4105C;
	Wed, 11 Jan 2023 09:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EEDE4105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXN-ij-TjkGl; Wed, 11 Jan 2023 09:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A4AD410BB;
	Wed, 11 Jan 2023 09:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4AD410BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22AC81BF2B3
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 099E48210A
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099E48210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7k2LszDTS-m for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:42:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 364A1820F1
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364A1820F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26C75878F9; Wed, 11 Jan 2023 09:42:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 10:41:06 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 615c2b690e4b1e4c55bc94a906ee6e254ca99384
X-Git-Newrev: b96bf0a106e4c344dfb8fff4d8e6785e19d17d15
X-Patchwork-Hint: ignore
Message-Id: <20230111094257.26C75878F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/check: disable doc
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

commit: https://git.buildroot.net/buildroot/commit/?id=b96bf0a106e4c344dfb8fff4d8e6785e19d17d15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
