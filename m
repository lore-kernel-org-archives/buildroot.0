Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC64BC4321E
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E22E60E97
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E22E60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6310480CA9;
	Mon, 25 Oct 2021 19:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gio2HhsqOhAb; Mon, 25 Oct 2021 19:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D3D80E25;
	Mon, 25 Oct 2021 19:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 287AD1BF34B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 188BB403C2
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hd5JIXrPBvI for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1992040241
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635190487;
 bh=ZitpVQR+okAARrdRt/gTTyG1jSF4lfM6CjRDZEdYZLw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QZmpY7Dkuh9WET554eoc5O5Yt2nC+4aOqcoHisqe7W7BRajBxhYWAeDmWIAN7OBL4
 pwvlkuxqE3EemIlKUaiwtDnzF07mFL87quqILWJ3LNrPQSR8HnoJX2gWRtJ2atYnNj
 61rP4rVvDouLaR9alHrowdZJsRk/h8+TbLYCL0OA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfUe-1mYXF92o1o-00B3tB; Mon, 25
 Oct 2021 21:34:47 +0200
Date: Mon, 25 Oct 2021 21:34:46 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211025213446.14bd871c@gmx.net>
In-Reply-To: <20211025083817.4045062-1-james.hilliard1@gmail.com>
References: <20211025083817.4045062-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GN4ojg9FNnm1LI3KE9o6iHp65rir9JAh/UJnZkmCIwLFA3EIrA7
 V4/TLUtlRS7SMBjkUCBotvNH2F8pqKfvCDmavb6XV8dqkRamPkjtoVuzGbyuX7LEqU8TysH
 Qn+i3OTYyxk6C6LfaNl535E3f+tOPtNvGdymYPNQIN5wT1lUnnETCDy8Vs1/em1A+2lDcZI
 93NI3UxdurXLmQ3iMSyJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FBZP60cLS/U=:ej8zS0yzCENPx3GCZtZFmO
 6DdPHNyFkIRNrbz9opT/fT0sqPWqxoQ03mv2UvywlaAFSehnvWWZh1MnU7bwh2sFMFwxVqMZd
 VQD23V28sFkVAEnm6yyjIjaHdBjHz7xBhnAnUQu2QCLQi1fPIDpqPXghT2jlYkCg8gcZiKYji
 b3ZqitZtMIqX132/dh1PE/nKrEnateusAabedgWNlbV54f3lHA+POldMoM+iHWuhnMqL3K1cX
 zv/P5Lh2c/X6E3voYCV5pyFv1GY+Y1WwWjs56IxiFStflYwfcwFhtvwv+yiXfKko+rPFe7S3G
 92TFrxavixo2aOXLw2b7f0Zwak9roCmPsC86NJmPipbrOoJpfc9ngtgA4PzmaQH2W4X+U3vAR
 hdMfkPT+5RkGaTKMSSYByy2vmLv/4CGZJiH/A/ZYKWr6EwHZ38vkKn6pzffWbRMYChV0p6Npy
 4PdbfoNeXdPLqB2bmHQqou/y4Wv9WhGQdZVMdT/v75gGb6JVvTXp3Aq/Sgjm9vxznlUsvyLdJ
 CODFuYE40ybg7YM0SiAsbyR9I0UvHBVRr20OTflFyjPPw6WOAEOHImPaz2s9dk1FynGkm7tOz
 WbiO3dd/QeUChBw8M28tjlD5CYHt92IAj+uOeKcGU9XQzgZHil3X5HC90ZC3fw6kc9ZnXhBve
 OkPEF1T2NJGZksGlcxiuqcZUpRDODIz27tEk/0gN0Gxjh2gp5syOu3PjzcxXCbvbAh1uB7/9E
 64OEHpXvL36huTCbOHziaOcXzHUSWdnZ3xIA8x1YDtV8o6zuLdCHyLaFCpV0XzRAJAZOVydWe
 WlOSsEdRPSDCeCyNk7+uLUbjnQFhrHuAewUk3938vvmRH6tzp9/hG53liF+IPWePnDOhLZK0g
 OEAE8ofh0R/8qFG3bSSN/n+RqB3wKG76eAG1UT/7J6D7WgxgY6MYtPEKJcCczpLdqd/dH+DgH
 aP7HmupCAO8Gy8zQvwHeDgPnIzefOv7bKpJC7XVoHmRPNcaHv8LRgmMHN7vMoCz3FruYLq9CV
 RlK1TsydtQ0A3jqSLok26oynJYRHCntTTK4fkv0CLubIjSsz3y6i5zvU8bgGUer/GIgj0me8/
 uWJCxCZLIbrn54=
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: fix fontconfig meson
 option
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

On Mon, 25 Oct 2021 02:38:17 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> output/build/pango-1.48.10/meson.build:1:0: ERROR: Unknown options: "use_fontconfig"

Same comment as for the package/gstreamer1/gst1-plugins-bad patch...

Otherwise (and thanks for fixing):

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regars,
Peter

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pango/pango.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pango/pango.mk b/package/pango/pango.mk
> index 104551a1fa..7d3d6626d9 100644
> --- a/package/pango/pango.mk
> +++ b/package/pango/pango.mk
> @@ -13,8 +13,8 @@ PANGO_LICENSE = LGPL-2.0+
>  PANGO_LICENSE_FILES = COPYING
>  PANGO_CPE_ID_VENDOR = pango
>
> -PANGO_CONF_OPTS = -Duse_fontconfig=true
> -HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
> +PANGO_CONF_OPTS = -Dfontconfig=enabled
> +HOST_PANGO_CONF_OPTS = -Dfontconfig=enabled -Dintrospection=disabled
>
>  PANGO_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
