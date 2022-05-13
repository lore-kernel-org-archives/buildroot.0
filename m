Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F01C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8064540936;
	Fri, 13 May 2022 22:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7jEPUGMlce7; Fri, 13 May 2022 22:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64C994015A;
	Fri, 13 May 2022 22:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8581BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A02B40207
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfLXaXD9onAH for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 335374015A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:16 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c12so11448748edv.10
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zfwNNkc8oZr2jtzu3VmQS/CPYo8UcdoR5RvfgfIpVv0=;
 b=HVLyJSCi4kgZQRQhixdnn6jRyC8RvQrPhQvfGmzyNptGIPcAe9BSn02a8xpD9ZCrcV
 sMSGZpJAFb35BT80wU8GcqktYJaXCgaELq2VqQ3Uums3WegrANMZcyyTby2eIAXSINDD
 PgnLBupFbHFgWhhkgdRoLj64xi7agQCBhiFvu0bTjsHf87cLYUfLSX4FLQdV5XACU/1q
 E3nZokgek7hJ3EdUeM6r9DBeh7lH46sB1tjbp9CFoALWZe4HdsGvhNSKitUkvpl5vqKT
 aPPy1ln3xahBWDqyOe7T4Mg0+ggz4BVAIQBYEXDqeuzWgXoXR4CpcuFUCLXOQA9ew8w8
 vS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zfwNNkc8oZr2jtzu3VmQS/CPYo8UcdoR5RvfgfIpVv0=;
 b=5/kbOSXIqo78cDoJ7TFzL/0s2lZiQQzCdRTvKtcfiPufKrV48Xlmh5qya2tKx//4Td
 JiZOyXRtIqk5xXQgZysE6TsR6rTF2OmDANRio5esGVcyOjWnlcfCNtmEo5N4Ud01xjmU
 xamPFQqyAWn8MFDrE6iFtbcqSCrv13vJlIabK06nrClA1OaRmm3AX/IzAaVicWYlZBZK
 Jq1rRBcRP3kgHIsPsVPLpY5EDbDC1VM9amYbABZ50Nc72e1wAv4o6xbsPgoHMpbVznFy
 SIHrbQSFFlAQb1s4IxeM0QGwLpOtSpsVkuUPc8DghJH5nopX/HdvtpvAfwaXk90GDEH8
 woBA==
X-Gm-Message-State: AOAM530MpLLCrfybPVq8OUlyHS2iRu8ZLseSmTxr/M4kfbaTvUMJsgYw
 KUq9tT7UBEqrO2CjRr1b/E5MRA==
X-Google-Smtp-Source: ABdhPJxl08BWzY750l3zvJkKKAMaFc06c+18uGFC3/Et3HbZnAD3t9hO/kDznpKdbLz9xEjKWaG7Yg==
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr766496edz.195.1652479874435; 
 Fri, 13 May 2022 15:11:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 nr1-20020a1709068b8100b006f3ef214e41sm1134199ejc.167.2022.05.13.15.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:11:14 -0700 (PDT)
Message-ID: <725a6fcc-0ad4-7851-b294-4a4bfe33a348@mind.be>
Date: Sat, 14 May 2022 00:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220508191141.1270350-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220508191141.1270350-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,1/1] package/numactl: needs atomic
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/05/2022 21:11, Fabrice Fontaine wrote:
> numactl unconditionally uses __atomic_fetch_and resulting in the
> following build failure on architectures that need libatomic to provide
> atomic intrinsics (e.g. microblaze) since commit
> 4ed540ddf59bec4b389be44d7f42820d2466904f:
> 
> /nvmedata/autobuild/instance-5/output-1/host/lib/gcc/microblaze-buildroot-linux-uclibc/10.3.0/../../../../microblaze-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_node_to_cpus_v1':
> (.text+0x2a34): undefined reference to `__atomic_fetch_and_1'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e225cb83dae390d9dc543d4da85c52180efbd40a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>   - Reword commit message
> 
>   package/numactl/Config.in  | 1 +
>   package/rt-tests/Config.in | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/package/numactl/Config.in b/package/numactl/Config.in
> index 23cf7facb0..325a05d609 100644
> --- a/package/numactl/Config.in
> +++ b/package/numactl/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_NUMACTL
>   	bool "numactl"
>   	depends on BR2_USE_MMU # madvise()
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	help
>   	  numactl allows you to run your application on specific cpus
>   	  and memory nodes. It does this by supplying a NUMA memory
> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 8efa3d194e..ccfa040d70 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_RT_TESTS
>   	bool "rt-tests"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>   	depends on BR2_USE_MMU # fork(), numactl
> @@ -32,6 +33,7 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
>   
>   comment "rt-tests needs a uClibc or glibc toolchain w/ NPTL, headers >= 4.5, dynamic library"
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
>   		|| BR2_TOOLCHAIN_USES_MUSL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>   	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
