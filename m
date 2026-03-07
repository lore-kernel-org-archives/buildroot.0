Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CFEFC9EDA
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4DD1614EE;
	Sat,  7 Mar 2026 10:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDyDxUu5JGAY; Sat,  7 Mar 2026 10:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FBCF614E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878052;
	bh=4Y/OpGxJQsWQWSUi6ZpAgbQIE2lgMXSVPiczvwg+aoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QM37uqcic1YmVGgOhPs5FR1xLnVWZFA88coijvlS+gjxr61c6nzo+hObb7UIZDU//
	 Otv2XAAe3R3WKxHxiKrq+91qYFsTHmK7WlYsy32U8Rgvz5hDE9Naf7UTs0H4qYVOox
	 seYZz7pnplbB1fDboLYt9rzm11D61gEmg/hv3iHB87+SYQaFBjFYmWxICL0hcmIsnu
	 mVPvvPeP2lcCQc7HeU/VmJgU4iuGyyT8wF3YGjDeq+lojfC+fkp8Igu7qCL4imfqzQ
	 LJ/4+DrdTbwzlkEYQq9vXzem/KMcka8HQQB5RZQvMYXQb/hU81A+Flcc2kKcnXQBuy
	 sVzXBtp/Hiibw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FBCF614E3;
	Sat,  7 Mar 2026 10:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C586B169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B73DB41E4C
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPn-hFN94dFN for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E390B409F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E390B409F2
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:07:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 064958620F; Sat,  7 Mar 2026 10:07:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 11:00:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10037a3cd541e1c46d6303ec02006ff5f6ad0df7
X-Git-Newrev: b7b8c9e2778dc08a45942af9aaf7312ec3d78ff8
X-Patchwork-Hint: ignore
Message-Id: <20260307100730.064958620F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio: bump to version 0.33.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7b8c9e2778dc08a45942af9aaf7312ec3d78ff8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index bd722a2367..79146dc1a2 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  8bc9dbdc265c291c93006f5e0f1d3918  trio-0.32.0.tar.gz
-sha256  150f29ec923bcd51231e1d4c71c7006e65247d68759dd1c19af4ea815a25806b  trio-0.32.0.tar.gz
+md5  e778db1205fa2ea00dac9340471b8f1d  trio-0.33.0.tar.gz
+sha256  a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970  trio-0.33.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 73c1ecb461..4211dbb313 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.32.0
+PYTHON_TRIO_VERSION = 0.33.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/d8/ce/0041ddd9160aac0031bcf5ab786c7640d795c797e67c438e15cfedf815c8
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/52/b6/c744031c6f89b18b3f5f4f7338603ab381d740a7f45938c4607b2302481f
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
