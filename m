Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052D606EE98
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I+S3ncU4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50D1F60A3B;
	Fri,  6 Nov 2026 16:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqknQElrk8fF; Fri,  6 Nov 2026 16:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34FC56090A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981329;
	b=DNOwFCmXIWnhM7EkAeRXq61DMNqix1FA3RYxYB9iPAeo6FnMahYQV5oAevPesRunA5M9
	 t9h+0jhWIvLDm/aWaqtr+6W1YNDBwAoreP98ObFALnyMyxgQStksVUeHZQ5XRb/yGL4d1
	 BFHHL0rXgvCkdte0alWGcX429JhaUEBhTvQaakgXzLbBsYM7iJHv63vpVhWJRFht/o6RN
	 pLlUUXdcqKYgBiFmRDjrX/GbmJttzHaJJuuF4AgOgvltf1y0SWer+8p0nsMdJF0MqNpms
	 kDqr4njzmZgg0A2zNqiX3QF0rF0UjAylYpXqJY9gQS9kKcyYiu859JP8eYqQY7/W2/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NkD7myEBmb1pjnGmXIDpj9A9BaFvy5du2UpuHHYhShM=;
	b=Q21Qw/jjzq1ZaYMrrvZEUKgtMxQuiOLky3qXYeFWE1fEM2/8ieIEYWyARUcsBZCXfQaE
	 4BI5o7Rxk5lsb4He/hwg/4sia5oVwdlNZ+oaFvCtXZF9OkYbhET2ZiuUaJ29UAJJ55wdi
	 WXHkWH8j5sSLBBmTSccKQozQ7MWwem8SiM4a8dPZH92cbDyuDpYWEqTAwnpQGd8OJGYFc
	 CwvZMmoGrU9WE4qnRotBrHwC+GRCrjlm4oviZFJOZOidHB2OVZZdTH0XvP5O7Lh0x2aNV
	 0o9s65VhpranulVI2mOOew3ho40WtKFlnYTglFqManWcuQ08+yVLmi/whs2lLgMyg7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981329;
	bh=NkD7myEBmb1pjnGmXIDpj9A9BaFvy5du2UpuHHYhShM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I+S3ncU4qgWDTsgECnSS7wF7TSGSNTihZg27l3f1rijVyg+fpZxbhMyte3uRcFZLn
	 rVSKW3BMaOzNvI396z4zi/ugcrUaiFxmOgdmhQcDEBgiYm2AVngytzRzQS5takeN1a
	 DbGZbRjKwW+J7HMPiFEk3AfiyaCJeho67OJ6cbgg5m42gSaDR7CEYoeizSPG0MjlD3
	 5lLpljHYMbWR/4EBlBveDbS1IYcNs0LxQmCN1G3nDQsawexTkoHWYDiO0Xa/xb58jf
	 0BUu7VaLScYbmpkSEip2guyVGDopazx1JX23DeUwaH3fsyeoHuOxp+suU5HWsFHrZ2
	 WgJZdXvisUWSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FC56090A;
	Fri,  6 Nov 2026 16:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEDC22E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0BE7608C8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nb3D4AOZje9W for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 61E7F60890
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61E7F60890
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BAF89E09B; Fri,  6 Nov 2026 16:06:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f4f82e5e6e8a6c3346316c8df0ee1c54672b27c8
X-Git-Newrev: 7edaf226a19d216f662bb23e06f544bcd8a8b609
X-Patchwork-Hint: ignore
Message-Id: <20261106160656.8BAF89E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/grpc: security
 bump version to 1.80.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2164348668312478000=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2164348668312478000==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7edaf226a19d216f662bb23e06f544bcd8a8b609
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This version contains a fix [1] for the eMudhra intermediate CAs [2].

[1] https://github.com/grpc/grpc/commit/d6e310e699d44656167d7f9af8cc1f7208cbaf04
[2] https://emudhra.we-have-a-problem.com/

(alternative to commit 727b904c13bbc2a9a7a530b1f8e47d7d180c2768)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 6329aff00f..729ebd433f 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  38f58596277fa632064cc0719b9ece4381c8c77461cb51e9b66ca149574b7865  grpc-1.80.0.tar.gz
+sha256  96041a694ba3ec445059a95bf2b9c805b6763c255e669a30e1156e8e2ea24fc9  grpc-1.80.1.tar.gz
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 19250d679c..be879d887c 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.80.0
+GRPC_VERSION = 1.80.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE

--===============2164348668312478000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2164348668312478000==--
