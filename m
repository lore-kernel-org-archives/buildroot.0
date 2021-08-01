Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC22EC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B51610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87B51610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A6583C89;
	Sun,  1 Aug 2021 12:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f60hzgVcK_Ha; Sun,  1 Aug 2021 12:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F2683C7A;
	Sun,  1 Aug 2021 12:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1211BF977
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19D634157D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WxaXC2mBkXu for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 604EF4050F
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 37FDD8A44E; Sun,  1 Aug 2021 12:07:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 14:05:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1c5ca57c30c851f63b1e24c7add5a9c34853bc8
X-Git-Newrev: e5910ff66b616fa557914b12266b36b1c87dc77a
X-Patchwork-Hint: ignore
Message-Id: <20210801120745.37FDD8A44E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5910ff66b616fa557914b12266b36b1c87dc77a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for rsync is added by the services/rsync module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rsync/rsync.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index f57e471ef9..5b51ca1df7 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -9,6 +9,7 @@ RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
+RSYNC_SELINUX_MODULES = rsync
 RSYNC_DEPENDENCIES = zlib popt
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
