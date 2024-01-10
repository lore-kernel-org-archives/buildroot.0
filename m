Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B61C4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579A441E41;
	Wed, 10 Jan 2024 14:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579A441E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9d58hERRXyxV; Wed, 10 Jan 2024 14:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEFBD420A0;
	Wed, 10 Jan 2024 14:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFBD420A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6621BF277
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 14:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D2E81ADE
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 14:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D2E81ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWeegJMAEpwW for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 14:29:14 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4099B81A81
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 14:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4099B81A81
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so2947975f8f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 06:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704896952; x=1705501752;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=43fMb4WMxZQLuAYWMxPHSHjvOblY8YKDgQkp9q59yH8=;
 b=pOcsEEbKuKbq7DOaBwFhVZhD8xWrWhQHWLWmDU44nvhe3jqUMhHORUcOdjst+TIEHQ
 IahP3ze97Jmagq5qs0USxY0KofLYfWX5uwpzDLk0VfB71l7a7rAc2sqbGQ4y5FqN8Ydh
 LljFj0rM3KGs3wDTIN/hZBFwRBAu0NbmGKZPYc218OzryKtH2XjC6vNUR4igqIVMHzuA
 7jYgv334Dxfw9gfGMcXNPrlVRhSFvg6PZXlWo0cFpNQ3bUxw2Qy0BEzNept2CIFjc039
 IVj9JKq6xOZgf5jjhp6f48Z/RR50VW5BskZ4PMbT9NHqKy9YqnDeEcUQPovH/lds5kdt
 kxhA==
X-Gm-Message-State: AOJu0Yx0K/1XwoTKU4Zu7jDppV6i1+6WiZlbtypESD+3PvSRNSijRyOd
 PZOZeoqQHlam/CCFFDlOOzVue7s0qMpwPeJFTT/wd1z0mUo=
X-Google-Smtp-Source: AGHT+IG/O9fx6oDxXUboUpadwCvgRAGSOYg6O2O8ZKeh3MAtcZ1g4rBzoBUZVFmOx+XoAu3h+Ofv/A==
X-Received: by 2002:a05:600c:214f:b0:40e:49af:264c with SMTP id
 v15-20020a05600c214f00b0040e49af264cmr88422wml.62.1704896952046; 
 Wed, 10 Jan 2024 06:29:12 -0800 (PST)
Received: from [10.5.2.37] (176-161-53-116.abo.bbox.fr. [176.161.53.116])
 by smtp.gmail.com with ESMTPSA id
 fs23-20020a05600c3f9700b0040c11fbe581sm2435586wmb.27.2024.01.10.06.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:29:11 -0800 (PST)
Message-ID: <05f3360d-4383-4c7a-9b49-b453dd0ae46e@smile.fr>
Date: Wed, 10 Jan 2024 15:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr> <ZZF8dBumVmvof2KW@landeda>
Content-Language: en-US
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZZF8dBumVmvof2KW@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704896952; x=1705501752;
 darn=buildroot.org; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43fMb4WMxZQLuAYWMxPHSHjvOblY8YKDgQkp9q59yH8=;
 b=IXcubqNbsGOUfSx0jLhF5i8LFsE8pZzgSS9Uc7KvIzXdnJTiq/tbUIRtN2hzc427A2
 OS24xNmZCMuKk+5J8BU5vlAqu7oqmNL8bjVGv1Ni7QrU575ST9XfK9l/n4b3EjQYfX4v
 8zvibX48kAny284c6sCIRgK8yan645xq+gvbCeK3Wx3RrtmPnFoCbn7GHAsDPEshxnif
 U6NWjdveYHVrlJaTxTumEICzwSeUboAzLIc1txSHRhwLkFENRDYb/8OdOWsy8jmLY8Pu
 5lSk8L1I95F5F9rRfp1u2Tokvdydb9/A3ym9hLRsq2tT+/kxIrxmIzQM7ezVJT5rEU8d
 naSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IXcubqNb
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: romain.naour@smile.fr, sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4509206009749792620=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4509206009749792620==
Content-Type: multipart/alternative;
 boundary="------------MhXyilVusfDhH1HZpGod62fe"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------MhXyilVusfDhH1HZpGod62fe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yann, All,


