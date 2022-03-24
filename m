Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D00DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F56E60BD9;
	Thu, 24 Mar 2022 20:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INe2uubHteNt; Thu, 24 Mar 2022 20:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42AA860ADD;
	Thu, 24 Mar 2022 20:02:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 108FB1BF379
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8F960ADD
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 20:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywz1Z3UVgliE for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 20:02:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8AA960A9E
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 20:02:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a8so11318310ejc.8
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QZoqNHr9D/hkY6IEw76K2aE0kToyB8v7VWvWiAiM5ek=;
 b=hRC12UsS4BG2DvOOCfScQvicg2/8ouk11ziYZbn8iBs7LCNl3+4FBdDYzw+W9kcIwy
 21DgmSe5DqpMz+ys1F4lh2vfXBSJZFBtvPquQHcC42NvoS0fXBYJzWhrZQEGwgAN7N1e
 0P6YVDKRNDnjsqgyBp7RzmJYONzbHHLrsDWFdmDmWOpBlpfKbtw++2PkMAeZShBomqYE
 hPWZ9UwyaAxsRCuobLM/9VAbDXDJ8xa4cLxmzaTblg+bxQse5BnCwMhzQG9AZV4aMIqE
 7rTVb7998uZnWrbnlOQLAKiaaza3nl+DkGMnuHVjZ982SOzTcfYFLYxbaX4e0CJGsCG9
 83ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QZoqNHr9D/hkY6IEw76K2aE0kToyB8v7VWvWiAiM5ek=;
 b=ob1uxQL2npeOSkr+8RCDSb6e3I9zICEUFfNwu0jltYHhCemO9EGiekK0iKMZ1tAWDC
 AKhlkOWVFjUFoWfjVYV8kaDc6vXSVGc+xmPflEqo5nukwFhIMbmgWXCkudPOmUrwpw5P
 sg351CoGr9CIoofKCGMULfkSHzmZlfj4jqJxXcJv8xAVZCAOCutTXY/cVY2wQa40qQpY
 Kt0HzoNdF6afpJnEG+FJXBJ6jT3n/Ad28GgibUkI92ekvQkEXf1jUcRKIO8QXc9rWIlI
 YubvLcSoKSbjYLKpM8C10ZCJn48wQ/6fFHTOnjgv2N2v+nCy+j56M/y5tfcKlQZLyLDE
 nUrQ==
X-Gm-Message-State: AOAM530qjNMzSI8QK+mWaB6WWRFgr5q/FfRzEN+30CnxPVMewGCywTY7
 S4j4u6g1UZj2hLbdp7VbA/on97miMgt5CQ==
X-Google-Smtp-Source: ABdhPJz0+zN7nA76KKnTEDZb5eLLsvc71P6CS9cyPsT1G+XDZeQb9bi49JiJ79hYWhB9sENBMoJdog==
X-Received: by 2002:a17:907:9493:b0:6e0:59f5:6705 with SMTP id
 dm19-20020a170907949300b006e059f56705mr7814011ejc.289.1648152127677; 
 Thu, 24 Mar 2022 13:02:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a17090673d800b006df8ec24712sm1511307ejl.215.2022.03.24.13.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 13:02:07 -0700 (PDT)
Message-ID: <e8baa7bc-4d7c-36da-6665-f4f27ae7b9d2@mind.be>
Date: Thu, 24 Mar 2022 21:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220315130737.428449-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315130737.428449-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] fakeroot: Fix segfault on ppc64le
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 14:07, Joel Stanley wrote:
> When generating a filesystem image on a power10 build machine running
> Ubuntu, we see a segfault when fakeroot is running chmod.
> 
> This has been reported and fixed upstream in Debian in version 1.26-1.2:
> 
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995393#53
> 
> Add the samae patch to resolve the segfault.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This isn't a commit in the fakeroot tree, rather a patch from the Debian
> packaging.

  Normally we'd just bump fakeroot, but I guess the patch isn't there yet in 1.28.

