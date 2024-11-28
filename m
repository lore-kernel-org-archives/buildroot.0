Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B15BD690F8
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 10:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E41038455A;
	Thu, 28 Nov 2024 10:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HucP9bK75ro7; Thu, 28 Nov 2024 10:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0221D846F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0221D846F9;
	Thu, 28 Nov 2024 10:46:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C55C1DA8
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 10:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CF9D40A20
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 10:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OVraYtIliXk for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 10:46:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 498C3404EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498C3404EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 498C3404EB
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 10:46:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.106] ([85.22.122.179]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72sP-1tKkVS0hYt-00GEtV; Thu, 28
 Nov 2024 11:46:49 +0100
Message-ID: <cfa86fb7-b9d5-4004-a541-9961caade4be@gmx.de>
Date: Thu, 28 Nov 2024 11:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, abelino <abelino.romo@gmail.com>
Cc: buildroot@buildroot.org
References: <20241125000233.2772592-1-abelino.romo@gmail.com>
 <20241125000233.2772592-2-abelino.romo@gmail.com>
 <nfrp5pen3gginip5e3amcb7moslbtb52bczpzoept4boja55uh@2psca5ps44q5>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <nfrp5pen3gginip5e3amcb7moslbtb52bczpzoept4boja55uh@2psca5ps44q5>
X-Provags-ID: V03:K1:y67lq61kOas2vY4pJMqvyv03YZ3YWuWHCNPHUNCAnffMzLrxXfB
 nIO9bTha0edeHyb/aS1Le/kQ4uGjk+q8dvKk/HlQoszg9pJFwFfAyqb1rPklukExzHv8+4s
 A7tnuKchMxy9roSlDtlI83XWRyrx5x0MLw8gxWp5v6c7KkS1GCuSdiheRFLf0LWq2GMk8bs
 9F1qLLjSnCOOSqs8idJIQ==
UI-OutboundReport: notjunk:1;M01:P0:1iXPpkvp5Uo=;0HeBSl/RLKYF00ml87A2PDPwC4S
 p+k1kn3NFw5Se6kPKCUfsCOXeC3I9Palx932RtlPsdN1SEmOqIaqYLn7yKnRy1RDa+E3IVv9+
 afZhE3UjJIa+xk+eQSJgIk3SjPIhlRtJyFjNI7uIjMCIwylcNA0ny8O5G5t3WmrROzg/XgngE
 dB74g1RElRqkvl8Qpar5Vf9iLIkIUBVfE6Rbl+6hsCOnDUWe4xRrejP4jMt0WDc8sWZYz12yC
 PyQlq723MCM9wTznzU/+AwnM0s8ybzmVWWKjFG8HTWscdw5rSBfQFKiiIxcKbnqd5Byo4qkdr
 gk5O5g7O1hlfJkD/xz+OaQntZbbqNZkTJZTZfFb49JlQNjfPKwphZsHjaBcjNYvGyGCLxXgTj
 8Bubl4Uv/WQsyijczFoHgeoVUQdN6IXYVOJsUPYQo/dflg6s6lnHP2DtTxa3p5fgz646GxFqi
 yms4mETKq/v1WxvYwoexqISdad8n/KguhNHAuAyHaXLHYFosw5jE5IKT2KyyTbyN3/Bd6BfhI
 Bh2NHdtOumucm4a8XURw2At6ESCxA2CXbbxYg6XOSuIj9maV91WZ2FMjgRrLwaieavR31/fyE
 E4FxNMiNkHJsvc/qWZ+FRrClbcb91SeiifMDRBh9tRqqXdVe/wwuWnBzc0SPjY8dQeBOfpPRo
 Mez/ukcf71F57yIiCNieupYe4oUgrZnsHQi/zcGtmrI9RPYc9IkbN8YStwYioIZ0gscaTorJe
 dh4AeG33PveDvP/TQcnFFbg034IPr5yAFFysQutSGDOBpSt7r7D+yGjzdJrBo5gqVtp0U5ucm
 WAfAeHBVRPUqIYAJuzcYm/RgJYC7Muro2809mQ/UizHPbmrtGJKsXnpMyp94xgtve7Z9zphrS
 Koobrg/rV7jNKI+PfCFF54prodO47yiXJqsoMM6pt4UHcfdbAYE0y6MdedCzZ5dI4M4UeQlrD
 aO6iJ4YXxCa2Y3L2SapDG8eaeDw/6bDpxj46u/mRBE1Osc6OXrxHSDDP3JzXG2Tv7uzz+V/72
 F9Ti88/4kVF+w2MDUbWRtZSUbs01/VLXZoMqQFydw2iYGCPpxR/y9C2aTOKGxWPDEQP3JNzEk
 OZyzrZfVdW9UsFMXUBLtpnqkiHbWfn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1732790809; x=1733395609; i=fiona.klute@gmx.de;
 bh=KoDSZFYxB+VkiNxeouJkXtScgWbwc97BE6Xu1OCk83M=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=CQvVE/pR71v0DlPjNIifmeWDZBGZowT6tDTIWLAxEv/ybRoPNbCOGbXrVRzaxIja
 Rtf4EmwQk2zzCvdLI/qIf7+FZWLaEvMUKenBB/+HcMkqioHlEJ4CdefrqotMoaLrD
 WZfFlIBAuNfqCzfMPx9mxZxwBXavccL+1HlxvcnCpVlxUzYGrfU1xglHR2/ul3Jip
 9Mcts7/zrnc8zpBs25T+Zyvq31CEVzMr74QTK9BQlnkmrIi5qAkourcdAQ4GDzM7+
 Go9rFXA0GR6FvYaj0L8eLsNoXU48f46XbraErpTb9MqjJz2lxqDt2bqkqr0/YI+3g
 JqxBB3qEatKaAEgtQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=CQvVE/pR
Subject: Re: [Buildroot] [PATCH 1/2] package/tpm2-tss: bump version to 4.1.3
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

Am 25.11.24 um 18:18 schrieb Vincent Jardin:
> Hi,
>
> see below,
>
> On Sun, Nov 24, 2024 at 04:02:17PM UTC, abelino wrote:
>> On v3.2.2, testing with an Infineon SLB9673 resulted in the following
>> error when attempting to read from a previously written NV index.
>> Upgrading to the latest release, v4.1.3, resolves the issue:
>>
>> ```shell
>> ~# tpm2_nvread 0x1900001
>> WARN: Reading full size of the NV index
>> ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() Error: Esys handle does not exist (70018).
>> ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource object is bad
>> ERROR: Failed to get shandle
>> ERROR: Failed to read NVRAM area at index 0x1900001
>> ERROR: Unable to run tpm2_nvread
>> ```
>>
>> Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
>> includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
>> features. Bumping to v4.1.3 adds access to these improvements and
>> addresses the NV index read issue.
>>
>> [1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0
>>
>> Signed-off-by: abelino <abelino.romo@gmail.com>
>> ---
>>   .checkpackageignore                           |  1 -
>>   ...01-Temporary-fix-for-build-without-C.patch | 44 -------------------
>>   package/tpm2-tss/Config.in                    |  2 +
>>   package/tpm2-tss/tpm2-tss.hash                |  2 +-
>>   package/tpm2-tss/tpm2-tss.mk                  |  9 ++--
>>   5 files changed, 6 insertions(+), 52 deletions(-)
>>   delete mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
>>
>> diff --git a/.checkpackageignore b/.checkpackageignore
>> index b793026881..906a733b7b 100644
>> --- a/.checkpackageignore
>> +++ b/.checkpackageignore
>> @@ -1237,7 +1237,6 @@ package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_pat
>>   package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
>>   package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
>>   package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
>> -package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
>>   package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
>>   package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
>>   package/trinity/0001-Fix-build-with-GCC-10.patch lib_patch.Upstream
>> diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
>> deleted file mode 100644
>> index 812c753ffb..0000000000
>> --- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -From 7dc753ad27a8cd14c9b00be94ca89b847cf05ce9 Mon Sep 17 00:00:00 2001
>> -From: Carlos Santos <unixmania@gmail.com>
>> -Date: Mon, 23 Dec 2019 08:02:19 -0300
>> -Subject: [PATCH] Temporary fix for build without C++
>> -
>> -C++ is required only for the fuzzing tests but AC_PROG_CXX is included
>> -by configure.ac even when fuzzing is not enabled (which we don't do on
>> -Buildroot).
>> -
>> -The patch applied upstream had issues and was reverted[1]. Use a local
>> -patch to solve the problem temporaryly.
>> -
>> -Fixes:
>> -    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
>> -    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
>> -    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
>> -    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
>> -    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
>> -    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
>> -    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
>> -    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
>> -
>> -1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
>> -
>> -Signed-off-by: Carlos Santos <unixmania@gmail.com>
>> ----
>> - configure.ac | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index ff59dd7c..3e4028fb 100755
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
>> - AX_CHECK_ENABLE_DEBUG([info])
>> -
>> - AC_PROG_CC
>> --AC_PROG_CXX
>> - AC_PROG_LN_S
>> - AC_USE_SYSTEM_EXTENSIONS
>> - LT_INIT()
>> ---
>> -2.26.2
>> -
>> diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
>> index 857987ae36..d87c1e0d8d 100644
>> --- a/package/tpm2-tss/Config.in
>> +++ b/package/tpm2-tss/Config.in
>> @@ -39,6 +39,8 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
>>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>>   	select BR2_PACKAGE_JSON_C
>>   	select BR2_PACKAGE_LIBCURL
>> +	select BR2_PACKAGE_UTIL_LINUX
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>>   	help
>>   	  This option allows to enable Feature API (FAPI).  Feature
>>   	  API (FAPI) as described in the "TSS 2.0 Feature API
>> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
>> index c9fa4e6ae0..891c1285b0 100644
>> --- a/package/tpm2-tss/tpm2-tss.hash
>> +++ b/package/tpm2-tss/tpm2-tss.hash
>> @@ -1,3 +1,3 @@
>>   # Locally computed:
>> -sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
>> +sha256  37f1580200ab78305d1fc872d89241aaee0c93cbe85bc559bf332737a60d3be8  tpm2-tss-4.1.3.tar.gz
>>   sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
>> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
>> index b76d16e71e..c8a7df7724 100644
>> --- a/package/tpm2-tss/tpm2-tss.mk
>> +++ b/package/tpm2-tss/tpm2-tss.mk
>> @@ -4,7 +4,7 @@
>>   #
>>   ################################################################################
>>
>> -TPM2_TSS_VERSION = 3.2.2
>> +TPM2_TSS_VERSION = 4.1.3
>>   TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>
> You should update it using $(call github,tpm2-software,) too.

Isn't pointing _SITE at the HTTPS clone URL and using _SITE_METHOD = git
preferred nowadays, to ensure we get reproducible tarballs?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
