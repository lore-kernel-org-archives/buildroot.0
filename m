Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B82C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:15:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B2E760F44
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B2E760F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D7182548;
	Mon, 26 Jul 2021 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hnoxz0GtJKt; Mon, 26 Jul 2021 20:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EAE4824EE;
	Mon, 26 Jul 2021 20:15:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17B641BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8A4940260
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzKaVp13k46R for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:15:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F18B8402E9
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:15:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 710DA8808D; Mon, 26 Jul 2021 19:40:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4b1cda06131931d713d33723355f71e4036b73d
X-Git-Newrev: e78a4c9e00c34a946cbd387d7a0bf76520f0fa7b
X-Patchwork-Hint: ignore
Message-Id: <20210726194027.710DA8808D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=e78a4c9e00c34a946cbd387d7a0bf76520f0fa7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for mariadb is added by the services/mysql module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 374b3dc352..d08b768a2e 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -11,6 +11,7 @@ MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client lib
 # https://jira.mariadb.org/browse/MDEV-12297
 MARIADB_LICENSE_FILES = README.md COPYING
 MARIADB_CPE_ID_VENDOR = mariadb
+MARIADB_SELINUX_MODULES = mysql
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
