Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55485606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vn7NShqL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F5E810B3;
	Sat, 31 Oct 2026 14:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcZM6eZFZMgA; Sat, 31 Oct 2026 14:36:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2EDBB80DCB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793457393;
	b=otgW4jWkowYShUDaiySWb0rQqIk3QxQdfho4inQ/W0IBbnKqyduypy6Heurhp0zlMvT8
	 teZRB2zsUVhH/S4Mk7OoabkyZGhCv7CdSpL4imPYagt+cDpObGlli3LMOxkWp1Ku6qKLH
	 nYiFwi+OEpsINcKhMPcuH99ufesnAZ+qQjhf22K49z8DfDM29fCaiWwRlbjifVzj4Y0WR
	 3ldDu6I4Z2p3KcueHEpD+P4e8Uf5t6ukygsIFeiTI1FU2cmNunhqPNSPSafkzLiOXOhJh
	 n9e+DJVNpoYJ1ntgzglZlx2zeGg41x/3KkeURCiRHCKqdLRP84FiJn3JrSsNldk31wQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793457393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SaZmPs6PpLC5s32OfsiFTjBRts3SnZV5ywTnAXthwI0=;
	b=Sy3FJ0dVIuaY84Mr4qyFJL7Yo+lK4rg/bufCQ+b1EGI8vNXIfzTZjbqrQ3lXmrwggrhQ
	 3AdVf3sz5vpDa0KOvDOxRuU2AJm5gjyPhGwL909Ou7RsPnXJvDCzkgJjF5fRB6g4MJsyC
	 x1e1M2jm2CxENdH3g609S/Lc31GWKFGthKEqRirv24Hwa7i1C8y0gBKWczrU+kVa0SuZK
	 B5B9WhfpSyiD50AFvfAJuKT6Ds2UzT8UhmJf7SWhxBI2v7hCZGTD3oNbyg8tzCzuS+Lqh
	 AXnhvNKC8rCQBBbnjQRTYjflfF74jGCV4Tp5zuW25/ALCsPZ5IgNhy2aqpiXjmI9L+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793457393;
	bh=SaZmPs6PpLC5s32OfsiFTjBRts3SnZV5ywTnAXthwI0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Vn7NShqLncLfM/GJXajQbeMEYWSJtCfK2miUff6tLMCT223Z7Pofjm2YwKK+l0Xvi
	 cfHKf87Wfyp+cQSETigovxCMEw7ObSoDrulrQ9yUJ680HNKOirg1HEpETpcgktBg1p
	 K/gol88d0nCfjUotmc8xkD96D4hmUu9Y6RiIg0fjSclLke7ooWu/5tdcNV2Dy3IRm9
	 OVU5VmR5PCwBL65Quw+OeQNb0bMHxDcsma84fTHhqWGrhFSwr47E3sXF1B9gs/NYwY
	 CZCnbpkoaI6sRmuB6u7h20QjLDFt3D1oyUU8rwvyW+pwI32JJUxaGHCFbvFRateU3R
	 6VNkdCxi/J9lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDBB80DCB;
	Sat, 31 Oct 2026 14:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4ED380
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0C4E40AA9
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TMi2ISw6mVY for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 14:36:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6622640AE3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793457390;
 b=Q1uojOWcZxrnaMRLZfsLvUrk7ZgJQTE8Pgy01wDBOp1+OPaqF+iJskM340GGvVHBqj0h
 7MHYbNAJIg/r1BxaVSD7INexMCsSvdrq3mpLHw11JTtfbJskpPu9BAFn7lwsX4YwvShOq
 K/S0G/HvtfPJDg1wqjkVawRJgjvdjiPcJ9l2clkdtR6By39eNPVXworzuDkj5Ix9TXwEW
 W6hYS5y3TIH1fkzsMGqD4frx4rfpUfzy1bNKmST3JA5VDs7Z9ryVrzk+afRTNXctvk+kA
 E0rdaNqWY9kCv0HS9n8IbM+0OgMzQD64P6d/a3VICgeRU4o4/0E5XIOah7/yEnR3ysg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793457390;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=jBXQTL95ufuRXtaGrzp8NKhXG23ulcmWxWg56vxIYns=;
 b=AYWq0n4uxwtOqI482Y/kBGvmp9YTcHQb1B+5uwhDeIDFl8Wy90Fq1IXFuPBrWmIrc8R8
 8DpxiFyYJ6E3TdZZ+BNYPY4Y3BfyrUgbTU04XI5HQ+H/QXCANJzN2RQs0yoGY2zDa16sR
 ctRo7Q8oVHEqVu6I3ufPDLFCZcG8JwPJR8OHQ+cu6PaO7uUrvoOuW5ucwGBFwXgIflyKo
 CmqPo6ealN9w1kShBYGs5RJhAD3CkxWKqGjrUeK73VitcPxa2y2Q7Brubft1wan8xcT/1
 BMcNC7S7F17hkR6IAlpp4d/ZA3acJ+dFG4+NEvu3j2igPKuUYudgVVAlQpDbr6KRtNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N5T6xTgI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6622640AE3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 14:36:29 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c4395d31228so243938966b.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793457387; x=1794062187;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jBXQTL95ufuRXtaGrzp8NKhXG23ulcmWxWg56vxIYns=;
 b=Zun6mDlkaEAd4x7zdl6h5LZY/7j6cM7/qeYrNsK7+2FMXyIqh2Cd9AAlj7is3Ottxc
 jhp0+UKJMcU4QZpc32zCBsEBnmQeRrZqhXqdiSB6RXWKWQGFNp6oQ/gtB5HWeDWAH2k3
 wuqU5XT/sqWRkH/Zrmn3JPgn10hSgGQtvtME1DuyjZS9ozyU71ocU2+pet0HPnpkiSFo
 g7378A4oQ2+OE+zYzq4v0rTfcVLW+kTCAL5NxmwrCs/PN9iOnumU2cdNgQui8Sp+nJcf
 R/0eVY+tCidzVcYACC7A0jENe6u/z8bDX6BXkBPXObFpnqXdYOLt9G8o8QtH4Ybfb1S8
 8g0A==
