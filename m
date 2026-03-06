Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42E7FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA3FF41E7F;
	Fri,  6 Mar 2026 19:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuq47A7VOIul; Fri,  6 Mar 2026 19:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98AFE41FE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826777;
	bh=SPy1FQ1BgZyG+CrOhi04nj6JGXD75MGIyJW4mJru5Tw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DMu1xLDQdJcpBUUjaeZ2MWILn6w8CJNrdd/fd/n+fbgS2ctxMFUjt4dfIBtmc3Vqt
	 KQVjr+w61QxU/vCKK4LZG1Ou4w/beX3isDIUEDaDYvlw6MLbkV0n5RHdBNq9t0k63E
	 TlrRxgpQaRUTSUTl0bLPiRGAGMJ/0D81W8vOvDB1eYh1syGKcitf889RsWRQlbNDnx
	 qbvuq79RyBJJE4Myo5ftxb7ANItVUeTlkhkn/BLPCLoXQ2k7CNhFwuBX2q2fiixpYY
	 BbkqqNmyK+G1qF586n8GM2C0hDOeGQDb15zW75R+JY8bAM9Aq/c4JXVwenfC9rXiaF
	 8a7xZuYY+36CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98AFE41FE1;
	Fri,  6 Mar 2026 19:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D6225B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DF9B8229B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enscxyyC3B1K for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C97D8376B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C97D8376B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 225CC7FB67; Fri,  6 Mar 2026 19:52:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:08:42 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 820cbef7e1faae1c12ea11edcceaeb76b74500d2
X-Git-Newrev: c55618c030d53564b4afe537b129212ddf5a144e
X-Patchwork-Hint: ignore
Message-Id: <20260306195223.225CC7FB67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-multipart:
 bump version to 0.0.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c55618c030d53564b4afe537b129212ddf5a144e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/Kludex/python-multipart/blob/0.0.21/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fa2bb2199d64b7c7e019b23ec13ae51994899dd9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-multipart/python-multipart.hash | 6 +++---
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 594c7cd497..ed01763cd7 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/python-multipart/json
-md5  fa3ee0a8ee83e24b66ab40a841922244  python_multipart-0.0.20.tar.gz
-sha256  8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13  python_multipart-0.0.20.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python_multipart/json
+md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
+sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 8e11f5f6cd..6921d935eb 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.20
+PYTHON_MULTIPART_VERSION = 0.0.21
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
