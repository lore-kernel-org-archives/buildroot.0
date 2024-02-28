Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000BAC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D1B2416A2;
	Wed, 28 Feb 2024 21:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKWltzdeh7d5; Wed, 28 Feb 2024 21:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51426416AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51426416AF;
	Wed, 28 Feb 2024 21:25:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A149A1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9622E60A4A
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asjpYF4G16FA for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1563600B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1563600B5
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD82787CDC; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:11:58 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 92a53b90625c0e4d76db44713527ca50d8cee418
X-Git-Newrev: 535bac39d5bded456bf16d4c5239a0c824234208
X-Patchwork-Hint: ignore
Message-Id: <20240228212548.DD82787CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/crda: drop
 CRDA_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=535bac39d5bded456bf16d4c5239a0c824234208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:kernel:crda added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:kernel:crda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 85d300f1021df905e60e704407b68dbed75ba430)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/crda/crda.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index a73c9aa26d..8043260cfc 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -9,7 +9,6 @@ CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snap
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
-CRDA_CPE_ID_VENDOR = kernel
 
 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
