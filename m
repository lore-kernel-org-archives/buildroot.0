Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43590CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC15381CDC;
	Fri, 29 Aug 2025 10:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3FQM_gR9Pvx; Fri, 29 Aug 2025 10:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE9181DF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE9181DF7;
	Fri, 29 Aug 2025 10:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B6CD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B9076159D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pt3oAtlGOs6e for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:28:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E236D613AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E236D613AD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E236D613AD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:28:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D102FB9782E8; Fri, 29 Aug 2025 12:28:10 +0200 (CEST)
Message-ID: <ec3aae34-2019-44cf-b202-78e3a53bcf89@rnout.be>
Date: Fri, 29 Aug 2025 12:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
References: <20250508142356.91867-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250508142356.91867-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756463291; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Et5YB+XRFSgpgPC3ps0iPFuiumNIxQ9Gd9Ugx/H+tuE=;
 b=l5AfoTWdxhoS8zx4Ajyuepv7LB9qmU/4QQGWzmLCBfhE/T/KQ3BoqLwSaAMg9GXRWrPU6q
 a3PZ5CA3UtIdzDJ1UJnWMp18YYCIRzpjImi+QUtUmuIf6UvgdTVkf0nHJzJcHHJu0GiO1c
 NojG9FgFOrC7GH+sbg/19tePsBW2CXcK2KmFWJ49X1gyF/rN+91u9q0vG/Kp8JYffI+NZN
 Z6QjOeJYYUX600FN+C/Bkihchj1hvM8AJ6njDOZ9eQXRwJ8DAXavIDcaymz1vcyRDIpzkC
 a4vgtSo5bi689L85ng83BOec5SL09Qsmcu2/EE6l4+OAvpEvCC9tzHaK9VrSUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=l5AfoTWd
Subject: Re: [Buildroot] [PATCH] utils/test-pkg: add new option
 -T/--toolchain-name
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/05/2025 16:23, Titouan Christophe via buildroot wrote:
> Recently when trying to reproduce a build error with test-pkg on the toolchain
> br-arm-basic, I had to create a new CSV file with that toolchain only to be
> able to run the test in that single case.
> 
> I believe having a command-line option right away in test-pkg would make this
> much easier, as I can now run: `./utils/test-pkg -T br-arm-basic -p redis`
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/test-pkg | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 19d8713d6a..6f1b33a45d 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -17,8 +17,8 @@ main() {
>       local -a toolchains
>       local pkg_br_name
>   
> -    o='hakc:d:n:p:r:t:'
> -    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
> +    o='hakc:d:n:p:r:t:T:'
> +    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,toolchain-name:'
>       opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>       eval set -- "${opts}"
>   
> @@ -61,6 +61,9 @@ main() {
>           (-t|--toolchains-csv)
>               toolchains_csv="${2}"; shift 2
>               ;;
> +        (-T|--toolchain-name)
> +            toolchain_name="${2}"; shift 2
> +            ;;
>           (--)
>               shift; break
>               ;;
> @@ -107,7 +110,9 @@ main() {
>       # E.g.: http://server/path/to/name.config,arch,libc
>       #  -->  http://server/path/to/name.config
>       mapfile -t toolchains < <(sed -r -e 's/,.*//; /internal/d; /^#/d; /^$/d;' "${toolchains_csv}" \
> -                                | if [ "${random}" -gt 0 ]; then \
> +                                | if [ -n "${toolchain_name}" ]; then \
> +                                    grep -E "[/^]${toolchain_name}.config"
> +                                elif [ "${random}" -gt 0 ]; then \
>                                       sort -R | head -n "${random}"
>                                   elif [ "${number}" -gt 0 ]; then \
>                                       head -n "${number}"
> @@ -278,6 +283,12 @@ Options:
>           try. If not specified, the toolchains in ${TOOLCHAINS_CSV} will be
>           used.
>   
> +    -T NAME, --toolchain-name NAME
> +        Name of the single toolchain to use. It must be defined in the CSV
> +        list of toolchains (see also -t / --toolchains-csv). If this option
> +        is specified, then a single build will be performed on that
> +        specific toolchain only.
> +
>       -k, --keep
>           Keep the build directories even if the build succeeds.
>           Note: the logfile and configuration is always retained, even without

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
