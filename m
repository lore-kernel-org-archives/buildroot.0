Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38037C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E7A824DD;
	Sun, 19 Jun 2022 13:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E7A824DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2bwmBvyQhJ2; Sun, 19 Jun 2022 13:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4DC18244D;
	Sun, 19 Jun 2022 13:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4DC18244D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC6611BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3AAD40915
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3AAD40915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2F2QtDYTasg for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:46:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A89F40908
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A89F40908
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 752938732D; Sun, 19 Jun 2022 13:34:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:44:11 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 5b53f4072ba4adeca5d74949a0b3f3b3b2070ddb
X-Git-Newrev: 473efeaf4ff98db68e2bf2b1cc8db120e0e701da
X-Patchwork-Hint: ignore
Message-Id: <20220619133410.752938732D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/ecryptfs-utils:
 add host-pkgconf dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=473efeaf4ff98db68e2bf2b1cc8db120e0e701da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Add host-pkgconf dependency to fix the following build failure (e.g. with
BR2_PER_PACKAGE_DIRECTORIES):

configure: error: OpenSSL not found

As a side-effect, NSS_{CFLAGS,LIBS} can be dropped

Fixes:
 - http://autobuild.buildroot.org/results/ea16957e8f048b713f5d2713aa5f0c157b62f574

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 80fc07c67a813f9b4844d4afbc562bc759b9174c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index f087e81a42..737c5b0ebb 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -11,14 +11,10 @@ ECRYPTFS_UTILS_LICENSE = GPL-2.0+
 ECRYPTFS_UTILS_LICENSE_FILES = COPYING
 ECRYPTFS_UTILS_CPE_ID_VENDOR = ecryptfs
 
-ECRYPTFS_UTILS_DEPENDENCIES = keyutils libnss host-intltool
+ECRYPTFS_UTILS_DEPENDENCIES = host-pkgconf keyutils libnss host-intltool
 ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
-#Needed for build system to find pk11func.h and libnss3.so
-ECRYPTFS_UTILS_CONF_ENV = \
-	ac_cv_path_POD2MAN=true \
-	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
-	NSS_LIBS="-lnss3"
+ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
