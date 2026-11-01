Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE560606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SKWxOLw8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 972BB80DCB;
	Sun,  1 Nov 2026 17:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRmU9gR4M1m8; Sun,  1 Nov 2026 17:07:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8E14F80D5B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552872;
	b=ndfIyvCU0fp5YEWr7XWJVxpt8FMcX+BSb1/rGemQ5Mq0J9bwpXnCMWsJoOsMJwZpXriV
	 UP0G7klHKtZOqWXEmdvu12iQrOM5ZXxjZboyQ8iwwqSdHAtsbpW54vHe2gP2Ik/atmqf8
	 9/Whn6FHxtmrKIVRn8Ovx89fkk5BYJEV+PzOZ6kT0zvbmBfkJRr0xK5NiIJ9mQr27Yh+f
	 uajiidIIrYW1F08bQ2wR5JoCTOu7jEsFlVbNTh9XgO9vjqcr62jPy0KZrxQLB8zyDKmeQ
	 JY+4fpchBRvvfZ3BIW238G7pp6YiyDSGhQfJmYOOFxt3e0FI3kL3y6GTAN/F7C2zQeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qAAaLjt9YfuPQMZoL9TAtDgmmBN/F6XJppUcwHZNKfg=;
	b=kSOdNOaE8wPR1FVYRaYRcQVi1GGj/DGD2uv2EIYSPfmOMvQB7+5JrywffhBytRksHXco
	 kJulWBio+Sj6xI4rr1kADdg0ymvmDtdmeXdC0j6G5ZFBMdBpTF/EQEof5RjYjo+BfJSqr
	 b/GESQ+fvnA7U2wOZm+CzpkqABWZ5dvupMf3HhRtI+twXfWeMxsMmHf2ODhJorqrphb8X
	 XpshGdvstnzCp4DD76YHXY0zoIzlDIeUFvT7NTTp4zxp3Dea9PTK/1yxJh2/jyJGHGLSz
	 13k0YnjyuWT36dZr2VYKaqHKb7LFlcIPgRcwKafcHg97XmJjd4CKTLiUQjZekfcBL5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552872;
	bh=qAAaLjt9YfuPQMZoL9TAtDgmmBN/F6XJppUcwHZNKfg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SKWxOLw8knKMFBUknwkIkNvyesu47xh+UyBwl1WZbS8582XTVE9sCgZe4YnClOEdG
	 G8mIlViwUITvEIY9Arsm4TH//ZfNtD2cubKtObfdN3mGOmbaWlAh9+XG/Ep4fEpV/F
	 SnKqrq6esjpJU8MH2zJVjC+c89Zp6mOJ73AercVkeX37c0VLGi733/+hBDJtVsyURm
	 EbEoKPv70xsKivMzkXHzVCPoqH64FkaCTuYQLYbh7i4dmb0qeNo60JjY4CWJXhth8c
	 HLLj04Dck/f6bnWhwaDdjO5EvOVljtrA3GCBnqruBZ0DKS3CXm/mfWFzHTKrwF/6MQ
	 3PP7UzOIaCW3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E14F80D5B;
	Sun,  1 Nov 2026 17:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF7DEF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E175B80CEE
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jwBhGD9_Hrb for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 29A4280D3E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=mUtCp96Qhqny5Q/0VMF7yfZ2qTNuN5S5d6JfmSeL8hLiX9LDnaGbZyaibstDgvS/RivI
 EJ182GZOMEElUrM0EY/TxMkheI33A8tmDX09XQKtmBXq9Yd6JCsTjex6H5fAg4Icbbx6n
 WJh+bob/8U1WK/EQ+RqdV5/9VOWToi/ztjrXyefxW+Kcb0DMbore4vQ38qWuERsBZRZ/J
 celzDKhdB/P9ERtQvkmIvdUpNhIU3tHQMFw3b+A8vF/FzV8kXuewnA08aOoEex2Oy1yXX
 QnMrqWqv9UUs3ef01rFdJl6jfkRyeiW+hw2K32LYXoitU0gVStN6jTqix2GO9s8wJRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=w832GPxioLpJRRpw6jOMBLUkCi4sgs51vfi7XNz1wmM=;
 b=OxnFBXiix+7DB3VmoYvAiVZDaloTQlcbaj4Qfuj3DYLbB9i5YOE5h4Cn/zwKYjkSSGsq
 5YAiQxzMfg4B5SvW7ARBRa1RdNE32uHJaBaUzs7851d3K6XAkEUti6PGvwXkt4uicLU3D
 pbImyagxH/VJanHNp4/JU2NVLFEkmoBp9EBWmfy8c59mKXtFdJat4q6QDjKAhRYXeMWC3
 OocIPsWc1ndwOACCi4txlon7dJUothD53lFGyPydPAWcTFJb1LW7eG6FKiAMzdwIv4SBV
 u7zco8knQZrU8OGqdO427r29hophj/W7EB35s34MaUE34QSLfyigpoNALvjXU6r7vqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A4280D3E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB20D9D4FA; Sun,  1 Nov 2026 17:05:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c178676f05eed58132199c3efb7c2c260360fc4
X-Git-Newrev: 9eda01d66e508ef21e0ecce758104a5d3fe87db1
X-Patchwork-Hint: ignore
Message-Id: <20261101170549.EB20D9D4FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 17.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9eda01d66e508ef21e0ecce758104a5d3fe87db1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 4ba9d2ce95..87ac397a84 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  1be3342bf865f39fa2db23bbafe1320d  websockets-17.3.tar.gz
-sha256  1c7dd93a1c9f89297471493674b1fc1d9467cafd45374f2172213046bdb3a329  websockets-17.3.tar.gz
+md5  58b9d7046b11916e5ff1ddfe31e54e30  websockets-17.4.tar.gz
+sha256  09d3939b70df0c8ad2da145ebd50978bccaee1d565e838b0e7921a34d38571eb  websockets-17.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 460cf5e70b..7f2bcb1112 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 17.3
+PYTHON_WEBSOCKETS_VERSION = 17.4
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/30/4b/4692be6d5bf739ed049b3813901c42091f8c054df89d5c089343823dea0d
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/75/79/590c5f0cc7d1661195aeefccb0e342b79f4c77d368d526d028821a390332
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
