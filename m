Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9106CD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0970A83BFA;
	Fri, 12 Dec 2025 07:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSDIEXHahDcN; Fri, 12 Dec 2025 07:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA50A83A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526189;
	bh=Sg4YGfZc9uC5fhrOB8jbgSUo4152BMGrItX4IsWrsx8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R6joJnwQaGwqBkDMQ91oWe6sWuJtufMk+o8AGOswlA/2WkCvfAcYWJk61r5VjM1AU
	 uRtomHFMVLgsGGlRzCecfcVUaFwLYfVZCvZfOjgSob3vKNPCASjfONeH4PjLYvf1Bs
	 dLqmPV8u0Npy+i2D4WMcW107qJZL7JjOSA5+Jg/Pk9D+2FNST+lu/DilBRoJ/LZtGN
	 keXnEuuqZ5+wydApyEHE9/CgYsWN5Owh+gqUxqy/1WPyYCef8N9jd5QW5WqJD7CJM9
	 cR5gQnkAHZO6OaU0ZB60w2YvXIlh4/H3gVo45HXXeNNcsg1w1ODlj/tQuhDnkXXQEI
	 P48oJksREqwRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA50A83A50;
	Fri, 12 Dec 2025 07:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D04892C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE43D4118D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQ40E1JQetF4 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5855B4110A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5855B4110A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 574D486C94; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:32:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3e0c424c59e37478de47fe4b98f2f8fe373003d
X-Git-Newrev: f0292e77d89a0faa60b1e1efc17934b38da876ec
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.574D486C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-immutabledict: bump to 4.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0292e77d89a0faa60b1e1efc17934b38da876ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/corenting/immutabledict/blob/master/CHANGELOG.md#version-422

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-immutabledict/python-immutabledict.hash | 4 ++--
 package/python-immutabledict/python-immutabledict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
index 1dd4a79597..f917e43702 100644
--- a/package/python-immutabledict/python-immutabledict.hash
+++ b/package/python-immutabledict/python-immutabledict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/immutabledict/json
-md5  ac3ce87a7507d3e7d44a24a6b6bdb4a7  immutabledict-4.2.1.tar.gz
-sha256  d91017248981c72eb66c8ff9834e99c2f53562346f23e7f51e7a5ebcf66a3bcc  immutabledict-4.2.1.tar.gz
+md5  2ddeb671f200618365b11b997d50368f  immutabledict-4.2.2.tar.gz
+sha256  cb6ed3090df593148f94cb407d218ca526fd2639694afdb553dc4f50ce6feeca  immutabledict-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
index 902352a5d0..4a886b1607 100644
--- a/package/python-immutabledict/python-immutabledict.mk
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IMMUTABLEDICT_VERSION = 4.2.1
+PYTHON_IMMUTABLEDICT_VERSION = 4.2.2
 PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
-PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/e0/c5/4240186fbabc58fba41bbe17c5f0cd37ffd4c0b85a5029ab104f946df175
+PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/ce/12/1da8e1a9050d0603ba65fb1796ed8860a705b906701c96e77f85cc7490be
 PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
 PYTHON_IMMUTABLEDICT_LICENSE = MIT
 PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
