Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9109C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 10:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCE341322;
	Mon,  3 Feb 2025 10:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM2ZAglFWfaF; Mon,  3 Feb 2025 10:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C65413AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C65413AA;
	Mon,  3 Feb 2025 10:38:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 124A21A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 10:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FDBC405DF
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 10:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFGwfXbpDx6N for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 10:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5792440577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5792440577
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5792440577
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 10:38:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1tdXKX2dRb-00H3YX; Mon, 03
 Feb 2025 11:38:38 +0100
Message-ID: <536f4074-7be7-4c4a-aadf-4d9bf0a028f6@gmx.de>
Date: Mon, 3 Feb 2025 11:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org,
 Christian Stewart <christian@aperture.us>
References: <20250131212420.5956C8678A@busybox.osuosl.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250131212420.5956C8678A@busybox.osuosl.org>
X-Provags-ID: V03:K1:sTHfH26vJZlkgzM73ufWSNoioUfWVUL67sqzr4W0sQ0LUbKVnX+
 3H7/1kteU0bwUx2kWwpQfOAvMlidnqFNPn+SOn1r0N8Ibm7fjtGKdVav1rr3hj3krs1Aays
 YukzUNecRjIgpbreLo9WQCR6orMli0PwJ/mkAV+7ukKQn4h58G02f7h6Uu2Tkssf8WzPNxl
 5+TgGdMEEul1JcB8yQfkQ==
UI-OutboundReport: notjunk:1;M01:P0:9IdzTdZ2r9E=;Uiu5rOYSc7WfrvLTLBUrdlQGWwJ
 Qr2xsQuG9juAUS0I1O7iv5vLVxYEqO8ot3fE80IImiPAuD/0Mt3XQXUwLidlRuycYS9fTR2XD
 /zN8owzH1JxiBijXCsMFfKG/n+fpbDry4NGVUzjAcEMjAWp+5T1WC1yki/4ufJ5h6odbwyawq
 sMIzJEjsUhx4Ov3p1c3aDOvzovM8e+hFBkvwuLlAYv8/V/wJfN53ce65CTsKoq6Q+VPiDTyDE
 gx6N5XWMXzRrpOMsRAdEtsNTfUrtYhMmxa7j6xPSW8iiU8MDuMjvESZd94zJUqsHaUScfSNim
 aQDoUDDLPCl4Xxe/nroAernPj3onZw6YydeA1cShjEfXfJfEcalD0wZPt1OWMqFt5QY2d+JSr
 gNzox8Tahv8U2Lk/kljj4afDhlMrBnUtvfufNs5EKYM0qEehNZyG/RaJpML0+ZQSBe4gzTrzp
 7P96osEZPy/F1Iavx7XIqB1Vj2VaaMTiTrNyOrh7AE+BZvoHV6PRKghcv52j6FV+KLbDvSCmM
 FR6jzHHwdcFJGjSxUaTAAUTgia5gcvl87eiFHg+JIJdDyLWn2PPER7R6R1bj+20X1gWV2IM0L
 AndhYUQOmwBbTjaOmylJzSY+GgXfG6Hl5rVAMP/CAbzbzqZk1y6O0XR2du5Uat9/99SCmK4B8
 t1TYpvRU62CGBkF7Ijwu4cUM+6gCakGwbTvHAOSGzr58iNz5aftyelDX6voA6Jnzb6h+dqVb1
 C9x+EESsT7ESXXB3JEY1VrW84+xCrAoN566NmnfNlPjd6d99HYaFCp35HRdP01doU3hMDaNrj
 a6KgQ60kqnnbGYB+/mIPYPrrJD9KoMBPEsS4bD+VzAPYEXuDnWQ3Amq51jut0HzYxYfUEO7Fq
 FPzKQtJvtUlYZfXu8lgmOF4UXiqLzcsSufQ5IkSeVwo6RAZpToKxxALHiI5urtkDc7N/SpA4+
 I11TmzVhW5gu5YQAP974EpJ03w/S5UB3qUMiMIoqLQLhiundcwWNcPBIYDgSWvjh72RWH7Gbg
 YBlURAedUemKoXtIgxZqZMTk/feOT8dKI3zrmt0tHsXaFQsRzAyx9cSnYNExu8mrFQlTP+JOI
 6lcbwlftqmedjpTiews2kVlzOqm1FMN8LFBOephi3nDF2I4wEwskl/OJUwGwIHWFfycxHucEV
 M9WJuzw1bIP6tZAXEd3k6PiR6gZZGHe99j6cKWLITTlcl0lmve5cPFxbLpVlPP0vssmxNLSdC
 yb/T+rG/1nYeIioVdH1eBzdpwXeZ2Co46t6bclSzcjGEnxxwg7Vlupl/TSaZZtUwkOx8cMJXf
 pw0r1EDOqM/VZJeJiLKDyaVKdIuXRpo0KSExI7vxP4eiKk7VOO750kd1qydD5AZTi4sy+H9QX
 wF9iO2Q4+EGO+JjY2oozrF2gKmxZis+ZwNr60=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738579118; x=1739183918; i=fiona.klute@gmx.de;
 bh=4bDid61sTEKMSa6Vv+uVm+lziWNtRZsKhr3jGOAa2X4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cGOCadQ9AWsaXfGtLYdWuGS9+v5WbEI1yvy0vk9B9Sfg4HbgQF4rEEArZK/WJR1r
 Hb+J0bt/5Xj5uHFRzbJCwIE6hrcsrrDFo33VWnyeyK2gtQiu8ifqxkTYFwm18liwK
 K21VYY1vDZClwz9ACUa1DRJo8TJF1FSzaW61i0mRMrCRmxZL2agkDWs9DgQ6vsfsH
 uOUO8A2pbD2iDgGqMRoUm7MBmWG3lT8nEekKD2Mi9lZlnirGagsg0623rb0d3iwhe
 nvBFJSQN0yVu83HtI4MhFlj0uazwsJrHWq6aYqOjK69UptsK417ZdIi3RquKkCdxE
 DpaPcZ+DOkDe7qQ2og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=cGOCadQ9
