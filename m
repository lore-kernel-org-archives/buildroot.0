Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916F2C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D7B605C5;
	Thu, 10 Apr 2025 19:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu-d3cArwjLe; Thu, 10 Apr 2025 19:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8572E60720
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8572E60720;
	Thu, 10 Apr 2025 19:29:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8B66108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A6F60698
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUGKnpN_OzOc for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D45606E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D45606E6
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E61AE83FF7; Thu, 10 Apr 2025 19:29:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 21:25:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5468334bb000118664ecf3b495f20f841fcc2708
X-Git-Newrev: 2d5903769ff00d0104b9e945c0e13a8094c7a6dd
X-Patchwork-Hint: ignore
Message-Id: <20250410192944.E61AE83FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jinja2: security bump to
 version 3.1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d5903769ff00d0104b9e945c0e13a8094c7a6dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2025-27516: Prior to 3.1.6, an oversight in how the Jinja
    sandboxed environment interacts with the |attr filter allows
    an attacker that controls the content of a template to execute
    arbitrary Python code.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27516
  - https://github.com/pallets/jinja/commit/90457bbf33b8662926ae65cdde4c4c32e756e403

For more details on the version bump, see the release notes:

https://github.com/pallets/jinja/releases/tag/3.1.6

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index a89c63a0f4..ffd0bc55c2 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  083d64f070f6f1b5f75971ae60240785  jinja2-3.1.5.tar.gz
-sha256  8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb  jinja2-3.1.5.tar.gz
+md5  66d4c25ff43d1deaf9637ccda523dec8  jinja2-3.1.6.tar.gz
+sha256  0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d  jinja2-3.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 9b95b3212c..74360ec258 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 3.1.5
+PYTHON_JINJA2_VERSION = 3.1.6
 PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/af/92/b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b
 PYTHON_JINJA2_SETUP_TYPE = flit
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
