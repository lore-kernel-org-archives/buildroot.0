Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C840ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0203140BB7;
	Sat, 17 Sep 2022 15:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0203140BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2sR1Jgb9_th4; Sat, 17 Sep 2022 15:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AF1E4014A;
	Sat, 17 Sep 2022 15:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AF1E4014A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE671BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCB03843E4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB03843E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6ajyDNSyaRo for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:46:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AED843E3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13AED843E3
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:46:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACBC6E0002;
 Sat, 17 Sep 2022 15:46:02 +0000 (UTC)
Date: Sat, 17 Sep 2022 17:45:51 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220917174551.09b8f32b@windsurf>
In-Reply-To: <20220909050800.3520691-1-james.hilliard1@gmail.com>
References: <20220909050800.3520691-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663429563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plX18P41ATe+ybW/h3eF1E6ZfX9XxYzDUV04njP1xrk=;
 b=AG/tdppk+TwtzaG97j1Yl6n7f62blDHA+QPLGJsLeLQu2SArx09U08RFryFDZgGaGB3ZVm
 9XR79oDBpqi0KKKHTIc95gOONtFL/qF30xludJoGH9gTLCY7nPxAWQ31zP1T/Y6GkfqcGV
 2KqjHJ8al6allaxmAFMLsPDlNJ12XdYwkWWXNquAv40DIZuzLoHLgi/E1yWiDjVudLlnoQ
 LQDoEA7KAh+aybvHTHfT6Kn6fl8J48sncfIbCrjxKQpgcBwTkNN/fCUtDO3mImQuoT0rSe
 31kWnSnS5Xyi981ZM2oM1tKtuwFBiMYwjcxOP27+IleGBMBvhfxYReAaw5fzqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AG/tdppk
Subject: Re: [Buildroot] [PATCH 1/2] package/weston: install to staging
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Sep 2022 23:07:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to install weston to staging so that applications like cog
> can use weston-direct-display.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/weston/weston.mk | 1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks! And thanks Adrian for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
