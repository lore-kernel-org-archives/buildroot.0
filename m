Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC213C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537A2416B6;
	Fri, 29 Jul 2022 20:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537A2416B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cskxApm9Sfhi; Fri, 29 Jul 2022 20:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB2A41582;
	Fri, 29 Jul 2022 20:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB2A41582
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 424E91BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A23A823C6
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A23A823C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Je6KzT4lGa2R for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:50:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E634981CA5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E634981CA5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:50:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d054:eb09:eac4:da7e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 01C4613F895;
 Fri, 29 Jul 2022 22:50:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Jul 2022 22:50:33 +0200
Date: Fri, 29 Jul 2022 22:50:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220729205033.GC1554632@scaer>
References: <20220727221217.1072588-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727221217.1072588-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659127837;
 bh=PQx6K7SL5a2gnwVftTXA3OWRGJpXKL675lVBzTfN/QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tvg++tOELbXSN7qUsvaIp4r0htCU8z81+EFxQtlzxZt5lt+chDs1ufBaMC/djvzHr
 +YVay5ItIwfDmYEm+adecA8obhgVFww89gsD3uTwYOvOXahp9xUZVFqATBMUmxDufQ
 Y4L7NSspMWZHPEUE1UWTP4+1Dy1vxY5qeU7+0rULF6nSToWzDoP3z2TLVJO96Tz9kb
 InWKWYu3CjIYQ4YkGV6qW/kAz4ZOkhVwsoq4WFQzCTpatsS9FEZm+24p9QWuk2gji5
 NTOBlm5RK2rALJSFzuO9c4YEEJ/ZnDmZdG+1U9rdH9KfmIBKaDrR/vWL8CXlCpmEsz
 TNAZIpA2JOlMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tvg++tOE
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: introduce "Integration
 topics" chapter
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-07-28 00:12 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> We want to add more information in the manual about how a system created
> with buildroot works overall. We currently already have a chapter about
> SELinux, but we want to add more information like that, e.g. details
> about how systemd in Buildroot works.
> 
> Create a new chapter "Integration topics" with an introductory blurb,
> and move the SELinux topic under it (as a section rather than a
> chapter).
> 
> "Integration topics" is not the best title, but we couldn't find
> anything better.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master with the fix spotted by Edgard, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...x-support.txt => integration-selinux-support.txt} |  6 +++---
>  docs/manual/integration.txt                          | 12 ++++++++++++
>  docs/manual/manual.txt                               |  2 ++
>  3 files changed, 17 insertions(+), 3 deletions(-)
>  rename docs/manual/{selinux-support.txt => integration-selinux-support.txt} (96%)
>  create mode 100644 docs/manual/integration.txt
> 
> diff --git a/docs/manual/selinux-support.txt b/docs/manual/integration-selinux-support.txt
> similarity index 96%
> rename from docs/manual/selinux-support.txt
> rename to docs/manual/integration-selinux-support.txt
> index 21137ae6c3..1f6bcf47eb 100644
> --- a/docs/manual/selinux-support.txt
> +++ b/docs/manual/integration-selinux-support.txt
> @@ -2,7 +2,7 @@
>  // vim: set syntax=asciidoc:
>  
>  [[selinux]]
> -== Using SELinux in Buildroot
> +=== Using SELinux in Buildroot
>  
>  https://selinuxproject.org[SELinux] is a Linux kernel security module
>  enforcing access control policies. In addition to the traditional file
> @@ -30,7 +30,7 @@ upstream https://github.com/SELinuxProject/refpolicy[refpolicy]
>  project, enabled with +BR2_PACKAGE_REFPOLICY+.
>  
>  [[enabling-selinux]]
> -=== Enabling SELinux support
> +==== Enabling SELinux support
>  
>  To have proper support for +SELinux+ in a Buildroot generated system,
>  the following configuration options must be enabled:
> @@ -42,7 +42,7 @@ In addition, your filesystem image format must support extended
>  attributes.
>  
>  [[selinux-policy-tweaking]]
> -=== SELinux policy tweaking
> +==== SELinux policy tweaking
>  
>  The +SELinux refpolicy+ contains modules that can be enabled or
>  disabled when being built. Each module provide a number of +SELinux+
> diff --git a/docs/manual/integration.txt b/docs/manual/integration.txt
> new file mode 100644
> index 0000000000..bdfbfa59de
> --- /dev/null
> +++ b/docs/manual/integration.txt
> @@ -0,0 +1,12 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[integration]]
> +== Integration topics
> +
> +This chapter discusses how various things are integrated at system
> +level. Buildroot is highly configurable, almost everything discussed
> +here can be changed or overridden by xref:rootfs-custom[rootfs overlay
> +or custom skeleton] configuration.
> +
> +include::integration-selinux-support.txt[]
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index b5cc044805..8ba0c76d32 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -38,6 +38,8 @@ include::common-usage.txt[]
>  
>  include::customize.txt[]
>  
> +include::integration.txt[]
> +
>  include::selinux-support.txt[]
>  
>  include::faq-troubleshooting.txt[]
> -- 
> 2.35.3
> 

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
