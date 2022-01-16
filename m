Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C14CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 12:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A394A8176F;
	Sun, 16 Jan 2022 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EviKGBNVkPev; Sun, 16 Jan 2022 12:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE5E8186A;
	Sun, 16 Jan 2022 12:05:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1331BF32C
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BFB68186A
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 12:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAtIH-C2d1DF for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 12:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F458176F
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 12:05:38 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w16so53245347edc.11
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 04:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=7GCf/rVqPO5XilaBZM12qLnfnKj1yVCeq/v2BSwgaYE=;
 b=Ldxun7I7Ew59p3f7IYMpx5pnZ/mKfB9WfCwj4MQeDTqz3wS7ehBV8xGnrJ+cbrNtQ2
 jpbZ9kzsU3MRbkFk7vT/j8AIix6/rUIGx3LV0bszA75O/nfujP0P8vWydwYAqQR59MQh
 wfDh3O7HB0nIb9JgjTPRQ+F1bFkIy2iLgabWpWJc2CX15/TgAdpHDYpiQ4q0gt9VtB4K
 Rl15hzSN9ZZeiaUcDLg7TnhPaImio1ESQCbUTfZ4bGbjYWUSVKMjW69MrIBlxkMFPQzV
 xrrUycu81tOeFW1moGGN06kIgdmjaEBE+G4yB9q6HHEh6+eVtUmvr4s+J4xJ/xRL8Q15
 VMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7GCf/rVqPO5XilaBZM12qLnfnKj1yVCeq/v2BSwgaYE=;
 b=QMhL4tG2VwPwMvQWRBmgcIyRculGl+vE86UCrPa7yOf6yltX7SHVLPk/Lyyo0JCjin
 uETQStQfNvCF6B/CoKxxolpVg/MuVF6hq+d5Tos9MB7N2HQAOGqLhm0DXXTsWkVL2r6Z
 6FKcg8VnO8ypf4H9C4woQt/n7JZsKWQasGeylUV+A4JTNpm4Scx25rE5+usjlZuKx1Hl
 aon9xqfeVNX3xVkMgDqGojPApVNXCDcM6UMwAZpWt+OZoaW+4gnfNajG9vhHWh/GpzZ0
 TWljmLfl0OBJd1F0k3BJ49RkudG3Gz+f12lZF2Fy8WHqwcxN4oGYMFjEgAAs6wda34uH
 +W4w==
X-Gm-Message-State: AOAM533/ZHmL/IvAcThEOO48G4nWlbvZ8Evy+EVPSn3+xxHtA2RjAVsh
 f1iSvhvtu8UnBGfVRLKrwEN/Go9xNNfoHA==
X-Google-Smtp-Source: ABdhPJzKuG9r+QnbbWEUH5jse8A3s4Y+I1ImMGTbi0gqoHpgZnwax6DDPKlQXCVEWeTy4NJfCYVrpQ==
X-Received: by 2002:a17:906:d552:: with SMTP id
 cr18mr264792ejc.387.1642334736654; 
 Sun, 16 Jan 2022 04:05:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id kz9sm3398813ejc.152.2022.01.16.04.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 04:05:35 -0800 (PST)
Message-ID: <35bc0513-f94a-7dc1-e583-7c1a425d78ae@mind.be>
Date: Sun, 16 Jan 2022 13:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Adam Baxter <voltagex@voltagex.org>, buildroot@buildroot.org
References: <c8e17fb9-4990-4267-b723-73ed1ced9c0b@www.fastmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <c8e17fb9-4990-4267-b723-73ed1ced9c0b@www.fastmail.com>
Subject: Re: [Buildroot] nvidia driver fails to build: compiler version
 check failed
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



On 16/01/2022 11:28, Adam Baxter wrote:
> Hi all
> 
> Using buildroot master 6e4791b751c0f8e0ba218da2c22e71d3e1436b5d
> 
> Config is hopefully attached.
> 
> Also, the below driver version was released by Nvidia on 2019.11.8 - perhaps it should be updated or removed?
> 
> make[1]: Entering directory '/home/voltagex/src/buildroot/output/build/linux-5.15.13'
> 
> Compiler version check failed:
> 
> The major and minor number of the compiler used to
> compile the kernel:
> 
> x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2021.11-1172-g6e4791b751) 11.2.0, GNU ld (GNU Binutils) 2.37
> 
> does not match the compiler used here:
> 
> x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2021.11-1172-g6e4791b751) 11.2.0

  Clearly these two are the same, so that sounds like a bug in nvidia's compiler 
check.

> Copyright (C) 2021 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> 
> It is recommended to set the CC environment variable
> to the compiler that was used to compile the kernel.
> 
> The compiler version check can be disabled by setting
> the IGNORE_CC_MISMATCH environment variable to "1".

  Sounds like the best option is to set this environment variable in 
nvidia-driver.mk then. We already make sure that the module is built with the 
same toolchain as the kernel.


  Regards,
  Arnout


> However, mixing compiler versions between the kernel
> and kernel modules can result in subtle bugs that are
> difficult to diagnose.
> 
> *** Failed CC version check. Bailing out! ***
> 
> make[2]: *** [/home/voltagex/src/buildroot/output/build/nvidia-driver-390.132/kernel/Kbuild:189: cc_version_check] Error 1
> 
> 
> (after looking at this I realised I'd probably have more luck with nouveau, anyway)
> 
> Thanks,
> Adam
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
