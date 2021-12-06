Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45307C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE5360D9D;
	Mon,  6 Dec 2021 21:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5TrSPQYDjAq; Mon,  6 Dec 2021 21:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F90F6079C;
	Mon,  6 Dec 2021 21:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CAFA1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C90660D9D
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Czljg33t6a0U for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66D936062F
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A9EFD81422; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 22:12:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c4a52e08789997229f505f59853a095b03c6668
X-Git-Newrev: dccfefafd442f908acd44f521b2311281d18ca13
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.A9EFD81422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: add host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=dccfefafd442f908acd44f521b2311281d18ca13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host variant of the python-urllib3 package will be needed for the
host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-urllib3/python-urllib3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index a1d22e023a..9580d9b6b9 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -12,5 +12,7 @@ PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
+HOST_PYTHON_URLLIB3_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
