Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9AAC02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F4B60BA8;
	Fri,  7 Feb 2025 21:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbz7o1zoVoNL; Fri,  7 Feb 2025 21:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E6261141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E6261141;
	Fri,  7 Feb 2025 21:29:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBFFCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 093C540471
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxxFuFiwR0DF for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E25640224
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E25640224
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E25640224
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:29:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso17068865e9.2
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 13:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738963785; x=1739568585;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3xRdQgKVdNMr8fqwhMSK/uCNjfNS39eR9AV7Opjy1oM=;
 b=hl0jvfmda3OvjWAIUoJH/U/T7Co8YHbp8Y+AwfoZyYcr2UQYspjFby1WPQOcbKlxDv
 GKdAGtenbvGzGbHp7/TPEli05+92cFFc5l/hXpbNuTLYjCf4sAoc8LswjAFbNQeajD8m
 zUwAeI+TnYkv795DtEmnA8h/tL0WfVY+ASgxrwHIwzrRDcMxci1jC1cGGZZeikzYf95+
 4RMem+ue7UGRfcKY4sCgJ9pSlDoD5ALOi07zt4MsCOxTrjAzCz0QNJSIlKZCKWI9kC1z
 ZYfpijDq1CJSzaKl6azQQ1xCaxcERITty0bQpvFBvXHbES4mU9zR3QpDdITCnMpDLG0Y
 L57Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTML9urnGaMSbJbJB1BgKNm574hiF8hykpEss2WKmGpSu473PKF5lkj935nyYmjgO7xhLlgd3yXa0=@buildroot.org
X-Gm-Message-State: AOJu0YwIN9/YBhfPiK76w1hdKcltow/7PxqXR9J3Uhh/KQ80+0SkE+Tr
 PpAyI+qhFjpuO5qsyGwdST/m73902UoN0UuSKQWC3BJdzmpJtq541hE34Jvm6HSOOIjSiMbURsQ
 P
X-Gm-Gg: ASbGncvpb78fmkurrJvHmKv4q/k2KoIieSoxIu+Xp8etbkP6TPi3lxsRSP5jBpS2t66
 TXvppStlFTnRbCOnr6pgXgpFENa07O+RSlFZrpDpMXEXkfDwW9JDBnrQDTCZkb3zHm5Ws0HWFy3
 OQubPrfILRkcI4eg8do9zdkvTDyGg+cSYrrMjO1+MFH0cRzgchQ2FcuXYLFlpSoP642bxUMG2xi
 jy5MhU8rGlmHJS3Vxta4qqyI94OeedNT8DGZsoLStsuhmT4TkAbvFXOiMx/9i4+bMhkA4/GjEuS
 d6lakiN/PClPIGYyKWBWV+w+0HfDxAo/pM1ILhxPW+PsqgOQ0COvJUY9r/yz04D39sirQyzdQna
 it1TB/vH28rseHP6usfEFLyxTpjU6eiry9hOnT9n5PdaTXA==
X-Google-Smtp-Source: AGHT+IE/wUk2oirFxgp7yYU+yM67bbwzW9Lf5FWvtT3DnxS8S+WbM/KnjEY99OkPqZq8evRnUmzrjw==
X-Received: by 2002:a05:600c:4748:b0:42c:bb96:340e with SMTP id
 5b1f17b1804b1-439249cab26mr43464815e9.31.1738963784484; 
 Fri, 07 Feb 2025 13:29:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dfaesm5547084f8f.90.2025.02.07.13.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 13:29:43 -0800 (PST)
Message-ID: <906b1d60-7409-48aa-99f8-66773dcb919a@mind.be>
Date: Fri, 7 Feb 2025 22:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Peckham <dave.peckham@gmail.com>, buildroot@buildroot.org
References: <CAHWkT_AaU522ir3aeOFukfjXyxeUZDNPpHUcG28yJr3PgM1GSA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAHWkT_AaU522ir3aeOFukfjXyxeUZDNPpHUcG28yJr3PgM1GSA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738963785; x=1739568585; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3xRdQgKVdNMr8fqwhMSK/uCNjfNS39eR9AV7Opjy1oM=;
 b=cyz5O/DSj+CMS9Pw6RR0Rqa1zSAC9MZVQxNCH87VrpibK4hgB9J3tbC5icOyceEJRU
 OMpgX93fvB2sTYSv3oi5+GSFZm3eK7SGhiJ+iHsf6CHvjHBXlRPvOG7SaEFlP8eXN0Ql
 F7/SWP+WNQ+6DJzjFRMez8D9kstvNGgnX/5Yw3Qu214VaweinWcKhRlkWOHMlvjBG+hW
 9Cec9riK2K5MNjoSQCMM5RzRM7F88w+keeEeBmUQU6v6pdrir7l2wo3IGprefXzF8piB
 g0Skdm82T+TOaUW/+K89Jk+qmagDUkmXn9H5raGmguji8Dxz/a2WQRGEPJjPMSf7gVtg
 FDYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cyz5O/DS
