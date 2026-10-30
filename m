Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790E606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ELhpWrey
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC1C8156B;
	Fri, 30 Oct 2026 15:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rh-h_5dylXt; Fri, 30 Oct 2026 15:28:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C794F816DB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374081;
	b=AEkfXe3gl1RbGyoQ+buHh4mWF12LKrFbbDnB98MBY94FlZ5j4cbFbPlNW4Sq72YID/H9
	 gAsXNQLjNIl/LMv7dSB11BkWqa0mH+yD/Fw8u7K6kQR81Lp/W6/zjyZwvB+uAhv6Xq7ek
	 YcW0+ybSuVyd220+z8h8dzaFCa48anWwJgnAPmQ/fUSqFvvsUpj+GCfxTfOm1bwUL4L/s
	 EmhPATwsRhU4+tQRfsoHP6YV7/fuLvae2GGJ2MXb7mXZiLZT5E02qDQ83louWENOyWmdX
	 FVfP62EIjkW7YkzWtwl0K4ZyP74jbmxwkqMT6a/TWP9elXOnt1rrBgbd9W28haZsKuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374081;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jx/RYUuNX+HDblhqHla6Zdb2FM3W56jK0syK6WyNfKE=;
	b=o38huS56IrM62ASFHQR8peWkj/ccxaACsLJTXIukDTPc9fqBR6y4EOmOc58/wVdaQZPy
	 k+H+4t1ko46RjHOGlkz4wHsDsdNbkPfL1si5sWvuUfcWEpOIeQU/VTaA3Jy4EQQAJfou5
	 4TuysuzbK7781UNCLO2GrxyqWm99evZPq/4rppvDNQNEdif0lyiONXqxYmEanARQg5rUv
	 spmM7fRQeu0LK2ljjA4jyrYQkbE5rhyUoJJAO3fwzmwm/L9jvyCfQaimahKiBY+zF3L71
	 YvRQknPqlJ/OIcSB+78v7dXM+1r8QTEt/hGV/uOWzic7jZuammI2+G3vV4rRMq95YWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374081;
	bh=jx/RYUuNX+HDblhqHla6Zdb2FM3W56jK0syK6WyNfKE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ELhpWreywYuh//8qIh2QuRQhFyRiqE16GtGRm9bT9YgWjmbHMRv6U3Bc2V15sK9yX
	 T8jxbVHxAHy5dhY9lyNzdycoaGJzhZzSZskIxDrRKBxnIP8nhr0g16SP7osc72AYfc
	 eJlFnvyv3XK/KCrIpdYPeknNxxiqq34pIbWeraIHDuc3OfLZxlzyH28SqxSwFykzP4
	 eIOsIx8Pp0FwYGGuvCzqK9fXIUQLq4Ai8TM7GJpae5ohXRQsAZ2KXPpNu2DV7Sq/C5
	 W0RfkSIr3k3/lbPSU5A95mnHUfA3LAoC/+RABIIKTvoeb5lhlmpYR2dPhII8ejlF9/
	 Nn6dbcXg6coUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C794F816DB;
	Fri, 30 Oct 2026 15:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34746235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2673940211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJE7w8TH_yE0 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E31AC4053E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374058;
 b=WVrvCSu+K09lnOqGuRwTJGT6wpL/rDXhDEZJ+BzGKpCo5qzKozHPB51vkfxZAR91K2jN
 2ocWQIuFsQ5clebRPGUj5WbYxIA2WajwpmCeL42L2RZZsmtfMWXKegESqPFKeazDjNERB
 VvmJzBse1oAwfrMX9HPQ1LQqrjcB0NRRTz0iKJv1f79orGvRTeNJAhGl0R9596trByOqL
 WsiNqB3qjcRdEaBimWsTvhf8GVZkWO8b39P+Dsaxo6kg2b4fUYYBliouk6Co7zEcPxrOc
 +PF+jEQCa012ZLwrIVcob1nV+jzEC0zWYXzJ+L0lIkLLV472YnzXsaYxCep51qa0Q5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374058;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SPl2zFLY3j7BL/EMLxHsSbLJ2KAqMHTJOmcMux/DiIQ=;
 b=tF9P3QFlt2TvzbxoDJndDVe163QhZG0eL1nk0z0Hx7DhqAhHpXyJqBm/7XwipYo/VQpY
 O9CflIdh4uVcHr3vf5AqdLuRkDQNv+T9N1a2smTP7Mp90AvRrPSVZ9vpWDSLYlOdrivuI
 v+dCKAeazg8j0wveQ/K+HiRhB0u2oF/7wo81yPp3XKCfmNmXH63jH7TY4iI3y1+9peOqy
 kSFsvifIh3k0tKxDTExUMVkFUTj9lCAGR3iP4eyl+nIxNd64JGBWqTKI4ScnwqcOI10Xw
 11eOLPvctOO/9PDIkZ0l+DNsosPi1CdqLya/b+IQwVvD3BABdwSQasoRZCkNiydDnoQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eXdRvyFG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E31AC4053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so540803f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374056; x=1793978856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SPl2zFLY3j7BL/EMLxHsSbLJ2KAqMHTJOmcMux/DiIQ=;
 b=F5eQf/Yca74TqWnhz831hKJ1xxqgqiHHRpc/NrNC0p/qla+bXSq/8Kd51SmF6vgsRz
 Gv5nNBtG46AaHk/qHJ5KiFaX2CFWsrp7jV/xh1lOQXJuzlS19LmSeI04iQGx1LU1FH9b
 qEwlnIcen4zUmxiRxCv1Wf2qS/R0VEvLjJUEphERKHlLq010Cr54/Vp/YT+YC9RsCAjy
 AjoEcovBYVv9wLZ6VvydqK3hIA63heWbIl/ob2YBwLeBj3Z4CbdiCW9rbjQqfuIL91GA
 Cu6qSZsoWeZvAvUf94Zvt4yhb1BNOe/+v3BTCyVcru/YX0oOsp4IgGdycaeRcjQXvddJ
 6jBA==