X-Gm-Message-State: AFq9FYLp0/NW70xSJr8ZtVBVnR3RabD9pcNR73dZ+6vMN61U4wLDsO/9
 4IctKoNP/bPMwfxnmeOFX8wVLIxYVFCUwFMpvjpoHkP6bR+cQ1vN+s7Xy7+rQH1eMOF27BCljbA
 0+4HX
X-Gm-Gg: AYBFou2PzuGGX0+vJWQtcEs+GWzwxDBOsq2Q9Y5Xgyvduzq7FUfTFho61qC7YcQTyuL
 AZwsMX8da7sGTGx8kRcVxN+eoOmSbblWdVUkdqty98l9MDptLmH733K6dhvdP1f8ehFLoX6f4F2
 mzZX/ahSV0eeyAlPtGNseLKLCli78X3jqCdBylUtlp1UQbTmBERSSYr6shibMH77JwzI2PQftsQ
 F+DC0nYkLLZe6v4VN7XVs8l734VBV67Db7tb/s+knNesK/6YEWyXHlI50Ak1/mSdplE40IVrVTq
 GeJfqvPbwwskSNakOQKzPfWBIkfnD1M6pFJi6vKrEdsH4cNNuG+AkpR3+4x9U9xQVjmOeZ1h2fq
 +ke/FsRd2ksbO30s0ajjIwpNjsEgdEiqwpjaQPLpgXeiBBmQj/uxWOubt590u2tJx0R1AMTCh+7
 tTwLKzTG0bGtbbbIuqCuGDN+Kb9x3lS2Kg5vnTD57E1FtgqDjbccjZXjQ0VpXrSTRn1pXOQpHNJ
 pCj0nUX8z+5jtmQWYVHfHsb5ucVbATXN+EMJl0+ZDcuc0rbE+TmXSkpLHdgmJp0jZ8EV6XISSYL
 zqOI7GXbtjGmBz/yllIxfLtzO3ziqh7fIfVVGQsg1bs=
