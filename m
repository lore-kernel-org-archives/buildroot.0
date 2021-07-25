Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F722C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:35:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C1960F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7C1960F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9051F60AFF;
	Wed,  4 Aug 2021 00:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hy5VoLQBtY7v; Wed,  4 Aug 2021 00:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD82D60AF7;
	Wed,  4 Aug 2021 00:35:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10AED1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5E2540F59
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55gWLXzkaRp8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C4EB40660
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F1CCD81F12; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 18:19:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ddd9e723c3ef6f8eb26a5eafd7d8a504b56059f2
X-Git-Newrev: 2aea94a47892f22250a63f4ee4fda1ec5373f6c4
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.F1CCD81F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: Add
 optional GSS support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2aea94a47892f22250a63f4ee4fda1ec5373f6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nfs-utils/Config.in    |  7 +++++++
 package/nfs-utils/nfs-utils.mk | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index bd1e091331..f2997b9c91 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -26,6 +26,13 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
 	help
 	  Enable NFSv4/NFSv4.1 support
 
+config BR2_PACKAGE_NFS_UTILS_GSS
+	bool "gss"
+	depends on BR2_PACKAGE_NFS_UTILS_NFSV4
+	select BR2_PACKAGE_LIBTIRPC_GSS
+	help
+	  Enable GSS support
+
 config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
 	bool "rpcdebug"
 	help
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 0b4bca4772..763dd57ace 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -16,7 +16,6 @@ NFS_UTILS_AUTORECONF = YES
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPTS = \
-	--disable-gss \
 	--enable-tirpc \
 	--enable-ipv6 \
 	--without-tcp-wrappers \
@@ -52,6 +51,16 @@ else
 NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
 endif
 
+ifeq ($(BR2_PACKAGE_NFS_UTILS_GSS),y)
+NFS_UTILS_CONF_OPTS += \
+	--enable-gss \
+	--enable-svcgss \
+	--with-krb5=$(STAGING_DIR)/usr
+NFS_UTILS_DEPENDENCIES += libkrb5
+else
+NFS_UTILS_CONF_OPTS += --disable-gss --disable-svcgss
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 NFS_UTILS_CONF_OPTS += --enable-caps
 NFS_UTILS_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
