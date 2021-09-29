Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C30BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:01:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067C861465
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 20:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 067C861465
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A564A4251C;
	Wed, 29 Sep 2021 20:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FdCRVzxgan2; Wed, 29 Sep 2021 20:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2AA42517;
	Wed, 29 Sep 2021 20:01:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1031BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E6066074E
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrewWAHFNbSW for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 20:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FF0260736
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 20:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2B32D8D683; Wed, 29 Sep 2021 19:58:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 21:54:55 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 26cfe50873978b8a6f8a664801b7b6c9da83acbe
X-Git-Newrev: d8068257972ce491c129bc9c0359cc611266bdba
X-Patchwork-Hint: ignore
Message-Id: <20210929195839.2B32D8D683@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/dovecot: drop
 host-gettext
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8068257972ce491c129bc9c0359cc611266bdba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

AM_ICONV is not needed since drop of autoreconf in commit
03fbb81b8bab7bad135b59267533be7688babe39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aa90237546ba3bafcc53545731dda45026515d7d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 62499061f2..ceec26a2db 100644
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
