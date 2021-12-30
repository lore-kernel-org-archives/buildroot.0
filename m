Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3655FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D81FA401F1;
	Thu, 30 Dec 2021 17:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcxkTtPKYsn9; Thu, 30 Dec 2021 17:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96DBE40205;
	Thu, 30 Dec 2021 17:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09D091BF3C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04B1E4057C
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QbvHPcbcrq08 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8637C40547
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:41:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:14b5:310a:ddef:6cec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5F07013F81D;
 Thu, 30 Dec 2021 18:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640886105;
 bh=MFdcIWehdvGMpqffIYmy4CB6d1hgn7HJF4555ow8z0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VP0bxCs+Z+OX41iCFQy045Rd4qcxoAIB/SNdA9m+mshwPbtwOzthVaMGT4DUARlTR
 dYVPrtEpjDbO3L/oiaiD8uLt/Q+vWbbgvagfwG2T93l/kxZApB+6z4hjKI2SFB2Ztu
 5zBhZ6O1jSvNbMC9qmxv4X5+c7u1znhI+ku6A7iflvJPVu3QWwbvOZVXrrxW2Y9E55
 PmTu6rEA63vBHkPyrXOK0bZ8eq6tvv7npHqO6mC1v1UCBtNwBBNjAEJiOTPgfORb93
 K/l0MMdh3h2tQ+t+3POeg1R/lVSGIcZHGdvPR9Eh5yBd0jiAYsUgioeyEDS9w7egu+
 9NR/AjTNUWXYg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 30 Dec 2021 18:41:41 +0100
Date: Thu, 30 Dec 2021 18:41:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211230174141.GF3390456@scaer>
References: <20211229093317.1256594-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211229093317.1256594-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-bad: add
 missing Config.in comment on udev
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

Thomas, All,

On 2021-12-29 10:33 +0100, Thomas Petazzoni spake thusly:
> The BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS option has a
> dependency on BR2_PACKAGE_HAS_UDEV, but no Config.in comment was added
> about this dependency. This commit addresses that.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index ad08615256..5e1dbcbc88 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -665,6 +665,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_V4L2CODECS
>  	help
>  	  Video4Linux Stateless CODECs support
>  
> +comment "v4l2codecs need udev /dev management"
> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
>  	bool "x265"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -- 
> 2.31.1
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
