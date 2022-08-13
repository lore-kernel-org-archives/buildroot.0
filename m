Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC3C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54EFD60A7E;
	Sat, 13 Aug 2022 22:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54EFD60A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7czI65aF_jD; Sat, 13 Aug 2022 22:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 635AF60A75;
	Sat, 13 Aug 2022 22:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635AF60A75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 723361BF5A4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF9A83E89
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 22:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF9A83E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BvQSO6kPbQ7i for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 22:26:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2107383E95
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2107383E95
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 22:26:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ac43:2f79:1c81:6f7d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D31E96012A;
 Sun, 14 Aug 2022 00:26:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 00:26:31 +0200
Date: Sun, 14 Aug 2022 00:26:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220813222631.GB2854108@scaer>
References: <20220813202018.2420987-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813202018.2420987-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660429593;
 bh=JlihF15khaNJA9rLiCrmp0RROAXljfB7VfSdGpPuAuY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lu01n72T1v9SlgbIpp8c+TWwjkdfIdF0qWA8f6UuFPG+N8EfqhzAoYfRArFzDH+EK
 HlTQ/qPeRaG+EgL4zQp/eoXY1PenCkiGvkUyrb3qM+yUkAvYjUITt/CINMbXFCMfwe
 oyAfsa1MzhbbocnanGjhb6P+GBtpLvkcnUR+oIXuU0cVbDS2q3/d2uN0Tm+8Is+lPZ
 rR6+ng/s4oNQv/V+iKuy4sVsPaA3dmvYTjXm245UZ76gG1kEaAV0dh8rcxZbsGA4X9
 pHkUgbREX4qKVu/zUn7meiI7ndiKfQW/f+u4c1JmxzAGt+uhXQydEt7jynubNlvbma
 GHUlY9JoC+oug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lu01n72T
Subject: Re: [Buildroot] [PATCH 1/1] package/lshw: fix build with gcc 4.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-13 22:20 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 4.8 raised since commit
> 72a009fa98a37825624f70dc2a1cf825a5999a0a:
> 
> hw.cc: In member function 'long long int hw::value::asInteger() const':
> hw.cc:2462:36: error: 'stoll' was not declared in this scope
>        return stoll(This->s, NULL, 0);
>                                     ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/162e438e3f9aab9310fdbc3cf7529144ce7cb50e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-error-when-g-version-is-less-than-5.patch | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
> 
> diff --git a/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch b/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
> new file mode 100644
> index 0000000000..f15c8bc52c
> --- /dev/null
> +++ b/package/lshw/0001-solve-Compile-error-when-g-version-is-less-than-5.patch
> @@ -0,0 +1,65 @@
> +From 383c80bf486f806438bb11a9c9a9567407cd47ab Mon Sep 17 00:00:00 2001
> +From: "E.V.Acacia" <624758472@qq.com>
> +Date: Fri, 3 Sep 2021 14:19:37 +0800
> +Subject: [PATCH] solve: Compile error when gcc version is less than 5
> +
> +[Retrieved from:
> +https://github.com/lyonel/lshw/pull/70/commits/383c80bf486f806438bb11a9c9a9567407cd47ab]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/core/cpuinfo.cc | 8 ++++----
> + src/core/hw.cc      | 2 +-
> + src/core/spd.cc     | 4 ++--
> + 3 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/core/cpuinfo.cc b/src/core/cpuinfo.cc
> +index 9e41a421..ed1c4164 100644
> +--- a/src/core/cpuinfo.cc
> ++++ b/src/core/cpuinfo.cc
> +@@ -465,13 +465,13 @@ string value)
> +     if (id == "model name")
> +       cpu->setProduct(value);
> +     if (id == "microcode")
> +-      cpu->setConfig(id, stoll(value, NULL, 0));
> ++      cpu->setConfig(id, strtoll(value.c_str(), NULL, 0));
> +     if (id == "cpu family")
> +-      cpu->addHint(id, stoll(value, NULL, 0));
> ++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
> +     if (id == "model")
> +-      cpu->addHint(id, stoll(value, NULL, 0));
> ++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
> +     if (id == "stepping")
> +-      cpu->addHint(id, stoll(value, NULL, 0));
> ++      cpu->addHint(id, strtoll(value.c_str(), NULL, 0));
> + 
> +     family = cpu->getHint("cpu family");
> +     model = cpu->getHint("model");
> +diff --git a/src/core/hw.cc b/src/core/hw.cc
> +index 1c1dad46..b266a863 100644
> +--- a/src/core/hw.cc
> ++++ b/src/core/hw.cc
> +@@ -2459,7 +2459,7 @@ long long value::asInteger() const
> +   switch(This->type)
> +   {
> +     case hw::text:
> +-      return stoll(This->s, NULL, 0);
> ++      return strtoll(This->s.c_str(), NULL, 0);
> +     case hw::integer:
> +       return This->ll;
> +     case hw::boolean:
> +diff --git a/src/core/spd.cc b/src/core/spd.cc
> +index a304d061..2ad66b82 100644
> +--- a/src/core/spd.cc
> ++++ b/src/core/spd.cc
> +@@ -195,9 +195,9 @@ static bool scan_eeproms(hwNode & memory)
> +   {
> +     if (scan_eeprom(memory, namelist[i]->d_name))
> +       current_bank++;
> +-    free(namelist[i]);
> ++    delete(namelist[i]);
> +   }
> +-  free(namelist);
> ++  delete(namelist);
> + 
> +   return true;
> + }
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
