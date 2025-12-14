Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC82BD5B16E
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800C560DC7;
	Sun, 14 Dec 2025 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ij0e97pS7qYS; Sun, 14 Dec 2025 21:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B62A60DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747316;
	bh=3hN9qCXdp8z7aOEZOAMFnysGlBLkgxJAv2SUOVLPLic=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KhBAjOjoBiVSfFG6887e5/uNNKvlcXXA5TgnqUx9WK+8UTRhjTzWxCQcL/KfTJcjk
	 zVmdDc18nUwjgR1zdRKZLvGjlHh48fAJWwx4Rj0AOzRd1/HUdKmiqB28P3nNtVIsgL
	 SEuQw1lFkHIFG2cf4V1O0Pt5QCHYqBgSk4QyEUOA+sYoG65p3i9TBTlbcqWF0tsy8P
	 hDgqJp+Zg80ygRlUKZq2KVz32JYTihOfDHncITL29TwAHy5o+lxJoDERbbkNnVX4zr
	 wjmqAxG/o+Ra/AyCVaepxWVu5QQBRaYEmemInr/Xr55oUyqBbuq06nEwzHoVeNZfEp
	 ETa5/w7AAsSBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B62A60DF5;
	Sun, 14 Dec 2025 21:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 133C12ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E493C40638
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmkVw4LYs5xN for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 740D740676
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 740D740676
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7196B8355B; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e546b31d88480d2e640600c1a0aee59e5d05e15c
X-Git-Newrev: f7f4ebcd2a4ace033342293bb702e143693fe393
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.7196B8355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: bump version
 to 2.43.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7f4ebcd2a4ace033342293bb702e143693fe393
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/googleapis/google-auth-library-python/blob/v2.43.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 37641a7a90..17ca9ddd61 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  cf398efdf51cd3885eef521198a202a5  google_auth-2.41.1.tar.gz
-sha256  b76b7b1f9e61f0cb7e88870d14f6a94aeef248959ef6992670efee37709cbfd2  google_auth-2.41.1.tar.gz
+md5  43aef15e30f2646226add26c54256302  google_auth-2.43.0.tar.gz
+sha256  88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483  google_auth-2.43.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index e649569b37..53e5900856 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.41.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.43.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/a8/af/5129ce5b2f9688d2fa49b463e544972a7c82b0fdb50980dafee92e121d9f
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ff/ef/66d14cf0e01b08d2d51ffc3c20410c4e134a1548fc246a6081eae585a4fe
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
