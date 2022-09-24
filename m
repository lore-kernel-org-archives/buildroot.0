Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4F8C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 15:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E3A84070;
	Sat, 24 Sep 2022 15:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E3A84070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0ItUDdLHklP; Sat, 24 Sep 2022 15:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C3B83FAF;
	Sat, 24 Sep 2022 15:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C3B83FAF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 926B41BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AA4760BBF
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA4760BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuDS7DWgn8rb for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 15:05:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA3060BB3
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCA3060BB3
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 15:05:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A349D240002;
 Sat, 24 Sep 2022 15:05:17 +0000 (UTC)
Date: Sat, 24 Sep 2022 17:05:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220924170516.4a0323dc@windsurf>
In-Reply-To: <20220826130843.264607-1-johan.oudinet@gmail.com>
References: <20220322160725.636205-1-johan.oudinet@gmail.com>
 <20220826130843.264607-1-johan.oudinet@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664031917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sod35k9GnaK/6JyqOehOvABtSENuLHA0bC/rULB8Fbg=;
 b=FEteb54SdmuXHmSoaerSY7R4XT5JFgDw8w1OZeeK2umcZ5owg/ITaG/0l3PTi3/R9jYVEQ
 LTNfOwMZA+MnDoVva9Usnpr7xcqyNI5JO0hIRIiIB+DvU36NPcidxOFNj9DpMqopyc8fTL
 Sc/ajmPTtWJjuzVdTXdo2DMt2DufSZ0rO5dE2hfHvQR/wzzUgCFZgwRfGH+yVY0MImbYGF
 KlBL3eABTJwArsOTSZsxCyoyjv2fWKSbN/alC9zYrG5G/EowFONkkb8dHBaQX39L1gJL9k
 1MrPHMe6fOzJyg1SHuBXhL5qAqHybziDrqHr32qeGkELLMP6RqTC6LABX9529w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FEteb54S
Subject: Re: [Buildroot] [PATCH v2] package/forge: new package
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

Hello Johan,

On Fri, 26 Aug 2022 15:08:43 +0200
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> A native implementation of TLS (and various other cryptographic tools)
> in JavaScript.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
> Changes v1 -> v2:
>  - build with npm (suggested by Yann E. Morin)
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/forge/Config.in  | 10 ++++++++++
>  package/forge/forge.hash |  3 +++
>  package/forge/forge.mk   | 28 ++++++++++++++++++++++++++++
>  5 files changed, 43 insertions(+)
>  create mode 100644 package/forge/Config.in
>  create mode 100644 package/forge/forge.hash
>  create mode 100644 package/forge/forge.mk

I have applied, but after changing the patch to do like we did for
chartjs: use pre-compiled JS files. Indeed, having a dependency on
host-nodejs is really heavy, and the fact that we don't have vendoring
support yet makes using npm during the build not very nice. So for the
time being, we'll use pre-generated JS files.

See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/d1938358ec119869a63af7622391f6a8de1fbb16

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
