Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E57C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB09D60034;
	Mon, 31 Jan 2022 20:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6IslVlJO-_s; Mon, 31 Jan 2022 20:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF875605B5;
	Mon, 31 Jan 2022 20:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 873D91BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83073408C4
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Soq50Z7JvdvI for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECD4F4014E
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:54:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id h7so46985586ejf.1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oNjO7E7xJVNcg1eO1+UaDq64DB7bAWAX47kBofrzNdI=;
 b=eugaraDWowMbW9Pjnv2M2D3jym+f4W90+pVrvQJD/5QUebU+D/N7D3C80aVuxXWR14
 SoxfAU/DpbCoIckDk766yKgcpgZvajoNDVW0Fgn8UMwfKrjcrLn1slqsRw08cWOXzc25
 PJxtmd/0AAb/JrPpqdAkIiSDTNFO/lBn8q2H80V5JLU0Qjr+9NLIoBQ1U/mHEsz1mb5f
 kZdAiYGXXvBQK2B0aYlP9Pb9QKSfAHf+5KxOB1KoU8Q4a3P5nUg9YxQshUtAquPVNw2E
 W82EnymtxuQKVsG4/MTpzSnksSjJUfeKwjooewjTds99HHOKmw6F4ObEwsczO2oEo9Ak
 dVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oNjO7E7xJVNcg1eO1+UaDq64DB7bAWAX47kBofrzNdI=;
 b=V5K01oElHaTZlylaKMRQ+4t7jG4LMtUv6fGBm5M4dtlxitFYAXmJOtAVDg30U2bfGN
 FvKg+KHkYnASouuC0tofQxj/mUwIiuKNYewsjY8Fz6piW7LuxZ8ZmY4xGSRl6AvqOAXK
 ZFOg2s2Nj1YS/XBA/LJ2lFnFhItBpYhwXxQ9DgSPWbpCXB6204iTTjk187mb3sYohub0
 K2otL8QW6Ob2nCMsP+miKOnXdmSIUK6uVZd+BNOk0NP1YLBN2tnQ8mEj2xGiR7XYb+DO
 psh75QcmQRXcsTubadclGrfNzx8Vi2giPpgS5Xq8E4K8IJ3zBXeJUsgtDwZrfeCGigXC
 IN5g==
X-Gm-Message-State: AOAM532GhW8HTAua6qDxVLYThZyXEM7KFTGdyZZ+UA3K8UoYRSt20osJ
 nJ44bmtGT4SvWJmqcF2+WTyyTd196K+4KA==
X-Google-Smtp-Source: ABdhPJzUH0yOD4XwMuA7qq3Kjiq26wDivDbHO5cYU7PDDW4IPlG7kKbSYfhvndKiGIv7Fi7b7CMgtw==
X-Received: by 2002:a17:907:c003:: with SMTP id
 ss3mr18343573ejc.349.1643662450050; 
 Mon, 31 Jan 2022 12:54:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u19sm14085752ejy.171.2022.01.31.12.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 12:54:09 -0800 (PST)
Message-ID: <de2ab9cf-a4f3-34f8-9cd0-f458ab1a7eaa@mind.be>
Date: Mon, 31 Jan 2022 21:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Matthew Weber <matthew.weber@collins.com>
References: <20211201230827.35080-1-matthew.weber@collins.com>
 <20211201230827.35080-2-matthew.weber@collins.com>
 <20220101210857.GA69135@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101210857.GA69135@scaer>
