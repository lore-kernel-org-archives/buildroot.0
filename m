Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F08C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 22:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1946408E4;
	Sun, 23 Jan 2022 22:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQMKH5VAy8W3; Sun, 23 Jan 2022 22:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDABC402F8;
	Sun, 23 Jan 2022 22:01:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF2311BF3F6
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC65881D4D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mwM9FEV_KZp for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 22:01:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B6BB81B69
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 22:01:18 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BkvDnojoyI46dBkvEnEbdZ; Sun, 23 Jan 2022 23:01:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642975276; bh=kAo6B3JjUor9vENDviZTi3cbMtZi4pPyyuQwFqBoRs8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ey+gEhYVkD/HGzXM8i3lZgk7jgIRbh0Ds23fb2IUSp2CB4YP01VM58dw9HCLrj/tN
 jlxC1xhr5aWEvk35oX7OP+Nn0EFJUqnWKq36uRaEARUF5BqploM5xgdP0My02Ugn2V
 8Vq2HdDCSMyfvCl69G13CeISaLRbT9ANZ0RC3oph0ZawgI0PZc2WnPOHUc7ubZu1NB
 KVbjr2dGC4IrCPR4G90AgyqnRnnIcIfC57KKC8VUALGuzIk3Q88XMIdZBOuczy211H
 D1ydepbuidem8jJ14IDaTUnU00DxMnZ/O8zQXR3mXAx/icMnrryeCfGXEQGHa2OjMU
 fWoEjeLQ7wzIw==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
References: <20220117080616.10563-1-heiko.thiery@gmail.com>
 <20220122151130.59ae7148@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <c0fdfc83-150f-bd10-33a6-501e6171dff3@benettiengineering.com>
Date: Sun, 23 Jan 2022 23:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220122151130.59ae7148@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfC3VIVG6erCdb7TH4c45JHUQDslVAAI7NRJeP5kRIea7vV5ptyyqFVBW6JRCAdwoKq5zphMBfdI4MIKnWeuZj7GYp1EoJdwEgKsApRbZquUEpq96fenA
 gapUDDJe2YV0f5EL97MEyP7JIJX4tC6LDv0bEHovIkDZWvX6YtkysixjUSqN2g02OASmUMC9e2R1SMvbS3Gtpj9wXAQG2a3r/RkB8WDFE8MXHdBhmBJ3sNUu
 BRx13w3Au+TBOqHsqmm0ZymSc08jxWnfOvOl06siIfUfzWDLn+XkBmBFFyhERF/+M17ShhOmmG2QgTiTZpooUA==
Subject: Re: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/01/22 15:11, Thomas Petazzoni wrote:
> On Mon, 17 Jan 2022 09:06:16 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
>> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ---
>>   board/kontron/pitx-imx8m/boot.cmd      | 8 --------
>>   board/kontron/pitx-imx8m/extlinux.conf | 4 ++++
>>   board/kontron/pitx-imx8m/genimage.cfg  | 5 +++--
>>   board/kontron/pitx-imx8m/post-build.sh | 7 +++++--
>>   board/kontron/pitx-imx8m/post-image.sh | 2 +-
>>   configs/kontron_pitx_imx8m_defconfig   | 3 +--
>>   6 files changed, 14 insertions(+), 15 deletions(-)
>>   delete mode 100644 board/kontron/pitx-imx8m/boot.cmd
>>   create mode 100644 board/kontron/pitx-imx8m/extlinux.conf
> 
> I have applied, but I am a bit worried about things are going on with
> this switch to extlinux.conf.
> 
> Indeed, we have:
> 
>   * Platforms where the UUID is hardcoded into genimage.cfg and
>     extlinux.conf, such as board/beaglev/
> 
>   * We have platforms where a "uuid" variable in filled in U-Boot before
>     triggering the extlinux.conf logic, and therefore extlinux.conf uses
>     root=PARTUUID=${uuid}. For example
>     board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf,
>     board/orangepi/orangepi-zero/boot.cmd,
>     board/solidrun/mx6cubox/rootfs_overlay/boot/extlinux/extlinux.conf,
>     board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf,
>     and a few others.
> 
>   * We now have platforms (kontron/smarc-sal28 and kontron/pitx-imx8m)
>     where a random UUID is generated in the post-build script, and used
>     in genimage and extlinux.conf.
> 
> I'm not sure where we want to go, and how much we want to enforce "best
> practices" that are common on all platforms, or just let each platform
> do its little business.

IMHO the worst drawback I see while using extlinux.conf VS boot.scr is 
the missing checksum. Especially on embedded systems we deeply treat.
Not having such checksum can make system booting without a parameter on 
linux command line for example, only because 1 ASCII has been corrupted.
I prefer the system to not boot at all in general instead of having it 
"working" while hiding some potential problem.

What do you and All think about this?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
