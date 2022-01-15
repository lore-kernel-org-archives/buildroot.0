Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9518C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F448141A;
	Sat, 15 Jan 2022 09:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ziuMCxSkbWba; Sat, 15 Jan 2022 09:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 106A8813C1;
	Sat, 15 Jan 2022 09:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C51741BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF0814013A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiWjhNq2Q_s7 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:31:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 160804056A
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:31:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 464F582627; Sat, 15 Jan 2022 09:24:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 09:51:15 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 257dda3c473fd6e818812183ba8ce66f8d718412
X-Git-Newrev: e2ea0138161625322a61217ba3f8ef0d09779c7d
X-Patchwork-Hint: ignore
Message-Id: <20220115092450.464F582627@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/findutils: enable
 selinux support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2ea0138161625322a61217ba3f8ef0d09779c7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 544839b318d08b7c331cc91b5f66b776d5a87736)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
