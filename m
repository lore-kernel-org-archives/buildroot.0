Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F36CD8C82
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8996B40F44;
	Fri,  5 Jun 2026 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbiIiH3Z83uY; Fri,  5 Jun 2026 12:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957AE41097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663160;
	bh=HlZj3ZPdM51AVLSj/jiLorHWkozHVMqIx4Mlb9RtJy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NeA1tIFXkeNwelw2yp+z6etLK97LE8rD5lxv02BUkFYUuptoRC8XWEwKvwML496ac
	 izFkyV6cpCz+68GrX9KXpHP526QAQTr3YYz+K4+yB/1m/yPRQf8ro9x/960BDUngzZ
	 cLvMGywBrYrm5S/HXPBf3LNX7VJI7sRmEFFdh3qz4Ca+EkNhsD/Mc6TZTtBt9dK7Hn
	 sz2ApgK38UkKKLvUtSu4qyGRRA4NKaylVf5lGWM5qMCCVP/jrm696EVvIx9yJodxV0
	 OkqhkJvJMZo253270n38jZwob0aRXM8c+WJ9QcCmzv8TbMssBI2BIFg0AI26UbkjRs
	 5u2HbD6wssxUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 957AE41097;
	Fri,  5 Jun 2026 12:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1056149B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0558F60BA1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOSaFdU4-NH2 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96CB60B98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B96CB60B98
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7A6887B39; Fri,  5 Jun 2026 12:38:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:22:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7ce09a9a71b52e01aca84977e1862e6a53104b62
X-Git-Newrev: 66066ece804f4590fc5050a653f859b366f4806c
X-Patchwork-Hint: ignore
Message-Id: <20260605123833.D7A6887B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-urllib3:
 security bump to version 2.7.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66066ece804f4590fc5050a653f859b366f4806c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 8b606d9074fff980fd1e73786531503b30fb14da)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
