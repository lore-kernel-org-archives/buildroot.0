Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED848CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5C88426A;
	Fri, 15 May 2026 13:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pVctxrZY-Ak; Fri, 15 May 2026 13:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FFD84262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851736;
	bh=q3uLDjccX3s3QXlulhO/S61hnq4zjUeKpxznLueV7o4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TmPK7QGaOqV01Sdz0shJEy01mdhYKQSyye7/+v3RcJv9LlquUvVSW9Boch5vy/ZPD
	 Hlr+5BP88h5rco07V4W+hqf5nICxq5oaLVxgOh0BFyBx2K9f69r50tqDdfIY1nN0Vg
	 TboRf04yQgb58LJAGn8SCFsrS5kP0Mau6AZXvFgVYimGNQ894jAbCfRp3ril9K2a4G
	 2Jcc+m4tu8wJvjjHZsObQA7fPQFl9sIWLasKYnKiXpFxBEXN0o3MN6w+7P+IsaIcuc
	 DoOa0jmhLJzTtS09xArM8vlt50gUy2rxGuUSLpiilcRik1dZOvtWLh5BRH06BCLJks
	 0WQqM9BcgBHUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71FFD84262;
	Fri, 15 May 2026 13:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E50136E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DB7061570
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dw2qkvQolML for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4053A6154E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4053A6154E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C3C86354; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:04:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 10e2083e2ddfa79130eb1ff77d5d7b5ac2715154
X-Git-Newrev: aec1220dc18ed70ae2fe10e07f14538be09b4525
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.93C3C86354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cmake: bump to
 v3.31.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aec1220dc18ed70ae2fe10e07f14538be09b4525
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:

- https://cmake.org/cmake/help/latest/release/3.31.html#id2
- https://cmake.org/cmake/help/latest/release/3.31.html#id3

This notably include fix for host w/ host-gcc16 [1].

[1] https://gitlab.kitware.com/cmake/cmake/-/commit/ea04e19daf7010781d0df980b9683a642093e381

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index cbca2fc355..058b900199 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.31/cmake-3.31.9-SHA-256.txt
-sha256  5d4fdec04247ca8a8e8f63692f0d0f1e9d6d082a2bdd008dff8ab3ba7215aa83  cmake-3.31.9.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.12-SHA-256.txt
+sha256  5f3fd5a54dfa65602bdbed64f981a72673cc19f2d304cc2955cf0dfa0cfd8272  cmake-3.31.12.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 304dc3755a..249e65700d 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.31
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
