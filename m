Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C948FC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929BE81B01;
	Thu,  9 May 2024 15:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwjTCDgxpcAo; Thu,  9 May 2024 15:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A1381699
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A1381699;
	Thu,  9 May 2024 15:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 288E71BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14674405CB
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI22HM8-B3xJ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5180940190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5180940190
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:51:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEAE786C4D; Thu,  9 May 2024 15:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 17:49:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 668834f869e7b92d4124c69a627dad8dc6098bbe
X-Git-Newrev: 8b45a3a144767bde38f1fcd0ac97c788a383685c
X-Patchwork-Hint: ignore
Message-Id: <20240509155105.EEAE786C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yamllint: fix dependencies
 and SETUP_TYPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b45a3a144767bde38f1fcd0ac97c788a383685c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For host build the runtime dependencies have to be added. Also the setup
type needs to be set to 'setuptools'.

./output/host/bin/python ./support/testing/tests/package/sample_python_yamllint.py
Traceback (most recent call last):
  File "/home/hthiery/sources/mainline/buildroot/support/testing/tests/package/sample_python_yamllint.py", line 3, in <module>
    from yamllint import (config, linter)
  File "/home/hthiery/sources/mainline/buildroot/output/host/lib/python3.11/site-packages/yamllint/config.py", line 19, in <module>
    import pathspec
ModuleNotFoundError: No module named 'pathspec'

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reported-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yamllint/python-yamllint.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index ceaca3b0b8..29344a1408 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -7,9 +7,13 @@
 PYTHON_YAMLLINT_VERSION = 1.35.1
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
 PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/da/06/d8cee5c3dfd550cc0a466ead8b321138198485d1034130ac1393cc49d63e
-PYTHON_YAMLLINT_SETUP_TYPE = pep517
+PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
 
+HOST_PYTHON_YAMLLINT_DEPENDENCIES += \
+	host-python-pathspec \
+	host-python-pyyaml
+
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
