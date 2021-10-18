Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49644C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:10:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D9361206
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11D9361206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7C1A40481;
	Mon, 18 Oct 2021 20:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfmEFJprPJh8; Mon, 18 Oct 2021 20:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1689B401CA;
	Mon, 18 Oct 2021 20:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFC9F1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFEC640389
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u97SiSythltL for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2D5440387
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A6566879A2; Mon, 18 Oct 2021 20:07:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 22:10:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6703cdfa6720146cded222dbc293bf5628622005
X-Git-Newrev: 8d469858cec937b61335088c407eecca9b6f2be5
X-Patchwork-Hint: ignore
Message-Id: <20211018200708.A6566879A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: test configurations
 with BR2_PACKAGE_PYTHON3_PY_ONLY
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d469858cec937b61335088c407eecca9b6f2be5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python3 variant of
https://git.buildroot.net/buildroot-test/commit/?id=c0de21d9530af53eae5588d99d90c7e0cb87c543

to support Kodi 19 which depends on python3:
https://git.buildroot.net/buildroot/commit/?id=148e695e37561fe45d4726cb68f6454464d17797

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a1431bf1a8..4fffcbad11 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -367,6 +367,8 @@ def gen_config(args):
         configlines.append("BR2_STATIC_LIBS=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
+    if randint(0, 20) == 0:
+        configlines.append("BR2_PACKAGE_PYTHON3_PY_ONLY=y\n")
     if randint(0, 5) == 0:
         configlines.append("BR2_OPTIMIZE_2=y\n")
     if randint(0, 4) == 0:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
