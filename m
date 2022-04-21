Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 889904015D;
	Thu, 21 Apr 2022 17:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAAr4f-tWJop; Thu, 21 Apr 2022 17:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BF5D409EC;
	Thu, 21 Apr 2022 17:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91C541BF20F
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E9D4813FA
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxSuqWVlkNw3 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:59:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA56181364
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:59:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v12so964261wrv.10
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YU346B7YbW0QaiZ5qhhRolVzxiAzT7id6ih0jZNV7wQ=;
 b=FulZ9H+qB3pSHvyqeAvi1OstFtyk/ef2Vzk75+31ui+V8TFKg5km++8SpaSM/QE+g6
 THoJ4VGhfp0KeWVvOjjoaAJ9PIvH0ORCJG/l/xjmp3EbAcojHi0FevobZVH75h2R4929
 n3s77smfXk6GfZQll2XhjWPgbBKejZXwpmSvxN/hl5nzpC7F9AZFuWUjZUE3cm1hcvSS
 FkgqhNKVuygUpqFr5ag+mnv1Sj5o5d5PbLbh2TJkNPnD7oWj72lZXwE3dzJGv+oEJS6m
 3zas3dFcGnQGZZD1YFekd6zG2gpf3TICT3IP6hiO2taGNI7KMIwnkJyJhYocEX+pj9rV
 HwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YU346B7YbW0QaiZ5qhhRolVzxiAzT7id6ih0jZNV7wQ=;
 b=K7TAlus1JNEMXyD1myhUhzIt+RF12Uj49a0PKZ4IvIuHSghZbwDgFpN5qN1s7xc6Eq
 B1voziiN7lSVCsuoBj3Ue+0ORuZIR3ek/aKIHI7vUiFl/opxkKSz+Y36yZm6lAhTHvaQ
 lNJW8s67tbCJTPbxIOiRqykabeaJtz84LrTDa2cRsa+GSk6Q5gBbl/dE+mHXv22st5Kg
 i/mFFprNlbuBhDxa/95WpIs5i7HCCaA9Wdpf8j70g+UXnDsMl30PD6tDVv4EdmV5lOcD
 i1ZWLy76hZCsR9Ip26Pd5SnvDaxXdA4igshZW9AyFERffBIFN8NjYwIFtYaF5es3AASQ
 VKvA==
X-Gm-Message-State: AOAM532xzAAgSjM5+4twXh+JAkGrHm5buIYH+Tfcx5gcHbptMmVa4Wht
 jv387wlhJ/oydxMEOPUVzWhWIg==
X-Google-Smtp-Source: ABdhPJwWJt2wdwVVMLOf7xjlOeIBKyeV/5xbhwuhrgtWXjbwHLZcWDCSDtCGjYLWroaQOLHcPcUc0Q==
X-Received: by 2002:adf:ded1:0:b0:207:bc14:78ba with SMTP id
 i17-20020adfded1000000b00207bc1478bamr696351wrn.492.1650563962778; 
 Thu, 21 Apr 2022 10:59:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm2699171wmn.46.2022.04.21.10.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:59:22 -0700 (PDT)
