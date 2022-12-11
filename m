Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1895C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BDC4020B;
	Sun, 11 Dec 2022 20:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BDC4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhGYGYYu6D42; Sun, 11 Dec 2022 20:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4875740743;
	Sun, 11 Dec 2022 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4875740743
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EACC91BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C68884051C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C68884051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onYdkJBxI6Au for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C7E4047B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C7E4047B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02A2E86561; Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:14:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0189bcb47c7733c36fcbcb88fbf26f57958db576
X-Git-Newrev: 467d464abe20e7c20ce246b0fee1d12ccc2b2312
X-Patchwork-Hint: ignore
Message-Id: <20221211201433.02A2E86561@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomli: drop flit-bootstrap
 for host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=467d464abe20e7c20ce246b0fee1d12ccc2b2312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As tomli is no longer required for bootstrapping our pep517 toolchain
we no longer need to use flit-bootstrap for the host package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tomli/python-tomli.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index b803d67466..5d259f71a3 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -10,7 +10,6 @@ PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb0
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