On 31/12/2023 15:36, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2023-12-28 16:26 +0100, Antoine Coutant spake thusly:
>> ripgrep previous version hash is no longer valid.
>> The tarball is modified by rust vendoring so the hash
>> may change with rust versions.
> This was very concerning, and if that had been true, could not have
> been solved just by bumping the version. Indeed, it is not always
> possible to bump the version, e.g. when the package is already using
> the latest version.
>
> Furthermore, it was a bit surprising that only ripgrep was impacted, not
> all the other cargo-vendored packages. And it turned out that indeed,
> another package was impacted, sentry-cli (but we only have the host
> variant of it).
>
> So, that really needed more investigations, to provide a more solid
> explanation why the hash was wrong, and if possible identify the point
> in the cargo history where the change happened, to ask upstream if the
> vendoring scheme was stable or not (in that latter case, we'd have had
> to introduce the versioning of the vendored archives).
>
> However, as you can see in the rest of this thread, the issue has
> nothing to do with cargo vendoring, in fact, and is caused by an
> unrelated change in the download infra (my fault!).

I'm sorry for the confusion I caused by my misunderstanding.

Thanks for all your research!


Regards,

Antoine Coutant

>
> So, the ripgrep version bump is OK, but not for the correct reasons. ;-)
>
> Regards,
> Yann E. MORIN.
>
>> The patch has been rebased to ripgrep 14.0.3.
>>
>> Changelog:
>> https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md
>>
>> Signed-off-by: Antoine Coutant<antoine.coutant@smile.fr>
>> ---
>>
>> Tested using qemu_aarch64_virt_defconfig and Arm AArch64 13.2.rel1
>> toolchain.
>>
>> Signed-off-by: Antoine Coutant<antoine.coutant@smile.fr>
>> ---
>>   ...llocator-behind-a-cargo-feature-flag.patch | 52 ++++++++++---------
>>   package/ripgrep/ripgrep.hash                  |  2 +-
>>   package/ripgrep/ripgrep.mk                    |  6 +--
>>   3 files changed, 29 insertions(+), 31 deletions(-)
>>
>> diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
>> index e2ba68f389..aa073c6e7f 100644
>> --- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
>> +++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
>> @@ -1,4 +1,4 @@
>> -From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
>> +From e4df6678e3e2d018acccafd47d1e484887d23323 Mon Sep 17 00:00:00 2001
>>   From: Jonathan Stites<mail@jonstites.com>
>>   Date: Wed, 6 May 2020 12:55:35 +0000
>>   Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
>> @@ -9,6 +9,8 @@ Moves jemalloc behind a feature for musl builds, where it is not
>>   supported by the upstream project, so ripgrep will fail to build.
>>   
>>   Signed-off-by: Sam Voss<sam.voss@gmail.com>
>> +[Antoine: update for 14.0.3]
>> +Signed-off-by: Antoine Coutant<antoine.coutant@smile.fr>
>>   ---
>>    .github/workflows/ci.yml      | 6 ++++++
>>    .github/workflows/release.yml | 8 +++++++-
>> @@ -18,10 +20,10 @@ Signed-off-by: Sam Voss<sam.voss@gmail.com>
>>    5 files changed, 35 insertions(+), 4 deletions(-)
>>   
>>   diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
>> -index ab154ec..aa567d9 100644
>> +index b37753e..a2cdeee 100644
>>   --- a/.github/workflows/ci.yml
>>   +++ b/.github/workflows/ci.yml
>> -@@ -149,6 +149,12 @@ jobs:
>> +@@ -160,6 +160,12 @@ jobs:
>>          if: matrix.target != ''
>>          run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
>>    
>> @@ -31,14 +33,14 @@ index ab154ec..aa567d9 100644
>>   +      if: matrix.os == 'nightly-musl'
>>   +      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
>>   +
>> -     - name: Test for existence of build artifacts (Windows)
>> -       if: matrix.os == 'windows-2019'
>> -       shell: bash
>> +     - name: Test zsh shell completions (Unix, sans cross)
>> +       # We could test this when using Cross, but we'd have to execute the
>> +       # 'rg' binary (done in test-complete) with qemu, which is a pain and
>>   diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
>> -index 7cfb6a4..ad6b82d 100644
>> +index b10c076..58a7a12 100644
>>   --- a/.github/workflows/release.yml
>>   +++ b/.github/workflows/release.yml
>> -@@ -133,7 +133,13 @@ jobs:
>> +@@ -153,7 +153,13 @@ jobs:
>>            echo "target flag is: ${{ env.TARGET_FLAGS }}"
>>            echo "target dir is: ${{ env.TARGET_DIR }}"
>>    
>> @@ -50,25 +52,25 @@ index 7cfb6a4..ad6b82d 100644
>>   +
>>   +    - name: Build release binary (non-linux)
>>   +      if: matrix.build != 'linux'
>> -       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
>> -
>> -     - name: Strip release binary (linux and macos)
>> +       shell: bash
>> +       run: |
>> +         ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
>>   diff --git a/Cargo.toml b/Cargo.toml
>> -index fb78fcb..0d34b1e 100644
>> +index f30cc0b..6fe4c79 100644
>>   --- a/Cargo.toml
>>   +++ b/Cargo.toml
>> -@@ -56,8 +56,9 @@ version = "2.33.0"
>> - default-features = false
>> - features = ["suggestions"]
>> +@@ -59,8 +59,9 @@ serde_json = "1.0.23"
>> + termcolor = "1.1.0"
>> + textwrap = { version = "0.16.0", default-features = false }
>>    
>>   -[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
>>   +[dependencies.jemallocator]
>> - version = "0.3.0"
>> + version = "0.5.0"
>>   +optional = true
>>    
>> - [build-dependencies]
>> - lazy_static = "1.1.0"
>> -@@ -75,6 +76,11 @@ walkdir = "2"
>> + [dev-dependencies]
>> + serde = "1.0.77"
>> +@@ -70,6 +71,11 @@ walkdir = "2"
>>    [features]
>>    simd-accel = ["grep/simd-accel"]
>>    pcre2 = ["grep/pcre2"]
>> @@ -81,10 +83,10 @@ index fb78fcb..0d34b1e 100644
>>    [profile.release]
>>    debug = 1
>>   diff --git a/README.md b/README.md
>> -index 46938bc..9917b29 100644
>> +index 63c0725..3d35819 100644
>>   --- a/README.md
>>   +++ b/README.md
>> -@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
>> +@@ -442,6 +442,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
>>    `musl-gcc` installed, which might be in a separate package from the actual
>>    MUSL library, depending on your Linux distribution.
>>    
>> @@ -101,10 +103,10 @@ index 46938bc..9917b29 100644
>>    ### Running tests
>>    
>>   diff --git a/crates/core/main.rs b/crates/core/main.rs
>> -index 47385de..c9dae5a 100644
>> +index 64f35ce..9aa6663 100644
>>   --- a/crates/core/main.rs
>>   +++ b/crates/core/main.rs
>> -@@ -31,7 +31,7 @@ mod subject;
>> +@@ -27,7 +27,7 @@ mod search;
>>    // have the fastest version of everything. Its goal is to be small and amenable
>>    // to static compilation.) Even though ripgrep isn't particularly allocation
>>    // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
>> @@ -113,7 +115,7 @@ index 47385de..c9dae5a 100644
>>    //
>>    // We don't unconditionally use jemalloc because it can be nice to use the
>>    // system's default allocator by default. Moreover, jemalloc seems to increase
>> -@@ -39,7 +39,11 @@ mod subject;
>> +@@ -35,7 +35,11 @@ mod search;
>>    //
>>    // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
>>    // i686.
>> @@ -127,5 +129,5 @@ index 47385de..c9dae5a 100644
>>    static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
>>    
>>   --
>> -2.32.0
>> +2.25.1
>>   
>> diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
>> index 71e74e1bcf..ff86c12ad5 100644
>> --- a/package/ripgrep/ripgrep.hash
>> +++ b/package/ripgrep/ripgrep.hash
>> @@ -1,3 +1,3 @@
>>   # Locally calculated
>> -sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
>> +sha256  2f022889c999ffe00955e586fe24b334d1c79060978fc41b95b52a30946e65d0  ripgrep-14.0.3.tar.gz
>>   sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
>> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
>> index d587441cfa..44662749bb 100644
>> --- a/package/ripgrep/ripgrep.mk
>> +++ b/package/ripgrep/ripgrep.mk
>> @@ -4,11 +4,7 @@
>>   #
>>   ################################################################################
>>   
>> -# Same as 13.0.0, we use a Git commit hash because the hash of this
>> -# tarball changed when moving to the cargo-package infrastructure, and
>> -# we can't change the hash of existing tarball. Please switch back to
>> -# a Git tag at the next version bump.
>> -RIPGREP_VERSION = af6b6c543b224d348a8876f0c06245d9ea7929c5
>> +RIPGREP_VERSION = 14.0.3
>>   RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
>>   RIPGREP_LICENSE = MIT
>>   RIPGREP_LICENSE_FILES = LICENSE-MIT
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------MhXyilVusfDhH1HZpGod62fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-56fded93-7fff-b6e6-84c2-584a595336cf"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Yann, All,</span></p>
    <br>
    <p></p>
    <div class="moz-cite-prefix">On 31/12/2023 15:36, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZZF8dBumVmvof2KW@landeda">
      <pre class="moz-quote-pre" wrap="">Antoine, All,

On 2023-12-28 16:26 +0100, Antoine Coutant spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">ripgrep previous version hash is no longer valid.
The tarball is modified by rust vendoring so the hash
may change with rust versions.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This was very concerning, and if that had been true, could not have
been solved just by bumping the version. Indeed, it is not always
possible to bump the version, e.g. when the package is already using
the latest version.

Furthermore, it was a bit surprising that only ripgrep was impacted, not
all the other cargo-vendored packages. And it turned out that indeed,
another package was impacted, sentry-cli (but we only have the host
variant of it).

So, that really needed more investigations, to provide a more solid
explanation why the hash was wrong, and if possible identify the point
in the cargo history where the change happened, to ask upstream if the
vendoring scheme was stable or not (in that latter case, we'd have had
to introduce the versioning of the vendored archives).

However, as you can see in the rest of this thread, the issue has
nothing to do with cargo vendoring, in fact, and is caused by an
unrelated change in the download infra (my fault!).</pre>
    </blockquote>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">I'm sorry for the confusion I caused by my misunderstanding.</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Thanks for all your research!</span></p>
    <br>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Regards,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Antoine Coutant</span></p>
    <blockquote type="cite" cite="mid:ZZF8dBumVmvof2KW@landeda">
      <pre class="moz-quote-pre" wrap="">

So, the ripgrep version bump is OK, but not for the correct reasons. ;-)