Subject: Re: [Buildroot] [git commit] package/containerd: bump to version
 v2.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

containerd fails to build for me after this update, with the error
message saying "ld" cannot be found, log below. I notice that
host/aarch64-buildroot-linux-musl/bin/ is absent from the configured
path, and CC and CXX are set in environment, but not LD.

Any ideas?

Best regards,
Fiona

 >>> containerd 2.0.2 Building
cd
/home/fiona/development/buildroot/output/revpi/build/containerd-2.0.2;
GO111MODULE=on GOFLAGS=-mod=vendor
GOROOT="/home/fiona/development/buildroot/output/revpi/host/lib/go"
GOPATH="/home/fiona/development/buildroot/output/revpi/host/share/go-path"
GOCACHE="/home/fiona/development/buildroot/output/revpi/host/share/go-cache"
GOMODCACHE="/home/fiona/development/buildroot/output/revpi/host/share/go-path/pkg/mod"
GOPROXY=off GOTOOLCHAIN=local
PATH="/home/fiona/development/buildroot/output/revpi/host/bin:/home/fiona/development/buildroot/output/revpi/host/sbin:/home/fiona/local/bin:/home/fiona/.local/bin:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
GOBIN= CGO_ENABLED=1 GOOS="linux" GOARCH=arm64
CC="/home/fiona/development/buildroot/output/revpi/host/bin/aarch64-buildroot-linux-musl-gcc"
CXX="/home/fiona/development/buildroot/output/revpi/host/bin/aarch64-buildroot-linux-musl-g++"
CGO_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -O2 -g0 " CGO_CXXFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 " CGO_LDFLAGS="
-ztext"
GOTOOLDIR="/home/fiona/development/buildroot/output/revpi/host/lib/go/pkg/tool/linux_arm64"
  /home/fiona/development/buildroot/output/revpi/host/bin/go build -v
