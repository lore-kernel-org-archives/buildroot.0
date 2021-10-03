Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75F4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5038A6137F
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5038A6137F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A34848F6;
	Sun,  3 Oct 2021 19:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tp1xANIPMKU1; Sun,  3 Oct 2021 19:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91701848EC;
	Sun,  3 Oct 2021 19:30:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0311BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5619D848EC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9DqwGCfE-v2 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:30:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C17E80C7A
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0224D8762E; Sun,  3 Oct 2021 19:27:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 21:29:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b470aaa377f28d37874351edd7ec992533bef279
X-Git-Newrev: e636c321c52aa40fc6d736ea70312ca26edca300
X-Patchwork-Hint: ignore
Message-Id: <20211003192740.0224D8762E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-packaging: depend on python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e636c321c52aa40fc6d736ea70312ca26edca300
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest version of this package requires python 3.6+.
The only reverse dependency, pytest, already requires python3.

Fixes:
 - http://autobuild.buildroot.net/results/217157f4dd9fd56d0a13d47e6373f4c478f26757/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[yann.morin.1998@free.fr: add note about pytest]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-packaging/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
index 12170df84e..74d5205e8d 100644
--- a/package/python-packaging/Config.in
+++ b/package/python-packaging/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PACKAGING
 	bool "python-packaging"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  Core utilities for Python packages.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
