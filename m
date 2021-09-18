Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C6AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:33:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EEF60F51
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05EEF60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0243403AE;
	Sat, 18 Sep 2021 20:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DNr3NaaU8DR; Sat, 18 Sep 2021 20:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16461402C9;
	Sat, 18 Sep 2021 20:33:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65B8A1BF95D
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5421C4016B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id te8xf33wm2iX for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:33:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8605C40108
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:33:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8F9648B6E7; Sat, 18 Sep 2021 20:31:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:32:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fe8806dbb0be96ec24c2cd30499949dd6cc0dd4
X-Git-Newrev: aa90237546ba3bafcc53545731dda45026515d7d
X-Patchwork-Hint: ignore
Message-Id: <20210918203125.8F9648B6E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: drop host-gettext
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa90237546ba3bafcc53545731dda45026515d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AM_ICONV is not needed since drop of autoreconf in commit
03fbb81b8bab7bad135b59267533be7688babe39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dovecot/dovecot.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index cd637f19a1..733917b062 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -16,8 +16,6 @@ DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
-# add host-gettext for AM_ICONV macro
-DOVECOT_DEPENDENCIES += host-gettext
 
 # CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
 # is part of the Red Hat packaging and not part of upstream dovecot
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
