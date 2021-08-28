Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA701C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858AF60E90
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 20:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 858AF60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FCE080CD0;
	Sat, 28 Aug 2021 20:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTEFWf9NPjTY; Sat, 28 Aug 2021 20:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A7E80CDF;
	Sat, 28 Aug 2021 20:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 627821BF3E5
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CDC4400EB
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 20:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUF9p9Yeq3eP for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 20:48:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C519940025
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 20:48:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 93BFD86703; Sat, 28 Aug 2021 20:47:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 22:48:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ba9967287d2ae0063a0ce5ab1980221f04d3ed8
X-Git-Newrev: ac2db5eb2e6091a05d1cd3d641213ab01ddb0aa2
X-Patchwork-Hint: ignore
Message-Id: <20210828204747.93BFD86703@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix typo in name of a
 qmake-package variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac2db5eb2e6091a05d1cd3d641213ab01ddb0aa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 39d334faa5c1 (package/pkg-qmake: add <pkg>_SYNC_QT_HEADERS
support), the qmake-package infra recognises said variable but the
manual has the wrong variable name, which is missing the "_QT" part.

We fix that by amending the manual to document the proper variable name.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-qmake.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
index c7e6ff354a..699d082aa1 100644
--- a/docs/manual/adding-packages-qmake.txt
+++ b/docs/manual/adding-packages-qmake.txt
@@ -80,6 +80,6 @@ also be defined.
   to the +make+ command during the target installation step. By default,
   +install+.
 
-* +LIBFOO_SYNC_HEADERS+, to run syncqt.pl before qmake. Some packages
+* +LIBFOO_SYNC_QT_HEADERS+, to run syncqt.pl before qmake. Some packages
   need this to have a properly populated include directory before
   running the build.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