> 
> I would appreciate if this was added to the 2022.02 stable tree.

  Plus, that would make backporting iffy.

  Therefore, applied to master. However.

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   .../fakeroot/fix-prototype-generation.patch   | 59 +++++++++++++++++++
>   1 file changed, 59 insertions(+)
>   create mode 100644 package/fakeroot/fix-prototype-generation.patch
> 
> diff --git a/package/fakeroot/fix-prototype-generation.patch b/package/fakeroot/fix-prototype-generation.patch
> new file mode 100644
> index 000000000000..38d32ff3b22c
> --- /dev/null
> +++ b/package/fakeroot/fix-prototype-generation.patch

  Patches should be named 0001-XXXX even if they are downloaded from upstream. 
Actually, if it can literally be downloaded, you could just as well have used 
FAKEROOT_PATCH = https://...

> @@ -0,0 +1,59 @@
> +Subject: Fix prototype generation for openat
> +Author: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
> +Date: 2021-12-30
> +Bug-Debian: https://bugs.debian.org/995393
> +Forwarded: Yes (implicitely)
> +
> +    As jrtc27 pointed out in IRC, ppc64el is more strict than other
> +    architectures when it comes to va_arg handling:
> +
> +        it's that ppc64le uses the elfv2 abi, and for variadic calls you
> +        must reserve space for a parameter save area
> +
> +    So enhance wrapawk to create a proper prototype and argument
> +    handling although it's specific to the openat call. Also add the
> +    missing documentation for the sixth column to wrapfunc.inp.
> +

  Missing Signed-off-by. Again, this needs to be added even if the patch is 
literally downloaded.

  Both problems are reported by check-package.

  Regards,
  Arnout

> +--- a/wrapawk
> ++++ b/wrapawk
> +@@ -37,7 +37,25 @@
> +   argtype=$3;
> +   argname=$4;
> +   MACRO=$5;
> +-  if(MACRO){
> ++  openat_extra=$6;
> ++  if(openat_extra){
> ++    print "  {(void(*))&next_" name ", \"" name "\"},"  > structfile;
> ++    print "extern " ret " (*next_" name ")" openat_extra ";" > headerfile;
> ++    print ret " (*next_" name ")" openat_extra "=tmp_" name ";"> deffile;
> ++
> ++    print ret " tmp_" name,  openat_extra "{"           > tmpffile;
> ++    print "  mode_t mode = 0;"                          > tmpffile;
> ++    print "  if (flags & O_CREAT) {"                    > tmpffile;
> ++    print "    va_list args;"                           > tmpffile;
> ++    print "    va_start(args, flags);"                  > tmpffile;
> ++    print "    mode = va_arg(args, int);"               > tmpffile;
> ++    print "    va_end(args);"                           > tmpffile;
> ++    print "  }"                                         > tmpffile;
> ++    print "  load_library_symbols();"                   > tmpffile;
> ++    print "  return  next_" name,  argname ";"          > tmpffile;
> ++    print "}"                                           > tmpffile;
> ++    print ""                                            > tmpffile;
> ++  } else if(MACRO){
> +     print "  {(void(*))&NEXT_" MACRO "_NOARG, " name "_QUOTE},"  > structfile;
> +     print "extern " ret " (*NEXT_" MACRO "_NOARG)" argtype ";" > headerfile;
> +     print ret " (*NEXT_" MACRO "_NOARG)" argtype "=TMP_" MACRO ";"> deffile;
> +--- a/wrapfunc.inp
> ++++ b/wrapfunc.inp
> +@@ -9,8 +9,10 @@
> + /**/									  */
> + /* each line of this file lists 4 fields, seperated by a ";".		  */
> + /* The first field is the name of the wrapped function, then it's return  */
> +-/* value. After that come the function arguments with types, and the last */
> ++/* value. After that come the function arguments with types, and the fifth */
> + /* field contains the function arguments without types.                   */
> ++/* A sixth field is a special needed when wrapping the openat syscall.    */
> ++/* Otherwise it's like the third (function arguments with types).         */
> + /**/
> +
> + /* __*xstat are used on glibc systems instead of just *xstat. */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
