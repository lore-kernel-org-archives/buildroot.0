Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D41C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30C080D0D;
	Tue,  1 Jul 2025 20:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TAirmIi2Ui6; Tue,  1 Jul 2025 20:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 476CE80CAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 476CE80CAE;
	Tue,  1 Jul 2025 20:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25DA0196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1798D41A63
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhRDYnaHX6fm for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B5DB41A18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B5DB41A18
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A546852F9; Tue,  1 Jul 2025 20:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Jul 2025 22:49:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 184a1b94a589da215282aec9f515914ba7831804
X-Git-Newrev: 7006854ce1514c03fe98d57dcaa68629ac800b71
X-Patchwork-Hint: ignore
Message-Id: <20250701205735.4A546852F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: security bump to
 v2.5.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7006854ce1514c03fe98d57dcaa68629ac800b71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/urllib3/urllib3/releases/tag/2.5.0

This fixes the following vulnerabilities:
- CVE-2025-50181:
    urllib3 redirects are not disabled when retries are disabled on
    PoolManager instantiation

- CVE-2025-50182:
    urllib3 does not control redirects in browsers and Node.js

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to release note in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 2391108e26..f4162882f7 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  787104cdecd70e6688713f8a079ffd3f  urllib3-2.4.0.tar.gz
-sha256  414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466  urllib3-2.4.0.tar.gz
+md5  2b8a86438e4d35fbc90572dbdb424759  urllib3-2.5.0.tar.gz
+sha256  3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760  urllib3-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 7294742909..9ec6c7f3c0 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.4.0
+PYTHON_URLLIB3_VERSION = 2.5.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/8a/78/16493d9c386d8e60e442a35feac5e00f0913c0f4b7c217c11e8ec2ff53e0
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
