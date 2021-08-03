Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28054C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:48:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72AD60EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E72AD60EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DFF4049A;
	Tue,  3 Aug 2021 20:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MA9qDhTAWdP7; Tue,  3 Aug 2021 20:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8AD404BB;
	Tue,  3 Aug 2021 20:48:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1E7D1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D02DE400E7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3Q-ZFk0os2G for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:48:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C554015B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:48:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4EA658B3CE; Tue,  3 Aug 2021 20:48:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:45:13 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f49f99b647b47db89eb1a68c0211e8d222ffbe0a
X-Git-Newrev: 070936595070910bd61a461784909153e079462b
X-Patchwork-Hint: ignore
Message-Id: <20210803204800.4EA658B3CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/dovecot: ignore
 CVE-2016-4983
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

commit: https://git.buildroot.net/buildroot/commit/?id=070936595070910bd61a461784909153e079462b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm,
which is part of the Red Hat packaging and not part of upstream dovecot

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 948e71689a0dc900ad2afa026e9e80e78086c157)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 93d04fc8a1..cb1cc990a1 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -18,6 +18,10 @@ DOVECOT_DEPENDENCIES = \
 # add host-gettext for AM_ICONV macro
 DOVECOT_DEPENDENCIES += host-gettext
 
+# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
+# is part of the Red Hat packaging and not part of upstream dovecot
+DOVECOT_IGNORE_CVES += CVE-2016-4983
+
 DOVECOT_CONF_ENV = \
 	RPCGEN=__disable_RPCGEN_rquota \
 	i_cv_epoll_works=yes \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
