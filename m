Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CC3C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 22:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F0848144E;
	Tue, 27 Dec 2022 22:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0848144E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7zCA5SbYD4F; Tue, 27 Dec 2022 22:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4109E8144C;
	Tue, 27 Dec 2022 22:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4109E8144C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 860491BF2E4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 22:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EDE540391
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 22:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDE540391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHTRgWvcZRf5 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 22:31:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C3C64018F
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C3C64018F
 for <buildroot@uclibc.org>; Tue, 27 Dec 2022 22:31:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pAITU-0003v3-Tj
 for buildroot@uclibc.org; Tue, 27 Dec 2022 23:31:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Dec 2022 23:30:45 +0100
Message-ID: <pan$60b46$ce6281f3$ccde7c98$d5e8f550@ID-313208.user.individual.net>
References: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
 <20221227224354.3b1d1fdf__40547.9438648158$1672177457$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-firmware: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Tue, 27 Dec 2022 22:43:54 +0100 schrieb Thomas Petazzoni via buildroot:

> Hello,
> 
> On Mon, 26 Dec 2022 19:03:53 +0100 Bernd Kuhls
> <bernd.kuhls@t-online.de> wrote:
> 
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> Do we know why these firmware files are not part of the linux-firmware
> project? They are needed in conjunction with which kernel drivers?

The history of this repo is unknown to me, it is used by the LibreELEC 
project in their images. Personally I need only these firmware files:

BR2_PACKAGE_DVB_FIRMWARE_FILES="dvb-demod-m88rs6000.fw dvb-demod-si2168-
d60-01.fw v4l-cx23885-avcore-01.fw"

for the cx23885/m88ds3103/si2168 kernel modules needed by this card:

05:00.0 Multimedia video controller: Conexant Systems, Inc. CX23887/8 
PCIe Broadcast Audio and Video Decoder with 3D Comb (rev 04)

(aka Hauppauge WinTV-HVR-5525HD)

These firmware files are not present in the linux-firmware package.

To pick up Yann's proposal: How about adding a device-specific Config.in 
option for these firmware files like

config BR2_PACKAGE_DVB_FIRMWARE_WINTV_5525HD
    bool "firmware for Hauppauge WinTV-HVR-5525HD"

When other users need specific firmware from this package they can add 
new options when needed, like I did with https://patchwork.ozlabs.org/
project/buildroot/patch/20221218220318.563479-1-bernd.kuhls@t-online.de/

Or, if the license mess gets too complicated, I am happy to keep the 
package in my private repo ;)

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
