Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A749C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:33:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB7060E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BB7060E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F79260648;
	Sat, 28 Aug 2021 15:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdkjLbgZPmEZ; Sat, 28 Aug 2021 15:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89EC76065C;
	Sat, 28 Aug 2021 15:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6A51BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4D66066E
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyZk5iIpUSn8 for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:32:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A794E6065C
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:32:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F341385C4C; Sat, 28 Aug 2021 15:31:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 17:00:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a3e3d9c198294e1848b692bfac4fa06d10706c1e
X-Git-Newrev: 2ff70353948f60047d2e7c747378cc1402d59dce
X-Patchwork-Hint: ignore
Message-Id: <20210828153149.F341385C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/log4cxx: add libesmtp
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ff70353948f60047d2e7c747378cc1402d59dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
