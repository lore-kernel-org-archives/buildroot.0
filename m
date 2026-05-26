Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D5CCD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 17:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCF1A60C0E;
	Tue, 26 May 2026 17:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99eoKldkDHIV; Tue, 26 May 2026 17:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE9BB60DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779817934;
	bh=y+E3gQllD02kPfCHn3eSFNb6aU+JNiaZ0o2wJrV47ZU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q4s1hK+KRyWFBZN+wL2T3NvDECNVr/cH7vBbLFMKSRXv7N/+CggvApOs6GDm6q1en
	 GOpipUr7nwczmnH04Qv8SIwuTM81uTiAQZbztEXvaR6Ic+6htA0ub+6jBNsUSsxzpg
	 pC/ne3BtsOOp7ZIWp4Sj11K9DgjtfipPIlCIFyb2BDv5yiYsXkMFL91hYv0Y5Wb4nc
	 hUW8sjSOUZgmW6h/YXuwU21vIf0o8SGfXijS8HL0/ok9zixhFv4tZP4kPYCB/ebiTu
	 aliSQ/togYlag/Zwr83HzxKCBzajQXy++MvX0Y3WZGUOkBNNICnO/il5gVy0MjDQ9T
	 Jts9q8/ZW69iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE9BB60DC5;
	Tue, 26 May 2026 17:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF6C2297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D569C405AD
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjJiACKj5Xf4 for <buildroot@buildroot.org>;
 Tue, 26 May 2026 17:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D724061C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D724061C
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:52:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89ED486F54; Tue, 26 May 2026 17:52:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 19:40:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0455e2571d35b642115e9122159ace0ce803fceb
X-Git-Newrev: 8b606d9074fff980fd1e73786531503b30fb14da
X-Patchwork-Hint: ignore
Message-Id: <20260526175201.89ED486F54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urllib3: security bump to
 version 2.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b606d9074fff980fd1e73786531503b30fb14da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

CVE-2026-44431: Sensitive headers forwarded across origins in proxied
low-level redirects

https://github.com/urllib3/urllib3/security/advisories/GHSA-qccp-gfcp-xxvc

CVE-2026-44432: Decompression-bomb safeguards bypassed in parts of the
streaming API

https://github.com/urllib3/urllib3/security/advisories/GHSA-mf9v-mfxr-j63j

For more details, see the release notes:
https://urllib3.readthedocs.io/en/stable/changelog.html#id1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 858b8ca3a3..92425d125b 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  2c381874816fe551f50a2551abae62b3  urllib3-2.6.3.tar.gz
-sha256  1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed  urllib3-2.6.3.tar.gz
+md5  e79707b798a66c8165c9c441440f4e80  urllib3-2.7.0.tar.gz
+sha256  231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c  urllib3-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 7f7f0b03d2..8e598818a1 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.6.3
+PYTHON_URLLIB3_VERSION = 2.7.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
