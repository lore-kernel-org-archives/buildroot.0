Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF9CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF81415D0;
	Sat, 30 Apr 2022 18:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EYpaetXrHggZ; Sat, 30 Apr 2022 18:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29613415CB;
	Sat, 30 Apr 2022 18:46:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85B1F1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71CC1415CB
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6NEu_TPzLsv for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E15415A6
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:46:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m20so21016220ejj.10
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QgVEjmjMH3SeL3TVOsdelZmcdd5E0mTV0fYgaiVY1a8=;
 b=L/hL+zYHqnuW3y+p8/GSltfC007bxfnT0eJzwqzdPjSdqjuB7QSMOx4uP0N7p40caQ
 zrVEoUsq7RRQEPEcu3AoCFYr6NYklOwfRtOd2pUPtkbnHw4+PW1xEayVngouiHI5XSmD
 wcalrRRPjHmhXlWZUXbaumXjfUijQElGNFd9seVV6MGh6gOt7Mx9RMJlm/SMD435eu9V
 Y66JoLuFf08/9g2xk+Cfetf7V6huKRaqYk66IoEufPz0Gu5oWY4NKIrD+XGxrSQn33jp
 M/8jPxJvypfCOQeKBHzzy+HIImMQpHghAj/DwjW8JHaI+cjzIA9jKo2F4fFRURxlnOX5
 2ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QgVEjmjMH3SeL3TVOsdelZmcdd5E0mTV0fYgaiVY1a8=;
 b=uovmZbf1j+IWT41qvcDH9kaD9rSVj54rzMp7/C0sls1LyA3ru6geSEwNEbkGJjNp7X
 0HAPepLG0y4e4bjx4p5lvcpOo9eiNzX1sA7xfNSlwwxZJPLelZHqlzxX3lFsHqH3dtSw
 fSk/+x1crMKkgXOeR4TnzAgnx1StOjJF+d0wpUGrmKsA/b65nSNGzvghNK/2Fo+BQEL2
 22GcQfE8DqjYbgXn7ESOCJ4ZrZw+0hHJ8JdDhA+hEuT58ro0tmnFBvGdSlxcGtR/hw3L
 O4/jpLUVsbYLqMSjWflndR8S1wTydxvXCGYY0IuXLY6+Rpviyre2kV00Z6R5aDHX/oex
 /1uA==
X-Gm-Message-State: AOAM531iL2RmDQRUDPxOpCZSZdpWfz58Vm/A3sdCEl4EKKDXv4l4fI0h
 wsgG/HotexyzYFbdj50ptfn6Lg==
X-Google-Smtp-Source: ABdhPJz6APhZv7GBLdsdABaMBozjS2qQ2uwtHK1wiNNI1FAA8M4M7A96FU19Vg1zvbeO+WizqR6y/Q==
X-Received: by 2002:a17:906:99c3:b0:6ef:fad0:45e3 with SMTP id
 s3-20020a17090699c300b006effad045e3mr4702911ejn.99.1651344374992; 
 Sat, 30 Apr 2022 11:46:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056402064500b0042617ba63a0sm4431374edx.42.2022.04.30.11.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:46:14 -0700 (PDT)
Message-ID: <eeec27ed-08bb-9a10-9bf1-4bfd1a489371@mind.be>
Date: Sat, 30 Apr 2022 20:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220427201812.4037832-1-fontaine.fabrice@gmail.com>
 <20220428104555.62683882@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220428104555.62683882@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: fix build with
 argp-standalone and NLS
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



On 28/04/2022 10:45, Thomas Petazzoni via buildroot wrote:
> Hello Fabrice,
> 
> On Wed, 27 Apr 2022 22:18:12 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Fix the following build failure with argp-standalone and NLS raised
>> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
>>
>> configure:14644: checking for argp_parse in -largp
>> configure:14669: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp  -lm -lm -lm  >&5
>> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
>> /home/giuliobenetti/autobuild/run/instance-1/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'
>>
>> [...]
>>
>> In file included from freeipmi-argp-fmtstream.c:35:
>> freeipmi-argp-namefrob.h:62:32: error: redefinition of 'argp_fmtstream_write'
>>     62 | #define __argp_fmtstream_write argp_fmtstream_write
>>        |                                ^~~~~~~~~~~~~~~~~~~~
>> freeipmi-argp-fmtstream.c:395:1: note: in expansion of macro '__argp_fmtstream_write'
>>    395 | __argp_fmtstream_write (argp_fmtstream_t __fs,
>>        | ^~~~~~~~~~~~~~~~~~~~~~
>>
>> Fixes:
>>   - http://autobuild.buildroot.org/results/26090162396b1b8cedfc58e1790ced528fcc35c6
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> While your patch is indeed the most "immediate" fix, shouldn't we think
> about providing a pkg-config file for argp-standalone, so that its
> indirect dependency on libintl when static linking can be properly
> described, and transparently discovered by users of argp-standalone?

  As usual, that only works if we upstream the pkg-config file to arp-standalone 
and downstream projects start to adopt it. Until then, we still need to do 
something like this patch (except more complicated).

  Regards,
  Arnout

> 
> Because otherwise here, you'll have to basically propagate this to all
> users of argp-standalone, and to all users of users of argp-standalone.
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
