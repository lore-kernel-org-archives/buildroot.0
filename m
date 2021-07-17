Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEC6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:38:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5BD60F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C5BD60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1808660A9C;
	Tue,  3 Aug 2021 23:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAQwuE6nd4v2; Tue,  3 Aug 2021 23:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6088160A89;
	Tue,  3 Aug 2021 23:38:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1391BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3772140F06
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlaIzVKlmWJR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0546040E51
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C93087F55; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 16:05:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0a5a9741e03e666204d577f82d29d93ba610381b
X-Git-Newrev: bdf0a924a7bfb28a4604bb18a4bb82b5fcc4cfb0
X-Patchwork-Hint: ignore
Message-Id: <20210803211006.4C93087F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: fix build
 with libtirpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdf0a924a7bfb28a4604bb18a4bb82b5fcc4cfb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Help nfs-utils to find the path of libtirpc

Fixes:
 - http://autobuild.buildroot.org/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - take the opportunity to move HOST_NFS_UTILS_DEPENDENCIES
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/nfs-utils.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index ab000e1ead..51a35028e2 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -23,7 +23,10 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
+
 HOST_NFS_UTILS_CONF_OPTS = \
+	--enable-tirpc \
 	--disable-nfsv4 \
 	--disable-nfsv41 \
 	--disable-gss \
@@ -32,10 +35,9 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
-	--disable-tirpc \
 	--without-systemd \
-	--with-rpcgen=internal
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc
+	--with-rpcgen=internal \
+	--with-tirpcinclude=$(HOST_DIR)/include/tirpc
 
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
