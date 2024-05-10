Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85174C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 582C6404A3;
	Fri, 10 May 2024 21:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a02gW1Td4I6I; Fri, 10 May 2024 21:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A6542BF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A6542BF8;
	Fri, 10 May 2024 21:28:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9C061BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 969A86137E
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93HabXvWtnwm for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC56160786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC56160786
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:28:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B79AD86F62; Fri, 10 May 2024 21:28:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:28:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8acc9e51012d7a1cd64c39859ac7f0b1bff632ee
X-Git-Newrev: 66e3c7b96d5757bef7223e04bbb9f66b48182066
X-Patchwork-Hint: ignore
Message-Id: <20240510212855.B79AD86F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatchling: bump to version
 1.22.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=66e3c7b96d5757bef7223e04bbb9f66b48182066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://hatch.pypa.io/dev/history/hatchling/#hatchling-v1.22.4

Remove now optional editables dependency [1].

[1] https://github.com/pypa/hatch/pull/1255

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index df703088e4..d49bee8bfc 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  d40aaea58a04a36a2b641f6efe99e362  hatchling-1.21.1.tar.gz
-sha256  bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc  hatchling-1.21.1.tar.gz
+md5  63a3c6480c0805c55ce396e1ad246e78  hatchling-1.22.4.tar.gz
+sha256  8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e  hatchling-1.22.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 550dbf0beb..91f6597dfc 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.21.1
+PYTHON_HATCHLING_VERSION = 1.22.4
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/d8/a1/7dd1caa87c0b15c04c6291e25112e5d082cce02ee87f221a8be1d594f857
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/4f/2a/c34d71531d1e1c9a5029bb73eb3816285befd0fffd7c63ffa0544253dca8
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
 HOST_PYTHON_HATCHLING_DEPENDENCIES = \
-	host-python-editables \
 	host-python-packaging \
 	host-python-pathspec \
 	host-python-pluggy \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
