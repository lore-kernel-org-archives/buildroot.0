Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187DBC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38FE40876;
	Tue,  2 Jan 2024 08:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38FE40876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRMjHeqwG3a1; Tue,  2 Jan 2024 08:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A9640928;
	Tue,  2 Jan 2024 08:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A9640928
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB021BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3434B40876
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3434B40876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSLuhljOhkTZ for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EE2408A0
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EE2408A0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CAB983C2A; Tue,  2 Jan 2024 08:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 09:53:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6febe37bacf87b56f9f0330ed01dc800232199cf
X-Git-Newrev: 950881da9997af650b59f88110f11b338124cc67
X-Patchwork-Hint: ignore
Message-Id: <20240102085518.3CAB983C2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncssh: security bump to
 version 2.14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=950881da9997af650b59f88110f11b338124cc67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Implemented "strict kex" support and other countermeasures to protect
against the Terrapin Attack described in CVE-2023-48795

https://github.com/advisories/GHSA-hfmc-7525-mj55
https://github.com/ronf/asyncssh/blob/v2.14.2/docs/changes.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index d72b5329c5..f74cbe9c83 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  4194feb9e0d17a0750f107f3445ff9f7  asyncssh-2.14.1.tar.gz
-sha256  1ac31c333a0d83c88831523245500caa814503423741b0e465339ef6da5b5e29  asyncssh-2.14.1.tar.gz
+md5  3b22a39fa9d638b277c9441187b73c5c  asyncssh-2.14.2.tar.gz
+sha256  e956bf8988d07a06ba3305f6604e261f4ca014c4a232f0873f1c7692fbe3cfc2  asyncssh-2.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 51e2e1973c..1f6b9d79a2 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.14.1
+PYTHON_ASYNCSSH_VERSION = 2.14.2
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49ddcc10567e52a8e0e1553fc936584e241d516b5682d55ea17
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6c/f9/849f158fe50cdb0b1bf75009861865c9a30c3b5a0d62ad43bb5e00b10feb
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
