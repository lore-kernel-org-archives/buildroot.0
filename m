Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D251C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE5274053F;
	Mon,  5 Feb 2024 14:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE5274053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JszFqNBo_jmt; Mon,  5 Feb 2024 14:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE24440A49;
	Mon,  5 Feb 2024 14:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE24440A49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0841BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0029C40A49
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0029C40A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VapKr_WCBk3 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:37:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09CBD4053F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09CBD4053F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6FC386CA4; Mon,  5 Feb 2024 14:37:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:37:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35a2cb02277acae94f018a0d22138dc9de005fdf
X-Git-Newrev: d7e45215a4faaef8d6eb993b38d5a70ad7d309b1
X-Patchwork-Hint: ignore
Message-Id: <20240205143757.E6FC386CA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-minimalmodbus: fix empty
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7e45215a4faaef8d6eb993b38d5a70ad7d309b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Calling `setup.py` build builds and installs  an empty package
after upstream changed their packaging. Calling setuptools via
`python -m build` builds the package correctly.

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-minimalmodbus/python-minimalmodbus.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
index 5a6e7733be..cb8a0d8cc9 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.mk
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -7,7 +7,8 @@
 PYTHON_MINIMALMODBUS_VERSION = 2.1.1
 PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
 PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
-PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
+PYTHON_MINIMALMODBUS_DEPENDENCIES = host-python-setuptools
+PYTHON_MINIMALMODBUS_SETUP_TYPE = pep517
 PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
 PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
