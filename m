Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA39C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 02:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D3460AD6;
	Fri, 14 Jan 2022 02:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lkNhgfLjb74; Fri, 14 Jan 2022 02:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EFA860AA9;
	Fri, 14 Jan 2022 02:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71B6E1BF3C6
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 02:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 604E260AA9
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 02:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rqa5Sd5huQhg for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 02:47:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DFDF60A89
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 02:47:40 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i5so30070996edf.9
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 18:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aw0mz/N0+IVCYqz24+b4Xw0ivchLI20rIpx6n/FCYd4=;
 b=jMX+dAPr/9/BvdwBY4zbclvYtm3k1PSXWMkcxypU6nRSDie+Fgz2BItheI7/4WE45I
 CVbZ4Hd2xrq/VhkQo3FKgQFJqILxcM6LDmDVKwXl932hxeCrjXA8AM6Aghud/ScdRnJo
 jdqj8Fauks1jlNLkEht6GbC82x2SgFEyqChZz9G47kViBCCatXbBwqEftHDZlYfzwDsO
 RhNKg6+mx+rokoQCAp37EDsseIqjlL6T5xj28NxbmG4VWqQSzqmaD3+1Qxi95jSyJgZB
 uIm9st9qw3JjaAQu6NJHNF6E9BXwNAYtu8gdUxyv6UK6H39keI7OwPgFEHPkiv7tLKwV
 /F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aw0mz/N0+IVCYqz24+b4Xw0ivchLI20rIpx6n/FCYd4=;
 b=cSUajPO5DNdBJbsRzoyfEBxr38Pz9obBVeecANyhozCgt5oWsCBWyLQkVXOyhQvw7W
 jIHlSZXaopMOp6Zv4LhgezXkJ9dce0bh2d9UJb/QTYp868gb6WbiiSJviyXMJRuLwoAx
 wmQZK20HI/SPCKiTvu+KguHFnS5al60w1OqYbUsGyGH/hC+QFa2olxhLjVZqvrPKca6h
 GKVnRiKRf7T5oxsM3MgA5/5a4hJh4aP7oYcNIvNBXqzLGK1rxpbfk0mSH1v0cMz+2iy9
 R9E6ozq1nvvJAjiJKy0/sWbB3/WPOcmzsr9nRw8+5S0IinuxPo6hscsLxoh1RMkD/6A5
 N7GA==
X-Gm-Message-State: AOAM530BQKAqzdmcpyAbVPeInTT7ycfdqMnXu32+JOtJ98bhpCOOOfHQ
 9ptOAp61/cKIdI4NkgN+2hOgb7uKSzkzME/Cb9jrY2/F20g=
X-Google-Smtp-Source: ABdhPJzElNCLGFd31dJIVp1JqcECaAAJYWM/Fw33RdRJpl2HUrLM5be3A0ujQfv28xNYZMIYuLZAn+DfhrZkHJlIO2o=
X-Received: by 2002:a17:906:274f:: with SMTP id
 a15mr5597081ejd.492.1642128458757; 
 Thu, 13 Jan 2022 18:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20220112184821.916646-1-heiko.thiery@gmail.com>
 <20220113220057.1db30808@windsurf>
 <CAOMZO5C+cjNoVVEe44MsnuZgVj2TKdTJo8xF7Y0o5ksjk_TLpw@mail.gmail.com>
In-Reply-To: <CAOMZO5C+cjNoVVEe44MsnuZgVj2TKdTJo8xF7Y0o5ksjk_TLpw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Jan 2022 23:47:27 -0300
Message-ID: <CAOMZO5ALS0kbonEJq4pSQPkR-dCha4hb84rGENt+GAAfkazeVA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 13, 2022 at 8:14 PM Fabio Estevam <festevam@gmail.com> wrote:

> I haven't submitted it formally yet because the kernel does not always boot.
>
> Usually, it hangs at:
>
> mmc1 is current device
> Scanning mmc 1:1...
> Found /boot/extlinux/extlinux.conf
> Retrieving file: /boot/extlinux/extlinux.conf
> 1:      imx8mm-evk-buildroot
> Retrieving file: /boot/Image
> append: root=/dev/mmcblk0p1 rootwait rw
> Retrieving file: /boot/imx8mm-evk.dtb
> Moving Image from 0x40480000 to 0x40600000, end=42770000
> ## Flattened Device Tree blob at 43000000
>    Booting using the fdt blob at 0x43000000
>    Loading Device Tree to 000000004fff5000, end 000000004ffffd6b ... OK
>
> Starting kernel ...
> (hangs here)
>
> Looks like a U-Boot issue that I need to investigate.

With kernel 5.15.14 it boots fine, so I submitted the patch with 5.15
instead of 5.16.

I will investigate the 5.16 boot problem later.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
