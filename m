Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D242C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4216C41608;
	Mon, 25 Apr 2022 19:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIS2CUPkAPbB; Mon, 25 Apr 2022 19:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0618341545;
	Mon, 25 Apr 2022 19:34:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90DB51BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87BB241545
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2li-shNeUapY for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:34:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BB5541520
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:34:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id w16so10369426ejb.13
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=0yLFGD/eNplH9fpJ8wbl5dL9R7u4HcOULE+BP43Ev4Y=;
 b=YrqWGfcwG3ZKsrsKDAZWUesm8baLZsPuKLIqICxm3ABaHsJpeFX5hPOc/sBaFa6tTI
 pukrQFKTOR45Uy8JK2jJU4agXHRT+XhwcMmZ4ZCQDzh/t6zy1yzgvtTMGBlw/AhL0jfd
 jWKabF+vaOwzhlyLXkC/N5whhzZnvwSnjb078Gf7pJKMOFLLO1HFwULd+aTVttTv6BSq
 EiGrO5RTcLeDhh0eD9VzG6yTpidXNJiGZMACn3/i8QfV04yrn793HEeVL6QH4KL968LX
 iH1ZdE0u5EiCjaH0tJgtB30W5SpJv2tbGYOvnJiFABqIc97aoP8howcAKZbKvxKPLZW7
 HdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0yLFGD/eNplH9fpJ8wbl5dL9R7u4HcOULE+BP43Ev4Y=;
 b=g4jn0I/WANtXfW2aXsZu1qYyPPF46Jt6vdXuoHbxZf58lGEm3hwXP3Rw2a6E8DB3m8
 yZen4uTK60ZggpzAK4L3HjpG2nKMyf3OC9OchvRHdN/c3Hn5Cho2rkPxeK0Bw8UjUYh5
 wMQXM16mYM4FAuMOFjEytTNk+5SYenDLbJmu+ooOp4xPJc7Cly8iPGLhct8eVwrjaQ4q
 aJGWhk5fvpRWGVY0q3YNgyFvzvWDGKFdkEL7mtM4mb58a73sNgoS5UHuuLvu56/+UwCt
 CJuoMJjgmIKxYS+OPnmZVc9FVrobuX+UL0u7+lDdqZpxjBpjX91zd1ZoJBYlx08jkUhl
 tXUg==
X-Gm-Message-State: AOAM532y0Nnex8DypsfvrpMMoDIMdyp3FGyN1ewTl3d/na2RJ+OP6/yi
 f/IJkoccGvwQSg3bOMo6qgUxHQ==
X-Google-Smtp-Source: ABdhPJzej5OyM3GxTf1rH4TagenMUi74IceSimolw3ackLZcn0mUEBL7Gr/GUqkPuT24oTv29OxP8Q==
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id
 nd33-20020a17090762a100b006da7952d4d2mr17773185ejc.260.1650915248367; 
 Mon, 25 Apr 2022 12:34:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a056402349400b00425a5ea1bb7sm5135767edc.57.2022.04.25.12.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:34:07 -0700 (PDT)
Message-ID: <3f3dfe0e-0086-0f47-ce50-2d1085a24272@mind.be>
Date: Mon, 25 Apr 2022 21:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220422212117.1291718-1-fontaine.fabrice@gmail.com>
 <20220422212117.1291718-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422212117.1291718-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/netsurf: fix build with ccache
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



On 22/04/2022 23:21, Fabrice Fontaine wrote:
> Update second patch to fix the following build failure with ccache:
> 
> /home/autobuild/autobuild/instance-11/output-1/build/netsurf-3.10/tmpusr/share/netsurf-buildsystem/makefiles/Makefile.tools:413: *** Unable to detect toolchain.  Stop.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b4ba19d7dcff1b0ee2b1546598b5ae6e9257a16d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>   - Update patch instead of using HOST_NOCCACHE)
> 
>   package/netsurf/0002-do-not-cross-compile-nsgenbind.patch | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
> index 2d4637511e..7caad47a20 100644
> --- a/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
> +++ b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
> @@ -8,6 +8,8 @@ the build, so it should not be built with the cross-compiler, but with
>   the native compiler.
>   
>   Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +[Fabrice: add quotes around BUILD_CC to fix build with ccache]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>    Makefile | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -21,7 +23,7 @@ index f279f01..5698c87 100644
>    # prefixed install macro for each host sub target
>    define do_build_prefix_install
>   -	$(MAKE) install --directory=$1 HOST=$(BUILD) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
> -+	$(MAKE) install --directory=$1 HOST=$(BUILD) CC=$(BUILD_CC) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
> ++	$(MAKE) install --directory=$1 HOST=$(BUILD) CC="$(BUILD_CC)" PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
>    
>    endef
>    
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
