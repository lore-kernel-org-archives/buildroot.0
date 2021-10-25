Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F4CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:14:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E8A60FE8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99E8A60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E47740119;
	Mon, 25 Oct 2021 22:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxRnq6DI23M5; Mon, 25 Oct 2021 22:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F25F403EB;
	Mon, 25 Oct 2021 22:14:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78D121BF85D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6817F40399
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpPW9QHK8auh for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:14:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17916400C6
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635200072;
 bh=7UjWD1FxSyDknyyqOFlyqboHTYxnc/TJxqYpjPqXUHc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=BsjJjd/TJKwiMdRiUY1x1yaHgXEdMk5Oa3pwfQZuYzQoMPz0ZsREWb/oIFZgiGt8C
 xmHz59JTLNsGMUG9bNFns3QLBickUQJvnBxO9jLQBv6FAW/u3vcgduOwzuiw2rEw0m
 vRWBA3Epm5Hzy1NUihBHct/7j6FhlLsOjiOzpdzw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsZ3-1mSBHj2yp5-00HMYN; Tue, 26
 Oct 2021 00:14:32 +0200
Date: Tue, 26 Oct 2021 00:14:31 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211026001431.7aef522a@gmx.net>
In-Reply-To: <20211025220732.2795545-1-aduskett@gmail.com>
References: <20211025220732.2795545-1-aduskett@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:fu+ptQROvFC9h8ff4uLSbAHex9AVKebH5Zas+wPpXB6HOTNP5sE
 qpq95zVFEGBCQPpbAaaIymiUdOPmmCZyk2p9nYTzZm2S2BBxDg4EB4vWlU8iWm1125xfBP+
 Jmz1EmzpQEhvFYhKLOBzlui44/GG83SIIGv0SQ7T7JeY0jEiHVg4pnLV4fvfEskfyAn/RvC
 PvgQ1c27pcEEEUKaPdajQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4dMxYpS7z1s=:bTv5paOIHw9PPx2FZm9YP6
 4XR+fTEBzGtMIuJafa39X9XGkUy+2EA286S1bT+nulSApd1zeUjtu8pK2h6BoVGjE8NmjlPBn
 5nSfnITK8DT6R0LfiI4CaHuvTKjKS5HDA+9KMhmYF0hMqO+67zLew6V5vxEOa9WCDUuW3Ucay
 BRy3/+A+GcQbhnVioP6BC21sgBsj+NOoKEP5WGTZ3j29lkQ7siQ60wb4dsRc4+WSvkI4XcrBo
 aIEL0Go5qNXCdAS10Cl+eZYsI0EzDhrbRI6uzrxiEv44TqvUEp8LK4TEWm9SE0wZhTr8/sZFr
 9ttH7JIXVA1O58kq588UkrCWsX4EWXBiaUdYoXJDiISXJbZrbS4b4gueUEJSM/pw4ETQLizEQ
 H8gyln7pXxI/hexAWbjQBV6rfifsdfYqq6+fh0sibAcM4JyatLJh3CsOAgLv8QOIXpfsEiyws
 MOtDyNwV4gu3LDET8naPLMbolfsAb86T3T0ywCqWMh+hPM18Gn8e+mMbwshkx5FvvLoFyqjZa
 TXUvCCrnNMlB71yPxnnt5CUP0/RdT4Ys7uJZHvVsTaPaG6vJWL0BbIIkshXQk4+/FhVze5n9R
 GFfCCgaj0W9ViQr/VHDdGLuehR26YP15uru1xqSzLcFdCAwPr/MBSMjcJ8Jcf5J4P2qXRuVMW
 afyecKde6RD9V1TByq1BrbG3UZJoqo33kVw+Jkex5N0Sjit45/oyIZIqZH5qcJOLxFhH55psc
 jh7oR+0pSvS68uLP7OIa1H267wEsgpGk+0UPIY6EWoPIZJ1MlPCzhe46DmTGKXDALPh3cRnca
 QezqpmvuxdsF2Y8q7wd36q4RIy/o4A2GQ5lrx6chq2mP3Cr2/v9T3c2Oah1CBd+LHKSjn2Dl8
 /7MgdDMPKXEVvd3hXsXZEhaYjt0L6hKdZUVz60qpf5ysZg8hCeiIXSTYMFQ0q+NBhbJaKIMlj
 6W0I87jF0cvFTWt3FPjes3IXBMBRv4/gZoayaZ9fjaLDcUbQjHfST3jcRw2o/xdrywlsVG1bq
 4la9t+Zmpf8SQ8n32N89Q4Za6xDnYdJ3ulJOoUasB7TepXbwkxe8w3aaoErUO1d54xgazPeCw
 1io2jJlcbjmNdM=
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput/libinput.mk: fix
 libx11 dependency typo
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 25 Oct 2021 15:07:32 -0700, Adam Duskett <aduskett@gmail.com> wrote:

> libx11 -> xlib_libX11
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libinput/libinput.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
> index 0c232994df..54790498c2 100644
> --- a/package/libinput/libinput.mk
> +++ b/package/libinput/libinput.mk
> @@ -24,7 +24,7 @@ ifeq ($(BR2_PACKAGE_WAYLAND_PROTOCOLS),y)
>  LIBINPUT_DEPENDENCIES += wayland-protocols
>  endif
>  ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> -LIBINPUT_DEPENDENCIES += libx11
> +LIBINPUT_DEPENDENCIES += xlib_libX11
>  endif
>  else
>  LIBINPUT_CONF_OPTS += -Ddebug-gui=false

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
