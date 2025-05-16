Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C52AC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B38D660B59;
	Fri, 16 May 2025 17:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBOq_gsO_Oje; Fri, 16 May 2025 17:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD6860C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD6860C14;
	Fri, 16 May 2025 17:57:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5200613D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4363580C58
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxF6zoRSelal for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E08580F15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E08580F15
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:57:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D03786CC8; Fri, 16 May 2025 17:57:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 19:54:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5009fd2436300383a50b3d23b80cdccd20c9d262
X-Git-Newrev: 6541717ef963bd4e7cf5b902d2ba4781217e99dc
X-Patchwork-Hint: ignore
Message-Id: <20250516175722.6D03786CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-h11: security bump to
 version 0.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6541717ef963bd4e7cf5b902d2ba4781217e99dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2025-43859: A leniency in h11's parsing of line terminators in
    chunked-coding message bodies can lead to request smuggling
    vulnerabilities under certain conditions.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-43859
  - https://github.com/python-hyper/h11/commit/114803a29ce50116dc47951c690ad4892b1a36ed

For more details on the version bump, see:
  - https://github.com/python-hyper/h11/compare/v0.14.0...v0.16.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-h11/python-h11.hash | 4 ++--
 package/python-h11/python-h11.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-h11/python-h11.hash b/package/python-h11/python-h11.hash
index 0c65a11d00..1ea92278dd 100644
--- a/package/python-h11/python-h11.hash
+++ b/package/python-h11/python-h11.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h11/json
-md5  84c33fc0aa1f868928114c4d02c43dc2  h11-0.14.0.tar.gz
-sha256  8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d  h11-0.14.0.tar.gz
+md5  af51401a776fd654cfd98a197af9f21f  h11-0.16.0.tar.gz
+sha256  4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1  h11-0.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37db5bb85926db28a427a25867f10b1232003aea1be69ccb851138adb8e6f361  LICENSE.txt
diff --git a/package/python-h11/python-h11.mk b/package/python-h11/python-h11.mk
index d7dca5244b..4e4685ea5a 100644
--- a/package/python-h11/python-h11.mk
+++ b/package/python-h11/python-h11.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H11_VERSION = 0.14.0
+PYTHON_H11_VERSION = 0.16.0
 PYTHON_H11_SOURCE = h11-$(PYTHON_H11_VERSION).tar.gz
-PYTHON_H11_SITE = https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03
+PYTHON_H11_SITE = https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963
 PYTHON_H11_SETUP_TYPE = setuptools
 PYTHON_H11_LICENSE = MIT
 PYTHON_H11_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