X-Received: by 2002:a17:907:1c90:b0:c42:2d07:4c38 with SMTP id
 a640c23a62f3a-c4ca7a4f427mr491381966b.26.1793457387365; 
 Sat, 31 Oct 2026 07:36:27 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4ec9fc7b8sm1064053a12.16.2026.10.31.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:36:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 31 Oct 2026 15:36:26 +0100
Message-ID: <20261031143626.1831225-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/libselinux: fix python
 bindings with pip 25.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the pip bump to 25.3 on 2025.02.x [1], the build of the Python
bindings of libselinux is broken for both the host and target variants.

This can be reproduced with the following defconfig:

```
BR2_aarch64=y
BR2_cortex_a72=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_LIBSELINUX=y
```

This has already been fixed on the master branch with Buildroot commit
[2].
At the time this commit has been cherry-picked on 2025.02.x [3] and
later reverted has pip version 25.3 was not present at the time on
2025.02.x [4].

This commit cherrypick and backport again the fix present on master to
fix libselinux build.

[1] 6615c3ad30 package/python-pip: bumpp version to 25.3
[2] 0e5eef911c package/libselinux: allow pip to use system-provided packages
[3] 32d1d7c367104d23cc9eec2762a7e543afdafd9e
[4] ae7e57a9622474534f5e67af7750c1b0ccb9ff4f

Fixes: 6615c3ad30 package/python-pip: bumpp version to 25.3
Fixes: https://autobuild.buildroot.org/results/6b893f3b01c51079af618e43893c6f46ec866378
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(alternative to commit 0e5eef911c9b313fddd9912128bf09d605b5f6ae)
---
 ...akefile-build-python-module-without-.patch | 52 +++++++++++++++++++
 package/libselinux/libselinux.mk              |  4 ++
 2 files changed, 56 insertions(+)
 create mode 100644 package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch

diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
new file mode 100644
index 0000000000..9ca87f0b49
--- /dev/null
+++ b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
@@ -0,0 +1,52 @@
+From 17a9372391ad2c9bf0e440391d6fd13cb8cfdaf3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Sat, 27 Dec 2025 15:39:11 +0100
+Subject: [PATCH] libselinux/src/Makefile: build python module without
+ isolation
+
+The "pip install" logic in libselinux/src/Makefile tries to get
+setuptools from the network, which is not correct as during the
+build/installation, there shouldn't be any network access, or
+downloading of arbitrary resources from the network.
+
+This causes build issues in Debian:
+
+  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
+
+And in Buildroot:
+
+  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
+
+To fix this, we use the --no-build-isolation pip install argument so
+that pip install is allowed to use the system-provided setuptools,
+instead of wanting to download this one.
+
+This patch is derived from
+https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
+with the change that --no-build-isolation is passed unconditionally,
+regardless of whether $(DESTDIR) is empty or not.
+
+Acked-by: James Carter <jwcart2@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/SELinuxProject/selinux/commit/17a9372391ad2c9bf0e440391d6fd13cb8cfdaf3
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index e9141bb9..9bc10606 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -190,7 +190,7 @@
+ 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+ 
+ install-pywrap: pywrap
+-	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
++	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+ 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
+ 
+-- 
+2.52.0
+
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 360ab063ca..7bc33392d5 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -35,8 +35,12 @@ LIBSELINUX_DEPENDENCIES += \
 	python3 \
 	python-setuptools \
 	host-python-pip \
+	host-python-setuptools \
 	host-swig
 
+LIBSELINUX_MAKE_ENV += \
+	$(PKG_PYTHON_SETUPTOOLS_ENV)
+
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_SETUPTOOLS_ENV) \
 	PYTHON=python$(PYTHON3_VERSION_MAJOR)
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
