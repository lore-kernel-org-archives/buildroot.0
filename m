Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7EDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A2060E52
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3A2060E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B95402BE;
	Sat,  4 Sep 2021 18:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G68ajetA1HCC; Sat,  4 Sep 2021 18:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EB9C402DA;
	Sat,  4 Sep 2021 18:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 593441BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD13640230
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vMOAal9gWqr for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 646FE402B7
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E26B8834A; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:00:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3e3d9c198294e1848b692bfac4fa06d10706c1e
X-Git-Newrev: 2ff70353948f60047d2e7c747378cc1402d59dce
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.2E26B8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: add libesmtp optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ff70353948f60047d2e7c747378cc1402d59dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libesmtp is an optional dependency (disabled by default) since version
0.10.0 and
https://github.com/apache/logging-log4cxx/commit/8a35b429c6b1bc73635d9b6db482523619199a90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cxx/log4cxx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 0ddea9466a..075f8cb371 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -22,4 +22,11 @@ LOG4CXX_CONF_OPTS = \
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
+ifeq ($(BR2_PACKAGE_LIBESMTP),y)
+LOG4CXX_DEPENDENCIES += libesmtp
+LOG4CXX_CONF_OPTS += --with-SMTP=libesmtp
+else
+LOG4CXX_CONF_OPTS += --without-SMTP
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
