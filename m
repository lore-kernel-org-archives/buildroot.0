Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C99606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=djrqqW7c
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC1260909;
	Fri,  6 Nov 2026 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYGSrsogkktC; Fri,  6 Nov 2026 21:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDB786090A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999676;
	b=lFO2K/Msj6ZSXwwYzmUA+fJRZBqvqgqshxTcEutnFjY2kf39rZJGD16FL+zAihGT6r9J
	 qmKFgeZ0zfRWr3Ex++sh87z/JHtx40lEHCyfDzUs2df/1SsxrAEjhN5ShmqG76RUo2Z7o
	 i0zFEGtE7AgAmL5mPI7W0TS5ZGxrAT/9TURbbU3qCWvCTN5XXqMrvf9J3Pcq1Q4eWVbu5
	 fXujrEV97FyYrug3rdyVud2FnqDEIkIpG44vInZQ2HSuYyymc5Zk6V1fee7kA/DGJWcfJ
	 h02gy6yZaHGkQEhSLNyrTlbK42EOwDCaBJU9SQd8I0EeJkaOAfrB0/x4M0/ZWGHXxdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lZiUmHHPNYoVpn6mNtLhf8NFqToouqggGcpCPJjkM10=;
	b=Gh87iAGmVHJ13Ak0iLZIz+I4wCNTzqBGpFZKVVJcJm+IeTD1Uzlws1DerM91JTAk86Zf
	 7eJPjJ649TgqHwdqTuuLCZtUvCGKwFPRc+7bl8UHkM4zousoJByMtYWYjfbdgmVpCjGtU
	 PGtogNfC9WATwuY6hhKk4mHYlmE+BekQt+pAzzH80FZIF/ZkAQHjXVmiJIhkoqiyEzvOI
	 ylmG9xiY8IucvsyzZwILIpTgxmXVGqIE1N3857w6JvVBpAvBvn+A76AGcLNJVxC3X0R4g
	 2qNIOuRVdlyMc7AC7W/Kt07AhsWivkBjhQfMnlmoDpnodRNdzuE7TBzEoeILI/8CgAw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999675;
	bh=lZiUmHHPNYoVpn6mNtLhf8NFqToouqggGcpCPJjkM10=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=djrqqW7cWx8Ce8BpxdNEJ7Fu6hqdxu1HQsAfhvroMC+YfgFNd61qTgVQJDxiIjciq
	 NoE3KVDLU4YNPbbelUp8Cz+u2t3T9s1WJeu+BuCW2yo5hkl2QIttPw8KaadL5JiOCe
	 s+orrPRYSPKqVrxGkfF2mvzD6BSYCpkKD0TTTqbq+qXksMkuIJp5sqF9g/VhTpH4vo
	 xokjG/HxE7hMCy/RjfudjxgHEgmQYvvZKveGFjda0zac4BkpoBJrtr09wtZZOVVUO1
	 s1yDpN+R4LY3GtuNhtJcDdZlHQR/hrwsslT6PndHg+p+7+26PaUrD0qQecWb6QErQe
	 gE/k2sNNlG8SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB786090A;
	Fri,  6 Nov 2026 21:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E771A64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FBD8409AB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUQD01qGIwNr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5729240907
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5729240907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6787E9E101; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48f40a59117304c86a76602759d1907359dde73d
X-Git-Newrev: 5fe87abcbfcc9964f1514119eea25ac664063d2c
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.6787E9E101@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cython: bump to version
 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5fe87abcbfcc9964f1514119eea25ac664063d2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index f4495dd076..5637514ca7 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  df8ac911bb3c6af48fb0158160e5b029  cython-3.3.0.tar.gz
-sha256  eed0d93fbca7087f143b42c34b05a825849bdf17f101572c2105acfa49aa88b8  cython-3.3.0.tar.gz
+md5  9e5b3106f42ced6d0d8b22e66e796bfe  cython-3.3.1.tar.gz
+sha256  e0e45989e821bef6aa9ae15c7d583ab5e055f7406c4b3624e49e06d24e90375a  cython-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 587949c17a..6ff967d1b1 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.3.0
+PYTHON_CYTHON_VERSION = 3.3.1
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/a9/d8/4981ef716ad0e3ff0d3ef383aefc6b03c4a88dee33b272bf8e0d833001ca
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/99/ca/18e324972e5cac914816fdd7bb03e19a455b90039c277a538f7781b50c85
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
