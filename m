Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1C0CD342C
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C160584295;
	Sun,  3 May 2026 14:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z907mm9SOf6I; Sun,  3 May 2026 14:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A81842D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819891;
	bh=AigTCcKL2g8C5WIIZGmmA75bKLQOnGHRX5UqjfK+wYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M0qw+H+c2HNHGHJIJXdVMXWZGcKRdTrgdJBGzo5msjBS8LI0DRM2uJXwF4Q9N6sZY
	 qnNqvSUdmD+CKVq3Nj1K7RgylLMu8ZyD6ltcAM13WT087bdRp2/FnskVYdgAGLChXg
	 qN9UPc53mzg2A8F/Lke3WaTzYme+cRLELfjoR40ZcIb+kCAS6LZS0dRMl5+IaSKljF
	 jM0MoqX9GdV4oFxbIM8ULsQWZfAVBIl63PG5TDaaeJCJq8NJoFZ9FTZKohtwIqWIB5
	 y5uWyUeLMjmRJmop5TEvBorYhB7GDO/IoqYwlP9yTFKvmK64FhTuVP5Wf+TueGHked
	 Q6aQDDFYVzs8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A81842D4;
	Sun,  3 May 2026 14:51:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E4F190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67165406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9okFTqwW5Oa for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA7C4046D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA7C4046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C82A83FC0; Sun,  3 May 2026 14:50:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41a11a7def12458143ca70269bdcc475e6cf7433
X-Git-Newrev: 829239df7f3fbe3847fc694af3bcd2b91e7d42b6
X-Patchwork-Hint: ignore
Message-Id: <20260503145048.6C82A83FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: bump version to
 4.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/829239df7f3fbe3847fc694af3bcd2b91e7d42b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jquast/telnetlib3/blob/4.0.2/docs/history.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-telnetlib3/python-telnetlib3.hash | 4 ++--
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 889a7aa428..14c52634f5 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  468f4d8cd3571065d093d9abcf8b8f39  telnetlib3-4.0.1.tar.gz
-sha256  819aa9dae793d66e9fef5524ce838eabc4723589b0f81c72fccd3f2448cbc2fb  telnetlib3-4.0.1.tar.gz
+md5  c72d70acb65fba264c7f1a8ed68d4e07  telnetlib3-4.0.2.tar.gz
+sha256  76726d7a7a34163b5dbef461e9cbf8fb4bda8f4fe7fcb225f56cbb4dcf5fd16e  telnetlib3-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 8d47ca44d4..7b29e7b13e 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 4.0.1
+PYTHON_TELNETLIB3_VERSION = 4.0.2
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/5d/57/42acb7ce2c1b3d88ab28d6b1de41a08fdd5180d262d728fd10071950566b
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/2c/1f/a5de9f0f86976d299a439619417019a9674fa8662377659734dd6e067235
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
