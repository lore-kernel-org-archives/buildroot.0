Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F627C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEB9340497;
	Sun, 11 Dec 2022 17:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEB9340497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoJsAM034MZD; Sun, 11 Dec 2022 17:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 478254026A;
	Sun, 11 Dec 2022 17:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478254026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 305951BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 194F740241
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 194F740241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Thss1uzvajlq for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:05:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E28384026A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E28384026A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB3CE864D6; Sun, 11 Dec 2022 17:05:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 18:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 889c7815ed5fca418ca02dda9a8f5fcf8674fac4
X-Git-Newrev: c0e09a1b0a6a57f3bda48d87f7292af136d59949
X-Patchwork-Hint: ignore
Message-Id: <20221211170557.CB3CE864D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pep517: drop
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
