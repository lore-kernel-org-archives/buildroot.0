Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE07FD5B870
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2AD60F06;
	Mon, 15 Dec 2025 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fee1XBzkkwRA; Mon, 15 Dec 2025 21:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F6460F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833006;
	bh=dszL6hmSc/PckXxjzNeF61DvMzBC43z+Yhbh/Enq/ms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ktg489yBnexZSj5Cy7YgW/N1N/1ze9iBTQcTpOlaE6epeBTYToJcGGDz6Jiox5Lf+
	 ygO+NrhvUGFm/WLpJ1uwkyCavSE/aojyjRfLpRpgzFipE/9PyoDmryjmF0X94JHwdD
	 rEqOZl2JqpylaJz3ztzIE7EwT4yGDANVdoWtCySn7uDULy3ftMAIFeOMRZLpNFQtYA
	 lzgn5tER8f70MLatGsZrNbvvn5TxZ9tnBFZgZjBNj2GTNiNalqpW8TUO3PUgJ1Qilk
	 hgafBU0nobZuiN6PUDgIqkreV5RJ1zQH2L/WzNvrfPOUuJiIWnxp+9o0lcdSpd0Bwb
	 3rOajdaV9zwBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F6460F0B;
	Mon, 15 Dec 2025 21:10:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C02151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1BD960F06
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ_VVr4a4Ria for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCDB60F07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCDB60F07
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB7F886FB5; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:48:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2da3485d3c6bfc50a656a5a01d8289d82c2cd813
X-Git-Newrev: 06af8b8551ccaa890c63f277b835c0c53176e80f
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.BB7F886FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-more-itertools: bump
 version to 10.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=06af8b8551ccaa890c63f277b835c0c53176e80f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/more-itertools/more-itertools/blob/v10.8.0/docs/versions.rst

Renamed tarball according to scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index a9b5d00f6b..113c243e8b 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  48da05632079828fd2e89e238192bb69  more-itertools-10.6.0.tar.gz
-sha256  2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b  more-itertools-10.6.0.tar.gz
+md5  05fc46d7baf167d89c82a383c9f0c2fa  more_itertools-10.8.0.tar.gz
+sha256  f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd  more_itertools-10.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 8c520c790a..befbb80402 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.6.0
-PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/88/3b/7fa1fe835e2e93fd6d7b52b2f95ae810cf5ba133e1845f726f5a992d62c2
+PYTHON_MORE_ITERTOOLS_VERSION = 10.8.0
+PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/ea/5d/38b681d3fce7a266dd9ab73c66959406d565b3e85f21d5e66e1181d93721
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
