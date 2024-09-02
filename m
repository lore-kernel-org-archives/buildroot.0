Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD6ECD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC23760622;
	Mon,  2 Sep 2024 16:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEysyOFDIQFa; Mon,  2 Sep 2024 16:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E856063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E856063D;
	Mon,  2 Sep 2024 16:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 852D41BF3FD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 723DC40187
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfEjd0LipS4u for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F634400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F634400B8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F634400B8
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:41:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 71AA113F8B5;
 Mon,  2 Sep 2024 18:41:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 18:41:20 +0200
Date: Mon, 2 Sep 2024 18:41:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Trimarchi <michael@amarulasolutions.com>
Message-ID: <ZtXqsMI7fp5F2zmr@landeda>
References: <20240902074109.50173-1-michael@amarulasolutions.com>
 <20240902074109.50173-2-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240902074109.50173-2-michael@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725295282;
 bh=6n6LfivsQe8bjSmv2JdERQ3GjGxpGWQSvNDEkKt4otQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkQTaD0NnoP9KdLgZjn3piQa+tvuDmn+8v1gLBPlBLDEIv1vTYECutauju1Td2lph
 THu0nq5ENID5PZu37iJJpxAypBsClhjQs0Nb1GzlOgOJQJpsiNjG1+oHyIMjcXNV80
 HLGcA1GSKu5GwJvqv3/Thqcx8ij/ktBk2yPH/ZcLlO7R8MqXBAH00ddYno38PmkSTo
 paKiSN/K/3Xx5FCFtQpSrPxtgwHBTGMugQbIkz1V3ltjX9rWjs+I5valZUPQhT+XQj
 IdIvbL5XsXtTGArwbKkilPND6N2CXUXsWHkdvtev7fdbPgRF9hmjJwbGnEVD24fY+B
 Hnpnh23m9j+OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=bkQTaD0N
Subject: Re: [Buildroot] [PATCH 2/2] scripts/cve: Restart the clone if the
 pull generate an exception
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

Michael, All,

On 2024-09-02 09:41 +0200, Michael Trimarchi spake thusly:
> If we are not able to pull from the directory, restart from a clean
> clone

In what situations would such a problem arise?

Is it due to a shallow clone as proposed in the first patch? If so, then
that's a good reason not to do a shallow clone.

Regards,
Yann E. MORIN.

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  support/scripts/cve.py | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> index 7d115a28b5..b205b72e65 100755
> --- a/support/scripts/cve.py
> +++ b/support/scripts/cve.py
> @@ -21,6 +21,7 @@ import datetime
>  import os
>  import distutils.version
>  import json
> +import shutil
>  import subprocess
>  import sys
>  import operator
> @@ -69,15 +70,21 @@ class CVE:
>  
>      @staticmethod
>      def download_nvd(nvd_git_dir):
> +        done = False
>          print(f"Updating from {NVD_BASE_URL}")
>          if os.path.exists(nvd_git_dir):
> -            subprocess.check_call(
> -                ["git", "pull"],
> -                cwd=nvd_git_dir,
> -                stdout=subprocess.DEVNULL,
> -                stderr=subprocess.DEVNULL,
> -            )
> -        else:
> +            try:
> +                subprocess.check_call(
> +                    ["git", "pull"],
> +                    cwd=nvd_git_dir,
> +                    stdout=subprocess.DEVNULL,
> +                    stderr=subprocess.DEVNULL,
> +                )
> +                done = True
> +            except:
> +                shutil.rmtree(nvd_git_dir)
> +
> +        if (not done):
>              # Create the directory and its parents; git
>              # happily clones into an empty directory.
>              os.makedirs(nvd_git_dir)
> -- 
> 2.43.0
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
