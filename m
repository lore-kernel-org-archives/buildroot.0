Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD7C433FE
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCFD408DE;
	Sat,  8 Jan 2022 16:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyVFfoSs2_qw; Sat,  8 Jan 2022 16:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941884090A;
	Sat,  8 Jan 2022 16:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B753A1BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A653E403A8
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VF3QZCO5R6Uq for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:52:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB7D402F7
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:52:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so4488939wmn.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Q7RyqdlFH9BpbOsBCV9K48RlVdG8lwxKqC/ei0sEpCo=;
 b=LVawyDu3bUmtSjJrymkaWxWcVNgOVDYUf4YXfemX5vOMC5IlWmhIZCpsgNfTaC+MIe
 Qz8gwVPdV3MFK1Ti4jZMG9qOhtEiJYKrdnbSKCbRmsxBaJ1ep4JaIOt+ghWaBvxO0R6U
 suDPzlWyiVUVbpoadPBeiqNDBh18amCN4dIV3ZkmGi0ja50E1vg+V1775fi5tIZfpVzH
 yHzbqqlUYjryws4RZe8OSzQ4rQ2kdTQioNYDkuRZaP77xaoG4ntFpNKpf6hM958AWAAA
 Z/wrYovXZoF/EHEfrzhbUl18LNkiubINDtEoLuiW2j5R4huFX8KMSxIpZ4HwLZ0F8drh
 KCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Q7RyqdlFH9BpbOsBCV9K48RlVdG8lwxKqC/ei0sEpCo=;
 b=pDYRrCHqG2ddLsz611aM7QOSJO4EoiEiH180BMw7Ir3xru4nDjmzfPyQYV61yilQsS
 vzjPVMdO+dnjxb/8oMH4wb8+6ypm0SlqeyBABVYZGxR/QH2o8bl+1PL9DO9d0JwEGNMu
 8JHBDwBrDnhB/XLOEmoZElwl/By3q7/6NCFqfpUIQ91DNeryOjaxlZMx9tSkTOcajMNR
 4L+RtWm837Bn2/zE+8MXF2VqOSsTD64fReA0XTHoEgKj7542JC8/bLFA7FymWN6Flxk/
 0g1glTqbF8zk+q+9BN3w03arrD6Q9zqthRhRrhENgKKz4az/WwxtsUjNFCOUPJ+DfyOa
 pYcA==
X-Gm-Message-State: AOAM531K4k9jpOMc88/n0BXyGECmIB+AxLw+eooUupWSeL1nVsXH0CRW
 ftpPC+U/5ck/D+uCIIT8pPg9sg==
X-Google-Smtp-Source: ABdhPJxBL4DFhYYlE6DxxNXs1l/Wg7gm0P6TUHUwTFYimG0Oa9jd2T3WFcvqi53qCYIC03OpkuAJmw==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr5151341wmk.75.1641660761321;
 Sat, 08 Jan 2022 08:52:41 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id m39sm1684523wms.33.2022.01.08.08.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 08:52:41 -0800 (PST)
Message-ID: <6147f82e-21fa-ad1e-5c89-96e1844c621e@mind.be>
Date: Sat, 8 Jan 2022 17:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 0/7] Bump of python-cryptography and other
 Rust related fun
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



