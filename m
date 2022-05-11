Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B7BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 00:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752214181E;
	Wed, 11 May 2022 00:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cft_9QMILney; Wed, 11 May 2022 00:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A321417C2;
	Wed, 11 May 2022 00:41:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23A1D1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2043060AD8
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKTwg9YZpSIL for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 00:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B64260AAD
 for <buildroot@buildroot.org>; Wed, 11 May 2022 00:41:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w19so836967lfu.11
 for <buildroot@buildroot.org>; Tue, 10 May 2022 17:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HLYftYX4Ad6LQpphqvzZNnFhn9Jl1cRA0u9D8BcqnPA=;
 b=Z3RN/5XgeBOGswqU4eN+6sRPQcSj4QHFE2gnd5jcCWibQI86i5FOy0nx3tQfPDSX9t
 WAcn8o915KVWaCThNatUrGWi+pZpJso+dpDQbkJ+BB1WPdqANjF3DU1zwtt6qUISojMS
 C6toKnOAdz/0ikFlZD0a/O6/stJhsokzkyIW91DaZRr95V4CPlChnswvRXlh6zGeeIE/
 CDIjdhGKC0h6Pt1+s41d2iO3vTyP/x+veFEc+qta5MB5D70Kfx85f7WJn8WS8R4odz48
 VYQS+tdAAR6i7s4IxsWxW6pA36FYK6sqsmIWAqFLFdL5acFH6NcIyTsCL9dRUYIqaP/O
 cHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLYftYX4Ad6LQpphqvzZNnFhn9Jl1cRA0u9D8BcqnPA=;
 b=qWuxyxoNGVLadyQP992smnwkE896qrefGizXdvwAXzcN62myQcKxYY3YDJzLLBNIT1
 KKrqh3c2gmygh/G8uis37eIgyGxLjKbnAcjS7Ta5YcWqmSBPH8Is/k8SIwAjm9V0pTQS
 KgtgAMWWlq+elXycp2eRmh9Y38DtqxCN3c5mbxvRzP0LYuDo/uxwOPSZ4NscOFZPS+nR
 zbKnPsnlEF4Kt1XDmNptqrKbqWeexhPhGQnM7VBWKDnS3gL6oukmIBBzxvCEKfMIjloF
 8tKyCxaDM4SK87jWfCrdf4gNGl7+/LI7d9rarZuRihQZ3ucGlg5AOLcxYOcwS8ed3dD4
 7nGg==
X-Gm-Message-State: AOAM5336pvfn+SAfGsyVNtN7aSOQw6Ovt7o6p3NaSKGlcQ58dqpOe/zE
 /AOQ4xMXcNrIJAm5NwIYEhsXFtEm1FLtTQ==
X-Google-Smtp-Source: ABdhPJzQyFhL16aWs0u3C8FSIIaCJ+DBqB06NgCmfsoEweTT9oq3J4FA0VN9k/BhEPa3AuklwJ5JUw==
X-Received: by 2002:a05:6512:2296:b0:473:cf55:5acd with SMTP id
 f22-20020a056512229600b00473cf555acdmr17998422lfu.255.1652229695815; 
 Tue, 10 May 2022 17:41:35 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 k3-20020ac257c3000000b0047255d211desm52064lfo.269.2022.05.10.17.41.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 17:41:35 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id j4so863061lfh.8
 for <buildroot@buildroot.org>; Tue, 10 May 2022 17:41:34 -0700 (PDT)
X-Received: by 2002:a05:6512:2244:b0:473:aa9d:8ae1 with SMTP id
 i4-20020a056512224400b00473aa9d8ae1mr18567788lfu.317.1652229694567; Tue, 10
 May 2022 17:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220511004007.3630-1-christian@paral.in>
 <20220511004007.3630-2-christian@paral.in>
In-Reply-To: <20220511004007.3630-2-christian@paral.in>
Date: Tue, 10 May 2022 17:41:23 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ra5_zrGCAw9G4U7n9P9bH9UXLs0EXjef9V8QEaTL1K4w@mail.gmail.com>
Message-ID: <CA+h8R2ra5_zrGCAw9G4U7n9P9bH9UXLs0EXjef9V8QEaTL1K4w@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: add support for riscv64
 architecture
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6803935614119338545=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6803935614119338545==
Content-Type: multipart/alternative; boundary="000000000000083bcb05deb1b45f"

