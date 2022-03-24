Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA485C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7553D40C15;
	Thu, 24 Mar 2022 21:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDH66MafFFCD; Thu, 24 Mar 2022 21:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7183404AA;
	Thu, 24 Mar 2022 21:12:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D825A1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4A1241C83
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRWK0yXu-Nmq for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:11:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB8941C7B
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:11:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x34so7059855ede.8
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 14:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:cc:in-reply-to
 :content-transfer-encoding;
 bh=lR5XuKn1LHOThdw+x+O76TXbkoYMSqeTrLPvYEorBCU=;
 b=Wx+QfF9+nhhVFxO1UoS0PiANYA+TQnp/0+TMDRf8ZBcttrj8PnWVP3bBh8Hg6i8BIf
 cKr+UwtrOjVuHYk39cVPCFxx1pGTf0lSeop7vdAqoSDN8xrNNCuEYQMzUko0Ue3fONkF
 Nf30QYhfB/iXMR4TffpE1fTVpXomgdkP1dLLMj1e63s6mQpRFFZxdWBbmcKZtzUdKgj2
 /FvhOmfwmpFI9WsGZT2asOPWoBEUImhYt5pp4Dqza8b7dmZBhiUx+5lZWxOBMQPcecDs
 B3hLWQtCPJBwzynmvVJSJzMD27kquEfnk+srO3c+R9mQ5vGa/DQdzqMagVCsm1CPqHTO
 kDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:cc:in-reply-to
 :content-transfer-encoding;
 bh=lR5XuKn1LHOThdw+x+O76TXbkoYMSqeTrLPvYEorBCU=;
 b=IE28bQR6bAzakjkUuYWQvHK+slDTgeZaYVYGT2XsBPxWJ7K02s7soXAbN9jqND7duN
 SHwNFuMpfg/W1Y/x3v1zcrVyFoEH8HI151iCT3of2CDN7oULd3nTphzQRInkZdIxrQXT
 ELfhqZsmcRVIH1WTiYF7hlrnuFyBgeeWfRabzU6u1uJepmTrN/AMcoVMYXYJ/FOruHP5
 vI3lfXSkYFyLhgx0bCRYW9qcuBkdumqtLdFqgJH5fE/vtuV/NvtR0WwSd3IPLMQCGDaI
 YWttRPd3u5aVjy2jKvZuHr7enzdVMbZXEvEBW9crbf0IoMAqDXW2Z/JSgMQ0qKYQOHcG
 xDww==
X-Gm-Message-State: AOAM533aX6tHPek6eOadficYLDvnkBMeEfxhL9aEVGzhOSXwp/gmZ4ST
 cMuqPL0HDTiBqCIn5cD4A2/hT5KqRsFjnA==
X-Google-Smtp-Source: ABdhPJwL5fMQR4KwiqVWWP0kcfDEFJCwpgdwMOMrcjtqNTqGFMM2iF3DvWdJljZNs39qqI0W8c/Mkg==
X-Received: by 2002:aa7:cd7a:0:b0:419:48ce:3a10 with SMTP id
 ca26-20020aa7cd7a000000b0041948ce3a10mr9016636edb.312.1648156314059; 
 Thu, 24 Mar 2022 14:11:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a170906534900b006df9b29eaf1sm1591191ejo.8.2022.03.24.14.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 14:11:53 -0700 (PDT)