On 07/01/2022 18:13, Thomas Petazzoni wrote:
> Hello,
> 
> This series bumps the python-cryptography package to a new version. It
> is based on earlier work from James Hilliard at:
> 
>    https://patchwork.ozlabs.org/project/buildroot/patch/20210318044253.3202355-2-james.hilliard1@gmail.com/
> 
> But it did require quite some more work, which is presented in this
> patch series.
> 
> The unique challenge caused by this version bump is that
> python-cryptography now has some Rust code integrated, so suddenly
> this package, and all its reverse dependencies need to depend on Rust
> being available.
> 
> There is also a host variant of python-cryptography, which is used
> solely by ca-certificates, which has a significant number of reverse
> dependencies. To avoid adding Rust dependencies to these, we broke the
> dependency of ca-certificates on host-python-cryptography using a
> simple patch, and dropped host-python-cryptography altogether.
> 
> This patch series depends on the "Go/Cargo vendoring" patch series
> posted recently. Indeed, the Rust code in python-cryptography depends
> on other Cargo crates, which we don't want to download during the
> build, but really during the download step.
> 
> There is however still one problem with the last patch of the series,
> see below.
> 
> This series is available at:
> 
>    https://github.com/tpetazzoni/buildroot/tree/python-cryptography
> 
> The patch series goes like this:
> 
>   - PATCH 1 modifies ca-certificates to no longer need
>     host-python-cryptography
> 
>   - PATCH 2 drops host-python-cryptography itselef
> 
>   - PATCH 3 and 4 fix some issues in package/rustc/ in the description
>     of the ARMv5 and RISC-V 64-bit Rust support. We noticed this
>     because Rust binaries were not working on ARMv5 ("Illegal
>     instruction"), this was due to the fact that we were using the
>     pre-compiled Rust standard library for ARMv6, due to a bogus
>     architecture name. This is fixed by PATCH 3. And while reviewing
>     this, we spotted a similar issue for RISC-V 64-bit, which is fixed
>     in PATCH 4.

  First four patches applied to master, with the fixup that you mentioned on 
patch 3.

  Regards,
  Arnout

> 
>   - PATCH 5 slightly improves the Cargo download post-process script to
>     make it possible to pass a custom path to the Cargo.toml file,
>     instead of assuming it's located at the root of the package source
>     tree.
> 
>   - PATCH 6 modifies the runtime test cases that involve
>     python-cryptography directly or indirectly to use a glibc toolchain
>     instead of the default uclibc toolchain. Indeed, Rust is for now
>     not available on uClibc platforms. This could have been done in the
>     patch doing the version bump, but the version bump patch is already
>     quite large, and the update of the runtime tests could be done as a
>     separate preparation step.
> 
>   - PATCH 7 finally bumps python-cryptography
>     itself. python-cryptography itself requires a bit of trickery to
>     leverage the Cargo download post-process logic, to vendor
>     dependencies during the download step. Then the patch also touches
>     the entire reverse dependency tree (sometimes up to 5 levels
>     deep!). This patch should NOT be applied for now, due to issues
>     (see below).
> 
> This series was tested by building the following configuration:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_PYTHON_CHANNELS_REDIS=y
> BR2_PACKAGE_PYTHON_CROSSBAR=y
> BR2_PACKAGE_PYTHON_KEYRING=y
> BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO=y
> BR2_PACKAGE_PYTHON_TXDBUS=y
> BR2_PACKAGE_DOCKER_COMPOSE=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> that builds all affected packages.
> 
> It was also tested by running all Python runtime test cases:
> 
>     https://gitlab.com/tpetazzoni/buildroot/-/pipelines/443445436
> 
> The one thing that fails is when building python-cryptography on a
> target arch that is the same as the host. This can be reproduced by
> running the tests.package.test_docker_compose.TestDockerCompose test
> case.
> 
> We get this:
> 
>       Running `/home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build`
> error: failed to run custom build command for `proc-macro-hack v0.5.19`
> 
> Caused by:
>    process didn't exit successfully: `/home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build` (exi
> t status: 1)
>    --- stderr
>    /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: versio
> n `GLIBC_2.33' not found (required by /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build)
>    /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: versio
> n `GLIBC_2.32' not found (required by /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build)
>    /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: versio
> n `GLIBC_2.34' not found (required by /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build)
> warning: build failed, waiting for other jobs to finish...
> error: build failed
> 
> Which looks terribly similar to the issue on ripgrep which was fixed
> by commit 4b2be770b8a853a7dd97b5788d837f0d84923fa1. So I tried doing
> the same, i.e passing:
> 
> 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> 	CARGO_TARGET_APPLIES_TO_HOST="false"
> 
> in the environment, and -Z target-applies-to-host to cargo (by passing
> it to the args argument of the RustExtension class in
> python-cryptography's setup.py). But cargo doesn't like that, the
> build log goes like this:
> 
>>>> python-cryptography 36.0.1 BuildingESC[27m
> ... calling setup.py ...
> cargo rustc --lib --manifest-path src/rust/Cargo.toml --features pyo3/abi3-py36 pyo3/extension-module --target x86_64-unknown-linux-gnu -Z target-applies-to-host --release --verbose -- --crate-type cdylib
> ...
> error: unknown `-Z` flag specified:  target-applies-to-host
> 
> The difference that I see with the cargo infrastructure is that this
> is not using "cargo build" but "cargo rustc". I would really
> appreciate some help on solving this (last?) issue.
> 
> Best regards,
> 
> Thomas Petazzoni
> 
> 
> Thomas Petazzoni (7):
>    package/ca-certificates: remove dependency on host-python-cryptography
>    package/python-cryptography: drop host variant
>    package/rustc: fix BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv5
>    package/rustc: fix the riscv64gc architecture handling
>    support/download/cargo-post-process: make manifest path configurable
>    support/testing/tests: switch python-cryptography related tests to
>      glibc
>    DO-NOT-APPLY package/python-cryptography: bump version to 36.0.1
> 
>   ...2pem.py-make-cryptography-module-opt.patch | 59 +++++++++++++++++++
>   package/ca-certificates/ca-certificates.mk    |  2 +-
>   package/docker-compose/Config.in              |  8 ++-
>   package/python-autobahn/Config.in             |  6 +-
>   package/python-channels-redis/Config.in       |  7 +--
>   package/python-channels/Config.in             |  7 +--
>   package/python-crossbar/Config.in             |  6 +-
>   package/python-cryptography/Config.in         | 14 +----
>   .../python-cryptography.hash                  |  5 +-
>   .../python-cryptography.mk                    | 20 ++++---
>   package/python-daphne/Config.in               |  7 +--
>   package/python-keyring/Config.in              |  7 +--
>   package/python-opcua-asyncio/Config.in        |  1 +
>   package/python-paramiko/Config.in             |  8 +--
>   package/python-pyopenssl/Config.in            |  8 +--
>   package/python-secretstorage/Config.in        |  6 +-
>   package/python-service-identity/Config.in     | 10 ++--
>   package/python-treq/Config.in                 | 10 ++--
>   package/python-twisted/Config.in              |  6 +-
>   package/python-txdbus/Config.in               |  5 +-
>   package/python-txtorcon/Config.in             |  7 +--
>   package/rustc/Config.in.host                  |  4 +-
>   support/download/cargo-post-process           |  2 +-
>   .../tests/package/test_python_autobahn.py     | 10 +++-
>   .../tests/package/test_python_crossbar.py     | 10 +++-
>   .../tests/package/test_python_cryptography.py | 10 +++-
>   .../package/test_python_service_identity.py   | 10 +++-
>   .../testing/tests/package/test_python_treq.py | 10 +++-
>   .../tests/package/test_python_txtorcon.py     | 10 +++-
>   29 files changed, 170 insertions(+), 105 deletions(-)
>   create mode 100644 package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
