Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD409C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 16:31:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35EA0604D2
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 16:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35EA0604D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CACA482974;
	Sat, 25 Sep 2021 16:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdXUAzsng8Ac; Sat, 25 Sep 2021 16:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F958295A;
	Sat, 25 Sep 2021 16:31:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA7701BF4E7
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 16:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55CC40418
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 16:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ryL46xaYP3S for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 16:31:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B2BA40417
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 16:31:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 352068B6BF; Sat, 25 Sep 2021 16:29:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 18:31:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d714137722eb68273bc736fd4543e768aeaa5dc7
X-Git-Newrev: ef5c8be25ab373866b5a92d3d9f31bf36b7a8abf
X-Patchwork-Hint: ignore
Message-Id: <20210925162934.352068B6BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-attrs: depends on python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef5c8be25ab373866b5a92d3d9f31bf36b7a8abf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-attrs contains a file with API for python 3.6+.
Although we can make a "tweak" and remove this specific file
for python2, we prefer to make this package available only for
python3, because the day this package (and many others) will drop
support for python2 is probably very close.

In addition, update python-attrs recursive dependencies to
depend on python3 too (python-automat is the only one left).

Fixes:
 - http://autobuild.buildroot.net/results/aa6/aa6889bc254eaa93adb4fc1a71bcee9f2f23cb33/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-attrs/Config.in   | 1 +
 package/python-automat/Config.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-attrs/Config.in b/package/python-attrs/Config.in
index fb0ab248fa..b1a69d0e3e 100644
--- a/package/python-attrs/Config.in
+++ b/package/python-attrs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ATTRS
 	bool "python-attrs"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  attrs is the Python package that will bring back the joy of
 	  writing classes by relieving you from the drudgery of
diff --git a/package/python-automat/Config.in b/package/python-automat/Config.in
index ee02d22b5b..9d22276c2c 100644
--- a/package/python-automat/Config.in
+++ b/package/python-automat/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_AUTOMAT
 	bool "python-automat"
+	depends on BR2_PACKAGE_PYTHON3 # python-attrs
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
