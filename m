Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522E1C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:26:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A66960E78
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A66960E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD708405FD;
	Tue,  3 Aug 2021 23:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MeYiJnZMbDFQ; Tue,  3 Aug 2021 23:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 129564059E;
	Tue,  3 Aug 2021 23:26:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 969621BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D151640E92
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzU13_xSNrH3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E6140E51
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 57C6B86A84; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 22:05:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 81175e558090ce986ab1ba5f4c309ca89743899f
X-Git-Newrev: 5675f09e584e124201451a0feee6e22d8ea2b84a
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.57C6B86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/thrift: drop
 unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=5675f09e584e124201451a0feee6e22d8ea2b84a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

WITH_QT4 has been dropped since version 0.13.0 and
https://github.com/apache/thrift/commit/17355425429274e7971fff39d7e45279cdf550fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/thrift/thrift.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 0f2a8eb071..544eb97323 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -20,7 +20,6 @@ THRIFT_COMMON_CONF_OPTS = -DBUILD_TUTORIALS=OFF \
 	-DBUILD_TESTING=OFF \
 	-DWITH_PYTHON=OFF \
 	-DWITH_JAVA=OFF \
-	-DWITH_QT4=OFF \
 	-DWITH_QT5=OFF
 
 THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=OFF
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
