Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409BAC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 17:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB35340574;
	Tue, 19 Jul 2022 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB35340574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QNTbTEoNJYz; Tue, 19 Jul 2022 17:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDC3D4051C;
	Tue, 19 Jul 2022 17:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC3D4051C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F18F1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29855823E0
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29855823E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KniC-gKayPDf for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 17:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AD72823DD
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 17:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AD72823DD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 29F5E83E6B; Tue, 19 Jul 2022 16:56:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 19:09:02 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ab90fa796c7f59494ed0c738ce47baeb8b0d31b1
X-Git-Newrev: 52da03a34a02775b7b10811bf73243c5aeea179d
X-Patchwork-Hint: ignore
Message-Id: <20220719165645.29F5E83E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/ecryptfs-utils:
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

commit: https://git.buildroot.net/buildroot/commit/?id=52da03a34a02775b7b10811bf73243c5aeea179d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