--000000000000083bcb05deb1b45f
Content-Type: text/plain; charset="UTF-8"

All,

I'll send a V3, this patch was in my "outgoing" folder & was double-sent
accidentally.

Apologies for the double-send...

Best regards,
Christian Stewart

On Tue, May 10, 2022 at 5:40 PM Christian Stewart <christian@paral.in>
wrote:

> Enable the supported "riscv64" GOARCH.
>
> Add a patch to fix a build failure due to GOARCH leaking into the calls to
> the
> go-bootstrap compiler. Unsets the GOARCH before calling go-bootstrap.
>
> PR: https://github.com/golang/go/pull/52362
>
> Signed-off-by: Christian Stewart <christian@paral.in>
>
> ---
>
> v1 -> v2:
>
>  - fixed build error with go-bootstrap
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...explicit-option-for-crosscompilation.patch |   8 +-
>  ...set-environment-before-generating-bu.patch | 111 ++++++++++++++++++
>  package/go/Config.in.host                     |   2 +-
>  package/go/go.mk                              |   2 +
>  4 files changed, 118 insertions(+), 5 deletions(-)
>  create mode 100644
> package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
>
> diff --git
> a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> index f76c5b1d03..a32a6ee355 100644
> --- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> +++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
> @@ -1,4 +1,4 @@
> -From e1382a731a726293e30901038c6870fa77ef6095 Mon Sep 17 00:00:00 2001
> +From 86fa3da18b5c73cc84dec91d92db4ae95f288bdc Mon Sep 17 00:00:00 2001
>  From: Angelo Compagnucci <angelo@amarulasolutions.com>
>  Date: Tue, 8 May 2018 16:08:44 +0200
>  Subject: [PATCH] build.go: explicit option for crosscompilation
> @@ -17,10 +17,10 @@ Signed-off-by: Anisse Astier <anisse@astier.eu>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> -index 99d1db5..eb4097f 100644
> +index d37c3f83ef..d838485bd3 100644
>  --- a/src/cmd/dist/build.go
>  +++ b/src/cmd/dist/build.go
> -@@ -252,12 +252,13 @@ func xinit() {
> +@@ -273,12 +273,13 @@ func xinit() {
>   // $CC_FOR_goos_goarch, if set, applies only to goos/goarch.
>   func compilerEnv(envName, def string) map[string]string {
>         m := map[string]string{"": def}
> @@ -36,5 +36,5 @@ index 99d1db5..eb4097f 100644
>                 }
>                 m[""] = env
>  --
> -2.7.4
> +2.35.1
>
> diff --git
> a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> new file mode 100644
> index 0000000000..44b3fbecc2
> --- /dev/null
> +++
> b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> @@ -0,0 +1,111 @@
> +From 00f3f4ee0d477779c87e4e60b08708362670e122 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Thu, 14 Apr 2022 13:34:26 -0700
> +Subject: [PATCH] build: bootstrap: set environment before generating
> buildcfg
> +
> +The GOOS and GOARCH environment variables should be unset before calling
> +mkbuildcfg. This change fixes a build failure when GOARCH=riscv64.
> +
> +Building Go toolchain1 using go-1.4-bootstrap-20171003.
> +src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
> +invalid operation: y << x (shift count type int64, must be unsigned
> integer)
> +
> +There is a build issue with go1.4 with the riscv64 code: however, why is
> the
> +riscv64 code being compiled at all?
> +
> +GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile
> riscv64.
> +---
> + src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------
> + 1 file changed, 29 insertions(+), 27 deletions(-)
> +
> +diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
> +index 036f8c52fa..73f6524969 100644
> +--- a/src/cmd/dist/buildtool.go
> ++++ b/src/cmd/dist/buildtool.go
> +@@ -112,9 +112,6 @@ func bootstrapBuildTools() {
> +       }
> +       xprintf("Building Go toolchain1 using %s.\n", goroot_bootstrap)
> +
> +-      mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
> +-      mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
> +-
> +       // Use $GOROOT/pkg/bootstrap as the bootstrap workspace root.
> +       // We use a subdirectory of $GOROOT/pkg because that's the
> +       // space within $GOROOT where we store all generated objects.
> +@@ -126,6 +123,34 @@ func bootstrapBuildTools() {
> +       base := pathf("%s/src/bootstrap", workspace)
> +       xmkdirall(base)
> +
> ++      // Set up environment for invoking Go 1.4 go command.
> ++      // GOROOT points at Go 1.4 GOROOT,
> ++      // GOPATH points at our bootstrap workspace,
> ++      // GOBIN is empty, so that binaries are installed to GOPATH/bin,
> ++      // and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
> ++      // so that Go 1.4 builds whatever kind of binary it knows how to
> build.
> ++      // Restore GOROOT, GOPATH, and GOBIN when done.
> ++      // Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
> ++      // because setup will take care of those when bootstrapBuildTools
> returns.
> ++
> ++      defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
> ++      os.Setenv("GOROOT", goroot_bootstrap)
> ++
> ++      defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
> ++      os.Setenv("GOPATH", workspace)
> ++
> ++      defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
> ++      os.Setenv("GOBIN", "")
> ++
> ++      os.Setenv("GOOS", "")
> ++      os.Setenv("GOHOSTOS", "")
> ++      os.Setenv("GOARCH", "")
> ++      os.Setenv("GOHOSTARCH", "")
> ++
> ++      // Create the build config files.
> ++      mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
> ++      mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
> ++
> +       // Copy source code into $GOROOT/pkg/bootstrap and rewrite import
> paths.
> +       writefile("module bootstrap\n", pathf("%s/%s", base, "go.mod"), 0)
> +       for _, dir := range bootstrapDirs {
> +@@ -172,30 +197,6 @@ func bootstrapBuildTools() {
> +               })
> +       }
> +
> +-      // Set up environment for invoking Go 1.4 go command.
> +-      // GOROOT points at Go 1.4 GOROOT,
> +-      // GOPATH points at our bootstrap workspace,
> +-      // GOBIN is empty, so that binaries are installed to GOPATH/bin,
> +-      // and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
> +-      // so that Go 1.4 builds whatever kind of binary it knows how to
> build.
> +-      // Restore GOROOT, GOPATH, and GOBIN when done.
> +-      // Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
> +-      // because setup will take care of those when bootstrapBuildTools
> returns.
> +-
> +-      defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
> +-      os.Setenv("GOROOT", goroot_bootstrap)
> +-
> +-      defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
> +-      os.Setenv("GOPATH", workspace)
> +-
> +-      defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
> +-      os.Setenv("GOBIN", "")
> +-
> +-      os.Setenv("GOOS", "")
> +-      os.Setenv("GOHOSTOS", "")
> +-      os.Setenv("GOARCH", "")
> +-      os.Setenv("GOHOSTARCH", "")
> +-
> +       // Run Go 1.4 to build binaries. Use -gcflags=-l to disable
> inlining to
> +       // workaround bugs in Go 1.4's compiler. See discussion thread:
> +       //
> https://groups.google.com/d/msg/golang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ
> +@@ -217,6 +218,7 @@ func bootstrapBuildTools() {
> +               cmd = append(cmd, "-toolexec="+tool)
> +       }
> +       cmd = append(cmd, "bootstrap/cmd/...")
> ++
> +       run(base, ShowOutput|CheckExit, cmd...)
> +
> +       // Copy binaries into tool binary directory.
> +--
> +2.35.1
> +
> diff --git a/package/go/Config.in.host b/package/go/Config.in.host
> index e82ab6e81a..8be86103ea 100644
> --- a/package/go/Config.in.host
> +++ b/package/go/Config.in.host
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>         depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
>         depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
>                 || BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
> -               || BR2_mips64 || BR2_mips64el || BR2_s390x
> +               || BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
>         depends on !BR2_ARM_CPU_ARMV4
>         # MIPS R6 support in Go has not yet been developed.
>         depends on !BR2_MIPS_CPU_MIPS64R6
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 3df16c9a68..ba0da74b86 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -63,6 +63,8 @@ else ifeq ($(BR2_mips64),y)
>  GO_GOARCH = mips64
>  else ifeq ($(BR2_mips64el),y)
>  GO_GOARCH = mips64le
> +else ifeq ($(BR2_riscv),y)
> +GO_GOARCH = riscv64
>  else ifeq ($(BR2_s390x),y)
>  GO_GOARCH = s390x
>  endif
> --
> 2.35.1
>
>

--000000000000083bcb05deb1b45f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All,</div><div><br></div><div>I&#39;ll send a V3, thi=
s patch was in my &quot;outgoing&quot; folder &amp; was double-sent acciden=
tally.</div><div><br></div><div>Apologies for the double-send...<br></div><=
div><br></div><div>Best regards,</div><div>Christian Stewart<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, May 10, 2022 at 5:40 PM Christian Stewart &lt;<a href=3D"mailto:christia=
n@paral.in">christian@paral.in</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Enable the supported &quot;riscv64&quot; GOAR=
CH.<br>
<br>
Add a patch to fix a build failure due to GOARCH leaking into the calls to =
the<br>
go-bootstrap compiler. Unsets the GOARCH before calling go-bootstrap.<br>
<br>
PR: <a href=3D"https://github.com/golang/go/pull/52362" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/golang/go/pull/52362</a><br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
<br>
---<br>
<br>
v1 -&gt; v2:<br>
<br>
=C2=A0- fixed build error with go-bootstrap<br>
<br>
Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" =
target=3D"_blank">christian@paral.in</a>&gt;<br>
---<br>
=C2=A0...explicit-option-for-crosscompilation.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0...set-environment-before-generating-bu.patch | 111 +++++++++++++++++=
+<br>
=C2=A0package/go/Config.in.host=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0package/go/<a href=3D"http://go.mk" rel=3D"noreferrer" target=3D"_bla=
nk">go.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A04 files changed, 118 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 package/go/0002-build-bootstrap-set-environment-be=
fore-generating-bu.patch<br>
<br>
diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.=
patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch=
<br>
index f76c5b1d03..a32a6ee355 100644<br>
--- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch<b=
r>
+++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch<b=
r>
@@ -1,4 +1,4 @@<br>
-From e1382a731a726293e30901038c6870fa77ef6095 Mon Sep 17 00:00:00 2001<br>
+From 86fa3da18b5c73cc84dec91d92db4ae95f288bdc Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolution=
s.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
=C2=A0Date: Tue, 8 May 2018 16:08:44 +0200<br>
=C2=A0Subject: [PATCH] build.go: explicit option for crosscompilation<br>
@@ -17,10 +17,10 @@ Signed-off-by: Anisse Astier &lt;<a href=3D"mailto:anis=
se@astier.eu" target=3D"_blank">anisse@astier.eu</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
-index 99d1db5..eb4097f 100644<br>
+index d37c3f83ef..d838485bd3 100644<br>
=C2=A0--- a/src/cmd/dist/build.go<br>
=C2=A0+++ b/src/cmd/dist/build.go<br>
-@@ -252,12 +252,13 @@ func xinit() {<br>
+@@ -273,12 +273,13 @@ func xinit() {<br>
=C2=A0 // $CC_FOR_goos_goarch, if set, applies only to goos/goarch.<br>
=C2=A0 func compilerEnv(envName, def string) map[string]string {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 m :=3D map[string]string{&quot;&quot;: def}<br>
@@ -36,5 +36,5 @@ index 99d1db5..eb4097f 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m[&quot;&quot;] =3D=
 env<br>
=C2=A0-- <br>
-2.7.4<br>
+2.35.1<br>
<br>
diff --git a/package/go/0002-build-bootstrap-set-environment-before-generat=
ing-bu.patch b/package/go/0002-build-bootstrap-set-environment-before-gener=
ating-bu.patch<br>
new file mode 100644<br>
index 0000000000..44b3fbecc2<br>
--- /dev/null<br>
+++ b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.=
patch<br>
@@ -0,0 +1,111 @@<br>
+From 00f3f4ee0d477779c87e4e60b08708362670e122 Mon Sep 17 00:00:00 2001<br>
+From: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=
=3D"_blank">christian@paral.in</a>&gt;<br>
+Date: Thu, 14 Apr 2022 13:34:26 -0700<br>
+Subject: [PATCH] build: bootstrap: set environment before generating build=
cfg<br>
+<br>
+The GOOS and GOARCH environment variables should be unset before calling<b=
r>
+mkbuildcfg. This change fixes a build failure when GOARCH=3Driscv64.<br>
+<br>
+Building Go toolchain1 using go-1.4-bootstrap-20171003.<br>
+src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814<br>
+invalid operation: y &lt;&lt; x (shift count type int64, must be unsigned =
integer)<br>
+<br>
+There is a build issue with go1.4 with the riscv64 code: however, why is t=
he<br>
+riscv64 code being compiled at all?<br>
+<br>
+GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv=
64.<br>
+---<br>
+ src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------<br=
>
+ 1 file changed, 29 insertions(+), 27 deletions(-)<br>
+<br>
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go<br>
+index 036f8c52fa..73f6524969 100644<br>
+--- a/src/cmd/dist/buildtool.go<br>
++++ b/src/cmd/dist/buildtool.go<br>
+@@ -112,9 +112,6 @@ func bootstrapBuildTools() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;Building Go toolchain1 using %s.\=
n&quot;, goroot_bootstrap)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 mkbuildcfg(pathf(&quot;%s/src/internal/buildcfg/zboo=
tstrap.go&quot;, goroot))<br>
+-=C2=A0 =C2=A0 =C2=A0 mkobjabi(pathf(&quot;%s/src/cmd/internal/objabi/zboo=
tstrap.go&quot;, goroot))<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Use $GOROOT/pkg/bootstrap as the bootstrap w=
orkspace root.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// We use a subdirectory of $GOROOT/pkg because=
 that&#39;s the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// space within $GOROOT where we store all gene=
rated objects.<br>
+@@ -126,6 +123,34 @@ func bootstrapBuildTools() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0base :=3D pathf(&quot;%s/src/bootstrap&quot;, w=
orkspace)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xmkdirall(base)<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 // Set up environment for invoking Go 1.4 go command=
.<br>
++=C2=A0 =C2=A0 =C2=A0 // GOROOT points at Go 1.4 GOROOT,<br>
++=C2=A0 =C2=A0 =C2=A0 // GOPATH points at our bootstrap workspace,<br>
++=C2=A0 =C2=A0 =C2=A0 // GOBIN is empty, so that binaries are installed to=
 GOPATH/bin,<br>
++=C2=A0 =C2=A0 =C2=A0 // and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empt=
y,<br>
++=C2=A0 =C2=A0 =C2=A0 // so that Go 1.4 builds whatever kind of binary it =
knows how to build.<br>
++=C2=A0 =C2=A0 =C2=A0 // Restore GOROOT, GOPATH, and GOBIN when done.<br>
++=C2=A0 =C2=A0 =C2=A0 // Don&#39;t bother with GOOS, GOHOSTOS, GOARCH, and=
 GOHOSTARCH,<br>
++=C2=A0 =C2=A0 =C2=A0 // because setup will take care of those when bootst=
rapBuildTools returns.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 defer os.Setenv(&quot;GOROOT&quot;, os.Getenv(&quot;=
GOROOT&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOROOT&quot;, goroot_bootstrap)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 defer os.Setenv(&quot;GOPATH&quot;, os.Getenv(&quot;=
GOPATH&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOPATH&quot;, workspace)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 defer os.Setenv(&quot;GOBIN&quot;, os.Getenv(&quot;G=
OBIN&quot;))<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOBIN&quot;, &quot;&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOOS&quot;, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOHOSTOS&quot;, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOARCH&quot;, &quot;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOHOSTARCH&quot;, &quot;&quot;)<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Create the build config files.<br>
++=C2=A0 =C2=A0 =C2=A0 mkbuildcfg(pathf(&quot;%s/src/internal/buildcfg/zboo=
tstrap.go&quot;, goroot))<br>
++=C2=A0 =C2=A0 =C2=A0 mkobjabi(pathf(&quot;%s/src/cmd/internal/objabi/zboo=
tstrap.go&quot;, goroot))<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Copy source code into $GOROOT/pkg/bootstrap =
and rewrite import paths.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writefile(&quot;module bootstrap\n&quot;, pathf=
(&quot;%s/%s&quot;, base, &quot;go.mod&quot;), 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, dir :=3D range bootstrapDirs {<br>
+@@ -172,30 +197,6 @@ func bootstrapBuildTools() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 // Set up environment for invoking Go 1.4 go command=
.<br>
+-=C2=A0 =C2=A0 =C2=A0 // GOROOT points at Go 1.4 GOROOT,<br>
+-=C2=A0 =C2=A0 =C2=A0 // GOPATH points at our bootstrap workspace,<br>
+-=C2=A0 =C2=A0 =C2=A0 // GOBIN is empty, so that binaries are installed to=
 GOPATH/bin,<br>
+-=C2=A0 =C2=A0 =C2=A0 // and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empt=
y,<br>
+-=C2=A0 =C2=A0 =C2=A0 // so that Go 1.4 builds whatever kind of binary it =
knows how to build.<br>
+-=C2=A0 =C2=A0 =C2=A0 // Restore GOROOT, GOPATH, and GOBIN when done.<br>
+-=C2=A0 =C2=A0 =C2=A0 // Don&#39;t bother with GOOS, GOHOSTOS, GOARCH, and=
 GOHOSTARCH,<br>
+-=C2=A0 =C2=A0 =C2=A0 // because setup will take care of those when bootst=
rapBuildTools returns.<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 defer os.Setenv(&quot;GOROOT&quot;, os.Getenv(&quot;=
GOROOT&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOROOT&quot;, goroot_bootstrap)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 defer os.Setenv(&quot;GOPATH&quot;, os.Getenv(&quot;=
GOPATH&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOPATH&quot;, workspace)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 defer os.Setenv(&quot;GOBIN&quot;, os.Getenv(&quot;G=
OBIN&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOBIN&quot;, &quot;&quot;)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOOS&quot;, &quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOHOSTOS&quot;, &quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOARCH&quot;, &quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOHOSTARCH&quot;, &quot;&quot;)<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Run Go 1.4 to build binaries. Use -gcflags=
=3D-l to disable inlining to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// workaround bugs in Go 1.4&#39;s compiler. Se=
e discussion thread:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// <a href=3D"https://groups.google.com/d/msg/g=
olang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ" rel=3D"noreferrer" target=3D"_blank">ht=
tps://groups.google.com/d/msg/golang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ</a><br>
+@@ -217,6 +218,7 @@ func bootstrapBuildTools() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D append(cmd,=
 &quot;-toolexec=3D&quot;+tool)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D append(cmd, &quot;bootstrap/cmd/...&quo=
t;)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0run(base, ShowOutput|CheckExit, cmd...)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Copy binaries into tool binary directory.<br=
>
+-- <br>
+2.35.1<br>
+<br>
diff --git a/package/go/Config.in.host b/package/go/Config.in.host<br>
index e82ab6e81a..8be86103ea 100644<br>
--- a/package/go/Config.in.host<br>
+++ b/package/go/Config.in.host<br>
@@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_S=
UPPORTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on (BR2_arm &amp;&amp; BR2_TOOLCHAIN_SU=
PPORTS_PIE) || BR2_aarch64 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || BR2_i386 || BR2_=
x86_64 || BR2_powerpc64le \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| BR2_mips64 || BR=
2_mips64el || BR2_s390x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| BR2_mips64 || BR=
2_mips64el || BR2_riscv || BR2_s390x<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_ARM_CPU_ARMV4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # MIPS R6 support in Go has not yet been develo=
ped.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_MIPS_CPU_MIPS64R6<br>
diff --git a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer" target=
=3D"_blank">go.mk</a> b/package/go/<a href=3D"http://go.mk" rel=3D"noreferr=
er" target=3D"_blank">go.mk</a><br>
index 3df16c9a68..ba0da74b86 100644<br>
--- a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer" target=3D"_bla=
nk">go.mk</a><br>
+++ b/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer" target=3D"_bla=
nk">go.mk</a><br>
@@ -63,6 +63,8 @@ else ifeq ($(BR2_mips64),y)<br>
=C2=A0GO_GOARCH =3D mips64<br>
=C2=A0else ifeq ($(BR2_mips64el),y)<br>
=C2=A0GO_GOARCH =3D mips64le<br>
+else ifeq ($(BR2_riscv),y)<br>
+GO_GOARCH =3D riscv64<br>
=C2=A0else ifeq ($(BR2_s390x),y)<br>
=C2=A0GO_GOARCH =3D s390x<br>
=C2=A0endif<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div>

--000000000000083bcb05deb1b45f--

--===============6803935614119338545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6803935614119338545==--
