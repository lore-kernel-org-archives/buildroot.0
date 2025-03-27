Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0E0C3600B
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 16:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C19B40B48;
	Thu, 27 Mar 2025 16:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TioeDWoGk6t8; Thu, 27 Mar 2025 16:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6489D40A04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6489D40A04;
	Thu, 27 Mar 2025 16:51:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 089A812A
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 16:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAD040ADF
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 16:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz7COkaNoMFt for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 16:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75B2741FFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B2741FFF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75B2741FFF
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 16:51:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCtj-1tNgkk2xVf-00fNIY; Thu, 27
 Mar 2025 17:51:33 +0100
Date: Thu, 27 Mar 2025 17:51:33 +0100
To: buildroot@buildroot.org
Cc: Nayabbasha.Sayed@microchip.com
Message-ID: <20250327175133.5d8a2a5e@gmx.net>
In-Reply-To: <37ad9e8d-bc5a-4e79-85e0-0128adfac465@microchip.com>
References: <37ad9e8d-bc5a-4e79-85e0-0128adfac465@microchip.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GHwpH1eFxRi5nYe/XKbDf2vBtIV/8eh47aZlHlHFihUTD4VJBDo
 Yd8koZnlHIa/peKIdrgKvgvVYNQbIgmnrA6kHwFyTg8YylmID8bkY1LMtjJZItlR0oHBKNw
 hnkyv7iW0yw7v0HC4XwbJTJ1Km8954HAxLLdkfozCjestOr+dPNTojhjaCs29tBO0q7fPRl
 JomPILECGsR6+ihHJIeVA==
UI-OutboundReport: notjunk:1;M01:P0:H+zfV5NpWOo=;qMteKxpcpn6POCa3hA5fjPemBq6
 gC4c83d45z9CdVEH0baBNP98Z1zkmFIoDMwNyvwzJRm01JXUe7sjTk7tG5fsHkmtyCo/6vigv
 NnUnD343rwkD+UcgywvXh+KamTwy4MyQoTRkebojA5yE5KNKmGB0E8JGpeKqTVO9Oy5MYyndX
 jdGvEXsogVAyqC4+D2nIR5IpirgLvyz4YxM4CQXiS5RssN/+pBn8fIcOVcE1uvEWo7TbkEzKd
 Sv8NCSURGMO8WIl6yRpMSXrOnTjPpFU2Jhggd5NcYJJZuCqd8QvOqYAftsdHDuKmB1H19BUca
 r5WkXfXJz1Eg+J7qH0ZsbzsA3/2/NsHMbRJxiX40CpVdzHPGddWZHYPsKkCxPa9OTnvF8I84S
 Xaq9TcwzNPdi6XUERgFx22xxoAbOU1esPnsWsnZMc44lt9cD3xfGsAoZdR88KUy8Ux2ZPDf30
 kJNwNcM4bIpasvuwUMS2F8/TwZViqLhgxh9LoR6dUy9JetRzYgW9naIvLHsm+e4qw8fhF+av3
 IwC9FSho3vY6oFEK+M+EH7Xg7KreAEssESKP4pl6VaFFn7AnCBZF+p9xwPvXWwlKVK92ka4IN
 t8rXDwezdz9R9gOUG6BGBXBkdTcE65B0glYgL6D6PncHhlZA8hS+mWwr6DaRGo8SDgaCipJ6X
 6PSGtUOXpjIq00kP8FlNg0M0Fc5mnuz3WFaNtU1ttYVzixDwWRmTpB/pdoSiQ2H/ZK5EggStR
 qA1WYQqvM6L+G59npXIK3i5nMziaC0jdpyHZ+rzbKdAbEsrVv1qckv7aa035o9/A2KlqJluz1
 Zu8kbKpTq4IkDkWSU0Oqz1vjEPqop7KB+/5kFvRVgMUJovvIcq/pY0hvxewIzAJ4GgsX3AlTO
 /lJjJHRbTL9wfLmgKVC/NDRNC6SEkpe8yoOwoMZt3W7Gtyo1+Ehb5oSjzfdL7znuVE1u9Pok5
 wg9vPh9UuPi2HpN0umj1c3kiZ5b9toVnzXx2edf1rR2QzTE0tdxg/wooT3lCy1Hsh8KcSw8sN
 vtq1I3O2VH/u6EE9HN/9es9DZcJNV5hMrEEALBW/oneQeny37mH/TlSKaXkDdQ6rGtwXvZ2Bp
 PheLDNrhp9liSlL5NJcre+a8FLM3JLqKJkHc24olVBmdyTdagtfygzFAQazABDpdUfQExcRnD
 E0RRw+fzvEWbg/oAfzhLccXeaoAqffQoSb13zaoAKVt+6Op+oaeYDJif1k5JAbyhg5gHlfErC
 SAKi7d2cIn89UTWbW25YC0+7bx5wzN8MYpyuE9CTmJb+2uInzQa7br1YKNdm85CmTbJn95Gkz
 X8k2GanGzxsjmQhgdkVydiCFCIkh7shqvKjm7VTHKbXR++HPOsfoE8zrM23bWTukltqMO1GMT
 ejVubYjrSEE/YtUbF4WysOSljfYCttSQ2GwTXFJKOi1KL0BcBjLHB9eZG8KwuF7bSbdmhCTg+
 +eLYZFSLj3151UmOOtV2VIq2hOhQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1743094293; x=1743699093; i=ps.report@gmx.net;
 bh=j6YBtDqpOI0+UMJIKsYiki1uR0SJ47Ay+46MnniJKMs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gWEQm4FRIXjfndshXun+IxshTkGUYJKaT/+zQGQHSRGyY8oPgjOlln1rea84bWPg
 P/uqMxubkUoy0m5yuYH68ubzNm5FSPmEd5QgSHYLmEQZOYwHHj4oxiP2d+X/Vzyj9
 xozaFSGUvvEEVEnVvas30yYzLCgOSnWhzsZiJEsrrPCrS9ijc1EIb5QoZnVFJfiOJ
 V2QbgXY83UJ66LlGGTXHsPRnSZRJ1MQ0eLZVx11br7Esldh1lwSP5861BNYlWqVWc
 KAVnY/bx6dXvSifdvB8gehJNrAN1LO1DB/omEQu0fmh822f7Ew+NNc0t+50AgcVrV
 nWrYcku7BCTt7z/t/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=gWEQm4FR
