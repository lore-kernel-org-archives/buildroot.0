Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DC2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234CF6102D;
	Tue,  3 May 2022 20:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxQ4pc52skdQ; Tue,  3 May 2022 20:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D41560FE8;
	Tue,  3 May 2022 20:27:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6DC11BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D275861028
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFERu6XAJy3W for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:27:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A003260E87
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:27:27 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g6so35589897ejw.1
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8LPSBywkMqFDFEM0K2YrhMeY4xLfoJtKN3vR9c42Dms=;
 b=JlgRIXzzCua9cVXi6phL9qE5BYLxTQZQkBityj8TgxObDlkAkpf6Bn/I4n5GutJSQC
 bfROLeOQPeU0WNianXFvI7rfuXTCOcloLiVZxTa+CmxoyJQJHVWHmX1LiirA1c6cvPC1
 vbSL+mPiwvLmKdRxVWZiN2F7OYz+wfW2MhSGSEPyUyiWb8pJUxsRa/tXKgR9UqwnUcze
 0R/FDCtPIKKTVVgb7ZoZv3SvKZkygi5AHufnn8k0kMoTk22WpWufFsRV8bXu2yXZTruO
 PUz5wj8ZG4+i0N+LgcdXaKOLeL/RJ4E9K5nnaWNuFVKMjAgMHBcqDggj2v1fKCLXZBIu
 cekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8LPSBywkMqFDFEM0K2YrhMeY4xLfoJtKN3vR9c42Dms=;
 b=DcaZMHA8IYigCJaxPBem1sNgFIyMWZc6JRC6JGhjLSfNKriw3OEuXk6OOdWojzauxU
 H0J1MmgetbGGAOhWf9fuBklSpC0rtM2F4290JraCliQ/pUojROYiWxZ9R6LrsVyGE1bz
 bwdJuyObaxnEM7Rgl5Y1v6LUehWsdl/iiF8xdDulkkJIQ67U00s3JJ6lFhsQIdRbwYJ1
 ekCSrYqILlhwEhFXX07HWmDVHdc1Jsl0oqcXfqvp0cgN9oWFfs/cD90zVYgKyQEdrnFD
 SwG9zBy2V0AeDO0t+VyZmE28gQM4WeZa5DT9hKgnF5wCDnytX2rvJoWIPNLiY96imbBp
 Nm4A==
X-Gm-Message-State: AOAM533keWox1uquS7qdMDk2kMVm0OG6rU0Ytld1Tf87Ub1p1Yc+hP2q
 zQgmqzk9R7QL6LPRSEBtgEGBH4gwj1ZHAg==
X-Google-Smtp-Source: ABdhPJwFajaCzvkwqj0uKewtcT51MbaxCucWc5UJj8BlCpMpdd5jFoGm8tpNT+7MEFM09XvpOvOjBQ==
X-Received: by 2002:a17:907:da9:b0:6da:beb8:fdac with SMTP id
 go41-20020a1709070da900b006dabeb8fdacmr17383581ejc.364.1651609645774; 
 Tue, 03 May 2022 13:27:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a056402019700b0042617ba637bsm8295789edv.5.2022.05.03.13.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:27:25 -0700 (PDT)