Message-ID: <2a0a7ee7-386c-6f47-df79-cde409cbfa4c@mind.be>
Date: Thu, 24 Mar 2022 22:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220315205918.2211690-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220315205918.2211690-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rygel: fix g_ir_compiler calls
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/03/2022 21:59, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 0.40.2 in
> commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:
> 
> [108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
> FAILED: src/librygel-core/RygelCore-2.6.typelib
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler --output src/librygel-core/RygelCore-2.6.typelib /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
> Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
> error parsing file /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir: Failed to parse included gir GUPnP-1.2
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...-meson.build-fix-g_ir_compiler-calls.patch | 84 +++++++++++++++++++
>   1 file changed, 84 insertions(+)
>   create mode 100644 package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
> 
> diff --git a/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch b/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
> new file mode 100644
> index 0000000000..3961ad0564
> --- /dev/null
> +++ b/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
> @@ -0,0 +1,84 @@
> +From bed9e2effae60f7d736731e93d9e699cb173f04e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 15 Mar 2022 19:20:33 +0100
> +Subject: [PATCH] meson.build: fix g_ir_compiler calls
> +
> +Fix the following build failure when cross-compiling which is raised
> +because rygel is using a custom_target target instead of the standard
> +gnome.generate_gir:
> +
> +[108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
> +FAILED: src/librygel-core/RygelCore-2.6.typelib
> +/home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler --output src/librygel-core/RygelCore-2.6.typelib /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
> +Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
> +error parsing file /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir: Failed to parse included gir GUPnP-1.2
> +
> +Indeed, the custom_target command is unable to retrieve the correct
> +--includedir from glib-2.0.pc so add an ugly hack to custom_target calls
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: probably not upstreamable]
> +---
> + src/librygel-core/meson.build         | 4 +++-
> + src/librygel-renderer-gst/meson.build | 1 +
> + src/librygel-renderer/meson.build     | 1 +
> + src/librygel-server/meson.build       | 1 +
> + 4 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/librygel-core/meson.build b/src/librygel-core/meson.build
> +index fd43bebe..e6be2b5e 100644
> +--- a/src/librygel-core/meson.build
> ++++ b/src/librygel-core/meson.build
> +@@ -70,7 +70,9 @@ core_gir = custom_target('RygelCore-2.6.gir',
> + # so we depend on the custom_target from that step and pass the input through
> + # commandline.
> + custom_target('RygelCore-2.6.typelib',
> +-               command: [g_ir_compiler, '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
> ++               command: [g_ir_compiler, '--output', '@OUTPUT@',
> ++                         '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,

  I don't understand why this isn't needed for any other g-ir-compiler calls. It 
can't be that rygel is the only package that has any GIR dependencies?

  If more packages need something like this, then we should probably create a 
wrapper around g-ir-compiler that adds the --includedir automatically.

  [Adam in Cc as the GOI specialist - poor guy.]

  Anyway, for now, applied to master, thanks.

  Regards,
  Arnout


> ++                         join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
> +                output: 'RygelCore-2.6.typelib',
> +                depends: [ core_lib, core_gir ],
> +                install: true,
> +diff --git a/src/librygel-renderer-gst/meson.build b/src/librygel-renderer-gst/meson.build
> +index ad98a3a7..e8baefe1 100644
> +--- a/src/librygel-renderer-gst/meson.build
> ++++ b/src/librygel-renderer-gst/meson.build
> +@@ -36,6 +36,7 @@ custom_target('RygelRendererGst-2.6.typelib',
> +                         '--output', '@OUTPUT@',
> +                         '--includedir', core_girdir,
> +                         '--includedir', renderer_girdir,
> ++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
> +                         join_paths(meson.current_build_dir(), 'RygelRendererGst-2.6.gir')],
> +                output: 'RygelRendererGst-2.6.typelib',
> +                depends: [renderer_gst_lib, renderer_lib, renderer_gst_gir, renderer_gir],
> +diff --git a/src/librygel-renderer/meson.build b/src/librygel-renderer/meson.build
> +index 5f401527..821273ff 100644
> +--- a/src/librygel-renderer/meson.build
> ++++ b/src/librygel-renderer/meson.build
> +@@ -43,6 +43,7 @@ custom_target('RygelRenderer-2.6.typelib',
> +                command: [g_ir_compiler,
> +                         '--output', '@OUTPUT@',
> +                         '--includedir', core_girdir,
> ++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
> +                         join_paths(meson.current_build_dir(), 'RygelRenderer-2.6.gir')],
> +                output: 'RygelRenderer-2.6.typelib',
> +                depends: [ renderer_lib, renderer_gir, core_gir ],
> +diff --git a/src/librygel-server/meson.build b/src/librygel-server/meson.build
> +index a3bd77d9..6b084eb6 100644
> +--- a/src/librygel-server/meson.build
> ++++ b/src/librygel-server/meson.build
> +@@ -122,6 +122,7 @@ custom_target('RygelServer-2.6.typelib',
> +                command: [g_ir_compiler,
> +                         '--output', '@OUTPUT@',
> +                         '--includedir', core_girdir,
> ++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
> +                         join_paths(meson.current_build_dir(), 'RygelServer-2.6.gir')],
> +                output: 'RygelServer-2.6.typelib',
> +                depends: [ server_lib, server_gir, core_gir ],
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
