Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8E7C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:45:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D34CA61108
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D34CA61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4646078C;
	Thu,  5 Aug 2021 20:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6nmld_Nvl2e; Thu,  5 Aug 2021 20:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3A0B607AD;
	Thu,  5 Aug 2021 20:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E4E71BF3C5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BD93838C9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKVZfMav532U for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6343C8378A
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:45:39 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id c25so11688368ejb.3
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qxd/UBxp2vVE+Ssk5HZYIJl4s0YhDddE3QUSMLWwLX8=;
 b=Xd6OuhNZbB+bXlC8achW/yFWgfxGD+SCi3zAshMVPQITHBAp3qqalluFZA26lPGI9+
 ThhAhmeAZLHGId7DW2zaACFyLdlCiM4HLPk3O0NI1hp04dqZgZIanokFXhWP7b8t8aNb
 O808kpBtE1v2tnbbMiPHBydtVBbEMhGgeemZLh4a5r4WY2xvNTAdS2OdvDPR2gqUGx7w
 dz1J1HcYyG0m7VTATXs+1AJgScZNvRnXuTfk2uK8iD8O4oP3o6frLOWtH+oo4K3KDxOj
 KjWAD6tAFXouGNmVBUp4rsiSqgqGVG4VYX1NSHqWOEO718+rne1i/f0i9RElOiP7Ix5g
 DVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qxd/UBxp2vVE+Ssk5HZYIJl4s0YhDddE3QUSMLWwLX8=;
 b=Eha26ZZAdW3xBrQWTlmkJSZG58jydgh9WLABPeKvrTm8XDZjBYQAin742Kw5f6whrU
 9DreqIKtzi4ByIedlJOdoocSOSCe6VrKxb2c9AfU7wTBe1u1itR5XnUyEKHMDrwkf1Lb
 2eURSr7HT4+mOdv4MSYwhz6giY8Ckmmuln6hbb+UTw6quEYelQfxyEOi9gt9KciJkKrq
 9J72otONoA2trbqW8yGSDxy8Xumd8FyDld6rgjxnVPecac4p3hlNVz9LUOyBKpdrk86Q
 4iR0GLSYLrP/SF9Y6ajBreFdFdhPY0EkaGbDxulncxE1QiNfwZkZKBZLSxoDLujBFHys
 wURw==
X-Gm-Message-State: AOAM533Mculy6VGgVMFMt0lSNgArz2GXS7FqDPuWtHMglz3uG05yJuR+
 PDWZSMOe3wxgDxg6FT6YpLcrnf8YzSZ5m5P9Kss=
X-Google-Smtp-Source: ABdhPJz6h4RvyQxXsj4lgFZeCUvcxDFnrtwjw0xIxFk5U/X//QotixnysyYKJolweHMyrhR7xEgHDA==
X-Received: by 2002:a17:906:f15:: with SMTP id
 z21mr6754299eji.177.1628196337531; 
 Thu, 05 Aug 2021 13:45:37 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id ck3sm2801462edb.80.2021.08.05.13.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 13:45:37 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1624911306.git.yann.morin.1998@free.fr>
 <ae1e35ca4f0557873fa25ca5205d92aa2a16dd1f.1624911306.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <04eed532-822e-28c7-bd3d-4d9288a2bad9@mind.be>
Date: Thu, 5 Aug 2021 22:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ae1e35ca4f0557873fa25ca5205d92aa2a16dd1f.1624911306.git.yann.morin.1998@free.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 3/4 v5] utils/test-pkg: add mode to only
 prepare .config files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 28/06/2021 22:15, Yann E. MORIN wrote:
> Currently, running test-pkg is only done locally on the developpers
> machine.
> 
> In a follow up commit, we'll add the possibility to run test-pkg in a
> gitlab-ci pipeline and, to speed up things, with one job per buildable
> configuration.
> 
> As such, we will need that test-pkg only ever prepares the
> configuration, and that it does not build them.
> 
> Add such a mode, with a new option, --prepare-only
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Note: naming is hard; naming options is harder; naming options with a
> terse term is even harder; naming options with a terse term that is
> still meaningful and explains what the option does, is even harder yet.

 But doing it inconsistently is easy (see below). :-)

 Anyway, there's an easy solution to that (which I believe we should apply
here): don't define a terse option.

 I think terse options should only be defined for stuff that a human has to
type. In scripts, terse options shouldn't be used, because it makes it harder
for the programmer to understand what the command does.

 Since prepare-only is meant ot be used by script, I don't think a terse option
is needed.


> 
> ---
> v5: split off from the next patch into this patch
> ---
>  utils/test-pkg | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 54c6c5e8fe..4a20cab57f 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -12,13 +12,13 @@ do_clean() {
>  
>  main() {
>      local o O opts
> -    local cfg dir pkg random toolchains_csv toolchain all number mode
> +    local cfg dir pkg random toolchains_csv toolchain all number mode prepare_only
>      local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
>      local -a toolchains
>      local pkg_br_name
>  
> -    o='hakc:d:n:p:r:t:'
> -    O='help,all,keep,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:> +    o='hakgc:d:n:p:r:t:'
             ^ AFAICS this is a 'g'...

> +    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:'
>      opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>      eval set -- "${opts}"
>  
> @@ -27,6 +27,7 @@ main() {
>      keep=0
>      number=0
>      mode=0
> +    prepare_only=0
>      toolchains_csv="${TOOLCHAINS_CSV}"
>      while [ ${#} -gt 0 ]; do
>          case "${1}" in
> @@ -39,6 +40,9 @@ main() {
>          (-k|--keep)
>              keep=1; shift 1
>              ;;
> +        (-l|--prepare-only)
             ^ ... but this is an 'l'!

 Clearly someone didn't test with the terse option. :-)

> +            prepare_only=1; shift 1
> +            ;;
>          (-c|--config-snippet)
>              cfg="${2}"; shift 2
>              ;;
> @@ -127,7 +131,7 @@ main() {
>          toolchain="$(basename "${toolchainconfig}" .config)"
>          build_dir="${dir}/${toolchain}"
>          printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
> -        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
> +        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" "${prepare_only}" && ret=0 || ret=${?}
>          case ${ret} in
>          (0) printf "OK\n";;
>          (1) : $((nb_skip++)); printf "SKIPPED\n";;
> @@ -147,6 +151,7 @@ build_one() {
>      local toolchainconfig="${2}"
>      local cfg="${3}"
>      local pkg="${4}"
> +    local defer="${5}"

 I like it if variables that are the same are called the same. I.e., use
prepare_only here as well. Perhaps you can even skip passing it at all since
it's a global variable.

>  
>      mkdir -p "${dir}"
>  
> @@ -170,6 +175,11 @@ build_one() {
>      # Remove file, it's empty anyway.
>      rm -f "${dir}/missing.config"
>  
> +    # Defer building the job to the caller (e.g. a gitlab pipeline)
> +    if [ ${defer} -eq 1 ]; then
> +        return 0
> +    fi
> +
>      if [ -n "${pkg}" ]; then
>          if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
>              return 2
> @@ -257,6 +267,10 @@ Options:
>          Note: the logfile and configuration is always retained, even without
>          this option.
>  
> +    --prepare-only

 And the terse option isn't even in the help! So nobody would use it anyway...


 Regards,
 Arnout

> +        Only prepare the .config files, but do not build them. Output the
> +        list of build directories to stdout, and the status on stderr.
> +
>  Example:
>  
>      Testing libcec would require a config snippet that contains:
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
