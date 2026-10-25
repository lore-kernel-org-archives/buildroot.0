Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6527E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OXyJWeC7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B5660F31;
	Sun, 25 Oct 2026 11:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKxVyuyobv3K; Sun, 25 Oct 2026 11:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 37F8E60F34
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929402;
	b=mFTUV/kor1o1GfvMKB//ZwswiYTHwQVt9agn6WRGcR65Acg3FA/bXhtEb1IEag+a1Nks
	 AMLaac02e5UiEvHTyKN+71FENSWYnBQYdC5q7+vtjXjl26Gxgy2KCDGGkASCePJXC+oPQ
	 MPJJMMDHML2De3+hJCrF+AsfC+zXqq+y5ha0YVpmKfokVzmXR6ZEyTtiQ2BlnIdPlzjHP
	 gaEuaVCKsxpItRviO3KpbXBSTtyEPb2zn5Flkon6Wu3AoG7W7wku+ABVFyGW0A+1MuZ6C
	 Bbgx3CfXOrFp6wXP1ys1TRsJIMHxGi2KCL54xqiujqjzxPjawLEFe6/jB06GsYuKoXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dDYcZLBHCkvxtxfEl8DeHmKS0OREKz2hHp5Tg06Pq9U=;
	b=Fk+CBv/ln9g+GmN9LZ4GGmH2H8IV+ryY4aL+0l7xPJZ/jpKHN24G4G1xkyO9j0RuEx6m
	 b41CH26DaO4g/20tFZk2nGt8+9udiCKOrRhoD5uK2/ztijMVDUqIhUGe1q6sRmCYYTGn+
	 Qa8WLdxGh4FQeUeHDNXT5pbPhD5qpNx0WsEWWu45TOb4QoDlAfVGNv1KQZeiyGQ4rbbf2
	 BJ4Gd/afA/xNNvr72ZZHMv97iBgeT7q16Z5LH7gfsIloF3gQ8A+SqeEZGKRaRsWKPVFc5
	 YCT3J2vN7h4rWpteA7XHd3zyUfd48BRjsSu0gSWz9kAXeRC12B27VzYlJGY29EoeOGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929402;
	bh=dDYcZLBHCkvxtxfEl8DeHmKS0OREKz2hHp5Tg06Pq9U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OXyJWeC7B36L/1M41wjzl3HPCsYiSZWBdqN5dTrdwaNV8GxgIxJcPt1YnNiry0JA+
	 xi7GjqpswcyeL2Q2cR/xK0ivwvZywZwPOngM0b2jrd0wQLcSIdvobbw0XL2lrsFbjf
	 DFxqdmA/62Qke31ip6Rsjlp7zvvBXKm9EsBCsS3vexuDaBIEDXHUmfAuazehfsHxmk
	 oU/4bG7TXFRW6PnxzgmIIwOr1av2KGYsprpbRy0KlKlDfLzGDnFpwjjT8WY3x2Xg3H
	 +ZhutuK6ZCzYChBWjuWPZhsjw1AHQtegKrt4CA0O26TIbNKEFpebIYhqxqz4pgH5Mp
	 fvATBaUM9aLvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F8E60F34;
	Sun, 25 Oct 2026 11:56:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AEC5D33
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E362B406E5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUhQa-71nsUw for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3AFA406CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=SllD69yFwE94QHjJzW9n9ESHOJ7xp6JdYnjKGP9H2bat+Gz1AxS8hvjKYnctYkR48qwH
 vjA4d0QxH96bdtp5GbzlXviYYOq+lV6VYLHQbvp6fK4hYlbCM5wijXrMMJELzqQCZh6Kt
 l/ZuFXB26eT7q8qBApozjZZ2pRqfPWc/1CBp8Q1roBz+yXpNkZC7O9zUvYTvkyP9Ah9I6
 vO3e2CQQR+chuxtrg+CqZE5JHs9uwhpSrLmbgeK71RyXyVaeixRdaskp1/+N39L8wcBMf
 Yqx52dLRQrsyzVKMJw9cAOzUgqc+ECzIUXA9p1faO3ch8vzfC4kR/IngwYikuKqmuJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HNuybF0wExJq7yN5/4aMv4idYRQeMPh6Gs3qMGuuqWc=;
 b=n+BZRaWXcMSFfsB+NcdqD7MismhNobk7tL6VCg53jkd87j6eInsj/R5XNeyjeYp2JznD
 FppQIh2UrcSiZ9DvRYQnzHE/gwNJWkSY71LO+WB6Okf3rWAeWWwtpoFtY4Zs7xxPum851
 fhUT/IR2HuYyBXzIhVkKpS+FpUiufDYPoBezgFLaW988NEocmjYBxZU547h/s6I/13BuM
 bXnMPqmwPe85yVYeHhr/exIT6ofSLhhELlUnQ6aVZJQ1JFDE+EmSL4pk91KbIkQQgSpZV
 Hx1ENq8jzJhCkl/Evu3J+Py/ReJROFA2tzfKGZFVaa4YvQqgHKAwunI+X4we/KrYtqA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3AFA406CC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84BFB9CE81; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:00:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2313a15905fc459c6faf4bccd7832cb464640b18
