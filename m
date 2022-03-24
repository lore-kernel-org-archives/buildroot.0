Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F17C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE1284499;
	Thu, 24 Mar 2022 21:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4W28VW6PMuqo; Thu, 24 Mar 2022 21:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F86844A1;
	Thu, 24 Mar 2022 21:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCB51BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D31E844A1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLiGeIujvpLA for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4350F844A0
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:12:36 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id yy13so11700786ejb.2
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nEG/el0mumjObzw4xt/MlQtN9R1nZJdMP+4ktMPyoSM=;
 b=by3za16n2kFfY+K+IIgNWSadzBM0uqvZ7o1IuGWq4ZNej0jZvPJFtSTAaodhWDj4Fu
 q5GPP66my9pzmWgBPhFzzLodo3s7k9Df261E7qpI87sWkHPTELrsmPQ3sHdxdd5U2G2k
 mq/bdI1VhwWy3ClXiuLi2LNfIl4uxTGf4fBuKmw2RvYv7CP6dkLFZUCJciyTTVdSdGrO
 9cTU6WAdaJW7Cm7afF9UC+SOD52v/5ZmBHmk6Zb9vdviCCByOk+7eZpy6G/SvwPKLROp
 G+GAWggA4jGDagoDY+yK4zqLbCVnx884twO895oX6TYZwgSAMXRms5jGROfc9jTwKF9V
 JxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nEG/el0mumjObzw4xt/MlQtN9R1nZJdMP+4ktMPyoSM=;
 b=PeFEk83Bgr/O67jmI1eBrA+ppsk7tmcPsgEvHMhKXku3TL1mOQbMUXSDiECVCW4Nu1
 rJd7uwTz21mTdCgM4D93eoFbl0JiQ6GAsZ3M/MNN0i1P+l1zeHCkkatmIDvkhe5fgaq2
 2pe6qg7kyjbPuYUMrOvmXXBucaBrbIvTptHGfk1oXzrmXMUDahyj27v1vudRz45fcwJu
 +XbLSu/SrChgJ5OTo1uk7z/HBNa5zd+rD6LnPSvXjwTwhNXUYE/MKabzxHP7Se64xPu3
 HY8Z9dODvO6GDskFpD7zUZKSEBY8tV+QzNS8lZxgJGJ2zh7tbaMdnY98f+0WqCm4dXW5
 nhsg==
X-Gm-Message-State: AOAM531mRfzaICywniiNnexVJhzsNpziSokctqC2XDMT35WNSCYLZ6gw
 6CB9Jbk39WDs6ldHjIIt+Fg049bdNbPX2w==
X-Google-Smtp-Source: ABdhPJxKMiiEA206VtSALPa1zKtnIBZ3tbbODfwYZZOfeHvJGUFmgDQQObE8EvdClQD54ewYpdR/Jg==
X-Received: by 2002:a17:907:94d5:b0:6e0:2924:bd54 with SMTP id
 dn21-20020a17090794d500b006e02924bd54mr7855348ejc.170.1648156354490; 
 Thu, 24 Mar 2022 14:12:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056402019000b00418ed60c332sm1925481edv.65.2022.03.24.14.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:12:34 -0700 (PDT)
Message-ID: <ce8f7fcc-fd3b-5cd7-1ef4-433c2279a2ef@mind.be>
Date: Thu, 24 Mar 2022 22:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315173231.1943484-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: fix build with libexecinfo
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 18:32, Fabrice Fontaine wrote:
> Fix the following build failure raised on uclibc and musl since the
> reintroduction of the package in commit
> 16ff948444c3978d63f483344a3d92d994c64312:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libabsl_stacktrace.so.2111.0.0: undefined reference to `backtrace'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/63ab2bc86cad03d5258492b17d1707078761d9b3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/grpc/grpc.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 23b92f1750..9138b4ea59 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -21,6 +21,7 @@ HOST_GRPC_DEPENDENCIES = host-protobuf
>   # which doesn't do this.  These CARES settings trick the gRPC cmake code into
>   # not looking for c-ares at all and yet still linking with the library.
>   GRPC_CONF_OPTS = \
> +	-DCMAKE_EXE_LINKER_FLAGS="$(GRPC_EXE_LINKER_FLAGS)" \
>   	-DgRPC_ABSL_PROVIDER=package \
>   	-D_gRPC_CARES_LIBRARIES=cares \
>   	-DgRPC_CARES_PROVIDER=none \
> @@ -36,10 +37,15 @@ GRPC_CONF_OPTS = \
>   	-DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
>   	-DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
>   
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +GRPC_DEPENDENCIES += libexecinfo
> +GRPC_EXE_LINKER_FLAGS += -lexecinfo
> +endif
> +
>   # grpc can use __atomic builtins, so we need to link with
>   # libatomic when available
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> +GRPC_EXE_LINKER_FLAGS += -latomic
>   endif
>   
>   GRPC_CFLAGS = $(TARGET_CFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
