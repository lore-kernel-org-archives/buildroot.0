Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84125C4332F
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 21:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF62660B00;
	Sat,  3 Dec 2022 21:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF62660B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CamZGsONkB8v; Sat,  3 Dec 2022 21:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0AA60ACF;
	Sat,  3 Dec 2022 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0AA60ACF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 635FC1BF5DC
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AA3C81815
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA3C81815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MWtnBhdKGjt for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 21:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAB3B81465
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAB3B81465
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 21:16:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1A42C19F5A1;
 Sat,  3 Dec 2022 22:16:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 03 Dec 2022 22:16:02 +0100
Date: Sat, 3 Dec 2022 22:16:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20221203211602.GH3302@scaer>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
 <20221130075452.2507453-7-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130075452.2507453-7-etienne.carriere@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670102165;
 bh=Q2OoD/x9BYcfwkcPThmHnHIuBAVmACyxBvQ7SWhsjBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Px9YxUQ3++ccf3Ss8H58rUsB7UkWN0Ab4IRcKKmVeL7Pamr++Vcqg6GqFcGW35yJV
 YT+sDQpSzE8woVy5gkAFb6XqnyRBNdw0Sp0ngMhMRwVp4LEB2q4ssgdlTLjhR2zm6e
 0L0g+we1nCiMCFSTjffBwCD1lVx/9vmrpejFEh2hBGCMrxfCMfPfSgrRnmXT5Vx+02
 yMapA4/G5O1Y1HsPjH/9/JegDt2ifJtt37Ir6ozySueD63dQ4zY5OxwOd+Q4p3lmVG
 F8t1kFhjkRNRm9SdZYMXqlRuuAh/1OTMCjtuiMfrSz2uRS/uokkdLfSf0Y7iqKQME+
 XJEkTMqUaW8IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Px9YxUQ3
Subject: Re: [Buildroot] [PATCH 7/7] package: optee-client: fix identation
 issues
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

Etienne, All,

On 2022-11-30 08:54 +0100, Etienne Carriere spake thusly:
> Fix issues reported by utils/check-package:
> package/optee-client/S30optee:40: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
> package/optee-client/S30optee:46: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
> package/optee-client/S30optee:47: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
> package/optee-client/S30optee:48: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)

I also had:

    package/optee-client/S30optee:0: filename should be S<number><number><daemon name> (http://nightly.buildroot.org/#adding-packages-start-script)
    package/optee-client/S30tee-supplicant:0: run 'shellcheck' and fix the warnings

So I also fixed those and applied to master, thanks.

Since those are fixes for existing issues, it should come early in the
series. I.e. a series should first fix issues, then add features (like
bumping a version).

That way, fixes can be applied early even if the rest of the series has
issues, and they can also more easily be backported as they do not
depend on the previous feature patches (in this case the fix applied
cleanly, but that's not always the case).

Regards,
Yann E. MORIN.

> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  package/optee-client/S30optee | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/optee-client/S30optee b/package/optee-client/S30optee
> index 17e6d6d2b8..abb7e77afe 100644
> --- a/package/optee-client/S30optee
> +++ b/package/optee-client/S30optee
> @@ -37,13 +37,13 @@ restart() {
>  }
>  
>  case "$1" in
> -        start|stop|restart)
> +	start|stop|restart)
>  		"$1";;
>  	reload)
>  		# Restart, since there is no true "reload" feature (does not
>  		# reconfigure/restart on SIGHUP, just closes all open files).
>  		restart;;
> -        *)
> -                echo "Usage: $0 {start|stop|restart|reload}"
> -                exit 1
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
>  esac
> -- 
> 2.25.1
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
