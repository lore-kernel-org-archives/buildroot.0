Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDEBEEAA77
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B8B740A97;
	Thu, 14 Sep 2023 21:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8B740A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SdIzy8FAhfd; Thu, 14 Sep 2023 21:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC93B4046F;
	Thu, 14 Sep 2023 21:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC93B4046F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3DDF1BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9E6B60E09
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E6B60E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lK9zyFrl8jx5 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:33:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAC4460D58
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC4460D58
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F9231C0002;
 Thu, 14 Sep 2023 21:33:15 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:33:14 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230914233314.04243ee3@windsurf>
In-Reply-To: <20230914211133.451932-1-fontaine.fabrice@gmail.com>
References: <20230914211133.451932-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694727196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bk6ESoNZLRw2I0LeMZMSXuNFMOsPY1J98HgQHpDmc1o=;
 b=lAfyjBhJ8YClaHg1t2rnbRCahPMpgOKQhk1kwHnKZDdARtnivSQJgpqBfMcghvMwjOyBcz
 5rWlucDRKgcIv1mocUMyKUwpEBgK6nt3VosgVzvBbNgtKOVGgmIPThKO3ETJ6y4R1W2eTO
 p9AePM2ZKtONMzTG9MyEeTkPy0sa7PmGmDUiQ9ogfCwq/j3vPhhH5NEG64j+KDIOBttHRn
 pPdUMLH93P5NsqC5OPQ3/e+OKr6LJ8XydynINUsnvReg6XvPhLPDEx4YYilL0wyFt/Vwsc
 49IsvRnBDynZ51GUQHlGI5iMVfBFkPJ+4RCzKxpkbMXVBoTU+B6CArTkKN6FrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lAfyjBhJ
Subject: Re: [Buildroot] [PATCH 1/1] package/zbar: add ZBAR_CPE_ID_VENDOR
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
Cc: Volkov Viacheslav <sv99@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Sep 2023 23:11:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:zbar_project:zbar is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/438B9E70-F8E2-4318-83B5-46A0DF320CE3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zbar/zbar.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks, and thanks for using the new link. This link
shows that upstream is considered to be
https://github.com/mchehab/zbar/tags, which we are not using.

Our Config.in.help text points to
https://git.linuxtv.org/zbar.git/about/ which is an empty page.

We download the tarball from https://www.linuxtv.org/downloads/zbar/
where the latest version is 0.23.90 (which we use). But both Github and
the Git repo at git.linuxtv.org/zbar.git have a 0.23.92 version.
Perhaps there is something to improve here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
