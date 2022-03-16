Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF2A5812FF;
	Wed, 16 Mar 2022 19:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7QW-Vz_tdPx; Wed, 16 Mar 2022 19:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F2E812D5;
	Wed, 16 Mar 2022 19:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D3D11BF4E5
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 299F660A94
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lS7yU7v8wLP for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 19:44:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC43607A1
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647459887;
 bh=JruqspdSYIrxzKx4UWPZKL914p6/G3LGBQjfCHpLcL8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=c3gGS8sMtA3xUN0nZOLrLX+vTUlHrYzO0FjO9Oogs9Ym+QCIaoMlZ+4GTwlupFW5D
 hYGAVirJwWegNHM9ZKrhcXsm4kD8tsLjQMR3HtMXWN5kOc3dk14Pl6Lds7PTq1utZb
 2R5BOe9YDTGYUJUejPQpj3hbMNAAuC9wrNCPja4s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.226]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1oJLoV1PpY-00xcad; Wed, 16
 Mar 2022 20:44:47 +0100
Date: Wed, 16 Mar 2022 20:44:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220316204446.7d203db4@gmx.net>
In-Reply-To: <20220316190545.3618918-2-james.hilliard1@gmail.com>
References: <20220316190545.3618918-1-james.hilliard1@gmail.com>
 <20220316190545.3618918-2-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:XP0PWJTAYGP7kkg4+TNz+UL8ZLqN5megKEPBXHbEH5lX8tHMC5q
 aKDRpzQZ6v5rDLtyGzDPsa3Fr1hEYUX9BYM6AYzg0/bhmdry408afrwqp4W6oBpc+iVE64Q
 ZFRAj0gMdGPKkT0O2997kA9cMBTAk8zeFasP0CrE+LL/0XubPT3PFI7E7/kHj9v89ptOSYu
 D73jvgSZRaHqhmopIcXlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2lE5BKdG6yo=:ai9y2/MaLVVsxiBgIu6Xrb
 Pyd3vuGee0LwQICaOUB3AErb9NGanrCVtn3qyZ+xQu9dlgIu2rZUDVfVDZ3QoYelrL8sQUwTb
 1EsjZ4xbo6JamzLs2FplScxiPyCkBiMW+QJhdVVt8sjw9pqa7mUBjJKOgNzJUrK0wJq0TJeEU
 +97THm2A83zDooflNtuuEeXn+gNdP5WjaET4NvBHDw3O/Da78gpKNAdvupwUKSPamNHDRrQ1b
 a2vR9e5uYIc+hsVrBCfuUAh3xiR4TtWUARYx9a714rarb7ZoemFa7L3FYLT1m3wdsZqtL5gir
 lHqY+UehqwVee6VEofffC5WoAsv2WmKy1lW7KYB+GYSVnpAIGWyF9bx3fe5gmOeQLp6OrCOLB
 JCovIQA+b89P2CIJbbAMTvpgqWF1JS/6qa1qk0ImucB+0QET+X6jHupk8B9UUBujY78QA4BlN
 3yjcAf/VBRgLDszXnsgMulgEn2FEPPzLc/va42rfA3O67cE892urHRCJrwg6JZcpLepKnBAR+
 nUj2SUbXnROd2uYOxZI3fTUwJFgHFYzjGSZ7EILjApf5i9ViF5omX2ZBgo5OGw3MpV0LS6j89
 7ue/wHSbLjiZrGBMB+DfXZE/2/AvJ8T9DvdBZEbgzFYsxSqPiAEU9vUzO6h3yaNUgsq5vvnit
 rIQ8h8nJ/2Fhv+Rrv984kjBDUfXw0eFLq/oPy5T6kpjohG3IarqdO4GYso1iaXMl/4pskVcM0
 n8pM3JAkBXoZ+/Wc7Jt0b+XU9V0cNdP4ddeqA5YXmYp5qh6NPeiiNHl8al+RTCOT8rZWFY1N1
 +6S6EE4Lrgo05lhzVAH1T3hhaC4VQjcFtqCNbx+LWODxVqpyL1MfOK5FYPmaaEEvtp9VOLJ27
 8oWsdREShZv9tBkQx5s3nOAUw/IpPT1TnUB08/A6tCTUp62Kr0bdzSrxEN/mSL04tnsSKi7rY
 l29VwTHAlbouIbE7IcyvpUl0wCKT41Ys51P2ledcWasfAzoI3NcKXS1TlGJKO0aBqPCmQjyqQ
 PtOAyb1wrZbtU9iS09KnKh0nH23FYs4bvOaqIBxJyVoTUcZhahFzXz1qmhcSBE91jviKxGOzA
 M+q5O0/GLxL1o8=
Subject: Re: [Buildroot] [PATCH 2/2] package/iwd: bump to version 1.25
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

Hello James,

On Wed, 16 Mar 2022 13:05:45 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for the patch/update, one nitpick...

An (upstream) change log entry would be nice, see [1] for an example...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/package/iw?id=ad0515252a25e94b85184102a66e93a17ad3c65e


> ---
>  package/iwd/iwd.hash | 2 +-
>  package/iwd/iwd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
> index 1a58ec88e8..1c34aa0a90 100644
> --- a/package/iwd/iwd.hash
> +++ b/package/iwd/iwd.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
> -sha256  61b5e48380cd3a6d0529f725eb6974157f1410af165f5d266b87add0bf395224  iwd-1.24.tar.xz
> +sha256  3f138e03301beb2afc7b385a62f56db17059137857ab579f269c4e441783e760  iwd-1.25.tar.xz
>
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 548b508edb..fc10c5f1d4 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -IWD_VERSION = 1.24
> +IWD_VERSION = 1.25
>  IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
>  IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
>  IWD_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