Regards,
Yann E. MORIN.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The patch has been rebased to ripgrep 14.0.3.

Changelog:
<a class="moz-txt-link-freetext" href="https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md">https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md</a>

Signed-off-by: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
---

Tested using qemu_aarch64_virt_defconfig and Arm AArch64 13.2.rel1
toolchain.

Signed-off-by: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
---
 ...llocator-behind-a-cargo-feature-flag.patch | 52 ++++++++++---------
 package/ripgrep/ripgrep.hash                  |  2 +-
 package/ripgrep/ripgrep.mk                    |  6 +--
 3 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
index e2ba68f389..aa073c6e7f 100644
--- a/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
+++ b/package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch
@@ -1,4 +1,4 @@
-From 68c2a4d7a5d9b46f65121958fdb12d5270bfd1b6 Mon Sep 17 00:00:00 2001
+From e4df6678e3e2d018acccafd47d1e484887d23323 Mon Sep 17 00:00:00 2001
 From: Jonathan Stites <a class="moz-txt-link-rfc2396E" href="mailto:mail@jonstites.com">&lt;mail@jonstites.com&gt;</a>
 Date: Wed, 6 May 2020 12:55:35 +0000
 Subject: [PATCH] puts jemalloc allocator behind a cargo feature flag
@@ -9,6 +9,8 @@ Moves jemalloc behind a feature for musl builds, where it is not
 supported by the upstream project, so ripgrep will fail to build.
 
 Signed-off-by: Sam Voss <a class="moz-txt-link-rfc2396E" href="mailto:sam.voss@gmail.com">&lt;sam.voss@gmail.com&gt;</a>
