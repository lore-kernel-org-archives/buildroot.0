Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD9A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QudcpKT4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2FE1405F5;
	Sun,  1 Nov 2026 17:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnhXLqjnzf13; Sun,  1 Nov 2026 17:07:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC55F405D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552871;
	b=pbbrEmU0SilUAxzWqHAYhsJRqJOWQaYdMF4bTsdQ9lWxqcl/IHKbG25lM7rkRMKdlrrL
	 gz1AjB3daoLGqHKbiq2Q62almH6Wp6H/kzkH1yFyYWFuAKG2ozH7ghJIpJbA1FfSMOwQh
	 8SoIqSanohr3DRevjqngpk01f8ECE9GKJUNmyMot8EIMat0/xKnZl/iMrnsO0H8s07EhV
	 PzF960hZ79QgKDgPkBheinz7ezgx8fLU+Zhj216pvY7TGL20derKUiu2iPY2BVn2F4cqF
	 QyakIt8/faf79Oa3ZjKZzuLKO1pXGVMfudnXE4EQi0f1kUHGtvxImS40p9vfcc2paGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c+scCiJXWOawdDbxOjbntnQLwUaOh9zRWQBNzA02cuA=;
	b=CKUWrfJr3cPuG8Egn5/LFf7cMvG5OJfWcrtIegptsxU2xkMEgyGGN7RiGZdvjHdmBamL
	 s4hce/zFzBDmDUeHJ4B/aLDdHB4uuexTeZ5q1KWT75/4UHsbDt2tNK2c0dI1cd9g3vTWj
	 wCGqnD9RlyQ3nf0g6OL9HHi9d/6sujTKAIBUn+d05pA+V1SZWfkY1eE6UGi5pyCIKpQxS
	 Rtv2K/757tdR+h7PxQ6WI6yFxwzSk7ObUk3aMlXJ0tMrmkCs3zXCqn+3c8OBcX70q5Q8u
	 NKF1VI1OHfq9UKufoDHZltynvmhfX6RKJgHWpTcYN/zYIuloa5spTJ9vQ4Jj0Bav63Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552871;
	bh=c+scCiJXWOawdDbxOjbntnQLwUaOh9zRWQBNzA02cuA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QudcpKT4aS+ukdDyRU9zPPPNFKhtMi+doV5wZCxuThTVTprDnEXwRMuHCaZWiuLfN
	 rIr0/rS3ydZ5b8mmgzJ3imQE0UAJVjFA6Jz4Vv1Irn+IlmA78DofrrVtWENkbqgbZI
	 oU7s7a1s7t7VKFP2pkUEto4hhBhwApZpDtoNpNRdYmS33Ag8WvqGTzz3AB5BjvXJ0s
	 3P02pt2QK436skf4TTcbQWzWN2HUTzq2selxtzpt//Y21rXE6E/6jzoQnQeqAz5/Cy
	 e3NcsEfMZNrD15F560GaZHK+B3jJ7Lt8Ium1dnNzXgUOk9vTZOcG1Wdf5vg4EBjqv4
	 9KEqNK0pSCeTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC55F405D2;
	Sun,  1 Nov 2026 17:07:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD3D72AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDFCA80C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yo8eSuLYpTiI for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0E1DD80CEE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=IzH6aLvqWfdphLNNB+O1llDB++I0D8L1T5ByHcVN2N8Bdi2VztSmIdnPTKKkmCFVl908
 GiRTtU/kRjsGtsPisHHsNJIJarIas44lA5/+S3NO3R3axs/yeXjCx1VAbVz2Kr4iCBK1h
 OghqE503r20D8rMCAS8FPKpAFIJgQrX8F4S5I6nfndDS7k32i2uUIki3OiBGqlAzQhqgt
 fuqAzHORXOnWzPfivGgFSK2E6WZJrMTfsKBIer2OpVw+uv8trk1nbthbXnzo6dMhAH+/7
 Y/RQ5cKEKCKXCQKDn99O1/tkY6dhn1Loq8LHktSgRFnrsUXC/fKL5ZugFIMeDRtuMFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3K9T+PTKcJjpYkqr1NFLagEZY4uEC6SLg4YVhyfww40=;
 b=W+9BkShKJpFgxLCn0iwoKcM4pkZoKfdm9IfC7sISQKVLb6NqnzkDBGqAwjaAovrfURuP
 1M0sy92a6DIZgr7UFmese825MY1/ydEHgPPsWdTUkm6GqhjI9WTYnELr8seHZD9+KtbJY
 XA+J3eU/pP7PoLSyE/pxe4OvXoMt1PvBhvaCL49pZmuUasIovfIwsBTvZOBtSYsquGADz
 gTFK+IzKEIFnLPyn27C9cUISj+i2Mjbmf99Jouftsamu7BNvT1WjY2aP5X5Sh5zAr570+
 dcQfEe4e5wBnUWJR5kTBFAHL+nfKeX8iNn64POWyhjJ8A60Z37n5AXy7vMaSJZO+dbQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1DD80CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D00709D4FA; Sun,  1 Nov 2026 17:05:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7821acac3aa60115627ced3dd462d4518bf2f03a
X-Git-Newrev: 40e868115df43899b0537417a0afa3f34f0e671f
X-Patchwork-Hint: ignore
Message-Id: <20261101170549.D00709D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serialx: bump to version
 1.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40e868115df43899b0537417a0afa3f34f0e671f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 1726bb480f..7a740ade13 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  a1fe8ade48ff969ed3a16f2f3f6272a6  serialx-1.15.0.tar.gz
-sha256  89ffdae6511492157eb1e957f7f6cb0cacace088692f7477b27c4a6b6dbd4d6d  serialx-1.15.0.tar.gz
+md5  9966645418ca948d84b4802e7478a2be  serialx-1.15.1.tar.gz
+sha256  689dfbaf55f5f87ea0b6bcdcab135577ce1e70f98d490650b02a8b86eb0b0281  serialx-1.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index a745694573..ccf6980daf 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.15.0
+PYTHON_SERIALX_VERSION = 1.15.1
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/1d/5f/d1496ad01c310ae573921ca24c62bfaad9ff34cf16c583f4ae85f39b77e9
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/93/80/20ddfe87f1f62f604112def5bfc65673bd6013496201a6dfd8cc56f40366
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
