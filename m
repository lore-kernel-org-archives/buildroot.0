Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8D606A338
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AedL/Tj6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE7680BCD;
	Mon, 26 Oct 2026 19:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wZ4V0uRNA21; Mon, 26 Oct 2026 19:45:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEE3B80BC0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793043918;
	b=YrFKIu4s1SJQfi0MqUFUk8OouGMPp4zrmHLge9YEp8OUZ+pphwBvheW6/Mrc/J+r9JaJ
	 M0vutGwyxDKvDFDsqcY3lojgPjojJvsIUJ9x4EOXdGJGHBlp++dE5jvHKr8zYVt+xgzuk
	 4d2w5Vqx2PFt/YGVCXZkqsBcs6p3y8jPpJFRsAXccDVe1WCTGleFM9oS6fnHiHN/rIwYt
	 dmNrFYeVRwuprpcbbJr1nffmpA2OifSZHH0selu6gUSZF0lxnoG5P2pDZinPGkhMor842
	 VOdJjy58kT0NMdRn0k7N2XVoJRPx5yhncrLWT8FXw52j0WFXMwemkw9BTn/tJ1aIicg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rLxcRzotVeS6KqT0HlnMERG1bk+xzlEyuuVVAGvSoTY=;
	b=UdllRY1Yu8ebedq2WY60qm32Oew9rxYNREZtxFZvW4SdPJSdzWU/7lDB5HCSzY4mWUaa
	 Cwim8boJM7krKZmyhUOkKcjLDLUVRQhuUXjt7YyDkQY3aBupBCMag/RkzI2kDYfclS882
	 pEikIe8hwraPd0ooBkH3P/GLAsOFVPxlWwPjpSZBRlnkCiwRbuJQW6q7s+wzNpUn9kWc0
	 KdhlUA0QKo7sF3aBDSNtjPvZ9gm/rycBpy9XqwstX5PJ6ZtPPltguGIAd+Vf9JPN8rDf/
	 Uazfzx0l2nfzResdVHdguGZoj9AwMKKouLMX9c4pESp1NCt0v91O/k79CDUDGKqTPZQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793043918;
	bh=rLxcRzotVeS6KqT0HlnMERG1bk+xzlEyuuVVAGvSoTY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AedL/Tj6WqFopkYaAzNUfzZgWdDly0QOzXTr2ERe1uEDTExEN+BDoHjitYF3vqaka
	 k5niifJYqwWcPEGfM6CWeHbAlOm1wpMOAogLTy81/VGjg78QL7JI8S+De7UtFeaB7d
	 g8dqIAgsnQbrDCESNPRvWT91rBPvpLDmvZ4QkgSW4QmZnGJE4yFXr9Pfu+f1+7371W
	 Yvj3tEgP8wnzHiP1yLO65LoFZcT1WB5FSOYyZqNQkD2zmWY8+UAtC6QZS0UgeyWWP8
	 fdiShych7zNadgkeqAo691XIgjr8aeb/CVinjbsjS7xSDUHzdSfxY7b96PJCiPZ53U
	 J5d+izl2aJz0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE3B80BC0;
	Mon, 26 Oct 2026 19:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E913D4BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF2DE80BCA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fi4tIOlPafjp for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:45:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7C5580BC0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793043914;
 b=ISCOZGGBUDbvGxwf8V0wwnVCFApsHUYQr949QWVpW7o4rtdbGZFyRxvJlAG4oEPX7ax/
 IKnC5/Aj9sZzGHBqdGLp5AdMPO86iOsznC0EzBCUpllld1H+N0ZPV6pMj1NPDehB4kq2i
 Y7yeiyMMEEjsFpMzPRS17XsjNnNJINGIYbvpoIwH72H5mmULtywRxwzDzTbpBWV6FJVRd
 ZwhN50tgjQ/96JyMqnzI6ehbArzPuUpot3NU8OuwS/93SMa5Dw604aQzSfix82Hrt8iu1
 tetYIQzVZ34iDqxnn/jYIwknk2Dc70G43eZ60raKhfUSMk/or3pd0vtRFqyQYEHacfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793043914;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aXWQIgBa742kCa9qTzRMgAgsoDKCZwNQlLar+Uv3GCg=;
 b=fuIu7XT/9W4lasvORL9+xOtWv/t/jUwqzB2ukL8Gy8e7rJ2JpBfEcWWrUuZLGR9Y2Ojl
 abiCKi1k67v8tfU89BjbXteSA0PzJpGHvcKsMoe661BO06Pg6Mv8j36GOciiBmTpQinbG
 Q7ETlIceQxrBdRM5Otq6vxygWOkgmWjai8tqpKFBWW4GvUbdLShn3Iamp3wLqjG4/6H9B
 lxYUJM2sMSbuyvAvmKUPl7T+uK3eawFVe93ApBfLw2q0dCjNCAS9lTJxzZ1CGdSTUCke4
 PHE4XRVawIrAH1aNDua9RY26sM58hszN8e8fY4vhXkf6PdBy5qbuRlYm46A70z+Kyjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7C5580BC0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:45:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A17BC9CFC4; Mon, 26 Oct 2026 19:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 20:33:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c91a70c6520fcebbcabd5644a06bdd223a49eb41
X-Git-Newrev: 00ed3e8ae8acdf197ce25680ce8ed2c5399f5b05
X-Patchwork-Hint: ignore
Message-Id: <20261026194348.A17BC9CFC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtracefs: bump to version 1.8.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00ed3e8ae8acdf197ce25680ce8ed2c5399f5b05
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtracefs/libtracefs.hash | 2 +-
 package/libtracefs/libtracefs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index d4f6b95094..18e6631367 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a9cd9cbae81b7fff71b3f72d2b819e49cec0402529e5f252e1d9319a62a356cb  libtracefs-1.8.3.tar.gz
+sha256  75187bad93e622c94c4a691173e45f08948d38b9a28e9b855b54a3e956d289a6  libtracefs-1.8.4.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index e9e577d985..16507ced21 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.3
+LIBTRACEFS_VERSION = 1.8.4
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
