Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1404C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83AC545203;
	Mon, 20 Feb 2023 22:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83AC545203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Keuqf5YrLaQd; Mon, 20 Feb 2023 22:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 689734F2E0;
	Mon, 20 Feb 2023 22:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 689734F2E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85DF81BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0F5061284
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F5061284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHcA8lco9SEi for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11D356124E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D356124E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DDA28648F; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:05:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5dd4caaa011b1efffc522d0d313725a195cfee7f
X-Git-Newrev: 889c7815ed5fca418ca02dda9a8f5fcf8674fac4
X-Patchwork-Hint: ignore
Message-Id: <20230220205208.0DDA28648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pypa-build:
 drop host-python-tomli dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=889c7815ed5fca418ca02dda9a8f5fcf8674fac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pypa-build/python-pypa-build.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index b78aefe855..adc124b074 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -12,7 +12,6 @@ PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
 PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
 HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-pep517 \
-	host-python-tomli
+	host-python-pep517
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
