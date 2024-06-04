Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE5C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 18:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5484E417D1;
	Tue,  4 Jun 2024 18:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NODnullZeaKU; Tue,  4 Jun 2024 18:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57650416CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57650416CC;
	Tue,  4 Jun 2024 18:06:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153C41BF831
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0189240644
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijZpoEKdS0XH for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 18:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06D64404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D64404D1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06D64404D1
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 18:06:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.83]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1sSvX50Z9I-00rLTE; Tue, 04
 Jun 2024 20:01:47 +0200
Message-ID: <a71cb6c0-3159-4b0e-a10d-038461480ffc@gmx.de>
Date: Tue, 4 Jun 2024 20:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Khem Raj <raj.khem@gmail.com>
References: <20240426215144.1107186-1-fiona.klute@gmx.de>
 <Zl9VCm-vH0yAi0Jc@landeda>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Zl9VCm-vH0yAi0Jc@landeda>
X-Provags-ID: V03:K1:dy/LAV7clfcMqODGirrFIFWWrhgA629Ttdps/tfh0jU2zB7uxOI
 BvW0Lse4QVkAzMpWN3oM94QUAn/Ngl+wFVPyQv5Eg644LBVNFdZm7swm2o5Lry77MHv1hhQ
 jHEpgm/CBUlLZNStpOGfxLAMe36em6wxd1y7sX8lhQflwEcXwFodShRYbednvEwHUEgTN2N
 g6ilkz88wqCsHmPUOqakA==
UI-OutboundReport: notjunk:1;M01:P0:cRq+dhdA3jc=;RLqQj2u2WIBS3Ukf+OEMPpbPH4c
 F/zjXCKbzlS5yrs8KijQI5fii9Xwfiood31sWCb062mJU1ndB0WE5EAZK+oc8C0KL0k0N7Eju
 9x1EDmkaY0QJKl4Bw2peV9eemVmBeW4aDQNUdPNX5lzAqw/9QJov5dthfcd4+PGjQdwv4HPYe
 kDEhSdIYtCAHGDn0hzzmYdhp+a8rBIXyyJ4yXW5Y5C0BflrQfH4YyhmAPVo6lTNWUcXVyVvN6
 7/vfbsuUemDxMypjBXtAw94rN5QyOajIy3dXUx7xZiVD1zhJ9Sf/sRVOOunZLc+zBA3ffgSZI
 64W9t5KlESHTPaF0BOLuaWy1Cht0W1Rp/SlC+MmwzlYCfkhfdwy93tZJtxs3dJh7lLtZlfP4j
 PHveIkA4YNezu5gcjWvJz5zYIIJ4hHBPTJhVZM663ZDRt2WCftdDvSyopfWg8XdkToW2RLjoE
 JwB84UIg18sJYw6+oajleENJel8+i/ZlQPGHBkAMElgxolmt6Y1ruTk+j6CQ13sTf5KYdFQgJ
 mlL9ioBcjzXnDy3qZqJwwjhlYHtApbJH1r0ymM1sFjoAvRszoR4A4BHbiTXddBdJ3ONLFRm0P
 VuqH7uyKiw0z4tiZv/Kf/VFlzgwKgnKDWzRkX/fgfqVAd8ojjIj1fwvkSHIYk9+kZZpB3/5UX
 HQC8qNo7aMkNTFnKwXAGNDQJ+G2pIaxk3CFfVKm6VXWeYdLTT8f17AolWCbwUEZ61HoOBeJ1v
 xkVnR85X1y7+7fZPgp32AZnHS9GnUACzdAYV8Q5gyBQ0c584I5KO7UiwshTY0heIPO+MTPl1p
 9ugfcgOgSJ/jq0+ScbnagV6Cr2XxiMnvulJEw7UVDJ/3c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717524412; x=1718129212; i=fiona.klute@gmx.de;
 bh=ASh6DFnKmfu/mnxEciZ9syD+qqJDTcPs0576UG/Wmj0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=n0Vxk2SGqTQZsuEnoBFSHZ1a9l4pmjrz2eC795IJKWxVBH04TRpq60AN59KpHSO7
 hMrfnHdurMCG7C86XWeNXOp0RFKNImYLTdDl8U+gwRKttFvORUFCXDsexY1r/ZXPq
 FGSww1omaaf1OuO7yRdnWcdKQ+N0X+67786EahSTOpvV+QXEqwPT5WweE1WfivYAv
 73dEz9LClQR9NVroVnhtTyQHjJoemgFFTg8beqRZZp61VTpNYMcEKT8j04vhQv+f0
 FdWrY7A/EvdcJ2Y814B6QbipG+DCvuMFcDyPlIS92awzr+6B1Dz4o9ee0e/p1MI73
 HUJqiNXMQYjBrRWLXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=n0Vxk2SG
Subject: Re: [Buildroot] [PATCH 1/1] package/kmod: fix build with musl
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.06.24 um 19:55 schrieb Yann E. MORIN:
> Fiona, All,
>
> On 2024-04-26 23:51 +0200, Fiona Klute via buildroot spake thusly:
>> From: Fiona Klute <fiona.klute+wiwa@gmx.de>
>> Patch from upstream PR still being discussed:
>> https://github.com/kmod-project/kmod/pull/32
>
> Thanks for this pointer. It should have been added in the bundled patch
> itself (see below).
>
> I was holding off on that patch of yours, because there has been no
> resolution on that upstream PR (adding Khem in Cc so he can maybe have
> a look back at it ;-) ).
>
> But following your comment on bug #16093, I decided to look again. I
> just looked at the discussion in more details, and all the discussion
> is basically just about how to name the symbol. So let's cary this patch
> for now...
>
>> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
>> ---
>>   ...able-implementation-for-basename-API.patch | 131 ++++++++++++++++++
>
>      # ./utils/docker-run make check-package
>      package/kmod/0002-Use-portable-implementation-for-basename-API.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)
>
> This is where you should add the upstream PR URL:
>
>      Upstream: https://github.com/kmod-project/kmod/pull/32
>
> You must also sign-off the bundled patch. No need to respin, I can just
> add it if you just reply with your SoB line.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

