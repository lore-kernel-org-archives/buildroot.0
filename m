Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D692DECAAD6
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 08:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F43B40483;
	Fri, 26 Aug 2022 08:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F43B40483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiJDDVHeNpC3; Fri, 26 Aug 2022 08:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E76140474;
	Fri, 26 Aug 2022 08:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E76140474
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 563A21BF86D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 08:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3106C610BD
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 08:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3106C610BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqYbvij9Y_tl for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 08:07:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A6D60B44
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7A6D60B44
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 08:07:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8F2F240004;
 Fri, 26 Aug 2022 08:07:53 +0000 (UTC)
Date: Fri, 26 Aug 2022 10:07:51 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220826100751.289668ab@windsurf>
In-Reply-To: <20220826064758.3968647-8-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
 <20220826064758.3968647-8-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661501275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CtPElp/Pyu2vRXvbVb5T/ALHh9ZrEqdd7Ueuj2rdio=;
 b=AaQQtwTrw1kmxrxkwfLG1uYeCOpR1nkpaCh2KKyjkQ1vuC4VPL2zmgfTld7ohOUaGAqRhn
 b5poeZOap4wVRcpyIlIuIGL5ESEFesWCdopYT+NC4GXWOZ64VXao1JIt4ibwTKx8XRBQdu
 vYm6NR22p9K8JCMBrm+RGDxk6H6PqpYUnAu4LAR2sAB/uYY/qHIvVsfjxnXSYxsBmqx1rM
 NCe/6FMZaHhxWclUdOrtdzH4B8XHBG9ZQAEYCU7rd8dl1hxilnlvnKdk0O6eao7XcKMfog
 bpzXFS3VIjMlIraH/0rKVjMh0P9pWNjwVXjlHa/+bwKwggi/adf9HKlRCcjQXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AaQQtwTr
Subject: Re: [Buildroot] [PATCH v2 07/29] package/qt6/qt6base: add support
 for building examples
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Aug 2022 08:47:36 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> ---
>  package/qt6/qt6base/Config.in  | 7 +++++++
>  package/qt6/qt6base/qt6base.mk | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
> index 2ed780e913..061861880c 100644
> --- a/package/qt6/qt6base/Config.in
> +++ b/package/qt6/qt6base/Config.in
> @@ -17,6 +17,13 @@ config BR2_PACKAGE_QT6BASE
>  
>  if BR2_PACKAGE_QT6BASE
>  
> +config BR2_PACKAGE_QT6BASE_EXAMPLES
> +	bool "Compile and install examples (with code)"

Did you check that indeed with qt6 examples are still installed with
their source code?

> +	select BR2_PACKAGE_QT6BASE_NETWORK
> +	select BR2_PACKAGE_QT6BASE_XML

Did you check that with qt6 examples indeed need network and xml, and
just that?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
