Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C2782EB5;
	Thu, 29 Sep 2022 13:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C2782EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6O5bd_NKiKzZ; Thu, 29 Sep 2022 13:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF0F83F89;
	Thu, 29 Sep 2022 13:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCF0F83F89
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9A801BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 925544015A
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925544015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZLJj2fRWqMR for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:56:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D2C4027F
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D2C4027F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8461864DB; Thu, 29 Sep 2022 13:56:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 15:55:13 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 3d60f6684c59d6fad9108f0c24b51fc67f0a8838
X-Git-Newrev: d1814692f10ed02e1af58db9637c9e8a215ba997
X-Patchwork-Hint: ignore
Message-Id: <20220929135632.B8461864DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/openssh: drop
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1814692f10ed02e1af58db9637c9e8a215ba997
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Commit b936a95d021d73e (package/openssh: bump to version 9.0p1) dropped the
patch touching m4/openssh.m4, but forgot to remove autoreconf.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7719e4525d895a59e5b5c522ce82f6c03b2df68f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 63a28f3af5..a8c32f3d33 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,9 +13,6 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
-# patch touching m4/openssh.m4
-OPENSSH_AUTORECONF = YES
-
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
