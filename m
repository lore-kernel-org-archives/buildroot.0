Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B5FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96140404F7;
	Sat,  3 Jan 2026 11:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMNZOTUDd4tK; Sat,  3 Jan 2026 11:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D804050B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439765;
	bh=ONT21ahnPSNjhlQgY5Z5g9WNlkdfVnLBLnlTkfU3hLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LqyYZjJKMofKHsFksQv2Ce/nIIYjWQY/da5JYGaygoOnsZv9QGzrtFmaQXHU6wHZQ
	 +/HPAFTFmMUTmBMS65qtjiw3327jKx9squWdgL8uGSeW6tvPoqwlhh8NSgAPBexTjQ
	 kVIcg5N4HMaJLuyQrgBR/gl9rFEDoX+prufZ42H6C8xpz69wjk9bgRzywKYU+5WBuh
	 5ZpTZWhwWsjOQYw8C01kRXu04GIFitGtAaulbCD5S8KYmxQ/aWm4mUPS8059c6FMKR
	 NDOjNfq3SZS1HEZTEBERV0BPtL+pgGFaxuFg8jUHoiAAhbDBqnR+IbdbY8NZ1xFG/s
	 RDIBvmn7nBXUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D804050B;
	Sat,  3 Jan 2026 11:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16EB8440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 030134050D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvrZ6QuAcbEa for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52621404F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52621404F7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B46C87FCE; Sat,  3 Jan 2026 11:29:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e0e91028c0a50b69c5489a523dca2b509c9a817
X-Git-Newrev: 7ae976e003dda440de9cdc6df85a51271bcf5b64
X-Patchwork-Hint: ignore
Message-Id: <20260103112924.4B46C87FCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gnupg: bump to version 0.5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ae976e003dda440de9cdc6df85a51271bcf5b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gnupg/python-gnupg.hash | 4 ++--
 package/python-gnupg/python-gnupg.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-gnupg/python-gnupg.hash b/package/python-gnupg/python-gnupg.hash
index 9f3ba63721..5b0c450a76 100644
--- a/package/python-gnupg/python-gnupg.hash
+++ b/package/python-gnupg/python-gnupg.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-gnupg/json
-md5  8358b54f2c76b714545f04df3f33df28  python-gnupg-0.5.4.tar.gz
-sha256  f2fdb5fb29615c77c2743e1cb3d9314353a6e87b10c37d238d91ae1c6feae086  python-gnupg-0.5.4.tar.gz
+md5  faf076013aa2e25a8424f29b49c1b75b  python_gnupg-0.5.6.tar.gz
+sha256  5743e96212d38923fc19083812dc127907e44dbd3bcf0db4d657e291d3c21eac  python_gnupg-0.5.6.tar.gz
 # Locally computed sha256 checksums
 sha256  4104ca980dbca7603fc553078378eb14566a76f819d033d7bff89fd6a97e181b  LICENSE.txt
diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
index ae5548660f..55c57cb702 100644
--- a/package/python-gnupg/python-gnupg.mk
+++ b/package/python-gnupg/python-gnupg.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GNUPG_VERSION = 0.5.4
-PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/f1/3e/ba0dc69c9f4e0aeb24d93175230ef057c151790a7516012f61014918992d
+PYTHON_GNUPG_VERSION = 0.5.6
+PYTHON_GNUPG_SOURCE = python_gnupg-$(PYTHON_GNUPG_VERSION).tar.gz
+PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/98/2c/6cd2c7cff4bdbb434be5429ef6b8e96ee6b50155551361f30a1bb2ea3c1d
 PYTHON_GNUPG_LICENSE = BSD-3-Clause
 PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
 PYTHON_GNUPG_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
