Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93564C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 345D240600;
	Mon,  4 Jul 2022 15:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 345D240600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwcuwZ9dtAEj; Mon,  4 Jul 2022 15:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ADD74000B;
	Mon,  4 Jul 2022 15:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ADD74000B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC1C71BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A64BF60681
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A64BF60681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLYjlDlLjZOl for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:53:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 049B360592
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 049B360592
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 331A5821E8; Mon,  4 Jul 2022 15:40:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Jul 2022 17:53:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44eda2602a498087592e70118976cff48da19d14
X-Git-Newrev: a49d70a3f2e02e08333d716547ec9e0d59cb1371
X-Patchwork-Hint: ignore
Message-Id: <20220704154035.331A5821E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: add missing
 runtime dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a49d70a3f2e02e08333d716547ec9e0d59cb1371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 7.0.4 python-setuptools-scm requires
host-python-typing-extensions package.

Fixes:
http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812/
http://autobuild.buildroot.net/results/2b381cd32671db4aa0b281ece5569667bae0f923/
http://autobuild.buildroot.net/results/a3c5208224cc7825152d9a27b64fd82fb000a259/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998@free.fr: split long line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-setuptools-scm/python-setuptools-scm.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 890ee0c9c1..c44f983951 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -10,6 +10,10 @@ PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/bc/e6/ac8b0
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
+
+HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
+	host-python-packaging \
+	host-python-tomli \
+	host-python-typing-extensions
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
