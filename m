Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DEBC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:44:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7749460F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7749460F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535C083A8D;
	Tue,  3 Aug 2021 21:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6OL_iMWrLbo; Tue,  3 Aug 2021 21:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F9583A92;
	Tue,  3 Aug 2021 21:44:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1E81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A22C40554
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2de8JNk_pPG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B83B34044D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0EE5185D40; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 23:25:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aedd6e7be908ffcb08b979673f2e719532bf930f
X-Git-Newrev: c920f0d9b6217dcfde59b6f79e764a9a7f0a5890
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.0EE5185D40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pymupdf: fix
 tarball name for sha256
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

commit: https://git.buildroot.net/buildroot/commit/?id=c920f0d9b6217dcfde59b6f79e764a9a7f0a5890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix tarball name for sha256 which is wrong since the addition of the
package in commit 71f7fc8a27af383d3307945bf6e880491cb74bd4

While at it, also update indentation to 2 spaces

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pymupdf/python-pymupdf.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index 6729c6b91b..a5a53997cd 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5	0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
-sha256	1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  python-pymupdf-1.16.0.tar.gz
+md5  0e924bbb7364ba63df65d33fee9656f0  PyMuPDF-1.16.0.tar.gz
+sha256  1a6cc5b8b0fb9aa16bfa453fdfed445398f00d2556e78d90ba54cdce8d900857  PyMuPDF-1.16.0.tar.gz
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