Thanks for taking care of this! If possible, please remove the
subaddressing from the "From", somehow my mail provider seems to not
deliver with it. I'll keep the "Upstream" tag in mind for the future. :-)

Best regards,
Fiona

> Thanks!
>
> Regards,
> Yann E. MORIN.
>
>>   1 file changed, 131 insertions(+)
>>   create mode 100644 package/kmod/0002-Use-portable-implementation-for-basename-API.patch
>>
>> diff --git a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
>> new file mode 100644
>> index 0000000000..46d23f4fa9
>> --- /dev/null
>> +++ b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
>> @@ -0,0 +1,131 @@
>> +From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 9 Dec 2023 17:35:59 -0800
>> +Subject: [PATCH] Use portable implementation for basename API
>> +
>> +musl has removed the non-prototype declaration of basename from
>> +string.h [1] which now results in build errors with clang-17+ compiler
>> +
>> +Implement GNU basename behavior using strchr which is portable across libcs
>> +
>> +Fixes
>> +../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> +71 | "Commands:\n", basename(argv[0]));
>> +| ^
>> +
>> +[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
>> +
>> +Suggested-by: Rich Felker
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + libkmod/libkmod-config.c | 2 +-
>> + shared/util.c            | 4 ++--
>> + shared/util.h            | 7 +++++++
>> + testsuite/testsuite.c    | 2 +-
>> + tools/depmod.c           | 2 +-
>> + tools/kmod.c             | 4 ++--
>> + 6 files changed, 14 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
>> +index e83621b3..8aa555a4 100644
>> +--- a/libkmod/libkmod-config.c
>> ++++ b/libkmod/libkmod-config.c
>> +@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
>> + 	bool is_single = false;
>> +
>> + 	if (name == NULL) {
>> +-		name = basename(path);
>> ++		name = gnu_basename(path);
>> + 		is_single = true;
>> + 	}
>> +
>> +diff --git a/shared/util.c b/shared/util.c
>> +index e2bab83a..0e16670e 100644
>> +--- a/shared/util.c
>> ++++ b/shared/util.c
>> +@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
>> +
>> + char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
>> + {
>> +-	char *modname;
>> ++	const char *modname;
>> +
>> +-	modname = basename(path);
>> ++	modname = gnu_basename(path);
>> + 	if (modname == NULL || modname[0] == '\0')
>> + 		return NULL;
>> +
>> +diff --git a/shared/util.h b/shared/util.h
>> +index c4a3916b..073dc5a7 100644
>> +--- a/shared/util.h
>> ++++ b/shared/util.h
>> +@@ -5,6 +5,7 @@
>> + #include <stdbool.h>
>> + #include <stdlib.h>
>> + #include <stdio.h>
>> ++#include <string.h>
>> + #include <sys/types.h>
>> + #include <sys/stat.h>
>> + #include <time.h>
>> +@@ -76,6 +77,12 @@ do {						\
>> + 	__p->__v = (val);			\
>> + } while(0)
>> +
>> ++static _always_inline_ const char *gnu_basename(const char *s)
>> ++{
>> ++  const char *p = strrchr(s, '/');
>> ++  return p ? p+1 : s;
>> ++}
>> ++
>> + static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
>> + {
>> + 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
>> +diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
>> +index 318343ac..aafc9873 100644
>> +--- a/testsuite/testsuite.c
>> ++++ b/testsuite/testsuite.c
>> +@@ -70,7 +70,7 @@ static void help(void)
>> +
>> + 	printf("Usage:\n"
>> + 	       "\t%s [options] <test>\n"
>> +-	       "Options:\n", basename(progname));
>> ++	       "Options:\n", gnu_basename(progname));
>> +
>> + 	for (itr = options, itr_short = options_short;
>> + 				itr->name != NULL; itr++, itr_short++)
>> +diff --git a/tools/depmod.c b/tools/depmod.c
>> +index 43fc354a..cfb15b11 100644
>> +--- a/tools/depmod.c
>> ++++ b/tools/depmod.c
>> +@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
>> + 	if (name != NULL)
>> + 		namelen = strlen(name);
>> + 	else {
>> +-		name = basename(dir);
>> ++		name = gnu_basename(dir);
>> + 		namelen = strlen(name);
>> + 		dirlen -= namelen + 1;
>> + 	}
>> +diff --git a/tools/kmod.c b/tools/kmod.c
>> +index 55689c07..df91e5c6 100644
>> +--- a/tools/kmod.c
>> ++++ b/tools/kmod.c
>> +@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
>> + 			"Options:\n"
>> + 			"\t-V, --version     show version\n"
>> + 			"\t-h, --help        show this help\n\n"
>> +-			"Commands:\n", basename(argv[0]));
>> ++			"Commands:\n", gnu_basename(argv[0]));
>> +
>> + 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
>> + 		if (kmod_cmds[i]->help != NULL) {
>> +@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
>> + 	const char *cmd;
>> + 	size_t i;
>> +
>> +-	cmd = basename(argv[0]);
>> ++	cmd = gnu_basename(argv[0]);
>> +
>> + 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
>> + 		if (streq(kmod_compat_cmds[i]->name, cmd))
>> --
>> 2.43.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--
Dipl.-Ing. Fiona Klute
Mollwitzer Str. 2
44141 Dortmund
Germany

USt.-ID/VAT number: DE363488944

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