Message-ID: <2846cd36-55a9-adfa-95d0-98fe30221c14@mind.be>
Date: Tue, 3 May 2022 22:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220502223140.3820989-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502223140.3820989-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zchunk: fix unsafe
 header/library path
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 00:31, James Hilliard wrote:
> Backport a patch from upstream to fix:
> unsafe header/library path used in cross-compilation: '-I/usr/include'
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/825/82517abd49dcf82c17fabaf9680353d5a6cc4279
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...rgp-standalone-wrap-and-find_library.patch | 106 ++++++++++++++++++
>   1 file changed, 106 insertions(+)
>   create mode 100644 package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
> 
> diff --git a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
> new file mode 100644
> index 0000000000..6c9cdba3ad
> --- /dev/null
> +++ b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
> @@ -0,0 +1,106 @@
> +From 473c97cda44b95f5cea08a0cdd566e602df564db Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Thu, 21 Apr 2022 14:24:01 -0600
> +Subject: [PATCH] meson: fix argp-standalone wrap and find_library
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +473c97cda44b95f5cea08a0cdd566e602df564db]
> +---
> + .github/workflows/main.yml       | 27 ---------------------------
> + meson.build                      |  6 +++---
> + subprojects/argp-standalone.wrap |  7 +++++++
> + 3 files changed, 10 insertions(+), 30 deletions(-)
> + create mode 100644 subprojects/argp-standalone.wrap
> +
> +diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
> +index c49806f..35667af 100644
> +--- a/.github/workflows/main.yml
> ++++ b/.github/workflows/main.yml
> +@@ -35,25 +35,11 @@ jobs:
> +     steps:
> +       - uses: actions/checkout@v2
> +
> +-      - uses: actions/checkout@v2
> +-        with:
> +-          repository: wolfv/argp-standalone
> +-          path: argp-standalone
> +-
> +       - name: Install mamba
> +         uses: mamba-org/provision-with-micromamba@main
> +         with:
> +           environment-file: .github/environment.yml
> +
> +-      - name: Compile argp-standalone
> +-        shell: cmd /C CALL {0}
> +-        run: |
> +-          CALL micromamba activate zchunk_test_env
> +-          cd argp-standalone
> +-          meson setup builddir
> +-          meson compile -C builddir --prefix=%CONDA_PREFIX%\Library
> +-          meson install -C builddir
> +-
> +       - name: Compile zchunk
> +         shell: cmd /C CALL {0}
> +         run: |
> +@@ -75,11 +61,6 @@ jobs:
> +     steps:
> +       - uses: actions/checkout@v2
> +
> +-      - uses: actions/checkout@v2
> +-        with:
> +-          repository: wolfv/argp-standalone
> +-          path: argp-standalone
> +-
> +       - uses: actions/setup-python@v1
> +         with:
> +           python-version: '3.x'
> +@@ -87,14 +68,6 @@ jobs:
> +       - name: Install meson and ninja
> +         run: pip install meson ninja
> +
> +-      - name: Compile argp-standalone
> +-        shell: cmd /C CALL {0}
> +-        run: |
> +-          cd argp-standalone
> +-          meson setup builddir
> +-          meson compile -C builddir
> +-          meson install -C builddir
> +-
> +       - name: Compile zchunk
> +         shell: cmd /C CALL {0}
> +         run: |
> +diff --git a/meson.build b/meson.build
> +index 1c6b32d..aa7dd25 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -58,10 +58,10 @@ endif
> +
> + # argp-standalone dependency (if required)
> + if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
> +-    if fs.is_dir(join_paths([get_option('prefix'), 'include']))
> +-        inc += include_directories(join_paths([get_option('prefix'), 'include']))
> ++    argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
> ++    if not argplib.found()
> ++        argplib = dependency('argp-standalone')
> +     endif
> +-    argplib = cc.find_library('argp', dirs : join_paths([get_option('prefix'), 'lib']))
> + else
> +     argplib = dependency('', required : false)
> + endif
> +diff --git a/subprojects/argp-standalone.wrap b/subprojects/argp-standalone.wrap
> +new file mode 100644
> +index 0000000..14c0b63
> +--- /dev/null
> ++++ b/subprojects/argp-standalone.wrap
> +@@ -0,0 +1,7 @@
> ++[wrap-git]
> ++directory = argp-standalone-1.4.1
> ++url = https://github.com/argp-standalone/argp-standalone.git
> ++revision = 21855f34ec9997c37e1a08cd69497336513a5800
> ++
> ++[provide]
> ++dependency_names = argp-standalone
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
