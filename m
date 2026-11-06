Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B70606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V7zZP2gC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FE3608BE;
	Fri,  6 Nov 2026 15:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULIsMpnNgifU; Fri,  6 Nov 2026 15:59:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87D7B608CD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980776;
	b=Lg7OtpLJNSOORi7I4IBrtTF5LqMNAyQOy7axlXpoB3Tdh0+LEfTFXfto8rzxlwMhzLQ/
	 vkfU4L8u5/UqLCs5owET/qP/9D6ShXvJ99OkItQrDjqBW1MXcLF2nn9xmFTwwYxq53awR
	 IfE/R2DeY4jxEYbCRGkjCu3BQZVhV1nE+KwxAdApkTn3AxEFxy5WMDpKo1cc6FJoeqZ/F
	 KifbL3Bm2yEkpcMyyEOSPxY68gnPJEAnNwyuQ+XrP8NSSRn9tBYmBFsZ5hb07bnwcRPFv
	 5jF6eQXo4zF0v0Gc9MhUFNv9GU6kmthLLhxoDJUhS9Iz+0vOlhoATDLD3PqCbSPSK7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980776;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=CQyK4M6TeHhfGNu4JcwjLonFeOTBpR2qfIa90cVNqiQ=;
	b=C+dMlVfd/L0oqdD1MXTlkc172qEUDB8waoRNs6foo4E9MUCL6z55lpes2kAJEruzE/Xp
	 IENdiQVZ/4WikWk/ozmEwL3xA9Tq3PfZbE4OITVYboDSzpUNoMYbpceuf7JZuHJHUt60r
	 IaDZF1FXra0M29R5nCO1WWRfSXKauFmU5znAgiWSRqEMaW2NIFhFMBvALpF5Htfhb3Mv5
	 i3PIHtpqe5adE0CB+scSTEnWo5ClUQqXXH/m3IJmPFMyH6S78N7/nNDs7ESD8A2zLe85z
	 021Dj8RjIdH+AqpUarqgbg8AGDlk7hFFq85rORWpJenceLfLp5/KFxjKk+vmfI6ovig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980776;
	bh=CQyK4M6TeHhfGNu4JcwjLonFeOTBpR2qfIa90cVNqiQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V7zZP2gCGZFEUSHEeLIe3mC7sOF3Gibrvg1l/GT2vIxE704zPqjBG0/je5CDi9qDH
	 ddwfCpKdtXp8hBw0bFTrzPENtGidM4s+J1a/Wkyjv3lhERg3APAJBpFYOTMbG5BbNc
	 cEu152woLNKuA9pz66+8DZb8xwCCXQU/Kh08xIZfXExfY7oHNyYPbauAcr8v16ifAf
	 xwqZTx9QYNZS+aNxDijqg3egyBI9nP4y6WA5cc/EN94KG5LJCXean6GPBoZUu7W0zy
	 qoICvm71szDKy0I/+zztx+W2io2GV2BFoQHoyTNCxqgaalde/xJ1OAot8ifjSmC90I
	 jhgnL1C/5IL9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D7B608CD;
	Fri,  6 Nov 2026 15:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F24F32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F2D408FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1f3Pr255ftn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5F42B40921
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F42B40921
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 971E29E0A8; Fri,  6 Nov 2026 15:56:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 09:05:09 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 51628caed763d102508497c981b29fbaefdb507d
X-Git-Newrev: 6574d3a92a42b1e68f922002439495c280e09d11
X-Patchwork-Hint: ignore
Message-Id: <20261106155657.971E29E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libselinux: fix
 python bindings with pip 25.3
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
Content-Type: multipart/mixed; boundary="===============2038792294433744336=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2038792294433744336==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6574d3a92a42b1e68f922002439495c280e09d11
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...src-Makefile-build-python-module-without-.patch | 52 ++++++++++++++++++++++
 package/libselinux/libselinux.mk                   |  4 ++
 2 files changed, 56 insertions(+)

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

--===============2038792294433744336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2038792294433744336==--
