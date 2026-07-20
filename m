Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E0FC44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01BA606EF;
	Mon, 20 Jul 2026 16:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjIZMQiSHxQM; Mon, 20 Jul 2026 16:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB447606F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784564878;
	bh=Lz+krxenBnLGMCrneFOitwZPU697fm8YD1EoBR70ZCQ=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xkt+/Y0RsNJ7Mw3jkCeXeX6mLmEumP/x0tOuwfcskfVpciX+mwmTS9/ONoWY7uskj
	 OYtyl2qynodhYjqBkmyXE8tGeMmQytHeAfhgejcB6/t3MDiF2pY4UtACixv0lJRi3E
	 uTF1sCuDXzjm4nsdoJaaixeO/32ild5HMx1yo42eyh6eBeZkCDFVKmd0TjVKhlV+zE
	 Dgr23zHTkjG5zdD6VZdLX36pd+1LANVD05OMRkEbMMx2U7m17ju77vy21A+AosUSBx
	 gQs23DrUPz23SqjATNdLJL+MMnE3JPZtXyFROm6e+njvWVu9V23lfIgOizhjkGIRn+
	 uKw1ycf4mwZqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB447606F3;
	Mon, 20 Jul 2026 16:27:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D162E5
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 16:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C12080CDA
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 16:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTg6zuaq2AwD for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 16:13:28 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E91980CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E91980CA8
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E91980CA8
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 16:13:28 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 52BF2440CDB;
 Mon, 20 Jul 2026 19:06:37 +0300 (IDT)
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260720150236.243961-2-francois.perrad@gadz.org> (Francois
 Perrad's message of "Mon, 20 Jul 2026 17:02:28 +0200")
References: <20260720150236.243961-1-francois.perrad@gadz.org>
 <20260720150236.243961-2-francois.perrad@gadz.org>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Mon, 20 Jul 2026 19:06:54 +0300
Message-ID: <871pcxprvl.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1784563597;
 bh=uBFm504dlTnblqpsYg+mI9E130jMrLM23F8eFMS9c/M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=edvgSCCjYTODU+6OlyaQLfGx4uROcwkyZK4gWqLXALaLqGWMzk/Q15vjIgCJT61Sm
 rhQrCuYwqfnkK6h26Mnk9PFgTvTOmlwUftB7UWZ7uBIePupKcfl+1AS5hUNonFmMSY
 eAGMHUWCPNArKmhRK8bdNi6jBEqcVm6SZX4Axe8zjdcKx2vikcJ0GueXe1X+yZ0PTq
 rxqzo1mdPX0xbqQ0Qw9X8iix/LeyXpk4MjiRz3NR2uy4FxTDUpsqUN9gDphJ80nqT1
 i3VreqkYV53kQTP/QWJJl+x2LEDjY3JRDINcssN25/4RlF2wlOqFJ8m+V55I0gkxnb
 jGjsMVG88g79Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=edvgSCCj
Subject: Re: [Buildroot] [PATCH v2 1/8] package/qbe: new host package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On Mon, Jul 20 2026, Francois Perrad wrote:
> dependency for host-hare

[...]

> diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
> new file mode 100644
> index 000000000..a6e3e4d57
> --- /dev/null
> +++ b/package/qbe/qbe.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# qbe
> +#
> +################################################################################
> +
> +QBE_VERSION = 1.2

Any reason to prefer 1.2 over the latest 1.3 version?

baruch

> +QBE_SITE = https://c9x.me/compile/release
> +QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
> +QBE_LICENSE = MIT
> +QBE_LICENSE_FILES = LICENSE
> +
> +define HOST_QBE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_QBE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
> +		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
> +endef
> +
> +$(eval $(host-generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