+[Antoine: update for 14.0.3]
+Signed-off-by: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
 ---
  .github/workflows/ci.yml      | 6 ++++++
  .github/workflows/release.yml | 8 +++++++-
@@ -18,10 +20,10 @@ Signed-off-by: Sam Voss <a class="moz-txt-link-rfc2396E" href="mailto:sam.voss@gmail.com">&lt;sam.voss@gmail.com&gt;</a>
  5 files changed, 35 insertions(+), 4 deletions(-)
 
 diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
-index ab154ec..aa567d9 100644
+index b37753e..a2cdeee 100644
 --- a/.github/workflows/ci.yml
 +++ b/.github/workflows/ci.yml
-@@ -149,6 +149,12 @@ jobs:
+@@ -160,6 +160,12 @@ jobs:
        if: matrix.target != ''
        run: ${{ env.CARGO }} test --verbose --workspace ${{ env.TARGET_FLAGS }}
  
@@ -31,14 +33,14 @@ index ab154ec..aa567d9 100644
 +      if: matrix.os == 'nightly-musl'
 +      run: ${{ env.CARGO }} test --verbose --all --features jemalloc ${{ env.TARGET_FLAGS }}
 +
-     - name: Test for existence of build artifacts (Windows)
-       if: matrix.os == 'windows-2019'
-       shell: bash
+     - name: Test zsh shell completions (Unix, sans cross)
+       # We could test this when using Cross, but we'd have to execute the
+       # 'rg' binary (done in test-complete) with qemu, which is a pain and
 diff --git a/.github/workflows/release.yml b/.github/workflows/release.yml
