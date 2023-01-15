Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DD6C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 19:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A576F415DF;
	Sun, 15 Jan 2023 19:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A576F415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HI-sgtrawTtb; Sun, 15 Jan 2023 19:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D2341682;
	Sun, 15 Jan 2023 19:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D2341682
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6F11BF2C0
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 455EB41682
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 19:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455EB41682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWPj8LWwFSrK for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 19:18:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1DB415DF
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E1DB415DF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 19:18:01 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 7940E20174;
 Sun, 15 Jan 2023 13:18:00 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:17:51 -0600
Message-Id: <20230115191751.3884627-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1673810280; bh=dr8HZIj4qywxwoSu27iD3eXdGQYXngOltEtNdnpu/as=;
 h=From:To:Cc:Subject:Date:From;
 b=xnp0Xto/mRWnYc+fqrrXOSfTf6BtnMRsA9EmDDlrpmCEUdFhuSxQK4P7DVcOZi4l5
 T5AaVt3zZ2kUojP88vudNFQO0ix1IOqnKRMOtPTb2o47UpQlkCiFtX1SnDdxkupK3w
 6y692JXQLcLHJZXGvonFiMbQ4pvoWU64swKk2g7o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=xnp0Xto/
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: fix broken IANA PEN
 registry URL
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, Floris Bos <bos@je-eigen-domein.nl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Backport the upstream fix for the IANA Private Enterprise Numbers
registry URL so the correct file gets downloaded and installed.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 .../0002-Fix-enterprise-numbers-URL.patch     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/ipmitool/0002-Fix-enterprise-numbers-URL.patch

diff --git a/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
new file mode 100644
index 0000000000..07cdbd4527
--- /dev/null
+++ b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
@@ -0,0 +1,36 @@
+From 1edb0e27e44196d1ebe449aba0b9be22d376bcb6 Mon Sep 17 00:00:00 2001
+From: Alexander Amelkin <alexander@amelkin.msk.ru>
+Date: Tue, 22 Nov 2022 13:55:33 +0300
+Subject: [PATCH] Fix enterprise-numbers URL
+
+IANA has changed their URL scheme, and the content at the old URL for
+enterprise-numbers switched from text/plain to text/html.
+
+Fix Makefile.am to use the new URL
+
+Resolves ipmitool/ipmitool#377
+
+Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
+
+[vfazio: backport from upstream 1edb0e27e44196d1ebe449aba0b9be22d376bcb6]
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ce3267f..3182a52 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -41,7 +41,7 @@ MAINTAINERCLEANFILES = Makefile.in aclocal.m4 configure configure-stamp \
+ 	$(distdir).tar.gz $(distdir).tar.bz2
+ 
+ SUBDIRS = lib src include doc contrib control
+-IANA_PEN = http://www.iana.org/assignments/enterprise-numbers
++IANA_PEN = http://www.iana.org/assignments/enterprise-numbers.txt
+ 
+ dist-hook:
+ 	cp control/ipmitool.spec $(distdir)
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
