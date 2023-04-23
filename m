Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D00DC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E1B80EAE;
	Sun, 23 Apr 2023 11:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E1B80EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LCEOA7gftJq; Sun, 23 Apr 2023 11:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D1D80D0F;
	Sun, 23 Apr 2023 11:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D1D80D0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7A851C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8117B80D0F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8117B80D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ie6eMRMMjH5x for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BCF380CF2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BCF380CF2
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:03:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 083F1B00539;
 Sun, 23 Apr 2023 13:03:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 13:03:45 +0200
Date: Sun, 23 Apr 2023 13:03:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230423110345.GD2696@scaer>
References: <SN4P221MB06822B245A5155FE545F0362A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <SN4P221MB068210A82360743E14AC9FD6A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB068210A82360743E14AC9FD6A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682247829;
 bh=nsO39ZZJd8HucPtDWuWsZpaSJuuhUhdFhIV7Gs/1vnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vw92umoQAXSe7/1xvKdW0KeZFSIUlMiM384Z/pPq+Uk//4ACrX54pCa90s0bubqR9
 GlVTZUxmx9ZMJrkc0MgjC+L8dvtvUS94jN/t3+1sN+n72XaSkto547pj9xiuUqIjnd
 B4L4XdpgzFSWmqpiMBOq9PCDtuksD9hNkdq0RcDO3P/+GB9izPsUuS31k1dSDm9LKj
 dMDVm2cmrsRwoz8pABAVlm/yVtFfBCH9cHCxUwxIrCVzeEyt1y9/EYxF9E3cAcXW76
 GoARMBPajNaLPbgu9eET4O4uVZEhKdqCJHFhv95kl3Urb0vtPdAaIjLFsUzjPNTHuO
 Dpm0PhaQ1FAMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vw92umoQ
Subject: Re: [Buildroot] [PATCH 2/4] package/libglib2: apply upstream status
 on girdir patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-21 10:12 -0400, James Knight spake thusly:
> Providing an upstream status for the remaining libglib2 patch from a
> recent version bump. This patch was introduced in Buildroot around
> November 2021 to help deal with build errors where `GObject-2.0.gir`
> could not be found (tied to Buildroot changes made in
> `gobject-introspection.mk`). The discussion thread mentions this could
> be submitted upstream, but looks like it never was. Reflecting that this
> package has not been submitted upstream.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...01-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> index db77a73203faf38aaa832dde8bbd9526cf39eecc..fb9905724278fb2c0a9be8384cb90108292668e8 100644
> --- a/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> +++ b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
> @@ -14,6 +14,7 @@ Fixes:
>   - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
>  
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: Never submitted
>  ---
>   gio/meson.build  | 1 +
>   glib/meson.build | 1 +
> -- 
> 2.39.1.windows.1
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