-index 7cfb6a4..ad6b82d 100644
+index b10c076..58a7a12 100644
 --- a/.github/workflows/release.yml
 +++ b/.github/workflows/release.yml
-@@ -133,7 +133,13 @@ jobs:
+@@ -153,7 +153,13 @@ jobs:
          echo "target flag is: ${{ env.TARGET_FLAGS }}"
          echo "target dir is: ${{ env.TARGET_DIR }}"
  
@@ -50,25 +52,25 @@ index 7cfb6a4..ad6b82d 100644
 +
 +    - name: Build release binary (non-linux)
 +      if: matrix.build != 'linux'
-       run: ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
- 
-     - name: Strip release binary (linux and macos)
+       shell: bash
+       run: |
+         ${{ env.CARGO }} build --verbose --release --features pcre2 ${{ env.TARGET_FLAGS }}
 diff --git a/Cargo.toml b/Cargo.toml
-index fb78fcb..0d34b1e 100644
+index f30cc0b..6fe4c79 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -56,8 +56,9 @@ version = "2.33.0"
- default-features = false
- features = ["suggestions"]
+@@ -59,8 +59,9 @@ serde_json = "1.0.23"
+ termcolor = "1.1.0"
+ textwrap = { version = "0.16.0", default-features = false }
  
 -[target.'cfg(all(target_env = "musl", target_pointer_width = "64"))'.dependencies.jemallocator]
 +[dependencies.jemallocator]
- version = "0.3.0"
+ version = "0.5.0"
 +optional = true
  
- [build-dependencies]
- lazy_static = "1.1.0"
-@@ -75,6 +76,11 @@ walkdir = "2"
+ [dev-dependencies]
+ serde = "1.0.77"
+@@ -70,6 +71,11 @@ walkdir = "2"
  [features]
  simd-accel = ["grep/simd-accel"]
  pcre2 = ["grep/pcre2"]
@@ -81,10 +83,10 @@ index fb78fcb..0d34b1e 100644
  [profile.release]
  debug = 1
 diff --git a/README.md b/README.md
-index 46938bc..9917b29 100644
+index 63c0725..3d35819 100644
 --- a/README.md
 +++ b/README.md
-@@ -406,6 +406,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
+@@ -442,6 +442,15 @@ build a static executable with MUSL and with PCRE2, then you will need to have
  `musl-gcc` installed, which might be in a separate package from the actual
  MUSL library, depending on your Linux distribution.
  
@@ -101,10 +103,10 @@ index 46938bc..9917b29 100644
  ### Running tests
  
 diff --git a/crates/core/main.rs b/crates/core/main.rs
-index 47385de..c9dae5a 100644
+index 64f35ce..9aa6663 100644
 --- a/crates/core/main.rs
 +++ b/crates/core/main.rs
-@@ -31,7 +31,7 @@ mod subject;
+@@ -27,7 +27,7 @@ mod search;
  // have the fastest version of everything. Its goal is to be small and amenable
  // to static compilation.) Even though ripgrep isn't particularly allocation
  // heavy, musl's allocator appears to slow down ripgrep quite a bit. Therefore,
@@ -113,7 +115,7 @@ index 47385de..c9dae5a 100644
  //
  // We don't unconditionally use jemalloc because it can be nice to use the
  // system's default allocator by default. Moreover, jemalloc seems to increase
-@@ -39,7 +39,11 @@ mod subject;
+@@ -35,7 +35,11 @@ mod search;
  //
  // Moreover, we only do this on 64-bit systems since jemalloc doesn't support
  // i686.
@@ -127,5 +129,5 @@ index 47385de..c9dae5a 100644
  static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;
  
 -- 
-2.32.0
+2.25.1
 
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 71e74e1bcf..ff86c12ad5 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f1d4a8b653ce48d59ad777288b1257cbda607db29db19d031b7e622c60526f8  ripgrep-af6b6c543b224d348a8876f0c06245d9ea7929c5.tar.gz
+sha256  2f022889c999ffe00955e586fe24b334d1c79060978fc41b95b52a30946e65d0  ripgrep-14.0.3.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index d587441cfa..44662749bb 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,11 +4,7 @@
 #
 ################################################################################
 
-# Same as 13.0.0, we use a Git commit hash because the hash of this
-# tarball changed when moving to the cargo-package infrastructure, and
-# we can't change the hash of existing tarball. Please switch back to
-# a Git tag at the next version bump.
-RIPGREP_VERSION = af6b6c543b224d348a8876f0c06245d9ea7929c5
+RIPGREP_VERSION = 14.0.3
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------MhXyilVusfDhH1HZpGod62fe--

--===============4509206009749792620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4509206009749792620==--
