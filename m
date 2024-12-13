Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84DE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 17:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A2341516;
	Fri, 13 Dec 2024 17:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MI85vLxIVHIL; Fri, 13 Dec 2024 17:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D378B41527
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D378B41527;
	Fri, 13 Dec 2024 17:11:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EED1975
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 17:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF318468E
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 17:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKoCb8EIhGfV for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 17:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C0E8467D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C0E8467D
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 17:11:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2025A86F0A; Fri, 13 Dec 2024 17:11:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 18:09:21 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d8e6f912c68658828c772fb38c701fb313ef3888
X-Git-Newrev: 80ade2cbab3eb55753fd237505082f368f911082
X-Patchwork-Hint: ignore
Message-Id: <20241213171102.2025A86F0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python3: security
 bump to version 3.11.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=80ade2cbab3eb55753fd237505082f368f911082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

gh-122792: Changed IPv4-mapped ipaddress.IPv6Address to consistently use the
mapped IPv4 address value for deciding properties.  Properties which have
their behavior fixed are is_multicast, is_reserved, is_link_local,
is_global, and is_unspecified.

https://github.com/python/cpython/issues/122792

CVE-2024-9287, gh-124651: Properly quote template strings in venv activation
scripts.

https://github.com/python/cpython/issues/124651

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index c11e79ca83..02d4df80c7 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-31110/
-md5  af59e243df4c7019f941ae51891c10bc  Python-3.11.10.tar.xz
+# From https://www.python.org/downloads/release/python-31111/
+md5  3e497037b170fe4be5f462c4964596f2  Python-3.11.11.tar.xz
 # Locally computed
-sha256  07a4356e912900e61a15cb0949a06c4a05012e213ecd6b4e84d0f67aabbee372  Python-3.11.10.tar.xz
+sha256  2a9920c7a0cd236de33644ed980a13cbbc21058bfdc528febb6081575ed73be3  Python-3.11.11.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 6a6fcaeb2e..7a8c2b3053 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
