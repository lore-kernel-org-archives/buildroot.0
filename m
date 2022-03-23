Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6EEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A50540CBD;
	Wed, 23 Mar 2022 20:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPXak1Nvyxi8; Wed, 23 Mar 2022 20:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E81BB40C71;
	Wed, 23 Mar 2022 20:28:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0E821BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E38C40FBB
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcgI4eFklRHc for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7003B40FD4
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9B4E9854E7; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:23:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf2e459bb9fc9fe57147313cda35f7022172e6e8
X-Git-Newrev: 92a3ca0932155498747c46d6f902a939d55c39f4
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.9B4E9854E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: security bump to
 version 22.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=92a3ca0932155498747c46d6f902a939d55c39f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-21716: Twisted is an event-based framework for internet
applications, supporting Python 3.6+. Prior to 22.2.0, Twisted SSH
client and server implement is able to accept an infinite amount of data
for the peer's SSH version identifier. This ends up with a buffer using
all the available memory. The attach is a simple as `nc -rv localhost 22
< /dev/zero`. A patch is available in version 22.2.0. There are
currently no known workarounds.

https://github.com/twisted/twisted/releases/tag/twisted-22.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 8f0935e4f0..63da0125b8 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  c818cb1ab241dc249517442e5a0e0412  Twisted-22.1.0.tar.gz
-sha256  b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61  Twisted-22.1.0.tar.gz
+md5  fd252d0b895ca2ab81b5b1454073d890  Twisted-22.2.0.tar.gz
+sha256  57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2  Twisted-22.2.0.tar.gz
 # Locally computed sha256
 sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8e867cfb58..e5d643ec05 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 22.1.0
+PYTHON_TWISTED_VERSION = 22.2.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/b8/8108806ebf2b33654989fd1511281dc94a49fa7e03326d84fe5498ecfae4
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