X-Gm-Message-State: AFq9FYLkQIasCEpzPF1iW5301YLam1SCf3KjBKFYYpxfnYZtLJPGHy1b
 QnVpW/o7GeMeqDZWerN/zakJoD66+Dt5VHRqoKOXSUpGQcxJvSoUnsCfXuL1sgpq7KqkshgQR16
 Z8OcPzoE=
X-Gm-Gg: AYBFou0+CMN76ygNG/0B7GX9djg/3hX30CyYQwt+x/yy5g3qFeubCPzdLhffAtzHGxF
 Y8+ak+8NfrjWkVIjiu990AZDMKGLJ5oowrBHA8m0jM5oleg9g+gfjAOaXz6EvHkvqFdhwhy+idm
 RgHnD/LHYW8wR50Y35VtRlQrqaTmh6SShsJ4Mzy55/85xvzrYpSVE6Xy7p69546N6kkJn1V4nO9
 eEE7WxgAo3fGLPn0pXl64uxkcT/UiO5PLwjiBItiGjvIuNsX1Qsj5/JDWfgQ1/87qMhr3b9K3H8
 evCx5ZksfnnnFe3OGlNzKquc3j+sHFiIzPThhr9lGnlVDIVOg4PFm/6CNTmpxhvxVefNc6C1FrO
 B1sr3rqa6vcb5SMEqygJswOv0+tCcc4I/CSDeNPk59mb62nA3LJM3cbhIt3Glu4y+nPGx58QkRG
 FiaobcjlpDEkTKPlv358eWPZ6MdDX4bPGlNG6sx87/mzBP5HQQhPvCcmrvrOarezuqbeTO8uhX/
 kOd9M8UCXJTJtjsGOStWJavs5pCA0uk0ksM0dMxF2dusOTwz7+HR67LnncmUK9wsY3/IE1dHA4f
 98s6/SjnZJSYAiLa7jHwHj2MnF41aLiwsxWUvCV86uQdPwApQ8si5Nji0wNXEuqzPFL+S5pL
X-Received: by 2002:a05:6000:41c3:b0:48c:4658:602b with SMTP id
 ffacd0b85a97d-48e6e4f5605mr6087697f8f.10.1793374055675; 
 Fri, 30 Oct 2026 08:27:35 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b964desm3763846f8f.46.2026.10.30.08.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:32 +0100
