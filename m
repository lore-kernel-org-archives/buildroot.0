Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E0FCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 482FB404F7;
	Mon, 18 Sep 2023 06:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 482FB404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBq3VzSU3E4p; Mon, 18 Sep 2023 06:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 874BF40446;
	Mon, 18 Sep 2023 06:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 874BF40446
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DF171BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D48E81F7E
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D48E81F7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvRbovkAwZz3 for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:43:22 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8164881F79
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8164881F79
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso504294866b.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 23:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695019400; x=1695624200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRDyyduhYy/y+dF6ezw5Y5Oo0E6cOhVF1aQbz8G/yFA=;
 b=Yi1kacLGWWH0guZiKUyo6Svwklwjx//sk7X/cXip8MPGIIT/mPsTBB9IuwswXpf7Xt
 JBctn+mruZNhvn9PqGBaTo/7DtDdpV6B3LoZjE1PiFk+Ud23AIfQppJ2FP6SISGG27ji
 m3WpE5mvwYB9hWQxj2fYkTX16lW/roJo70XbAjOuEDlNAqukSJs2zKB39OVdQ86FFTrY
 cbVxzTR/GOqRdL+iVa5i64wLNazD9BKMSsNIjz6Qm8QcXDt5Cy4/Wqxwwo3RDn88UbB/
 WwXIzG4wp1h8oZsCGqW7TA7ZfOXb6P1N7Xvhrewp+cxrkYxgorqgVjSEYQMj+B+DjtlN
 1xrA==
X-Gm-Message-State: AOJu0YwBcTtRvxcO7UKtvM3j8p35uYN7CFPGToOIeYz9Ewa3NnF457zq
 3EUxW5btbwOhI6r/n+xTNBzkFHHQY+PNXGpZCKnAm1Qz
X-Google-Smtp-Source: AGHT+IEQ53oc1Ij5cHoZw16ka3tf3P2YZrQ+0jra7bXWGqEfVZwroGpVudJK21J4cG64t5O4SVad/PsWBE4/JAbbwkQ=
X-Received: by 2002:a17:906:8a48:b0:9a5:d657:47ec with SMTP id
 gx8-20020a1709068a4800b009a5d65747ecmr6878099ejc.64.1695019400169; Sun, 17
 Sep 2023 23:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-6-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-6-arbab@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Sep 2023 06:43:08 +0000
Message-ID: <CACPK8XecSK063SVgYTCAvsRc0NaZy48bCmv+8pbNDoid+VLnRQ@mail.gmail.com>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1695019400; x=1695624200; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YRDyyduhYy/y+dF6ezw5Y5Oo0E6cOhVF1aQbz8G/yFA=;
 b=N712H6F/yT3VbtQDtxytB6NGR2gYHJaCJSkwQ8zwbivXLULEfqmI55h7UhDCmBv/Ny
 a3REyQDisIulRdeARAcSiiG+uQFWH+zadzY3wX0SfCJBsrf5O6ql+WDdnCMvjMUCdtGT
 0mmQLekmmAKpW7D37Tghcd7eiUhRSth+aWbrU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=N712H6F/
Subject: Re: [Buildroot] [PATCH v2 5/5] package/petitboot: enable discovery
 of SCSI devices
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Sept 2023 at 15:58, Reza Arbab <arbab@linux.ibm.com> wrote:
>
> It's likely that the "sg" kernel driver needed to scan SCSI devices is a
> module. Install a udev rule to load it automatically when devices are
> present.
>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  package/petitboot/66-add-sg-module.rules | 2 ++
>  package/petitboot/petitboot.mk           | 2 ++
>  2 files changed, 4 insertions(+)
>  create mode 100644 package/petitboot/66-add-sg-module.rules
>
> diff --git a/package/petitboot/66-add-sg-module.rules b/package/petitboot/66-add-sg-module.rules
> new file mode 100644
> index 000000000000..ae18d28c570e
> --- /dev/null
> +++ b/package/petitboot/66-add-sg-module.rules
> @@ -0,0 +1,2 @@
> +# load modules to scsi disks, if they aren't in kernel
> +SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST!="[module/sg]", RUN+="/sbin/modprobe sg"
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 596e801b781c..590b58e9c71a 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -63,6 +63,8 @@ define PETITBOOT_POST_INSTALL
>                 $(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
>         $(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
>                 $(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/66-add-sg-module.rules \
> +               $(TARGET_DIR)/etc/udev/rules.d/66-add-sg-module.rules
>         $(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>                 $(TARGET_DIR)/etc/init.d/S15pb-discover
>         $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
> --
> 2.39.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
