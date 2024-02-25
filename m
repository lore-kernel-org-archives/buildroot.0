Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3E8C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 19:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B682405A5;
	Sun, 25 Feb 2024 19:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id no5wP4HYNYsK; Sun, 25 Feb 2024 19:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01038405B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01038405B5;
	Sun, 25 Feb 2024 19:24:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B4B91BF267
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 19:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 055E56070E
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 19:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7TcnBSSiAU6 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 19:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 311EE6070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311EE6070D
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 311EE6070D
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 19:23:56 +0000 (UTC)
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eK6KrMrRv0554eK6KrU886; Sun, 25 Feb 2024 20:23:53 +0100
Message-ID: <d643e11f-81d7-4bd4-9891-beb2e648d2c2@benettiengineering.com>
Date: Sun, 25 Feb 2024 20:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240225171149.1447606-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240225171149.1447606-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfBwti7BIjAaABMvTBWc4LzLCIV0HppkvhvgYtIhBsi3gKQ4tM2s+K7CjOqDIt1pSOBneVSUNL4bepPaGId7/CHhzQ4S9UnRQMjzuMZxjoed+QjMccp6d
 NXNWFQYYQ4StEbOaEdqegioFpYVyAFJpLd9rgvOTMfe+gmkm/MUN6y+s/Wf9myUvHb+zyYFh3DNsVbfcLA9MVmUjCTSmEmkrsNaarloQ3bNc77N3Zrf3lhOC
 MpmxGDo1ExuxCmPpsvL4QmNWD974kVQQsRrh7IzSwasH+zX62goeuDu7NjvHTi67FnZVaSnsofv018NVCCcbOg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708889033; bh=8CYTaneQVKue6kah2t3AAc9uCQOA9TTm49jZ/kBAcDQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ED08qwbor4BLsE0DzrT8HtuBU1EA2BoFIycVPgErdGAXfaa+8Fp8L66SiMgnz5E4/
 9Dx+pM6UzJy6/2aPsU84emkSYDXIBLY7goLewEC4Iedep1OxFGXPVMczpOlpitzubj
 Ab8Bgpp3Qgj7TDIOiF2orlDLuW4IE9l0UpcH9sP+PBWBhjcEO9f30bq4XQinqSh827
 wAMa72Z1dHiWJU08gPSDcTO4V91fyYdNbMzmHXHhuD/L3t7/mjCkaByRnvJOZBkwJ3
 W1dtxPbIeA8EpF/AxCQBdecc2k2IK3qioNN7CVgDMIR6bTLBz+jXy1BM3fjJPV9asa
 1FTw8BbbR7iwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ED08qwbo
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: disable utest
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

thanks a lot for the patch,

On 25/02/24 18:11, Fabrice Fontaine wrote:
> Disable utest to avoid the following build failure raised since the
> addition of the package in commit
> b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is found:
> 
> ../utest/tracefs-utest.c: In function 'test_uprobes_instance':
> ../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
>   2492 |         char self[PATH_MAX] = { 0 };
>        |                   ^~~~~~~~
> 
> Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
>   - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   .../0002-meson-add-utest-option.patch         | 40 +++++++++++++++++++
>   package/libtracefs/libtracefs.mk              |  3 +-
>   2 files changed, 42 insertions(+), 1 deletion(-)
>   create mode 100644 package/libtracefs/0002-meson-add-utest-option.patch
> 
> diff --git a/package/libtracefs/0002-meson-add-utest-option.patch b/package/libtracefs/0002-meson-add-utest-option.patch
> new file mode 100644
> index 0000000000..90f73a7ea0
> --- /dev/null
> +++ b/package/libtracefs/0002-meson-add-utest-option.patch
> @@ -0,0 +1,40 @@
> +From 7a09e2d414959075e2177c50ef1d4bf606b9ccdc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 15 Feb 2024 21:20:29 +0100
> +Subject: [PATCH] meson: add utest option
> +
> +Add utest option to allow the user to disable utest
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/rostedt/libtracefs/pull/2

For this project you have to git send-email the patch to:
linux-trace-devel@vger.kernel.org

as documented in:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tree/README#n45

Can you do that? Otherwise I can send the patch.

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> +---
> + meson.build       | 2 +-
> + meson_options.txt | 2 ++
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3156f1c..d4cfd53 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -35,7 +35,7 @@ incdir = include_directories(['include'])
> +
> + subdir('src')
> + subdir('include')
> +-if cunit_dep.found()
> ++if get_option('utest') and cunit_dep.found()
> +     subdir('utest')
> + endif
> + if get_option('samples')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 8450992..a48efea 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -18,3 +18,5 @@ option('doc', type : 'boolean', value: true,
> +        description : 'produce documentation')
> + option('samples', type : 'boolean', value: true,
> +        description : 'build samples')
> ++option('utest', type : 'boolean', value: true,
> ++       description : 'build utest')
> +--
> +2.43.0
> +
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> index ed45fcbc50..21cb8e84e3 100644
> --- a/package/libtracefs/libtracefs.mk
> +++ b/package/libtracefs/libtracefs.mk
> @@ -14,6 +14,7 @@ LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
>   
>   LIBTRACEFS_CONF_OPTS = \
>   	-Ddoc=false \
> -	-Dsamples=false
> +	-Dsamples=false \
> +	-Dutest=false
>   
>   $(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