X-Git-Newrev: e0f834c984ab86e821b0426eb592ea30c48166d8
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.84BFB9CE81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-inflect: bump to version
 7.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0f834c984ab86e821b0426eb592ea30c48166d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add the coherent.licensed build dependency and the jaraco.functools
runtime dependency.

Update the license hash: upstream replaced its checked-in license with
an SPDX identifier [1] and generates the MIT license text with
coherent.licensed [2].

[1] https://github.com/jaraco/inflect/commit/8eb81cec315179539a0d9edfea634e1cae726e68
[2] https://github.com/jaraco/inflect/commit/4b10e63076aa60d774e16ab96c8ab816748c93ef

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-inflect/Config.in           | 1 +
 package/python-inflect/python-inflect.hash | 6 +++---
 package/python-inflect/python-inflect.mk   | 8 +++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-inflect/Config.in b/package/python-inflect/Config.in
index c2773aae45..ebd3f8666d 100644
--- a/package/python-inflect/Config.in
+++ b/package/python-inflect/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_INFLECT
 	bool "python-inflect"
+	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_TYPEGUARD # runtime
 	help
diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
index 1538bfa178..dac0f25440 100644
--- a/package/python-inflect/python-inflect.hash
+++ b/package/python-inflect/python-inflect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/inflect/json
-md5  2b4c0c942b110c587d8cc1acfb606882  inflect-7.5.0.tar.gz
-sha256  faf19801c3742ed5a05a8ce388e0d8fe1a07f8d095c82201eb904f5d27ad571f  inflect-7.5.0.tar.gz
+md5  e56412feca1a5142cc033bc8fe3e5c0e  inflect-7.6.0.tar.gz
+sha256  b46875b50534a7cd5fcfb5a7c971bb93fe68948c43ca53e9833bd1e1a69221bd  inflect-7.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
index 21e87aea35..e8ccbd8833 100644
--- a/package/python-inflect/python-inflect.mk
+++ b/package/python-inflect/python-inflect.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_INFLECT_VERSION = 7.5.0
+PYTHON_INFLECT_VERSION = 7.6.0
 PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
-PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/78/c6/943357d44a21fd995723d07ccaddd78023eace03c1846049a2645d4324a3
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/9b/4e/2836918b501ac34bf42c14dabc039ed83ce8a81bb5711e3ee4f526deedce
 PYTHON_INFLECT_SETUP_TYPE = setuptools
 PYTHON_INFLECT_LICENSE = MIT
 PYTHON_INFLECT_LICENSE_FILES = LICENSE
-PYTHON_INFLECT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_INFLECT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
