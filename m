Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4012BC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA80402C4;
	Sat,  6 May 2023 16:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA80402C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXItaRAt0RSQ; Sat,  6 May 2023 16:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246E241F4B;
	Sat,  6 May 2023 16:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246E241F4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 577BD1BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DD994272A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD994272A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HgeFpXXRT6J for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:12:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E88C242028
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E88C242028
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:12:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3D313B0056B;
 Sat,  6 May 2023 18:12:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:12:04 +0200
Date: Sat, 6 May 2023 18:12:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161204.GU252090@scaer>
References: <20230504072644.3448038-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504072644.3448038-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389528;
 bh=WP4cuXlBfMdMK3riZz+9pS311E30W8YxfB78oRo5gv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vaft8lmESMhAW2X+X8SpL5v5n0HgLHf/CWzDpDY0nwYeYzm/JzODBvex48PXjF1hd
 jlMVgjw8Dn+eVGAM4zmWJYyeKHkJMDBTxoKLCqk3+QQRXQw+Ccqq8rPsyrDdWB9ngl
 cZqiCAN5QaWJtePGTAft9RAiJM9JXlbmAsDbNoqzWSo1Yhb+rg1trcboCv7k4tvkhh
 SQ+/UHyzhK2Wswf32uLvTJfSBFwiGrdEmGgjraVEKVbZaR/3CS5fJ4WTzT+1HPtURy
 X2pnssa6OQLKRRs9s3YMP47dQNjSowIp7XBbtwtwaesW6yhmBqxhlkicWUAjrQ/kfI
 PNa2Fbcq4SHNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vaft8lmE
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gocryptfs: bump version to
 2.3.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-05-04 00:26 -0700, Christian Stewart via buildroot spake thusly:
> Drop patch merged upstream fixing jacobsa-crypto on riscv.
> 
> https://github.com/rfjakob/gocryptfs/releases/tag/v2.3.2
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-fix-jacobsa-crypto-build-on-riscv64.patch | 186 ------------------
>  package/gocryptfs/gocryptfs.hash              |   2 +-
>  package/gocryptfs/gocryptfs.mk                |   2 +-
>  3 files changed, 2 insertions(+), 188 deletions(-)
>  delete mode 100644 package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
> 
> diff --git a/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
> deleted file mode 100644
> index 0074932fba..0000000000
> --- a/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
> +++ /dev/null
> @@ -1,186 +0,0 @@
> -From e72d34ef2c87e5c9ffd49c98b651641f48d89c24 Mon Sep 17 00:00:00 2001
> -From: Christian Stewart <christian@paral.in>
> -Date: Sat, 25 Jun 2022 14:57:38 -0700
> -Subject: [PATCH] go.mod: fix jacobsa/crypto build on riscv64
> -
> -Replace dependency jacobsa/crypto with a fork with support for riscv64.
> -
> -Issue: https://github.com/rfjakob/gocryptfs/issues/666
> -
> -Upstream PR: https://github.com/jacobsa/crypto/issues/13
> -
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - go.mod                                        | 15 ++++---
> - go.sum                                        | 16 +++-----
> - .../jacobsa/crypto/cmac/hash_generic.go       | 40 +++++++++++++++++++
> - vendor/modules.txt                            | 16 ++------
> - 4 files changed, 59 insertions(+), 28 deletions(-)
> - create mode 100644 vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
> -
> -diff --git a/go.mod b/go.mod
> -index 754a667..5103029 100644
> ---- a/go.mod
> -+++ b/go.mod
> -@@ -2,19 +2,22 @@ module github.com/rfjakob/gocryptfs/v2
> - 
> - go 1.16
> - 
> -+// Fixes build against risc-v
> -+// See: https://github.com/jacobsa/crypto/issues/13
> -+replace github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93 // buildroot-1
> -+
> -+// Prevent x/sys version from changing and polluting vendor/
> -+// Pin it to the current version in the original go.mod.
> -+replace golang.org/x/sys => golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
> -+
> - require (
> - 	github.com/hanwen/go-fuse/v2 v2.1.1-0.20211219085202-934a183ed914
> - 	github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
> --	github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd // indirect
> --	github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff // indirect
> --	github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11 // indirect
> --	github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb // indirect
> - 	github.com/pkg/xattr v0.4.3
> - 	github.com/rfjakob/eme v1.1.2
> - 	github.com/sabhiram/go-gitignore v0.0.0-20201211210132-54b8a0bf510f
> - 	github.com/spf13/pflag v1.0.5
> - 	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
> --	golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d // indirect
> --	golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
> -+	golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a
> - 	golang.org/x/term v0.0.0-20220722155259-a9ba230a4035
> - )
> -diff --git a/go.sum b/go.sum
> -index 4167388..71826e9 100644
> ---- a/go.sum
> -+++ b/go.sum
> -@@ -1,9 +1,9 @@
> -+github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93 h1:awSzmXfGWzvmRmrU1oSHqUdpxNcVPRMqv0rytbSA8kA=
> -+github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93/go.mod h1:SHG0nzlQikn4UxNIXqEKd2hvJM2tRIrdr1FfOrF+/wY=
> - github.com/davecgh/go-spew v1.1.0 h1:ZDRjVQ15GmhC3fiQ8ni8+OwkZQO4DARzQgrnXU1Liz8=
> - github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
> - github.com/hanwen/go-fuse/v2 v2.1.1-0.20211219085202-934a183ed914 h1:hGXMxS1wTE4y+f7iBqFArrJ6X8QozHnEdnVzGZI9Ywc=
> - github.com/hanwen/go-fuse/v2 v2.1.1-0.20211219085202-934a183ed914/go.mod h1:B1nGE/6RBFyBRC1RRnf23UpwCdyJ31eukw34oAKukAc=
> --github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 h1:YuDUUFNM21CAbyPOpOP8BicaTD/0klJEKt5p8yuw+uY=
> --github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115/go.mod h1:LadVJg0XuawGk+8L1rYnIED8451UyNxEMdTWCEt5kmU=
> - github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd h1:9GCSedGjMcLZCrusBZuo4tyKLpKUPenUUqi34AkuFmA=
> - github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd/go.mod h1:TlmyIZDpGmwRoTWiakdr+HA1Tukze6C6XbRVidYq02M=
> - github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff h1:2xRHTvkpJ5zJmglXLRqHiZQNjUoOkhUyhTAhEQvPAWw=
> -@@ -30,21 +30,17 @@ github.com/stretchr/testify v1.6.1/go.mod h1:6Fq8oRcR53rry900zMqJjRRixrwX3KX962/
> - golang.org/x/crypto v0.0.0-20210817164053-32db794688a5 h1:HWj/xjIHfjYU5nVXpTM0s39J9CbLn7Cc5a7IC5rwsMQ=
> - golang.org/x/crypto v0.0.0-20210817164053-32db794688a5/go.mod h1:GvvjBRRGRdwPK5ydBHafDWAxML/pGHZbMvKqRZ5+Abc=
> - golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod h1:m0MpNAwzfU5UDzcl9v0D8zg8gWTRqZa9RBIspLL5mdg=
> --golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d h1:LO7XpTYMwTqxjLcGWPijK3vRXg1aWdlNOVOHRq45d7c=
> --golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d/go.mod h1:9nx3DQGgdP8bBQD5qxJ1jj9UTztislL4KSBs9R2vV5Y=
> -+golang.org/x/net v0.0.0-20220708220712-1185a9018129 h1:vucSRfWwTsoXro7P+3Cjlr6flUMtzCwzlvkxEQtHHB0=
> -+golang.org/x/net v0.0.0-20220708220712-1185a9018129/go.mod h1:XRhObCWvk6IyKnWLug+ECip1KBveYUHfp+8e9klMJ9c=
> - golang.org/x/sync v0.0.0-20201207232520-09787c993a3a/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
> --golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
> --golang.org/x/sys v0.0.0-20201101102859-da207088b7d1/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
> --golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
> --golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
> --golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
> - golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2 h1:c8PlLMqBbOHoqtjteWm5/kbe6rNY2pbRfbIMVnepueo=
> - golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
> - golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod h1:bj7SfCRtBDWHUb9snDiAeCFNEtKQo2Wmx5Cou7ajbmo=
> -+golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod h1:jbD1KX2456YbFQfuXm/mYQcufACuNUgVhRMnK/tPxf8=
> - golang.org/x/term v0.0.0-20220722155259-a9ba230a4035 h1:Q5284mrmYTpACcm+eAKjKJH48BBwSyfJqmmGDTtT8Vc=
> - golang.org/x/term v0.0.0-20220722155259-a9ba230a4035/go.mod h1:jbD1KX2456YbFQfuXm/mYQcufACuNUgVhRMnK/tPxf8=
> - golang.org/x/text v0.3.3/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
> --golang.org/x/text v0.3.6/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
> -+golang.org/x/text v0.3.7/go.mod h1:u+2+/6zg+i71rQMx5EYifcz6MCKuco9NR6JIITiCfzQ=
> - golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
> - gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
> - gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c h1:dUUwHk2QECo/6vqA44rthZ8ie2QXMNeKRTHCNY2nXvo=
> -diff --git a/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go b/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
> -new file mode 100644
> -index 0000000..235e3fc
> ---- /dev/null
> -+++ b/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
> -@@ -0,0 +1,40 @@
> -+// Copyright 2012 Aaron Jacobs. All Rights Reserved.
> -+// Author: aaronjjacobs@gmail.com (Aaron Jacobs)
> -+//
> -+// Licensed under the Apache License, Version 2.0 (the "License");
> -+// you may not use this file except in compliance with the License.
> -+// You may obtain a copy of the License at
> -+//
> -+//     http://www.apache.org/licenses/LICENSE-2.0
> -+//
> -+// Unless required by applicable law or agreed to in writing, software
> -+// distributed under the License is distributed on an "AS IS" BASIS,
> -+// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> -+// See the License for the specific language governing permissions and
> -+// limitations under the License.
> -+
> -+// +build riscv64
> -+
> -+// This code doesn't require that it's safe to perform unaligned word-sized loads, but has a poor performance.
> -+
> -+package cmac
> -+
> -+import (
> -+	"unsafe"
> -+)
> -+
> -+// XOR the blockSize bytes starting at a and b, writing the result over dst.
> -+func xorBlock(
> -+	dstPtr unsafe.Pointer,
> -+	aPtr unsafe.Pointer,
> -+	bPtr unsafe.Pointer) {
> -+	// Convert.
> -+	a := (*[blockSize]byte)(aPtr)
> -+	b := (*[blockSize]byte)(bPtr)
> -+	dst := (*[blockSize]byte)(dstPtr)
> -+
> -+	// Compute.
> -+	for i := 0; i < blockSize; i++ {
> -+		dst[i] = a[i] ^ b[i]
> -+	}
> -+}
> -diff --git a/vendor/modules.txt b/vendor/modules.txt
> -index 0e97e42..634c079 100644
> ---- a/vendor/modules.txt
> -+++ b/vendor/modules.txt
> -@@ -5,19 +5,11 @@ github.com/hanwen/go-fuse/v2/fuse
> - github.com/hanwen/go-fuse/v2/internal
> - github.com/hanwen/go-fuse/v2/internal/utimens
> - github.com/hanwen/go-fuse/v2/splice
> --# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
> -+# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 => github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93
> - ## explicit
> - github.com/jacobsa/crypto/cmac
> - github.com/jacobsa/crypto/common
> - github.com/jacobsa/crypto/siv
> --# github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd
> --## explicit
> --# github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff
> --## explicit
> --# github.com/jacobsa/ogletest v0.0.0-20170503003838-80d50a735a11
> --## explicit
> --# github.com/jacobsa/reqtrace v0.0.0-20150505043853-245c9e0234cb
> --## explicit
> - # github.com/pkg/xattr v0.4.3
> - ## explicit
> - github.com/pkg/xattr
> -@@ -39,9 +31,7 @@ golang.org/x/crypto/internal/subtle
> - golang.org/x/crypto/pbkdf2
> - golang.org/x/crypto/poly1305
> - golang.org/x/crypto/scrypt
> --# golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d
> --## explicit
> --# golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
> -+# golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a => golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
> - ## explicit
> - golang.org/x/sys/cpu
> - golang.org/x/sys/internal/unsafeheader
> -@@ -51,3 +41,5 @@ golang.org/x/sys/windows
> - # golang.org/x/term v0.0.0-20220722155259-a9ba230a4035
> - ## explicit
> - golang.org/x/term
> -+# github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93
> -+# golang.org/x/sys => golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
> --- 
> -2.38.1
> -
> diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
> index 28965a0648..e8691607b1 100644
> --- a/package/gocryptfs/gocryptfs.hash
> +++ b/package/gocryptfs/gocryptfs.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  bfc98c18e44a2ca24a0e1472b6d9bb96e6072d7fb5651616515d2e7117b8fed9  gocryptfs-2.3.tar.gz
> +sha256  7ad6138eb49d3a0481211ec4d4828f35e269f234433b57a4e4ea7cf6e63ba887  gocryptfs-2.3.2.tar.gz
>  sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
> diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
> index 077597e7e8..6d84acc23b 100644
> --- a/package/gocryptfs/gocryptfs.mk
> +++ b/package/gocryptfs/gocryptfs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GOCRYPTFS_VERSION = 2.3
> +GOCRYPTFS_VERSION = 2.3.2
>  GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
>  GOCRYPTFS_LICENSE = MIT
>  GOCRYPTFS_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
