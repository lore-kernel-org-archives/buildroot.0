Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D71C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C47882FA9;
	Mon,  6 Dec 2021 21:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iS3xZ9DdrZeB; Mon,  6 Dec 2021 21:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C208282C;
	Mon,  6 Dec 2021 21:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BFA81BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C8A38282C
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXH0lvzFSCFO for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5197C82503
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o20so48519917eds.10
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fgwbn7d0nMHjjQUMypT74h4+QXv72GsUJ9HzIaQVn6s=;
 b=IwO7Tjj7ESGjzU3q9B2UiihP31vothZwrsefaAlv9qGy57jTM6HJc++/1u0YBA1i1O
 Sn0YdqJkeJNWS88a/vXUiN482X1jtgWS+/fCBqXJ0lS++3fXSLoBQJFOIj7RHFq6fNQf
 zTFQzGNIJl2OKuHlOPcudQwW2l+an95J/GJGR7TwVltBX1+WfwruL6M7WxyAGPbgFtjc
 1qy0OFsenEZ9CiZz8wXTmul7y8ag3hdPRA1jxlpJnNp0Ac2EZUs0BuPK3NMnUjN2HJUj
 0aaWIkfbeMEQm9iErKfQDOEY8+JVhG7MvtfLL9Qo4ZJc26RQ6hpZToYui0aZ5Kt0zpfQ
 uORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fgwbn7d0nMHjjQUMypT74h4+QXv72GsUJ9HzIaQVn6s=;
 b=zhacrECo85y9qAqR3jV4nU9agtjM3OyMbpAQyrMpnS7IxBQ3RMCwDFhGICi6Bv5Vft
 EysCkLhPtIqX0EVEJ8cOrWsC6mZSBt05HnZ0p+9/ttHo9NeGbeH6XAQD8BkuGnP5S/K3
 efKoxv4Gu3PPCaDWfmMLxgx9NWBGD2GFEJzJ2zjaQCy5uMVSMECtNAysq9xsn1l6Rdus
 R8DEVn6qrnMk7qzjIIMk4L8xz3nFPuCfbymmOHR/6/snp/wbMEHozoyQuUJ/6tWIrxEF
 L5EYvT3VkOp/KFdGBVcAXzObOwMPZyBjExesqo2CbS1mveOp6VcGXrM4tBJPoNcllIl9
 HZoA==
X-Gm-Message-State: AOAM533lin068AVr35erk6yJsEnHNC/b6bPjT2s5MgSNRi5tEj1xluFc
 HLDSN3mK3O6LTPqc0DTmRt2vmA==
X-Google-Smtp-Source: ABdhPJztXPA7hz/Zu85YTBmjAeasbmLl9AU8wy3OexZnbPHSiDuU70JJdlibLufg/FsMI8xave/mDg==
X-Received: by 2002:a17:906:9b84:: with SMTP id
 dd4mr48735439ejc.280.1638825850319; 
 Mon, 06 Dec 2021 13:24:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nb17sm7477105ejc.7.2021.12.06.13.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:24:09 -0800 (PST)
Message-ID: <53de8e62-4076-c835-6c5b-1bba93799b84@mind.be>
Date: Mon, 6 Dec 2021 22:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211129061647.2173322-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211129061647.2173322-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next v2,
 1/1] utils/checkpackagelib/lib_mk.py: check typo in define
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/11/2021 07:16, Fabrice Fontaine wrote:
> Check typo in define to detect SMAKE_LINUX_CONFIG_FIXUPS in smack
> (fixed by 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)
> 
> The new expression will catch "SMAKE_CONF_OPTS" as well as
> "define SMAKE_LINUX_CONFIG_FIXUPS"
> 
> Two modifications were made:
>   - add (define\s+)? which will match "define " but also an empty value.
>     Thanks to this, the second group will always contain the variable
>     name.
>   - remove \s*(\+|)= which seems superfluous

  It wasn't entirely superfluous - without it, you're relying on the fact that 
it's not idented but it is capitalized to parse it as an assignment. But I guess 
that's OK.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Also, add GCC_TARGET in ALLOWED variable to avoid the following
> warnings:
> 
> arch/arch.mk:12: possible typo: GCC_TARGET_ARCH -> *ARCH*
> arch/arch.mk:13: possible typo: GCC_TARGET_ABI -> *ARCH*
> arch/arch.mk:14: possible typo: GCC_TARGET_NAN -> *ARCH*
> arch/arch.mk:15: possible typo: GCC_TARGET_FP32_MODE -> *ARCH*
> arch/arch.mk:16: possible typo: GCC_TARGET_CPU -> *ARCH*
> arch/arch.mk:17: possible typo: GCC_TARGET_FPU -> *ARCH*
> arch/arch.mk:18: possible typo: GCC_TARGET_FLOAT_ABI -> *ARCH*
> arch/arch.mk:19: possible typo: GCC_TARGET_MODE -> *ARCH*
> 
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle and Ricardo
> Martincoski):
>   - Update commit message
>   - Replace " " by "\s+"
> 
>   utils/checkpackagelib/lib_mk.py | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index d09922f724..a304f71fd5 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -236,6 +236,7 @@ class TypoInPackageVariable(_CheckFunction):
>           "BR_CCACHE_INITIAL_SETUP",
>           "BR_LIBC",
>           "BR_NO_CHECK_HASH_FOR",
> +        "GCC_TARGET",
>           "LINUX_EXTENSIONS",
>           "LINUX_POST_PATCH_HOOKS",
>           "LINUX_TOOLS",
> @@ -248,7 +249,7 @@ class TypoInPackageVariable(_CheckFunction):
>           "TARGET_FINALIZE_HOOKS",
>           "TARGETS_ROOTFS",
>           "XTENSA_CORE_NAME"]))
> -    VARIABLE = re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
> +    VARIABLE = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
>   
>       def before(self):
>           package, _ = os.path.splitext(os.path.basename(self.filename))
> @@ -258,7 +259,7 @@ class TypoInPackageVariable(_CheckFunction):
>           # linux extensions do not use LINUX_EXT_ prefix for variables
>           package = package.replace("LINUX_EXT_", "")
>           self.package = package
> -        self.REGEX = re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
> +        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
>           self.FIND_VIRTUAL = re.compile(
>               r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
>           self.virtual = []
> @@ -268,7 +269,7 @@ class TypoInPackageVariable(_CheckFunction):
>           if m is None:
>               return
>   
> -        variable = m.group(1)
> +        variable = m.group(2)
>   
>           # allow to set variables for virtual package this package provides
>           v = self.FIND_VIRTUAL.search(text)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