-ldflags "-X github.com/containerd/containerd/v2/version.Version=2.0.2"
-modcacherw -tags "no_aufs seccomp no_btrfs no_devmapper no_zfs no_cri"
-trimpath -p 17 -buildvcs=false -o
/home/fiona/development/buildroot/output/revpi/build/containerd-2.0.2/bin/containerd
github.com/containerd/containerd/v2/cmd/containerd
# github.com/containerd/containerd/v2/cmd/containerd
/home/fiona/development/buildroot/output/revpi/host/lib/go/pkg/tool/linux_amd64/link:
running
/home/fiona/development/buildroot/output/revpi/host/bin/aarch64-buildroot-linux-musl-gcc
failed: exit status 1
/home/fiona/development/buildroot/output/revpi/host/bin/aarch64-buildroot-linux-musl-gcc
-Wl,-z,now -Wl,-z,nocopyreloc -fuse-ld=gold -o $WORK/b001/exe/a.out
-rdynamic /tmp/go-link-4163522443/go.o /tmp/go-link-4163522443/000000.o
/tmp/go-link-4163522443/000001.o /tmp/go-link-4163522443/000002.o
/tmp/go-link-4163522443/000003.o /tmp/go-link-4163522443/000004.o
/tmp/go-link-4163522443/000005.o /tmp/go-link-4163522443/000006.o
/tmp/go-link-4163522443/000007.o /tmp/go-link-4163522443/000008.o
/tmp/go-link-4163522443/000009.o /tmp/go-link-4163522443/000010.o
/tmp/go-link-4163522443/000011.o /tmp/go-link-4163522443/000012.o
/tmp/go-link-4163522443/000013.o /tmp/go-link-4163522443/000014.o
/tmp/go-link-4163522443/000015.o /tmp/go-link-4163522443/000016.o
/tmp/go-link-4163522443/000017.o /tmp/go-link-4163522443/000018.o
/tmp/go-link-4163522443/000019.o /tmp/go-link-4163522443/000020.o
/tmp/go-link-4163522443/000021.o /tmp/go-link-4163522443/000022.o
/tmp/go-link-4163522443/000023.o /tmp/go-link-4163522443/000024.o -ztext
-lresolv -ztext -lpthread -ztext -ldl -ztext
collect2: fatal error: cannot find 'ld'
compilation terminated.

make[1]: *** [package/pkg-generic.mk:289:
/home/fiona/development/buildroot/output/revpi/build/containerd-2.0.2/.stamp_built]
Error 1
make: *** [Makefile:23: _all] Error 2


Am 31.01.25 um 22:19 schrieb Peter Korsgaard:
> commit: https://git.buildroot.net/buildroot/commit/?id=9c2e146ca9a21f0de3c97981113a57c58c3a5bd5
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Major release v1 -> v2.
>
> Dropped patch as it is no longer necessary:
> https://github.com/containerd/containerd/pull/8924
>
> containerd-shim and containerd-shim-runc-v1 were removed.
>
> https://github.com/containerd/containerd/releases/tag/v2.0.2
>
> Signed-off-by: Christian Stewart <christian@aperture.us>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 6 ++----
>   2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index e3f8434192..4ec78897d9 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  393bfde8ca1766a0bca3441e18eddc3f5a5c8d97ef676bde0d6c9903e1b0ec0c  containerd-1.7.23-go2.tar.gz
> +sha256  472747a7a6b360a0864bab0ee00a8a6f51da5795171e6a60ab17aa80cbd850a2  containerd-2.0.2-go2.tar.gz
>   sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
> diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
> index 88b53caf51..ee07c22495 100644
> --- a/package/containerd/containerd.mk
> +++ b/package/containerd/containerd.mk
> @@ -4,21 +4,19 @@
>   #
>   ################################################################################
>
> -CONTAINERD_VERSION = 1.7.23
> +CONTAINERD_VERSION = 2.0.2
>   CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
>   CONTAINERD_LICENSE = Apache-2.0
>   CONTAINERD_LICENSE_FILES = LICENSE
>   CONTAINERD_CPE_ID_VENDOR = linuxfoundation
>
> -CONTAINERD_GOMOD = github.com/containerd/containerd
> +CONTAINERD_GOMOD = github.com/containerd/containerd/v2
>
>   CONTAINERD_LDFLAGS = \
>   	-X $(CONTAINERD_GOMOD)/version.Version=$(CONTAINERD_VERSION)
>
>   CONTAINERD_BUILD_TARGETS = \
>   	cmd/containerd \
> -	cmd/containerd-shim \
> -	cmd/containerd-shim-runc-v1 \
>   	cmd/containerd-shim-runc-v2 \
>   	cmd/ctr
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
