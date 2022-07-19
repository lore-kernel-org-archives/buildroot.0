Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69459C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 17:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB73E404D5;
	Tue, 19 Jul 2022 17:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB73E404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7D2X9kxlKwRZ; Tue, 19 Jul 2022 17:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A646A40C66;
	Tue, 19 Jul 2022 17:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A646A40C66
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36AEB1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F299B60B91
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F299B60B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PN7Lus7fBu8 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 17:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502CA60AD3
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 17:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 502CA60AD3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2BA6283E54; Tue, 19 Jul 2022 16:56:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 19:09:28 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c3a3cf97e93906e9479a27c572e1b62e01680598
X-Git-Newrev: 59e7917e6194c62a18acb1a3e4ccb9c248222cf2
X-Patchwork-Hint: ignore
Message-Id: <20220719165638.2BA6283E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ecryptfs-utils:
 add pkcs11-helper optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=59e7917e6194c62a18acb1a3e4ccb9c248222cf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

pkcs11-helper is an optional dependency which needs openssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f90061fc384d42805145e0c6cfa01de0afe48f31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 737c5b0ebb..393ea4da78 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -26,6 +26,14 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
+
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER),y)
+ECRYPTFS_UTILS_CONF_OPTS += --enable-pkcs11-helper
+ECRYPTFS_UTILS_DEPENDENCIES += pkcs11-helper
+else
+ECRYPTFS_UTILS_CONF_OPTS += --disable-pkcs11-helper
+endif
+
 else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
