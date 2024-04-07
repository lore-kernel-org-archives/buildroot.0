Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3395BCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D11A041524;
	Sun,  7 Apr 2024 20:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYAUhtp6ULm1; Sun,  7 Apr 2024 20:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B852C41562
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B852C41562;
	Sun,  7 Apr 2024 20:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25C9A1BF3F6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E16881DFD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqgC34rbCFc1 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A4D981DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A4D981DFE
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A4D981DFE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:38:12 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 9B601240103
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 22:38:09 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VCPDw70PDz6twv;
 Sun,  7 Apr 2024 22:38:08 +0200 (CEST)
Date: Sun,  7 Apr 2024 20:38:07 +0000
From: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240407203807.GB13509@Apollo>
Mail-Followup-To: Arnout Vandecappelle <arnout@mind.be>,
 buildroot@buildroot.org
References: <20240305070452.183573-1-karthikeyan@linumiz.com>
 <9b60fd4d-7a0e-47da-a37a-9690b4ac84db@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b60fd4d-7a0e-47da-a37a-9690b4ac84db@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1712522289; bh=GIl8nSSqGaAzTysmhB+cEU9gHCUUYpquu0mSCZvDBdY=;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Disposition:From;
 b=ZiAEc+p5VQZ5R3CKID8IL1JqryqUQOeyTjHuxvjpAcCYMOZEGNZTow4gOmu6CkdTR
 mGEgkjc9VvVCESk3fG1URL0C+JBlXfD/FiDSNLgwxbYWjX1gur8iRZlCCiVP/Z8c3h
 mt284lhFtPaCElX+5Hd/2KR0SGqVCMnPyb6HgRYFgdplh6Zw/Ltw1rAtuJx4uY1sDI
 MHPW9bzeovjOwqeemQqQWMEs3PqN1/YbLyjayFyZ1DGy3QUoIJ7o7D4gds4pdKo5KD
 fxTsdU2sjHOJ3fEaJZmMoqKhfyQWE6Eywu1s1bpBM4VVgG1sO4l0gY6qtQlgKIObnZ
 zdkmgpqigjGyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=ZiAEc+p5
Subject: Re: [Buildroot] [PATCH] package: linux-firmware: update linux fw
 bluetooth package for rtl88xx
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

On Sun, Apr 07, 2024 at 05:50:50PM +0200, Arnout Vandecappelle via buildroot wrote:
> 
> 
> On 05/03/2024 08:04, Karthikeyan Krishnasamy wrote:
> > add realtek 8821cs bluetooth firmware in linux firmware package,
> > BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT config for realtek 88xx family,
> > not device specific config to enable, add fw's in realtek 88xx family
> > in build instead of adding them separately.
> 
>  I reworded this as follows.
> 
>     package/linux-firmware: RTL_88XX_BT: install all firmware
> 
>     Instead of enumerating each binary, which is cumbersome and may miss
>     some of them, simply install all binaries starting with rtl88.
> 
> 
>  Applied to master, thanks.
> 
>  Regards,
>  Arnout

Hi,

just saw this commit. In effect it added new firmware blobs for
rtl8821cs and rtl8852btu, but also removed one for rtl8852cu, was this
intentional?

  $ diff old new
  4a5,6
  > rtl8821cs_config.bin
  > rtl8821cs_fw.bin
  14a17,18
  > rtl8852btu_config.bin
  > rtl8852btu_fw.bin
  18d21
  < rtl8852cu_fw_v2.bin

Best,
Gero

> 
> > 
> > Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> > ---
> >   package/linux-firmware/linux-firmware.mk | 11 +----------
> >   1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> > index 60e8861abe..7e1e5cf6f2 100644
> > --- a/package/linux-firmware/linux-firmware.mk
> > +++ b/package/linux-firmware/linux-firmware.mk
> > @@ -90,16 +90,7 @@ endif
> >   # Realtek 88xx Bluetooth
> >   ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
> >   LINUX_FIRMWARE_FILES += \
> > -	rtl_bt/rtl8812ae_fw.bin rtl_bt/rtl8821a_fw.bin \
> > -	rtl_bt/rtl8821c_config.bin rtl_bt/rtl8821c_fw.bin \
> > -	rtl_bt/rtl8822b_config.bin rtl_bt/rtl8822b_fw.bin \
> > -	rtl_bt/rtl8822cs_config.bin rtl_bt/rtl8822cs_fw.bin \
> > -	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin \
> > -	rtl_bt/rtl8851bu_fw.bin rtl_bt/rtl8851bu_config.bin \
> > -	rtl_bt/rtl8852au_fw.bin rtl_bt/rtl8852au_config.bin \
> > -	rtl_bt/rtl8852bu_fw.bin rtl_bt/rtl8852bu_config.bin \
> > -	rtl_bt/rtl8852cu_fw.bin rtl_bt/rtl8852cu_config.bin \
> > -	rtl_bt/rtl8852cu_fw_v2.bin
> > +	rtl_bt/rtl88*_fw.bin rtl_bt/rtl88*_config.bin
> >   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
> >   endif
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
