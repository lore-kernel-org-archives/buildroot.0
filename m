Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A90CC77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 19:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4423410D8;
	Tue,  9 May 2023 19:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4423410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPorylEboFwy; Tue,  9 May 2023 19:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2E0410A8;
	Tue,  9 May 2023 19:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2E0410A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60A3A1BF337
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 19:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4609C40946
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 19:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4609C40946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v38scCk_LACI for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 19:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6BA44035F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6BA44035F
 for <buildroot@buildroot.org>; Tue,  9 May 2023 19:43:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1E4FB780511;
 Tue,  9 May 2023 21:43:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 21:43:06 +0200
Date: Tue, 9 May 2023 21:43:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230509194306.GC252090@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-2-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425171454.48802-2-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683661394;
 bh=bn+dDvdBUi6SiIbpUdXkWKE6OT+YE+qNSdVv9pZc/WE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kWmLyhnWnK8+bGqkBF1YvzFsShwOfyFyTfDy8bLYm5SaVPvE+sI6+gsPfvyFPhTvp
 +p9H+XHT+D5+3v/mtbydw6KJlAQmN9we8wIcpB+WpFDWzYStt6VvvlI+N+MLHMzZy8
 c1Wppk7jW6ADQsQac0OsbzZ0Rfp8HUMl6ioVa+p3UDzW/eDdVglMXnhDk2DHLZ1+u0
 HwUIPVIZUzpT/ZFyD6uo8UFpTy+VRbWTZEjwRcJBz30aOc4cH+++adcXPYAciiB2n8
 YjCRLQvXRE1xN0eOmolKbHk3MWmo+vJVhh0KFbNz75fwn9ri8ByGlpvMxEww5/zMRz
 8cM8hnHiEfnmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kWmLyhnW
Subject: Re: [Buildroot] [PATCH v2 01/13]
 package/libglib2/0003-disable-building-docs.patch: new patch
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-25 10:14 -0700, Adam Duskett spake thusly:
> If rst2html5 is installed on a host system, meson will attempt to build
> html5 documentation from the docs directory, resulting in the following
> error:
> 
> /usr/local/bin/rst2html5.py
> Traceback (most recent call last):
>   File "/usr/local/bin/rst2html5.py", line 27, in <module>
>     from docutils.core import publish_cmdline, default_description
> ModuleNotFoundError: No module named 'docutils'
> 
> Since we don't need, nor want to build the documentation, remove the docs
> subdirectory from being built entirely.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

As noticed by James, there is an upstream patch that fixes the issue, so
I've instead backported that.

Also, see below...

> ---
>  .../libglib2/0003-disable-building-docs.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libglib2/0003-disable-building-docs.patch
> 
> diff --git a/package/libglib2/0003-disable-building-docs.patch b/package/libglib2/0003-disable-building-docs.patch
> new file mode 100644
> index 0000000000..27a540bf61
> --- /dev/null
> +++ b/package/libglib2/0003-disable-building-docs.patch
> @@ -0,0 +1,38 @@
> +From f3b8515471aaa452f06d84da68372fcead8637d2 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 24 Apr 2023 11:52:24 -0700
> +Subject: [PATCH 1/1] disable building docs
> +
> +If rst2html5 is installed on a host system, meson will attempt to build
> +html5 documentation from the docs directory, resulting in the following
> +error:
> +
> +/usr/local/bin/rst2html5.py
> +Traceback (most recent call last):
> +  File "/usr/local/bin/rst2html5.py", line 27, in <module>
> +    from docutils.core import publish_cmdline, default_description
> +ModuleNotFoundError: No module named 'docutils'
> +
> +Since we don't need, nor want to build the documentation, remove the docs
> +subdirectory from being built entirely.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

    $ ./utils/docker-run make check-package
    package/libglib2/0003-disable-building-docs.patch:4: generate your patches with 'git format-patch -N'
    package/libglib2/0003-disable-building-docs.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

Since I've replaced your path with a backport, that fixed those
warnings. ;-)

Regards,
Yann E. MORIN.

> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 0cbc968..28e1147 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -2442,7 +2442,6 @@ if get_option('man')
> + endif
> + 
> + gnome = import('gnome')
> +-subdir('docs/reference')
> + 
> + summary({
> +   'host cpu' : host_machine.cpu_family(),
> +-- 
> +2.40.0
> +
> -- 
> 2.40.0
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
