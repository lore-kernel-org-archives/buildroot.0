Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF99C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 17:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 879D382B94;
	Tue, 19 Jul 2022 17:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 879D382B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2AKGJH8N1iy5; Tue, 19 Jul 2022 17:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A2B8823DD;
	Tue, 19 Jul 2022 17:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A2B8823DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23EB11BF5A8
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F238E60ADE
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F238E60ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aLJ4V99p0ub for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 17:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54E5B60B3A
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 17:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54E5B60B3A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 341E483E3D; Tue, 19 Jul 2022 16:56:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 19:09:32 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 59e7917e6194c62a18acb1a3e4ccb9c248222cf2
X-Git-Newrev: 8f6aebdb2e163f681a43ab1175b7c7bdfd25d086
X-Patchwork-Hint: ignore
Message-Id: <20220719165638.341E483E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ecryptfs-utils:
 add libgpgme optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f6aebdb2e163f681a43ab1175b7c7bdfd25d086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e122d962a1415fb595286ad71771701f9860765d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 393ea4da78..6eb3add98b 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -16,6 +16,15 @@ ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap
 
 ECRYPTFS_UTILS_CONF_ENV = ac_cv_path_POD2MAN=true
 
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+ECRYPTFS_UTILS_CONF_OPTS += \
+	--enable-gpg \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr
+ECRYPTFS_UTILS_DEPENDENCIES += libgpgme
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-gpg
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-pam
 ECRYPTFS_UTILS_DEPENDENCIES += linux-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
