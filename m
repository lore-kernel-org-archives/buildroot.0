Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F5606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZY/VT2BK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EFDD6061B;
	Sun,  1 Nov 2026 17:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SA6jyJ62Lqax; Sun,  1 Nov 2026 17:07:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94226606C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552851;
	b=ZEb4fTeqMGArnD5+0Qd+RzOWsedGSqhimpoGOVdlOY8RYnHOIPg8Ke8FJKKnNzR8LCB7
	 dsFfW96mBUd1Ie2WPdHR5ABg49X/dVl3bfKMZZ1JBRmCrjbvIDoi9B9gcu1kzApx26tKz
	 Yf6ZcNhknlUkvfmjr6PCmQF3A9CdqKA3P50Dm2Tf4CuiUjmw6hazg+PvzUQqiWDtbBFbr
	 ebMprhGDwNI6EH3ezLwWi79pe13VPTc0RHG6pGJttQLlsXsgog9TSHw78fpanNXqR2rzJ
	 chwxbJuBky6CM4ef5rInr596PoyA4JUgrGzlEl1AeB2U5tetC/MfYGuUWoote5/95Fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hjSeg4MdjmLbtd95t84S+x/AePOhZEIvTNKJF5o528U=;
	b=hSiBCT6O4WbbyfOVHxoxq5JCMlz9+W+AGPpBQ20FBJS0/G3K9uyqmyCv66FNA2tYWeOu
	 eo+NaGsjHqDoheiVVUqXDQ0jQ5T3PmgpigVWLCmOU3Is5w1ry4+sI0tr3Zg11sd0Zy4Hf
	 aN12Ug8KKRJWvveEOcv8VqfAePMXmptYQkAJ4TZ40sIF/yv9QqeXMDf8bibtZ97kj/Mea
	 jQZmodtDRAF1mV+e1zkAMXiIoQVDiBPvZfvakM7Uwv/aZmJd4Jy39bHvtTMecmdOL8KHM
	 tGM6VCcKpbwzN0KLU41GXwiu4EBYjLnDS6qCKjOTxvErn2CYrSXNoDsYl51U6KUA2NA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552851;
	bh=hjSeg4MdjmLbtd95t84S+x/AePOhZEIvTNKJF5o528U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZY/VT2BKRz7vqSitOcadzUYxEH/aIj6UhvFRIUgH5X7QPq73IJLtBqJPm4ZxllxhL
	 ZYSW7oAtJdmZjMpMZLyyyBvQdNalo6IbH8apKsJ4iUMfbReFegpA2vKABjnHKiOIi+
	 Rh+rpAHsrTT11NvKslFS27SnkNL+4JahAy7Nx8tmahsuMv1jCINYcjXhRat3eNBGyv
	 eRB/cJM+V9+n9PUzpqFVk8qxShnxInokGJITw1E8BP0kb8cn/bm4IOeb7uWPv1uTfO
	 sp3sZyR5ciDQBOA9q/qg47slxeQRvmLA2R9qOc7oITSfV39HpIAeLnur5qTM1P200u
	 b3INeaazt6ZOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94226606C9;
	Sun,  1 Nov 2026 17:07:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C8332AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D68D80D6E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E64RaQOT--mN for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E03580C97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=ikrxUsSWeMQGGB9pHP4BT+JfkcvHEMZd4pU//IBNIJnkOobafLy4aUnbCQ7epyTcZ1le
 +jCScqydLNzbPmmUHFVWwYK00UpIW7N8OjhIezltihKGUR9kHOUBaCBdQ2PePR4h4c4jy
 gjpxiUSQ0HuTI1hP5UzOQ2mvzI/r/O6pnaGwfvB2ZYmL4HktzWVqh4N5cTIwBed0LoRMf
 tYimUTplhnAkmHmV5UFKOElFRBVUPYem+cDhhXGadRGbsWLhhPLacL6RwNXxFIl7tlkzI
 nyX6XKhe2CGW8giHEZyansIP4Qpiii+vLhZlpFdoJ/FgKcktIzucRsutkk1WIQe2vVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M8UYiFTQIeSKsnX4sdyyfnZ1MuWXiuRoOpKJ1Tqj054=;
 b=CWdDIxhIPdrG7NeayMMYyy/Q+GAAWQUcofTLKVRdGnJ2AijsyoSNQyrCUaPyXdO3H+Ik
 2lkuBVKnkbW7+zah2Yk9iJxyQOWhcynDzLNHVdPv0GKDtuPovnkwwn91pQYU5tFyPFn0r
 1bwOYDngvNtCeleMKsikQyqkKA+uFywciFUur/NrzBW43jb+DJgOE+AO11+04Usm3kFw3
 LSmjflUr1rMmYvFLavTqYDm13NfwwNaiUMm2RJccm35pMd29+ifOyl1e9iaHawcPiOwKj
 DgDAH3P30QvgrNvXwFiOmcNK6ltTyTNFiKd2VAtdgbuDsIpQNdCk+Pkm7y8vkd6cGbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E03580C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B1D99D4FD; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baf595f195294216dab08559ed3248ba165cea9c
X-Git-Newrev: 8b3703ef0d2c8ba0352b1db198cc8e29a13f7e0b
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.4B1D99D4FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump to
 version 2.43.2
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b3703ef0d2c8ba0352b1db198cc8e29a13f7e0b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 2a619a6c1e..be09a0a49d 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  2ac450a1a704ecc4b73951dcdb69f7d4  google_api_core-2.43.0.tar.gz
-sha256  d67355a22d995a009b6c5ca98744ea35fbf4f9c2c006aa0588c0941d1ceb5216  google_api_core-2.43.0.tar.gz
+md5  ca991e5ca3103553a8798db83c30be5d  google_api_core-2.43.2.tar.gz
+sha256  5dfc5e9d52982bcc03bd6af380a893365b5fdf907dc527f63d3a372833c33329  google_api_core-2.43.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 0ee2d158c9..9d58e498e1 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.43.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.43.2
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/bf/1c/83011225511b8a0aeee9633d58d8e6b5d858ea5502e76117bcefb620245d
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/a4/74/307919972c4dc84598f4128a8d6ae05ac3d9e6ca73fe60a7bb93c670931c
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
