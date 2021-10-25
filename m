Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932E8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:07:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C4261002
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C4261002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BDB60826;
	Mon, 25 Oct 2021 12:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcFvtJ6PC7Gi; Mon, 25 Oct 2021 12:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7320E6083E;
	Mon, 25 Oct 2021 12:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45F0B1BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3611780D76
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IHTDkt4hc4V for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:07:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DDFA80D6C
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:07:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9F2A188758; Mon, 25 Oct 2021 12:04:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 14:07:14 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: a5227c746d0e8021a7ab111f049704929e8ebc09
X-Git-Newrev: d22d09a033683fcc9ee9ebbcb88422ad20793f5b
X-Patchwork-Hint: ignore
Message-Id: <20211025120414.9F2A188758@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] utils/genrandconfig: test
 configurations with BR2_PACKAGE_PYTHON3_PY_ONLY
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

commit: https://git.buildroot.net/buildroot/commit/?id=d22d09a033683fcc9ee9ebbcb88422ad20793f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Python3 variant of
https://git.buildroot.net/buildroot-test/commit/?id=c0de21d9530af53eae5588d99d90c7e0cb87c543

to support Kodi 19 which depends on python3:
https://git.buildroot.net/buildroot/commit/?id=148e695e37561fe45d4726cb68f6454464d17797

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d469858cec937b61335088c407eecca9b6f2be5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 622cfd4891..3db5da442b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -369,6 +369,8 @@ def gen_config(args):
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
