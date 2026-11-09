Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F3606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cz1jJarl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E7740787;
	Mon,  9 Nov 2026 16:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yEKyrwa_Ic1; Mon,  9 Nov 2026 16:19:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CAEEE40763
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794241197;
	b=T4tXcAGXqdKrBb+INPCM1GrYioO6UKUvrWflnyuAO7xVfPV+NuFsY37TVCxAIhxglWMY
	 d2S4bi857wTmkzeRKhGV/HR9YVauX8WlbKY4PCwJbCyXk6Imw9oEFMhIdwC6wvWgRlj1B
	 IHpYl9vZpPpcuN1A6vUwCkCABw0BwrrfX8lB9c/7cjebkTBMeL4N1Am+Wx1xe01lRJfy3
	 JUwXMugZEJ/b6z1KY14kc0OGRPCSIAStSbd6xJ5EXd6e1Fm0dw3ajnczbg10aAEwOiY+d
	 3cTRXTYXTquV1rrDMZ3WCeTqR56m4TeP53kvZ2QqMZwld5uEiBb837LlFzQostqmaWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794241197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0seQvQb0jbEN6ol/HcYS4XLVdYBwm5Kk9Y3QqXPaSwg=;
	b=P79pp/GasZfyjSohK3YFf3o28GjyClKIC5Su4tX7d1ezLypVpOLEm2v0iKZ2rl6fPVno
	 Lf0H7i171IHNf2/0wpAg5pFb8ZRaOATSQHF2xctSi9V+D7ga4hNpH1iWKO9oqbhsW3nLF
	 8Pew+cNi4QsrL9jbhbNeBT5G0Yi08eDiO6Tj4kuPT9xDXw7fsk9qV6Sf0DkdeQS8XPLKq
	 CehUfXcplrb0r9O6QlWVsY8JdS8DUwfHjifk25MFpZCN+D6gx41Zbfxx/BvAJxUBa3kBn
	 B215/UztMyOMdte23N4OrK/v+2Tf/CObBFrfyTvwa1FpUQ9+fMse/JrgpY7HB72f2kA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794241196;
	bh=0seQvQb0jbEN6ol/HcYS4XLVdYBwm5Kk9Y3QqXPaSwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cz1jJarl7HDdZe+dB45DDP1pwd7kCDoP63w+hloGR6ibZ42yccdT6GvNRl15lK/VZ
	 M/VQn23TpO706keeQzFVs6KOgcOT//1/sFA8qGP5AJyeu764hM7hQpNjcW0dJtlLwx
	 JcyAEBJzNkX/vVo0Idi7o4E7J4auHGPLr1Ry5msW2Woyx7UCWQbyqrJHkap3NxRsGo
	 YsBVCQVJIZP2b+MGOnbsQ8yw8WEvjVZmywcKRHVgEs5QNR1MutfNTfhS189xMBjA6Z
	 yNi7LoE/UoCh+IibYximyqXB0voqbm3EImkADq6rkRbq56MnnO9uii8arjPDq5bG21
	 E1BCfxxWzkWSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAEEE40763;
	Mon,  9 Nov 2026 16:19:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA89E1E3
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 16:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABF3B4077E
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 16:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwEhB6QlMq0I for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 16:19:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3C8984075C
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C8984075C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 16:19:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so11789325e9.3
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 08:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794241191; x=1794845991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1q3C8GME+gaD+uXrZr4B0gYVUVdkEWYn/Pza/H7HnAk=;
 b=hghOUfv5wqt7TEV/w7A9xEhKo0PAXxw2sS+Iu1HpUkOrbchUtIEUoRm4M/3794KwYi
 THWcTde/M5tAk5/iE9f+G/HRoqc85JWI3Lyxvvpn1Er51nhQIUWXJuOk74VIDTIVplWs
 n9mSDq0dNyuYYffiR+ypwbM9rroJNTuoZaB5VWyEpiORND9yfL6tYQXxeOQvNYrJJUqy
 rQM2mPo5CQLkHMlhHzkRd5hOCRfdkNZbQMqO3JfSYbBrSgQBm0LdQDgRCq5YE6A/HFY1
 ++S2z0zLTIfkxJoayIi//UmuKgKq8yVpGvhUOlBby/ySOjqZwTLi1cqocDgUq2WjWhtY
 sC0Q==
