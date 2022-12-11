Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339F7C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D17504F21A;
	Mon, 20 Feb 2023 22:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D17504F21A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8V7lr5umr5Yz; Mon, 20 Feb 2023 22:48:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A52944F305;
	Mon, 20 Feb 2023 22:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A52944F305
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ABCB1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6D0C61287
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D0C61287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdiuixFTQSyk for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20BAE6109D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BAE6109D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E03F828C8; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:05:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 889c7815ed5fca418ca02dda9a8f5fcf8674fac4
X-Git-Newrev: c0e09a1b0a6a57f3bda48d87f7292af136d59949
X-Patchwork-Hint: ignore
Message-Id: <20230220205208.1E03F828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pep517: drop
 host-python-tomli dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0e09a1b0a6a57f3bda48d87f7292af136d59949
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-python-tomli dependency is not required on python version
3.11 and newer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pep517/python-pep517.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
index 1fd294fbb4..c43b09faaa 100644
--- a/package/python-pep517/python-pep517.mk
+++ b/package/python-pep517/python-pep517.mk
@@ -10,6 +10,5 @@ PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f6
 PYTHON_PEP517_LICENSE = MIT
 PYTHON_PEP517_LICENSE_FILES = LICENSE
 PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
-HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