Subject: Re: [Buildroot] [PATCH 2/3] utils/test-pkg: add ability to fail
 when skipped
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 22:08, Yann E. MORIN wrote:
> Matthew, All,
> 
> On 2021-12-01 17:08 -0600, Matthew Weber via buildroot spake thusly:
>> Add flag to allow the return value to be incremented when a skip
>> happens, treating the overall run as a failure.
>>
>> This flag could be used when using test-pkg for local validation of
>> downstream packages, for example in a user's br2-external. An example of
>> this could be a user choosing to use test-pkg as part of a CI
>> infrastructure where the fragment and toolchains are tightly controlled
>> to test a package against multiple toolchains easily.
>>
>> In this case, the user would want to lower the rate of false-positives
>> of that fragment/toolchain configuration if a build is instead skipped
>> (which may happen in the case of buildroot version bumps where
>> dependencies could change).
> 
> I am a bit skeptical about this use-case. >
> As I understand it, wht is most interesting in a CI setup for internal
> development, is that *all* internal packages do build togetrher and form
> a working sysem *as a whole*.
> 
> As such, a CI setup would build the defconfig file(s) for a project (and
> run the integration test-suite), rather than build each package
> individually

  I don't think the intention is necessarily to build each package individually. 
Although it actually does make a whole lot of sense to do that, because it helps 
to check if the dependencies are set correctly.

  So, the obvious way to take the approach that Yann proposes is to have a list 
of defconfigs that enable all the packages in the external with the various 
toolchains. However, that still doesn't solve the issue that Matt faces, because 
any package can silently disappear from the config if its dependencies are no 
longer met.

  But indeed, it would make a *whole* lot of sense to add a check to %_defconfig 
that everything in the defconfig still appears in the generated .config file. If 
it doesn't, there is something really wrong...

  So yeah, I tend to agree that this is not the approach we should have upstream.

  Note that in CI it's very easy to check the output of test-pkg and search for 
SKIPPED lines. So it's not that this feature is really *needed* to land upstream.


  Therefore, I've marked the series as Rejected.

  As always, you're welcome to argue why we should include it after all.

  Regards,
  Arnout


> 
> Building each package individually with test-pkg would have the
> disadvantage that it takes more time overall, as all the common deps are
> build as many times as there are packages to test, and package are also
> dependencies one of the others, so most packages would be built more
> than once as well...
> 
> So, I am really not convinced...
> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Matthew Weber <matthew.weber@collins.com>
>> ---
>>   utils/test-pkg | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/utils/test-pkg b/utils/test-pkg
>> index d0472f176b..97957008fa 100755
>> --- a/utils/test-pkg
>> +++ b/utils/test-pkg
>> @@ -18,8 +18,8 @@ main() {
>>       local -a toolchains
>>       local pkg_br_name
>>   
>> -    o='hakc:d:n:p:r:t:e:'
>> -    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,'
>> +    o='hakc:d:n:p:r:t:e:f'
>> +    O='help,all,keep,prepare-only,config-snippet:,build-dir:,number:,package:,random:,toolchains-csv:,externals:,fail-on-skip'
>>       opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
>>       eval set -- "${opts}"
>>   
>> @@ -29,6 +29,7 @@ main() {
>>       number=0
>>       mode=0
>>       prepare_only=0
>> +    fail_on_skip=0
>>       toolchains_csv="${TOOLCHAINS_CSV}"
>>       while [ ${#} -gt 0 ]; do
>>           case "${1}" in
>> @@ -65,6 +66,9 @@ main() {
>>           (-e|--externals)
>>               BR2_EXTERNALS="${2}"; shift 2
>>               ;;
>> +        (-f|--fail-on-skip)
>> +            fail_on_skip=1; shift 1
>> +            ;;
>>           (--)
>>               shift; break
>>               ;;
>> @@ -147,7 +151,12 @@ main() {
>>       printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
>>           ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
>>   
>> -    return $((nb_fail + nb_legal))
>> +    nb_result=$((nb_fail + nb_legal))
>> +    if [ ${fail_on_skip} ]; then
>> +        nb_result=$((nb_result + nb_skip))
>> +    fi
>> +
>> +    return $nb_result
>>   }
>>   
>>   build_one() {
>> @@ -279,6 +288,9 @@ Options:
>>           Externals to be used as part of the build process. Packages from
>>           within these externals may be tested.
>>   
>> +    -f, --fail-on-skip
>> +        If any builds are skipped, return a negative exit value.
>> +
>>   Example:
>>   
>>       Testing libcec would require a config snippet that contains:
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