X-Gm-Message-State: APuU4Z87hPBCN6fxKfAnevFV1wOrHqMuQiYM/lIvZH5oKrI4NzV1A4It
 bgja1XGygcF6ELQfbPxYEYkWpLKZddY5wAwMd9/oHCMNJz+OWAtyPn6JlbxO49ULeDLd/dCFPCE
 ckDcH
X-Gm-Gg: AYBFou3n11PKNxdXg+B5l4edwNf4DFgt5EhQYxQCN09PwO1NnxKtB6mefZTm9I58AdC
 hZVxxiMl+Uba5qGX9metslK07hSCmrWsGGyLNTbrxXX5t1AOiidiBDElmi1cKUW6qAv7gHSl2Fi
 p43GeygueRgdyLhbztfrFozhJppnBRfcW8yZsUKmEdecSWp6/4XVUeayzDm7z0ce1O+4VQqoC2x
 G95Cq98feuhkjksdbq00WsZ0NoEuFl01So0rfmstJrrhQumvvmW+PPCjt+I8j7kXeS+Wfb0n/FB
 zZDSAASUyTFsMUcrwJBKU6tcYYmiYqGQcg1fVRBVXNBUJ4vqmjOnq/Khxww5itW8wlw9O0wPYYR
 m1wLrQH4bKmSLGh6/OOCRNVtSU/73zl6wM/IejyRyEFKhh6aOIki9qMmERR7jeh5arSWOmjiVJT
 GS2WDE/KbJa9iLVjtvIqbsK9676xDqT3bM7WRLJWd0BHLmImsgbpM1jfCmBFBjH75HsszGz0J+h
 L4SSjKmVQEk9IL5SG3aEcyRYmj5xCj5TnuX3K6Euj4Jj5i8kSfKXaz3WmKdNLnafQsMw0WTO6au
 f9aBAbafoMyIPhTmR/YCow==
X-Received: by 2002:a05:600c:8712:b0:4b3:6900:280c with SMTP id
 5b1f17b1804b1-4b963c7d013mr84587325e9.19.1794241191500; 
 Mon, 09 Nov 2026 08:19:51 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb0b0c2sm220333135e9.8.2026.11.09.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 08:19:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 17:19:48 +0100
Message-ID: <20261109161949.714131-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/2] package/python-django: fix build
 with older setuptools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit [1] bumped python-django package to its latest LTS
version. This included the following upstream commit [2] which bumped
the minimum setuptools version and broke the build on LTS.

[1] 8c1e897d56 package/python-django: security bump to v5.2.18
[2] https://github.com/django/django/commit/cd5ad8c81bf221868e3c33d90d6e021d067829b4

Fixes: https://autobuild.buildroot.org/results/4ee/4ee28d52c1ea8883b8c66c899322a0c6f5d3fe83
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ped-minimum-setuptools-version-to-83.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch

diff --git a/package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch b/package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch
new file mode 100644
index 0000000000..e26b8d904c
--- /dev/null
+++ b/package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch
@@ -0,0 +1,28 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Mon, 9 Nov 2026 12:00:00 +0100
+Subject: [PATCH] Revert "[5.2.x] Bumped minimum setuptools version to 83."
+
+This reverts upstream commit cd5ad8c81bf221868e3c33d90d6e021d067829b4.
+
+Buildroot provides an older setuptools version and no Django code depends
+setuptools 83 feature.
+
+See https://autobuild.buildroot.org/results/4ee/4ee28d52c1ea8883b8c66c899322a0c6f5d3fe83/build-end.log
+
+Upstream: N/A
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=83"]
++requires = ["setuptools>=77.0.3"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
