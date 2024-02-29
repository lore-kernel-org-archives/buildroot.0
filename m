Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B04C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE1041C60;
	Thu, 29 Feb 2024 15:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4gKeXrjdriL; Thu, 29 Feb 2024 15:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA1AC41C51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1AC41C51;
	Thu, 29 Feb 2024 15:53:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2373B1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCE26085A
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBqfrv0zJySL for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3A860EF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC3A860EF6
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E762987790; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:21:57 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 09898aeaab7276aa2317d8e416416eccc8c3080c
X-Git-Newrev: 8a8a5622720899c08be4d29dccefcb1e72988e45
X-Patchwork-Hint: ignore
Message-Id: <20240229153159.E762987790@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/python-minimalmodbus: fix empty package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a8a5622720899c08be4d29dccefcb1e72988e45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Calling `setup.py` build builds and installs  an empty package
after upstream changed their packaging. Calling setuptools via
`python -m build` builds the package correctly.

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d7e45215a4faaef8d6eb993b38d5a70ad7d309b1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
