Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31288CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E27E85B76;
	Tue,  9 Jun 2026 13:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO6WHI2hGrE2; Tue,  9 Jun 2026 13:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F18885B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010248;
	bh=/MTTkQx7d0mZ9DeppeGBz3s4etrK/2vlItw/z5lLcLc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mD3THLaLBTTa8nk2/HWKA98h+1nnSgSLV6rzlmkz7+Qav6t6+qQ95trrxOZAhTYYe
	 JVSq3GACdG43PNsNkwEhB3ctFJ8ALqICJrmxe+QHKBAKS2e1SDrp4olFl8ZLNs/s9G
	 ivwon70XWqBZBNwUg+FhXh3xxhE0E0MDKRY0oU7do076jh6vfUB8BHEykHiKxqxnkr
	 hKBgjapF6M0BF2aB0hSxVOacf+HMxFIFwrdK7r6eIGR44g/Hjtd6u82EX8BzekeKGy
	 z7Uho7rkH8CvWNgPB5Q3whBIP3WWALaPQDw5o3lGLNalB8IRmLuUJRW8DeBGlucyJK
	 C81q27gdAGCyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F18885B69;
	Tue,  9 Jun 2026 13:04:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D817196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E88B426E8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znrYK6q0Hody for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CCDC426D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CCDC426D6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77C6287E7E; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:44:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a761ac88c6bdb9a6a0f77d65fb92b0d25544677
X-Git-Newrev: 0c2e0f1e9821c2e96b5060d003e773464ded62c2
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.77C6287E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: bump to
 version 48.0.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c2e0f1e9821c2e96b5060d003e773464ded62c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#4800---2026-05-04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Marcus: add changelog link]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index bd91df3abe..4498dfd45d 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  6cfe2745f466960344bf699234a12e16d6cd16f87e50cc2d15857351732daeb0  python-cryptography-47.0.0-cargo5.tar.gz
+sha256  99bb9d438282237d394309a95f1effa4f91ca1f64f7ad0a0cff0f35e294d07b4  python-cryptography-48.0.0-cargo5.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1d5dad3367..bb4a5084cc 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 47.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 48.0.0
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/ef/b2/7ffa7fe8207a8c42147ffe70c3e360b228160c1d85dc3faff16aaa3244c0
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/a9/db8f313fdcd85d767d4973515e1db101f9c71f95fced83233de224673757
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
