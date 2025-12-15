Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1DBD5B872
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E234981DE3;
	Mon, 15 Dec 2025 21:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czv2Ky0I8JJo; Mon, 15 Dec 2025 21:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123C981DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834728;
	bh=oyEl5Pd7mvRxq6WBpr8fB7KnoiB2Ky/AF2HlZxFeN1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fdaO9AfYpdEmndGsgapb9kZneZPUORPhtRpZEvMIlc5lsHxUlAuySU0tpLUV51tuR
	 x0Ae2EYD8ZeEir8+FHf2Lccmb6/H9z7Hzq2v1IRgA2jmy8AIGMNQOGvpqHi6JLXEOi
	 E7YTUm7HH7YODvyD7FARSE8Md7kCoPN02DuFhqamms0TcvY5XovacG+I0hMFmon2Ns
	 QZ8yOmVMtZ3SoMSSrd2+0wQRdM4VeJAD9qr8IGXuKgTmo/HqjRrfTYkHJt0katrL0R
	 bjaQbUnt/O6NILorMHBz1bgKZFr5uhHXqU8CmN8TmvBCA3kuisPeorjhNrayzSwbod
	 0cs9VzVqwxwFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123C981DE5;
	Mon, 15 Dec 2025 21:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3930E364
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F31740AEE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKNCUgWr0KiD for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EBA04021B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EBA04021B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FB9386FC1; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4df1c7afb0b70bdcf99720855ccd6341086e4a27
X-Git-Newrev: a8a09c557c1c95b4acd0151ef1295aaa1a1320e8
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.4FB9386FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pudb: bump version to
 2025.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8a09c557c1c95b4acd0151ef1295aaa1a1320e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/inducer/pudb/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 9918f3e041..f897f09735 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  dc73886506e57c8ba2116e5cbe112fb8  pudb-2024.1.3.tar.gz
-sha256  264f239e0538e52e83d3d020143100b3171cae17227674bb1b9f8b075f34849c  pudb-2024.1.3.tar.gz
+md5  35a728fbb6996bbbc9a857e7142883d5  pudb-2025.1.5.tar.gz
+sha256  e6dedb81fc3c8cdcd66cf62e86337cb913570ebb2c994c9ab52012d059e086ad  pudb-2025.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 4dedda0bc2..603ce4cc30 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2024.1.3
+PYTHON_PUDB_VERSION = 2025.1.5
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/36/27/fb087bdf2cd9c8e56d0347b863ce5995967c15a3e2a0b9245c7a8f6f1598
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/f5/69/0c52c6058da586e173e48ef8f9c45bc805d9df78d5ad4d69467ff68694b5
 PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
