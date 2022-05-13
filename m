Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306ABC433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D57774161B;
	Fri, 13 May 2022 21:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5tkOActBqHS; Fri, 13 May 2022 21:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2EC4415F5;
	Fri, 13 May 2022 21:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF4681BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBB6340207
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4juuuTJ7Ui9P for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1D974015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:56:47 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dk23so18595166ejb.8
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rw/GCWVexh2w50Y6R166NTJe9cqMS6hUdscH/OIMNg8=;
 b=CktNFzqFRx78UVJBt5CozpWPBQgNUtNuZAigHRwdpUUDubBamADGeSjObYGEeQm3Fj
 ngRbS4ABDDObejf3DH3Ef/7dCwIyLsSHOobCBMbGRf+Vor4zhk0Y7WwCZsXVOzbLVhWs
 L9zxCv0rJHbExVDtb6WqedEpGV02FU145Hx9zbCOVnqIArV59zFg3xba4bhABsHZiRgX
 H5bmwZIucJU5H1ClYWf6oomamdkgpJW98P+8l9a5V+/aXz0Gd93BPfO5xQNev+0ZRwPs
 HP+KsFFBAlcVYsABfFyoAgKdnSSnCAQyzG1tHoYe34mLuiyaRNNOv+17ZWosToDBzvTX
 KS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rw/GCWVexh2w50Y6R166NTJe9cqMS6hUdscH/OIMNg8=;
 b=clifYSBXcx1Wg04422chLrrQm5CaMTA2FLM4gJVWqL824kcXVzHfCKM5KUqDPh9Bae
 IOGOpxqXjiXC1Rjt4asJCnuO1IO/FLx4OLDeN+6pVd9mDiyL1v8G9MuQGhzGxJAynXCM
 7KNqXFDdYedbKclpdzv+lRfgiktzGR4ms0faHgGz+wawpOlSHjRErx2pgv+fX7wnmfmt
 IaKil+rF0MKeKSUjzIN54rIWBhRbV04T897nN0p5RdWjuJKFYw9a2USv91CJyKUvK76h
 oKcRg1UctnEdb9y30TvD6Y2N5iHS7h+qUu07xcOkMKQ7HkwaEBgCBQaxkrWV/u/EvLXE
 8S6Q==
X-Gm-Message-State: AOAM532MVyeWi84pztQ/EwYiP+KMcabn6Owo+Gd5JQ6jfmizzp3aMe/f
 w2O659P1N6/MuxN9o3QFVfiigoey60rbXg==
X-Google-Smtp-Source: ABdhPJzi+kNevFPI603YNKR5kXG0THr0zGPjvpxlZM2586oAyPO4YXtvIiElBYN/K2pVpW67Llw9dQ==
X-Received: by 2002:a17:907:2146:b0:6f5:28b5:5f38 with SMTP id
 rk6-20020a170907214600b006f528b55f38mr5963829ejb.118.1652479005714; 
 Fri, 13 May 2022 14:56:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ia20-20020a170907a07400b006f4c24495e7sm1155783ejc.33.2022.05.13.14.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:56:45 -0700 (PDT)
Message-ID: <3f28da1c-de5b-8022-c3d5-0a4c6e9bc303@mind.be>
Date: Fri, 13 May 2022 23:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220509204641.464787-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509204641.464787-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcgi: disable tests
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



On 09/05/2022 22:46, Fabrice Fontaine wrote:
> Disable tests to avoid the following static build failure on sh4aeb:
> 
> In file included from /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:20:
> /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/include/libcgi/cgi.h:81:31: note: expected 'char *' but argument is of type 'const char *'
>     81 | extern int slist_delete(char *name, formvars **start, formvars **last);
>        |                         ~~~~~~^~~~
> /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: unable to find a register to spill in class 'FPUL_REGS'
>    352 | }
>        | ^
> /home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c:352:1: error: this is the insn:
> (insn 1084 1081 1085 105 (set (reg:SI 4 r4)
>          (mem/f:SI (post_inc:SI (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])) [0 MEM[base: _414, offset: 0B]+0 S4 A32])) "/home/autobuild/autobuild/instance-5/output-1/build/libcgi-1.3.0/test/test_slist.c":323:3 189 {movsi_ie}
>       (expr_list:REG_INC (reg:SI 76 fr12 [orig:343 ivtmp.286 ] [343])
>          (nil)))
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/84a2339568d23b328af2416bfcec1ef41eccdce5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-CMakeLists.txt-honour-BUILD_TESTING.patch | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
> 
> diff --git a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
> new file mode 100644
> index 0000000000..3ec674ae70
> --- /dev/null
> +++ b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
> @@ -0,0 +1,44 @@
> +From 15ec267520efbe45193eb1df5361a4ab56164294 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 8 May 2022 17:54:42 +0200
> +Subject: [PATCH] CMakeLists.txt: honour BUILD_TESTING
> +
> +Allow the user to disable tests through the standard BUILD_TESTING
> +option: https://cmake.org/cmake/help/latest/module/CTest.html
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/rafaelsteil/libcgi/commit/15ec267520efbe45193eb1df5361a4ab56164294]
> +---
> + CMakeLists.txt | 12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index cbf0d97..e3329a1 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -29,15 +29,21 @@ option(BUILD_SHARED_LIBS
> + 	"Global flag to cause add_library to create shared libraries if on."
> + 	ON
> + )
> ++option(BUILD_TESTING
> ++	"Build tests."
> ++	ON
> ++)
> +
> + # subdirectories
> + add_subdirectory("include/libcgi")
> + add_subdirectory("src")
> +
> + # test
> +-enable_testing()
> +-include(CTest)
> +-add_subdirectory("test")
> ++if(BUILD_TESTING)
> ++	enable_testing()
> ++	include(CTest)
> ++	add_subdirectory("test")
> ++endif(BUILD_TESTING)
> +
> + # cmake package stuff
> + configure_package_config_file(${PROJECT_NAME_LC}-config.cmake.in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
