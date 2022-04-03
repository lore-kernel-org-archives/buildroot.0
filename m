Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2139C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 13:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335A36079D;
	Sun,  3 Apr 2022 13:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPhy96SxVRJv; Sun,  3 Apr 2022 13:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9EF60C21;
	Sun,  3 Apr 2022 13:58:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04F2E1BF3B0
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 13:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6D4D40147
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 13:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dVsRq6LwBVBU for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 13:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61B94400A6
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 13:58:33 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w18so1873167edi.13
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kjX+Jb6fnxnuWEuCLYazOFFcS44OEfBxpkWw9GqNVlo=;
 b=Dkdvt+0uy0OBk4gBO7RbooWxftf3D3taub0D5dRGL0Bkc0ksSTYKkuE1k1joTRRj2G
 S+y87Qnhsm+yX0Ms7K+1SLaCuhPTemVtkQDykswE3OWEcGDFs2IrYLCuVMI1cueiQ1sI
 97WcQ4QjzT/5MVuFAi0PCcavSB9XmdgYSeT11+4LGJ7ktT9t4nz3p5k0CfwCXt3oB5gr
 o4xZtl5AcwpnTEL4sLMOZ3xo0kt7mUN3X/i8wp7EC6I84GQBwBzWYfrhSq6xpveYClww
 JYt4GgEazty6Fp/7HmgnHvM8uPjLrsoRCmMdn1O6a44ieEHTLf/UzhazviSz4tAG5iex
 gb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kjX+Jb6fnxnuWEuCLYazOFFcS44OEfBxpkWw9GqNVlo=;
 b=mwQEGNPeuA9ps2BpABLr73+mea7U34ytPBuu2JSVLKRTDcFvP6bbkgYuxLmHhXlBLF
 XbocZxUPo6Ph4TN0P4fLJx0HKVe50ctkL93CX9O528EsjTiIyd+EUAqZLlEvjqP09Mnb
 c1xu1KVHEhGoGK7foY31ALz1gyUh/0vt4KeN2Gm4QKt8vLezrGAeJ37McictzcY8oAx3
 cmDqkGw53OLjtAJ6LDaAChijIsOlsCsPO4isJm/NHcWXCU/j7yM1GR03Ws3l/kP2+R3T
 jdpvi/jxsucIfliC3kkpKhFMv8XO2sk6LSRUNr/EvX8nrlDkWeB5PZOrok7IAvvfcPQO
 BWEw==
X-Gm-Message-State: AOAM530AG8ouaqW449UjcWnMZKHBRGQIDxlrAFo7Yel1AQ4FCdLgB4tn
 eIBzniAaXqDK94DsIYfuk6NoDA==
X-Google-Smtp-Source: ABdhPJzaPeKmMqHpiOqBz7PzutrqwFT716kZ/gUDchVftyqs0xBmhuw3mjl+4u0HJnILYwKcyssXfg==
X-Received: by 2002:aa7:c888:0:b0:419:166a:93e2 with SMTP id
 p8-20020aa7c888000000b00419166a93e2mr29155514eds.22.1648994311301; 
 Sun, 03 Apr 2022 06:58:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170906614600b006e133d37f8bsm3262887ejl.138.2022.04.03.06.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 06:58:30 -0700 (PDT)
Message-ID: <7fa02b77-d609-4cd4-5b93-b8f58c50b45f@mind.be>
Date: Sun, 3 Apr 2022 15:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220402010559.410834-1-james.hilliard1@gmail.com>
 <34c73050-b148-7887-63ec-56f1e90c854e@mind.be>
 <CADvTj4oJnqUCN2MuTh+vUh8mPcpR7xa2OWX-RBJTA0Xb9CJcDA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADvTj4oJnqUCN2MuTh+vUh8mPcpR7xa2OWX-RBJTA0Xb9CJcDA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 20:58, James Hilliard wrote:
> On Sat, Apr 2, 2022 at 10:29 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>    Hi James,
>>
>> On 02/04/2022 03:05, James Hilliard wrote:
[snip]
>>> +    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
>>> +       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
>>> +        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
>>
>>    I don't understand why for this particular one you remove it explicitly, while
>> for other cases you rely (I guess) on the dependency check to make sure we get a
>> valid config (eventually).
> 
> Others were missing the empty string config for matching against so
> this approach
> didn't seem to work there.

  I still don't understand... If I have the time, I'll try to cook up a patch 
that does the check the same way as all the other checks are done, and you an 
tell me if you're happy with that.

[snip]
>>    I agree though that it's more work to do that than the current patch, so
>> perhaps this is a good first step.
> 
> Yeah, best to do this incrementally IMO, since this is revealing issues already
> in the autobuilder relating to config validation I'm running this on:
> http://autobuild.buildroot.net/?submitter=James+Hilliard+%28asahi-mini%29

  So this is running a modified buildroot-test that passes the 
--no-toolchains-csv option?

> Note that this autobuilder is an aarch64(running
> https://asahilinux.org/) host so
> it doesn't use the prebuilt toolchains.

[snip]
>>> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>>> -                           "savedefconfig"])
>>> +            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>>> +                                      "savedefconfig"]):
>>
>>    This one should simply never fail, so it should move outside of the loop,
>> after checking dependencies.
> 
> I just tested that this can fail so I've kept it in the loop for now.

  Okay, let me rephrase: if 'make dependencies' passes, then 'make 
savedefconfig' should never fail. If you had a situation where make 
savedefconfig fails, I'd be interested to know about it and debug it.


  Regards,
  Arnout

>>> +                continue
>>>
>>> -    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>>> -                            "dependencies"])
>>> +            if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>>> +                                "dependencies"]):
>>> +                continue
>>> +            break
>>> +    return 0
>>>
>>>
>>>    if __name__ == '__main__':
>>> @@ -433,10 +443,18 @@ if __name__ == '__main__':
>>>        parser.add_argument("--buildrootdir", "-b",
>>>                            help="Buildroot directory (relative to current directory)",
>>>                            type=str, default='.')
>>> -    parser.add_argument("--toolchains-csv",
>>> -                        help="Path of the toolchain configuration file",
>>> -                        type=str,
>>> -                        default="support/config-fragments/autobuild/toolchain-configs.csv")
>>> +
>>> +    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
>>> +    toolchains_csv.add_argument("--toolchains-csv",
>>> +                                dest="toolchains_csv",
>>> +                                help="Path of the toolchain configuration file",
>>> +                                type=str)
>>> +    toolchains_csv.add_argument("--no-toolchains-csv",
>>> +                                dest="toolchains_csv",
>>> +                                help="Generate random toolchain configuration",
>>> +                                action='store_false')
>>> +    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
>>> +
>>>        args = parser.parse_args()
>>>
>>>        # We need the absolute path to use with O=, because the relative
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
