Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3901C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD21560DE5;
	Mon,  6 Dec 2021 21:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ut4pEinQ3wh3; Mon,  6 Dec 2021 21:26:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1632E60E08;
	Mon,  6 Dec 2021 21:26:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44FCC1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3364140416
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJy0UKayn5ur for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5225141C31
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 924A581422; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 22:12:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3029878c5efa28eff793405095fe64327c15ad5
X-Git-Newrev: 07fc2fb1a5625ea18c76fab906b8da83ac1f49f3
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.924A581422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: add
 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=07fc2fb1a5625ea18c76fab906b8da83ac1f49f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host variant of the python-charset-normalizer package will be needed
for the host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index e1b805fbfb..7fe9f96996 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -10,5 +10,7 @@ PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/9f/c5/3
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+HOST_PYTHON_CHARSET_NORMALIZER_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
