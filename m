Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9009F606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Urw6jZX6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B063405D9;
	Sun,  1 Nov 2026 17:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zP7bCTBZElOy; Sun,  1 Nov 2026 17:07:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 73FFC405CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552866;
	b=Ac1WxoKu0ChgbsctilhUthrVkN3ULAj+3OeYVtCa+TtZFofXm8cW5pxYUkYd2Q9Ciei4
	 WlmqGsxaEsrku1Qv127VHduzzPN17LMh9ShpyL3RpMyobshhxxvxG+vPNuipOwKDtVdxI
	 IuVs2t+fHTecIYZLh/dujZRYjBkulZMbmweEXMn35qv/QagHFzlYdnEsAf5+xULYjzG8E
	 za6HJWjrk1+ufCTCq9cKYWv11i06CPov0wTZexRN4A+0y3WTRB3XGypu9VzwgQdPKi3Zn
	 XFJ+a51BR7ZMJwye6UyTjwOsqfF5B0imopBLfKrFSoVsHw1o1BTTTjMzLuePNF6p1zQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552866;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sOt1PturXcAUjQcwZYn8uib6kdMEvXgixsZgTbhsRWk=;
	b=Z0/LFrh04JO//bbqm5mncUYVzkY2gqn3V59w/q+ad8H90riXjYVX0uy+fcrh1Au2TymT
	 qWEqBOPivvLg+x70ajC0tbErFVnHKSgl34MWa6aR9nG3MvXxYUwStnUT32tldX2Enqr6i
	 A3SqoY+B2dvk9Q09x/TUtNDFvqHmI6/Rf5j0ERUohqelLHXH1aQCYNBvlNNn8Xg5UNc2W
	 WVKDVsMl1kSBpuhUcfrHIfqXgc4ODZJVPzn3sRA/5wvt2PzzeJhuCGkzdsd0ac+l7YHJw
	 v5iKC21aRLujrERumtaQNwQAQqzhdCczOpDDQbbxBwlYCrq0cO04e9I2OjUDquOiQxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552866;
	bh=sOt1PturXcAUjQcwZYn8uib6kdMEvXgixsZgTbhsRWk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Urw6jZX6/eUKQvaP4OXjWYlsf95kE28xubxUx4F52lEOrTveb0k7kvOjDtvz+PBGe
	 489E0Tleyoabwj5XzmvLXUiBbxxAov2Pa48Cj9nus/Govrg+W+cLlMA2j+c3CgrYVI
	 ftncydWhZnSdNWtVtAEdigFDvNwDCUretZGyvrbiel68U76qqTkdCKxbh9aXHKJ8nr
	 0BR8YbJ7b+th4xAfBBXKHIIKhkS4himl8al4ypQXE5CZMtTAuCtpc93IhNadySGGbE
	 J5RB+snAUc4rq8T5jPuYAF8+1uwsKiZM4iYoO6CZmas6sVBnyas1p7A1sRhU6EqqMP
	 GPlp1JGZsrdWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FFC405CE;
	Sun,  1 Nov 2026 17:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51D4DEF6
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E9CC80D43
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVc9_dlImXoA for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CEA880D5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552838;
 b=CgFLa3L8psplEJdXxLAtAyPvTLMy3k5v1H5e0e7VihvIXSTyN/X9Q1xw7mwTdaGSLStg
 GOArYZp0EzabeBWH/6JQ+Ge5rdMkhnP9kIFDmlIuWYT+HQt9eOkMHvM3QF4y6qXrW0HqV
 JdSZZy+MuVs6guqJfMODUMud+cLw5ISK6o4z88gQHaFUFwRBb/l9AUiqeFV+NhES4cqeR
 GUlQjyCUr5VjfOE4lq7dg3IbcMCM0ZZyS/e1CLM6ejzk4z+q5FROJ4t6tzkrR/bKTA8NO
 VKae2YISngrqjia9crpC4xlIQHM480rYXSEIqKIcg+RNBfopEqtRPs1n9iMJW9E/c5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552838;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CLsrlrtOn1MRiWzAlwgrkeAM6OgQ4Hceo3fVa+0tO8A=;
 b=SliOL1jea/XyVirfWVggxS6K36ADOYTvnVwILwKKX/FFR+BBhLEQOh8RqBdLw/r+DokR
 NJNl6UPPFwUPhsOtPvijIhdXOpikdr4m4EYNlY1LZRUTeNxMrsNhu2x8pyumV8Och6+3d
 nEwkctq/HQ9QEudVic8Cqnm7f9MrI9WANc/6t1GCaSVDImpPnEgq/T5QgtjJbgcB4o2/Q
 Aev4u3fl7vR2O6P6JQR8YX4TmqiyCiiex+AarCOMFKLhF/NTdl8VNIwAtJbGI0dyCncWT
 3RH+gIluX9w9c23fMH3e6eZlnXHaoAFy+s49MCOurrqIMaepoC/thJp7I+xOkUSalzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CEA880D5E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEC7F9D4FC; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2fb76dbc2134cf9b54f9af368eb329997d3e3e9
X-Git-Newrev: 29b8164302bf2f65624b7b1530b326b678e4f356
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.DEC7F9D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylru: bump to version 1.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29b8164302bf2f65624b7b1530b326b678e4f356
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pylru/python-pylru.hash | 4 ++--
 package/python-pylru/python-pylru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index faa9575119..c491513528 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylru/json
-md5  2710118d4618067047400d3f63cd5167  pylru-1.3.2.tar.gz
-sha256  ad610b227999da4e2cbaf68a6adf7b57ff69a3e3839ff0f86210dc2f5ebddcdd  pylru-1.3.2.tar.gz
+md5  c808033f18a2c2d95913956d2ba2f998  pylru-1.3.3.tar.gz
+sha256  c540c0f3aea3e03493b520807fbf2d67e95f4f97532a919989960707e2fabb2d  pylru-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b376065aeb8d20c17795697af05c8426ae02f736dd06224ded1b35aad8bac818  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 761c1e7d87..0413547378 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.3.2
+PYTHON_PYLRU_VERSION = 1.3.3
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/0c/88/dc306f0b4dbc5cd89c5153bdf5b2141d0f9107dde8b26edabf4f6654e65f
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/ed/d2/a944dfae27670a4d230301acc83115eb8a5004f8c71549a3cf5d35a40fe0
 PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = MIT
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