Message-ID: <20261030152734.1906832-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020202639.1094960-3-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] utils/genrandconfig: implement
 secondary configurations filter
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit [1] marked a set of target configurations as
> "secondary", with the intent to test those less frequently in
> autobuilders. This was implemented by adding a Kconfig "depends on
> !BR2_HIDE_SECONDARY_TARGET_OPTIONS" which was controlled by an
> environment variable that could be set by the "autobuild-run"
> script. It turns out that "make randconfig" is not selecting random
> configs amongst the available options (i.e. following the
> dependencies). Instead, it selects fully random options, and if a
> dependency could not be met, the default choice is taken. As a
> result, every time a secondary architecture needed to be filtered
> out, the default architecture was selected instead, which is
> currently i686 at the time of this commit.
> 
> This commit reimplement the list of secondary configurations
> initially made in commit [1] as a filter in the
> "utils/genrandcondig" script. This commit also adds the following
> x86 i586 CPUs which were missed in commit [1]:
> c3, geode, pentium_mmx, winchip2, winchip_c6
> 
> Since "utils/genrandcondig" is called from "autobuild-run",
> this commit fixes the too frequent i686 architecture issue.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/ddce0814a794b27a6449b144f85c90fa53e92ac6
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/genrandconfig | 49 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 5cea529354..e6655fe189 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -99,7 +99,46 @@ class SystemInfo:
>          return not missing_requirements
>  
>  
> -async def fixup_config(sysinfo, configfile):
> +def is_secondary_config(configlines):
> +    """Identify secondary configurations.
> +
> +    This function identifies configurations considered as
> +    "secondary". This classification can be used to skip those less
> +    frequent configurations.
> +
> +    Returns: 'True' if the configuration is considered as "secondary",
> +    or 'False' otherwise.
> +    """
> +
> +    secondary_configs = [
> +        # Secondary architectures (including all CPUs)
> +        "arcle", "armeb", "aarch64_be", "hppa", "loongarch64", "m68k",
> +        "microblazeel", "microblazebe", "mips", "mipsel", "mips64",
> +        "or1k", "powerpc", "powerpc64", "s390x", "sh", "sparc",
> +        "sparc64", "xtensa",
> +        # Secondary CPUs:
> +        # Armv4 CPUs:
> +        "arm920t", "arm922t", "fa526", "strongarm",
> +        # Older 32bit CPUs before i686:
> +        "x86_c3", "x86_geode", "x86_i486", "x86_i586",
> +        "x86_pentium_mmx", "x86_winchip2", "x86_winchip_c6",
> +        "x86_x1000",
> +        # All RISC-V 32-bit:
> +        "RISCV_32"
> +    ]
> +    for cfg in secondary_configs:
> +        if f"BR2_{cfg}=y\n" in configlines:
> +            return True
> +
> +    # We also mark RISC-V 64-bit noMMU as secondary
> +    if "BR2_RISCV_64=y\n" in configlines and \
> +       "BR2_RISCV_USE_MMU=y\n" not in configlines:
> +        return True
> +
> +    return False
> +
> +
> +async def fixup_config(sysinfo, configfile, skip_secondary_configs=True):
>      """Finalize the configuration and reject any problematic combinations
>  
>      This function returns 'True' when the configuration has been
> @@ -113,6 +152,9 @@ async def fixup_config(sysinfo, configfile):
>  
>      ROOTFS_SIZE = '5G'
>  
> +    if skip_secondary_configs and is_secondary_config(configlines):
> +        return False
> +
>      # libffi not available on ARMv7-M, but propagating libffi arch
>      # dependencies in Buildroot is really too much work, so we handle
>      # this here.
> @@ -530,6 +572,9 @@ async def gen_config(args):
>      else:
>          configfile = os.path.join(args.outputdir, ".config")
>  
> +    # Skip secondary configurations 90% of the time
> +    skip_secondary_configs = randint(0, 9) != 0
> +
>      # Now, generate the random selection of packages, and fixup
>      # things if needed.
>      # Safe-guard, in case we can not quickly come to a valid
> @@ -553,7 +598,7 @@ async def gen_config(args):
>          if ret:
>              return ret
>  
> -        if await fixup_config(sysinfo, configfile):
> +        if await fixup_config(sysinfo, configfile, skip_secondary_configs):
>              print("  configuration valid")
>              break
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