Message-ID: <d2021f62-2067-48f6-31ca-2ada8e2cad5f@mind.be>
Date: Thu, 21 Apr 2022 19:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Nicolas Tran <nicolas.tran@smile.fr>, buildroot@buildroot.org
References: <20220413095038.1941918-1-nicolas.tran@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220413095038.1941918-1-nicolas.tran@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.60.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/04/2022 11:50, Nicolas Tran wrote:
>      Link to Rust 1.60.0: https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html
> 
>      Packages relying on Rust have been updated to support version 1.60.0:
>      package/rust
>      package/rust-bin
> 
>      Newest version of the source archives have been retrieved with their hash values, and the signature of the .asc files have been verified as follows:
>      $ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
>      $ gpg --verify <filename.asc> <filename>
> 
>      The signatures were recognized but the ownership from https://static.rust-lang.org could not be verified. Because this URL can be trusted, it has been considered to blindly sign the corresponding key:
>      $ gpg --lsign-key 85AB96E6FA1BE5FE
> 
>      There is no typographical error in the packages according to the check-pakage utility:
>      $ ./utils/check-package package/rust-bin/*
>      $ ./utils/check-package package/rust/*
> 
>      The testsuites for the rust-bin and rust packages to test the Rust toolchain under 1.60.0 were successful:
>      $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
>      $ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust
> 
>      In order to verify the compatibility of Rust 1.60.0 with packages relying on it, tests using `./utils/test-pkg` were run.
>      For example, running the following command with `.conf` file enabling the corresponding BR2_PACKAGE:
>      $ ./utils/test-pkg -d test-pkg -c ripgrep.config -p ripgrep
> 
>      Results:
>      package/ripgrep: OK
>      package/librsvg : OK
>      package/suricata: OK
>      package/bat: OK
> 
> Notes:
> - For all the mentionned packages, the successful build was made on the toolchain bootlin-armv7-glibc (except package/bat, for which it was bootlin-x86-64-musl).
> - A redundant build fail was witnessed for the bootlin-x86-64-musl toolchain for all the packages tested (except for package/bat). The same tests were redone in the master branch and it was already the case with Rust 1.58.1.
> 
> Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rust-bin/rust-bin.hash | 252 ++++++++++++++++-----------------
>   package/rust-bin/rust-bin.mk   |   2 +-
>   package/rust/rust.hash         |   2 +-
>   package/rust/rust.mk           |   2 +-
>   4 files changed, 129 insertions(+), 129 deletions(-)
> 
> diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
> index b2a4502cd9..5e1100c671 100644
> --- a/package/rust-bin/rust-bin.hash
> +++ b/package/rust-bin/rust-bin.hash
> @@ -1,129 +1,129 @@
> -# From https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
> -sha256  0a80900aa160de4292b1174e25f183bd88f6c2fbb3056a59fcb4d658c70084cb  rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
> -sha256  110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e  rust-1.58.1-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
> -sha256  01d2e69ed06fbc05a779a7d09f99d0b54a0d10fef9a7dcd0ea07866d57900ca2  rust-1.58.1-mips-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
> -sha256  0b8fafb75e06ba9d4ca58f2cde3179a677908aed8be64e798fc107135839c480  rust-1.58.1-mipsel-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
> -sha256  00216feea0a6468e9ce57c7d3ad50e22fe888dfc9aabc34128e1f4b02c5a09b9  rust-1.58.1-powerpc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
> -sha256  f6f870875d9adbe5a8b7bb6f61c44b6c54381e5dff50b4d2cdce50d18a8a541e  rust-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
> -sha256  45bf988d0337095a4d30bb237d552e3420b4381e208624f0d956e1caf6b90207  rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
> -sha256  488e30e926d1835c0140a01bff4d3fe6499be1e89e5c740b2ceace892ab4c2e6  rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
> -sha256  48cf31128a54551330f9c094f69d274adaab1ac506869dd65353aaea5bcbf33f  rust-1.58.1-s390x-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
> -sha256  f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25  rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz.asc
> -sha256  c7a016ac63aeb5481d661ee3e680b57d35d5ccb902c605c32937a047a02cff49  rust-std-1.58.1-aarch64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz.asc
> -sha256  4c8d9774fb1f6cfa616f2c43395f438e887a38f0cd901a3886056cc1c1b84c30  rust-std-1.58.1-aarch64-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz.asc
> -sha256  eb58c2b72e9bbe50c80e9f2981e14d737198f7e17a4cad524d00baefdfa3bc1d  rust-std-1.58.1-arm-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz.asc
> -sha256  58e3f4905c3e7028811971219a3222640f947062fb93dbe51c1674551e9b06a6  rust-std-1.58.1-arm-unknown-linux-gnueabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz.asc
> -sha256  b354f0ad28d8cc7d5996d46c3a310c80aa6486ac7b89abcd1eeef7f13435e0ff  rust-std-1.58.1-arm-unknown-linux-musleabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz.asc
> -sha256  705fba2a50835354112ab86d1ee8889c39f3c7265d7ca26f1dffebaa463600a6  rust-std-1.58.1-arm-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
> -sha256  0505759fa8b26c902a701f266db4bfbfe496de71c5c6548a55c562fe9d386485  rust-std-1.58.1-armv5te-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz.asc
> -sha256  9ca8adb43b4e75556a99b6c7a9bc1d9aab894bbe109736c34582169ec81aee14  rust-std-1.58.1-armv5te-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
> -sha256  9f38bc3220d659ff482db9a0ace9dcb7051991d471149fad7bbb62fce8314e04  rust-std-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz.asc
> -sha256  1511c675d17033737ab2bd1e87b525aaf59e0455f5a717ab0a91fd849949164f  rust-std-1.58.1-armv7-unknown-linux-gnueabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz.asc
> -sha256  2cf8a8cc2441a1bb4b45b690c87fff4df975fac077240706c08594e26f901bdc  rust-std-1.58.1-armv7-unknown-linux-musleabihf.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz.asc
> -sha256  db86e823484f210884d7d815ffcd7dae355bba86e18151b0838ec06544bb8126  rust-std-1.58.1-armv7-unknown-linux-musleabi.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz.asc
> -sha256  02bce02f929114cc60126410fceeab6c0bcc8b96c394de9516d8f449880cb585  rust-std-1.58.1-i586-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i586-unknown-linux-musl.tar.xz.asc
> -sha256  e80d5769f042a00388546dbd26cb40c045d5dddc84e5da3f98d174027ed9eaaa  rust-std-1.58.1-i586-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz.asc
> -sha256  d7f2bc431db551ea9019a6d50d4e3f11e14fabbea3abec1478ac72a281309152  rust-std-1.58.1-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-i686-unknown-linux-musl.tar.xz.asc
> -sha256  c70fbb13aedfb88cfec8098355a155a4edce3d52f9b099bc033b7c7ac45aab00  rust-std-1.58.1-i686-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz.asc
> -sha256  b678ac0282cbb1965f9a7485a1f56b01d0229f91ddff5a18a9628f86970f5902  rust-std-1.58.1-mips-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips-unknown-linux-musl.tar.xz.asc
> -sha256  2f571f4c9b4e86e278539e811f495fb84f44898d4333b983a3d95ef5d2c0fdd8  rust-std-1.58.1-mips-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
> -sha256  7f2f613606f039eec83239753a83c227b1d3c39b6474647234e7788a1541e850  rust-std-1.58.1-mips64-unknown-linux-gnuabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz.asc
> -sha256  7283539843df5c8abd06b0ce3830efeab0d673447b45d3b6636d2eb296d28681  rust-std-1.58.1-mips64-unknown-linux-muslabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
> -sha256  3d2935e0979a7150cc271481f5f06569005ee27f0a7ef7ed1a5393c3e34b1974  rust-std-1.58.1-mips64el-unknown-linux-gnuabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
> -sha256  33078d23ea70ca405b5938e5a2a74fbf4ec7dc41b729e4991e3e01d4c8370028  rust-std-1.58.1-mips64el-unknown-linux-muslabi64.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz.asc
> -sha256  fdade0d00dac3524348041ec915a5a96208c9c1929ce746ab6352d0d2897a3a7  rust-std-1.58.1-mipsel-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz.asc
> -sha256  c747a00ac9a6ee70793002e6db2fbce3b2cd60eda277729468d18369736c6c8e  rust-std-1.58.1-mipsel-unknown-linux-musl.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz.asc
> -sha256  7813f825e5d10aac0ded4b3f785970c69c25464b4edcf9c2b83eff0e55ee95f3  rust-std-1.58.1-powerpc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz.asc
> -sha256  c68d93de3a46ec709788fee2c38a298a261d4254d299299195ab3474b316a59b  rust-std-1.58.1-powerpc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
> -sha256  a85f5f42918e8b140d7093ba49fc46a21625863538c95d2db03f831cc445f025  rust-std-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
> -sha256  2d7276fe261478c377913177dcec3e0aeed84f2c567db0ae8e415efee7bb9ce0  rust-std-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz.asc
> -sha256  e990778d618a213a0825625277505850e222df9ab5b514fec927fbf2d2d21a66  rust-std-1.58.1-s390x-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz.asc
> -sha256  7a7cd002c63179f3f47d64b1140c180986322a7cc0d31de61d7c4728cedacba0  rust-std-1.58.1-sparc64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz.asc
> -sha256  e72367c15906f021f46801652181c917cd3328be022b93bb30506724f7b56256  rust-std-1.58.1-x86_64-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.sha256
> -# Verified using https://static.rust-lang.org/dist/rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz.asc
> -sha256  b0d3e03c9b1eff6e241383913b02653ba80776626ca7c4a93f36c2ad829ba989  rust-std-1.58.1-x86_64-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz.asc
> +sha256  5d18bc384273edbd8a4b6d18104685651fb42d5f07bdf518ef2ec3641269c95d  rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz.asc
> +sha256  94567ff691b46ef3dff64f3866445a278a17b20639e62cdc4b6fcd7aed86cec8  rust-1.60.0-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-mips-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-mips-unknown-linux-gnu.tar.xz.asc
> +sha256  d7643bf1c46765600b7f12e95c68c7bf98c720c9483d79d5d54884ea9c7f97be  rust-1.60.0-mips-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz.asc
> +sha256  7ff0a817d040688235b69c54e42266d5267481900a621012e7f3a4b9f58d0570  rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz.asc
> +sha256  9502d2ceff5d0f9963cdb5dea1e5f83f140132f84df1f588be588d5d151d6637  rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.asc
> +sha256  3e2914c26a60297d3b08fc30eee4fe919bf0a1bc24abb28a4ceb67b9f580e063  rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
> +sha256  2fb5c3cba35f3c1815a24c4f0de1ae34ce6ccfb7fb63cb724070670e8bfceba2  rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
> +sha256  cc20c99079d69bd85e5ddb4990415bcc76293513e3b05e8a0ad1d2efa9b968a4  rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-s390x-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-s390x-unknown-linux-gnu.tar.xz.asc
> +sha256  1af141aa6ea084f8333cca4973488395414a87c2bdd77c1d58994869cf3cde5d  rust-1.60.0-s390x-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz.asc
> +sha256  83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e  rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz.asc
> +sha256  fbc39c2ba2eee9bad7305d73d02a63ada651961be8fd9e0dae520bda5d715c6e  rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz.asc
> +sha256  16e8f0e03e6a025ef1f96cb76890810d4212525de82340d8cbf2f627725f2ec7  rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz.asc
> +sha256  0260245f927a38efccf36c7c652e263b7dd69b80383e09426204bd9592990f9f  rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz.asc
> +sha256  aa40798080243dcdb199a1b7ffd21c056cdc94a76b0a8a339d5a8ad7a64fdc5a  rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz.asc
> +sha256  4c0722a9fa5cafa3c720bec8ab110147a0ccbe6947a4b98284e61fa01c006045  rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz.asc
> +sha256  1429378d662b3bd15b69f426b30678d032ad193d805d7931997943ce8ebe96df  rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
> +sha256  48df1c532e23bda5476d287d9280da5cdbd0ed52f4f2e2af5dc088e816a52123  rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz.asc
> +sha256  84aaa30d90acd0e633c80d54c368d3fcda2b78cbe547e97aeae944765ad93481  rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
> +sha256  b913c45d85fcc1caf7de684127cf00a51430e0096e7c470e18ec76a8eec0b6d7  rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz.asc
> +sha256  3b28be7ae8f669d40fcb01c36e83d9e0107164815c26e080d7cbcf4185b20be2  rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz.asc
> +sha256  5499545cb0799a56f9d974e513234acfddac4aa7c40703b4780022069a6b1a69  rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz.asc
> +sha256  925db12e7103935e90264890afdafd93e8485893effbd3fcd526ee9404683db1  rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz.asc
> +sha256  790288c7060c5dc4aaaf5cc4d2842feeb86a046ce4689023f7def3cf4a091126  rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-musl.tar.xz.asc
> +sha256  d583a74a61c8df3e1fdfc0ce86d0275c6922b584205385e94440b4b16278b74e  rust-std-1.60.0-i586-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz.asc
> +sha256  04a7ed0ab0811e3d4dc86053af1d49a8654bfdd6a1a5c22419e8a2c42c33c382  rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-musl.tar.xz.asc
> +sha256  c7f7f87b0c66e68dc939d4fe906ee61d6bf8f4836b6e54eb02eccc07e805e806  rust-std-1.60.0-i686-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz.asc
> +sha256  0f5ad9aaf415314308b0c5400b4e8300abe0d31233708902dbed0c5ad5bb70cb  rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-musl.tar.xz.asc
> +sha256  7b8c08adf5c9c4eae38b8929c58916e15ab7ada2d4e3438c60d1d778ba1ba0d6  rust-std-1.60.0-mips-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
> +sha256  8cfc02116e2c15d96696332b8260a217f30aa21e95fac0b241a6a1b4252787e4  rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz.asc
> +sha256  ca6096a4a6366c1faed3b71052bff5a3722bf7a186218f05980c4291d48ef31b  rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
> +sha256  636cff37d1fb5474b576d9772d9754aa2d936611363ce658f1b422f444aa1ad7  rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
> +sha256  a7b9428705e1267a22ad778d75f6e9c4ffab31e7f82180585c2bb187548c8ab6  rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz.asc
> +sha256  ff963e0a04a5ae8511f75a5e11f42fce4e14942487ce7b6a4615a3b2ef412407  rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz.asc
> +sha256  75e0212990727dc31e11bc76ddee87c0a94628427c5f18e5c63a3365ca7bfb38  rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz.asc
> +sha256  81138f4b9c8ec6f68fa81f10ec0da5962a7bb433a85009fe970ec3bb6596b1af  rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.asc
> +sha256  b390bec6ce697a6347fb6c5dd70bb23f562cc9945ed215f10fd08dbc1a38293f  rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
> +sha256  3bfce36ef03027574f2f1e17d24b172bd086a0a3adbd8944955d18ad9919a78e  rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
> +sha256  9a1d788ed9d0b456ea6974b6468199455d82e437e56025de2a1d4031e9f67174  rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz.asc
> +sha256  3d44442c5dc02fbdc4f71dd4f76dac714fa69a8021a3350b3919439a7ac548ac  rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz.asc
> +sha256  83039cd55d4ab7606d81f0e199f042e011cbe55b07b252913543c339c6c2f434  rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz.asc
> +sha256  6fb8ee3650beb10836ae48a9aaa535473e64eaca20695b88113267aea3c7557f  rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz.sha256
> +# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz.asc
> +sha256  0801252694e49eca069003f311e23e124a6dee3557e613133dc2e3cab7bed64d  rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz
>   # Locally generated
>   sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index d4cb8f50ea..7cfe5cd6df 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RUST_BIN_VERSION = 1.58.1
> +RUST_BIN_VERSION = 1.60.0
>   RUST_BIN_SITE = https://static.rust-lang.org/dist
>   RUST_BIN_LICENSE = Apache-2.0 or MIT
>   RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> diff --git a/package/rust/rust.hash b/package/rust/rust.hash
> index 7eb8f59603..81f366e564 100644
> --- a/package/rust/rust.hash
> +++ b/package/rust/rust.hash
> @@ -1,6 +1,6 @@
>   # From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
>   # Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
> -sha256  2b3643a48e7087053b0268971ec4154350342508922a8acb0707aaf94deb4469  rustc-1.58.1-src.tar.xz
> +sha256  a025876deccbcb3f288d8e02623ea321f94623f31305d3c5c6f17855bb9685db  rustc-1.60.0-src.tar.xz
>   # Locally generated
>   sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index cd8c87b68d..6ac75f39c4 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RUST_VERSION = 1.58.1
> +RUST_VERSION = 1.60.0
>   RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
>   RUST_SITE = https://static.rust-lang.org/dist
>   RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
