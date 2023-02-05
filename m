Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1AEC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 08:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA18641851;
	Sun,  5 Feb 2023 08:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA18641851
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OY7kresrLv82; Sun,  5 Feb 2023 08:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B444F41859;
	Sun,  5 Feb 2023 08:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B444F41859
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7761BF20B
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D68B8400D7
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 08:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D68B8400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4J9yiLCRZmrM for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 08:20:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 873B5400AF
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 873B5400AF
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 08:20:18 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 45F49BDE0395;
 Sun,  5 Feb 2023 09:20:15 +0100 (CET)
MIME-Version: 1.0
Date: Sun, 05 Feb 2023 09:20:15 +0100
From: Andreas Ziegler <br015@umbiko.net>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
References: <mailman.18015.1675100677.179342.buildroot@buildroot.org>
Message-ID: <bd47b6d90e460842dbe8252016f2b077@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1675585215; bh=TxJaSEhNp6SpZ+BfUc6wccn6WzmfpIer9Ap+EnqgV28=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=agvhRHVV6Os8Ku5ImJBy9ZS6wAH2IWz/AH4WoJEkMpGkmkWlCvsc9HixklMXfn83c
 I8KG7+/j/eE9akQXM3BQkW1YpSmHY6Gp5Ue0j6WRMykGhFb0m+I/ozeXj4mKPaO4Lm
 iIK//z4GcNbC17VF0wEsVJ5luUQdsjEMfMcsVXgk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=agvhRHVV
Subject: Re: [Buildroot] [PATCH 1/4] package/libtraceevent: new package
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

libtraceevent and libtracefs are libraries, thus should be positioned 
under "Target packages" -> "Libraries".

Introducing a "Debugging, profiling and benchmark" category here would 
probably be appropriate.

Tested successfully on x86_64 hardware.

Kind regards,
Andreas

On 2023-01-30 18:44, Maxime Chevallier wrote:
> 
> Introduce the libtraceevent library, that used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd, libtracefs and rtla.
> 
> This package tries to install libraries in /usr/local/lib by default,
> hence the redefinition of the "prefix" variable, so that the library
> gets installed in "/usr/lib" instead.
> 
> The same applies to the pkgconfig handling of the proved Makefile, 
> which
> installs the .pc files in the /usr/local area by default, hence the
> redefinition of the pkgconfig_dir to either the correct directory 
> within the
> staging area, or to empty value for the target to avoid installing the 
> .pc
> in that case.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  DEVELOPERS                             |  3 +++
>  package/Config.in                      |  1 +
>  package/libtraceevent/Config.in        |  9 +++++++
>  package/libtraceevent/libtraceevent.mk | 33 ++++++++++++++++++++++++++
>  4 files changed, 46 insertions(+)
>  create mode 100644 package/libtraceevent/Config.in
>  create mode 100644 package/libtraceevent/libtraceevent.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 706ee80ece..fcf05e0aa0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2106,6 +2106,9 @@ F:	package/postgresql/
>  F:	package/protozero/
>  F:	package/timescaledb/
> 
> +N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
> +F:	package/libtraceevent/
> +
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
>  F:	configs/arcturus_ucp1020_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index 83fddf316f..2f0e6dcb18 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/kyua/Config.in"
>  	source "package/latencytop/Config.in"
>  	source "package/libbpf/Config.in"
> +	source "package/libtraceevent/Config.in"
>  	source "package/lmbench/Config.in"
>  	source "package/lsof/Config.in"
>  	source "package/ltp-testsuite/Config.in"
> diff --git a/package/libtraceevent/Config.in 
> b/package/libtraceevent/Config.in
> new file mode 100644
> index 0000000000..d351e3b4de
> --- /dev/null
> +++ b/package/libtraceevent/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBTRACEEVENT
> +	bool "libtraceevent"
> +	help
> +	  libtraceevent is a library that interfaces with the ftrace
> +	  subsystem in the linux kernel.
> +	  It used to be bundled directly in the trace-cmd
> +	  tool, but it was eventually extracted so that it can be used
> +	  by multiple other tools and libraries, such as libtracefs and
> +	  rtla.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
