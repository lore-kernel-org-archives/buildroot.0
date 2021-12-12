Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20535C433FE
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF65A40571;
	Sun, 12 Dec 2021 14:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_EJhb9VF51e; Sun, 12 Dec 2021 14:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC5864014E;
	Sun, 12 Dec 2021 14:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9C61BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 363F785754
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SRaWvaVXZ1V for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 098A985755
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2004A82D93; Sun, 12 Dec 2021 14:06:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:05:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffa6d7800db8edee2b0585b5c067171ae35ba3dc
X-Git-Newrev: 544839b318d08b7c331cc91b5f66b776d5a87736
X-Patchwork-Hint: ignore
Message-Id: <20211212140653.2004A82D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/findutils: enable selinux support
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

commit: https://git.buildroot.net/buildroot/commit/?id=544839b318d08b7c331cc91b5f66b776d5a87736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/findutils/findutils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 918591c53f..3237e5502a 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -15,4 +15,11 @@ FINDUTILS_CONF_ENV = \
 	ac_cv_func_working_mktime=yes \
 	gl_cv_func_wcwidth_works=yes
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+FINDUTILS_DEPENDENCIES += libselinux
+FINDUTILS_CONF_OPTS += --with-selinux
+else
+FINDUTILS_CONF_OPTS += --without-selinux
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