Subject: Re: [Buildroot] Golang package examples? Cross-compile x86 to ARM
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2025 22:11, Dave Peckham wrote:
> Hi,
> 
> I'm porting my org's production yocto project to buildroot.I'm having
> a tough time understanding how to build my golang package linked
> against the target architecture. I have read the chapter on the
> golang-package macro, but I'm new to buildroot and I still have some
> unanswered questions and my build isn't working. I'm using the
> raspberrypi4_64_defconfig just for testing.
> 
> My Go program links against SDL2 via the go-sdl2 package. The gist of
> my problem is that it appears buildroot's golang-package macro is
> using my host's "pkg-config --cflags --libs sdl2" call, which is not

  PATH is set to start with <output>/host/bin, so "pkg-config ..." should use 
Buildroot's pkg-config, not the host's.

  Of course, you need to make sure that pkg-config is there, by adding 
host-pkgconf to _DEPENDENCIES.

> correct for the target architecture (ARM): -I/usr/include/SDL2
> -D_REENTRANT -lSDL2. I think it should be pointing to one of these,
> which "objdump -f" indicates are not x86.
> 
> $ find output/ | grep libSDL2.so
> output/target/usr/lib/libSDL2.so
> output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libSDL2.so
> output/build/sdl2-2.28.5/build/.libs/libSDL2.so
> 
> My .mk file runs the Go program's Makefile like this:
> 
> # sdl-test-go.mk
> $(MAKE) GOOS=linux GOARCH=arm64 CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

  Uh, we never go through make...

> 
> And the Makefile is simple:
> go build -o sdl-test-go sdl-test-go.go

  This is wrong in a thousand ways, that's why we don't go through make :-) It 
misses the necessary options to select the correct cross-compilation target, to 
get the right CGO compiler, to use proper vendoring of go modules, and probably 
more.

  Clearly the documentation is lacking if it leads you to think that you should 
call $(MAKE) anywhere... Any suggestions on how to improve?

> 
> This results in, what I can only imagine, is the buildroot
> cross-compiler invocation trying to use my x64 SDL instead of
> something from the "target".
> 
> Any ideas or links to some non-trivial/complete sample buildroot Go
> package files?

  Just search for golang-package in the Buildroot source. A good (though 
somewhat complex) example is containerd. A simpler example is delve.

  Good luck!

  Regards,
  Arnout

> 
> Thanks,
> Dave
> 
> *******************
> $ make -d sdl-test-go-rebuild
> ...
> go build -o sdl-test-go sdl-test-go.go
> Live child 0x61216f10ab30 (build) PID 2142765
> # command-line-arguments
> ./sdl-test-go.go:14:14: undefined: sdl.Window
> ./sdl-test-go.go:15:16: undefined: sdl.Renderer
> ./sdl-test-go.go:19:11: undefined: sdl.Init
> ./sdl-test-go.go:19:20: undefined: sdl.INIT_EVERYTHING
> ./sdl-test-go.go:23:8: undefined: sdl.Quit
> ./sdl-test-go.go:25:19: undefined: sdl.CreateWindow
> ./sdl-test-go.go:25:46: undefined: sdl.WINDOWPOS_UNDEFINED
> ./sdl-test-go.go:25:117: undefined: sdl.WINDOW_SHOWN
> ./sdl-test-go.go:31:21: undefined: sdl.CreateRenderer
> ./sdl-test-go.go:31:52: undefined: sdl.RENDERER_ACCELERATED
> ./sdl-test-go.go:31:52: too many errors
> Reaping losing child 0x61216f10ab30 PID 2142765
> make[2]: *** [Makefile:5: build] Error 2
> Removing child 0x61216f10ab30 PID 2142765 from chain.
> Reaping losing child 0x5b78e4d3d710 PID 2142748
> make[1]: *** [package/pkg-generic.mk:283:
> /home/dpeckham/code/buildroot-2024.02.10/output/build/sdl-test-go-1.0/.stamp_built]
> Error 2
> Removing child 0x5b78e4d3d710 PID 2142748 from chain.
> Reaping losing child 0x582808f9d390 PID 2142250
> make: *** [Makefile:82: _all] Error 2
> Removing child 0x582808f9d390 PID 2142250 from chain.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
