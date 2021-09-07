Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F5AC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 14:00:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C62460F21
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 14:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C62460F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5800D40015;
	Tue,  7 Sep 2021 14:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FycPDULEOoqe; Tue,  7 Sep 2021 14:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A63F401B2;
	Tue,  7 Sep 2021 14:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33F551BF995
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2314C401B2
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmpQW-KfAagQ for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:59:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0038940015
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:59:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 32800887EF; Tue,  7 Sep 2021 13:58:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 15:52:21 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 1a9a41d3718b36c676c0534dc40e8a9e74a4b5bd
X-Git-Newrev: b6997e09172f604a3b7a46a3e7f83685f7509c59
X-Patchwork-Hint: ignore
Message-Id: <20210907135806.32800887EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] docs/manual: fix typo in
 name of a qmake-package variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6997e09172f604a3b7a46a3e7f83685f7509c59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Since commit 39d334faa5c1 (package/pkg-qmake: add <pkg>_SYNC_QT_HEADERS
support), the qmake-package infra recognises said variable but the
manual has the wrong variable name, which is missing the "_QT" part.

We fix that by amending the manual to document the proper variable name.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac2db5eb2e6091a05d1cd3d641213ab01ddb0aa2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
