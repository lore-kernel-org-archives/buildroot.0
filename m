Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D072606A33A
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tv+Q5+lp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E76B481210;
	Sat,  7 Nov 2026 10:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4yzLnvsfyjS; Sat,  7 Nov 2026 10:30:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F83F811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047404;
	b=K9yIQiEUYaMnHrbZqmVM75eoCri/53tlGm4x2+LXGty4LZyMAjgPDI8NzaIZl1kDHIRo
	 MuM6DRrWzV6V/U9Cy3EBtWZ6wHs80+bjpPrGtPWEporvb3fqeEi6m0GDk8vPgYX33vxMz
	 agQVtLMhyehc30d3M61YwudoCSXwUhTWbqAIMZ/kxX2pVgjArYROSp7rjqY5aF7xfRWQU
	 vgxLvagIgLfwPQeQjBiSpDq2HxJO/EsTUrJ1QqJPv6WI14WA7zcwFv/KLkuny4vuNu5qz
	 2nzRNAY/TNyjmzXiXdoe6SCMOFGLFOrktt+lYvxoSohDCG0XQMe0fx6StE1IjH0OaMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047404;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EDPyPGM9/7Kc6+PxYG+qEnbe3g3kbXTU5XF8/NdS6dE=;
	b=orC1irwDAI7fsqkqwhQmeHC9URvhl6pVTfuJFvyGio73VKkFN9aMJ1slYTCvzAz+lBHi
	 mdGZpDJVTO5mIR+rjqwkj/g40OjP5CCNA0e7nzhGhTadQvBs1kakz53w9wnUW53Fjxodt
	 Ya7Xk7myNm+/tKyYDXckT+OxVyfh+3E6uaHhm9ATENWo1AKGhovdUDbDSm/vdwDKTbNyk
	 yNf5MC0ki7g/pp7/78HR4GvqkruwOvMUHUrcahcNpdTB8fQXeIJmXUX0oCioXu7HX0Gsv
	 Su1w2h6fxjV8kGje140wT/Mc+nqduT12FayYcRpXzFfM2dfGLvlyBxkjZi84x45GJyg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047404;
	bh=EDPyPGM9/7Kc6+PxYG+qEnbe3g3kbXTU5XF8/NdS6dE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tv+Q5+lplp9+gXnNa0XU0qfYW+9vItLZlFsYTq8om1JRUWTvVfQn9uDBfNAkSfOoc
	 4Szy1JSPCWxQXYgBN4/MH2dybq6a+EYR5x4kt87ggICd81qu/JHPYE+lkI9wBomMKh
	 f81+xLN4x1RKMF/hKgBOlq54PhbDJ826DQK78GgRD8mYPksQTE93nPUMir4oOmSMK0
	 YoxPgmzQ084k5kzfsJj8H9v5Ozxh4+zx+XkIoXUZNH8CtEDQ0mJ+hCMwhocE0Qwqmp
	 qrlwpdb6nN+qJWvYqmuIEtiKGzb8YfZ4/jMzUkyTzeJxQt+yT9XW+g95kRjK2nmrGf
	 7IBlAGyvS8sTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F83F811AA;
	Sat,  7 Nov 2026 10:30:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F84137D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64CD0400FF
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2jdexcqQ87W for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7D7E44009B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7E44009B
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 437F6886E0; Sat,  7 Nov 2026 10:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:14:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 848f077b5c38ced42fd5925bc30169ec6468a9be
X-Git-Newrev: fc44998e6c3e8d49ab2bf0e045ec2b298d89b59b
X-Patchwork-Hint: ignore
Message-Id: <20261107102827.437F6886E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.52.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc44998e6c3e8d49ab2bf0e045ec2b298d89b59b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index c17ad00388..54a2ad9b1c 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  56d83852139d542e3d53cdadbe52e80697e08e91b7c804e0d4d8f0a495d793da  python-selenium-4.51.0-cargo6.tar.gz
+sha256  1e728ef2686db6fc1d1d6c6ae85cb0fc438808acab78033cdb28d1ca01f9a40f  python-selenium-4.52.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  307012b4481479a56605420e81db14686a0274d246d06d224c363ee09297d330  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index e1d288cfe6..92471a8c01 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.51.0
+PYTHON_SELENIUM_VERSION = 4.52.0
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/c3/d3/c925308af2c9b9a9ccf531cf23ffba4f38c0d750f088a06e560fb2ca0c59
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/96/07/d9a9ca4bbcfaad6e07e8034ccd719ef42032ab25a421fb9171baad4ed734
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