Subject: Re: [Buildroot] [help] v4l2loopback package build fails for
 raspberrypi5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nayab,

On Wed, 26 Mar 2025 14:09:48 +0000, Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:

> Hi there,
>
> I am using latest source on master branch.
>
> I am trying to build the v4l2loopback package after enabling the config
> BR2_PACKAGE_V4L2LOOPBACK_UTILS in menuconfig
>
>     make O=raspberrypi5 raspberrypi5_defconfig
>
>     make O=raspberrypi5 v4l2loopback
>
> When installing to target, I see the following error:
>
>     >>> v4l2loopback 0.13.2 Installing to target
>     /usr/bin/install -D -m 0755
>     /home/nayab/buildroot/raspberrypi5/build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl
>     /home/nayab/buildroot/raspberrypi5/target/usr/bin/v4l2loopback-ctl
>     /usr/bin/install: cannot stat
>     '/home/nayab/buildroot/raspberrypi5/build/v4l2loopback-0.13.2/utils/v4l2loopback-ctl':
>     No such file or directory
>     make[1]: *** [package/pkg-generic.mk:364:
>     /home/nayab/buildroot/raspberrypi5/build/v4l2loopback-0.13.2/.stamp_target_installed]
>     Error 1
>     make: *** [Makefile:83: _all] Error 2
>
> In 2025.02-LTS also, I see this behavior. Buildroot is unable to
> generate the file `v4l2loopback-ctl` in the
> build/v4l2loopback-0.13.2/utils/ directory.
>
> But when I go the package build directory and execute `make`, I could
> see the file is generating.
>
> Could somebody help fixing this issue?

See [1] for suggested patch...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20250327164913.13610-1-ps.report@gmx.net/

>
> Thanks,
> Nayab
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
