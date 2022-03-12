Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F97C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D120E410B3;
	Sat, 12 Mar 2022 20:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-UqLdXoBC0n; Sat, 12 Mar 2022 20:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B748410AF;
	Sat, 12 Mar 2022 20:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1177E1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BAE0410AF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVqxZI1WmrNs for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C739410AE
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:25:31 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gb39so25916337ejc.1
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=qHlURVpZ2k7OkJjfR8ljftEU5lyL3sefzaZf0SPGRi8=;
 b=dBEb4d0HHLR9pGrqtj/YOaAdHTCCKZ+qdXg+JRn/MOoVvfrEGgeWNgK15w3aYmBxzL
 O9UTy4zVgoAvIT8Y5CdoB+stP8eq5S8VNTjQsrKbpzfgTVsY8+VmWYmO3Sn2KOxLFK/Z
 QMnx78XMT/6Pk0bC982qvCKM7QzsnoJMWosKeZQ47RqhFUkspCIhnnPNYsuTda8yEjJE
 JRXxuppY6Rj96xXajPsVIw3J0OG+5vCoqsWBEwjVd0EgHo37ohn9CnU/2tP5lOWdaLOy
 8lvH/U8linVsgE7BeN8HOed2PlIS42Ph0dQ7thuvitw8i+ZOCD22W+KlazlU07FijYUg
 kJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qHlURVpZ2k7OkJjfR8ljftEU5lyL3sefzaZf0SPGRi8=;
 b=usWTR1DZQBRJcgz+7+7amD4vWQJ/F58JCXmK/3JxG+4Xdo23ut5B2FZc4I80Xw24KQ
 LX//W8ZcqReRQemmbHJw/QtknhRS70GCDE8X/wcyp1ItqLqzODQfDXxV7/FdQwwxc514
 3UMxBgjDr5spD7z7N56IH2g6KwFmp21Jc9kGi3xBXcj+T6NuRikcqXMn19hi7TgZ3HmO
 l+cczLq+xLtH6hlD4CoU/azmQZcVv6Cty40ATfjYHM+9NT5bYg7oYziOkAC6sircab2A
 xHDN/TKGTikrk1aiPaCTsWU/Humkn7/x/6mkWd+LuAj213JzU80FhF2XwwADsYfjeeHY
 QMsQ==
X-Gm-Message-State: AOAM531mUVILMYJ3FdyCFGv1e4LfYe1Qp4C7sC825MwykPPcHQrNYlD4
 PXe9QLZkEyDR7sljS6CXXPN9DA==
X-Google-Smtp-Source: ABdhPJw7s0AxASF1iGbO+iGjeo73bkwmCgbrI+/xIm0JDRrstYMBq2rZtpG5g1O5X3+NykMBjNHs0A==
X-Received: by 2002:a17:906:6144:b0:6cf:bb2e:a2e1 with SMTP id
 p4-20020a170906614400b006cfbb2ea2e1mr13592971ejl.299.1647116730292; 
 Sat, 12 Mar 2022 12:25:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709063a0500b006da8fa9526esm4668731eje.178.2022.03.12.12.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:25:29 -0800 (PST)
Message-ID: <df142276-680b-6965-1344-30afc9fd7807@mind.be>
Date: Sat, 12 Mar 2022 21:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220225083037.229109-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220225083037.229109-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/rust: set musl-root for musl
 toolchains
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



On 25/02/2022 09:30, Romain Naour wrote:
> Without musl-root in config.toml the build stop with the following error:
> 
> thread 'main' panicked at 'couldn't find libc.a in musl libdir: output/host/arm-buildroot-linux-musleabihf/sysroot/lib/lib', src/bootstrap/sanity.rs:192:25
> 
> musl-root is needed to provide the path to libc.a and libunwind.a because
> rust link them statically into the standard library and liblibc [1].
> 
> For other libc, musl-root is not used and ignored [2].
> 
> [1] https://github.com/rust-lang/rust/commit/cd980b3bee5bd48e8a6cd4c0d7c8e0fb0fdb64dd
> [2] https://github.com/rust-lang/rust/blob/1.58.1/src/bootstrap/sanity.rs#L181
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Runtime tested with TestRust with ripgrep and bat packages.
> ---
>   package/rust/rust.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 4a6b04dc8c..c2e0a361dd 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -56,6 +56,7 @@ define HOST_RUST_CONFIGURE_CMDS
>   		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
>   		echo '[rust]'; \
>   		echo 'channel = "stable"'; \
> +		echo 'musl-root = "$(STAGING_DIR)"' ; \
>   		echo '[target.$(RUSTC_TARGET_NAME)]'; \
>   		echo 'cc = "$(TARGET_CROSS)gcc"'; \
>   		echo '[llvm]'; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
