Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ADCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AF860EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7AF860EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF80280EE9;
	Sat,  4 Sep 2021 21:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FenYMjJiHcq; Sat,  4 Sep 2021 21:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0917E80EE7;
	Sat,  4 Sep 2021 21:03:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC42F1BF28F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A956D40251
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sqqfE9LEpp0 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB819401B7
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 742B4884DB; Sat,  4 Sep 2021 21:02:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:57:08 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7e3b63f6b66ce25fcd1a632cf9b5b2f66b4d6a1c
X-Git-Newrev: c64565e9809766d294b0d4f21ad0a4fd9d8be5a8
X-Patchwork-Hint: ignore
Message-Id: <20210904210204.742B4884DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/sqlite: add
 SQLITE_TAR_VERSION
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c64565e9809766d294b0d4f21ad0a4fd9d8be5a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

3.34.1 is the version used by https://release-monitoring.org as well as
NVD NIST database so add SQLITE_TAR_VERSION and drop
SQLITE_CPE_ID_VERSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3943b6f003647c8d9a993da31f0d22061906e9d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 2c2928f274..f04b866631 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3340100
-SQLITE_CPE_ID_VERSION = 3.34.1
-SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
+SQLITE_VERSION = 3.34.1
+SQLITE_TAR_VERSION = 3340100
+SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
