Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63692C54EBE
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 08:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D519C41B65;
	Sat,  7 Jan 2023 08:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D519C41B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqDsu3Dx8SyK; Sat,  7 Jan 2023 08:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDB9641B49;
	Sat,  7 Jan 2023 08:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDB9641B49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B3811BF255
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 08:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5320F60E85
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 08:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5320F60E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5HIEoIMIMfF for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 08:40:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4F760E6D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A4F760E6D
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 08:40:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F1B440007;
 Sat,  7 Jan 2023 08:40:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pE4kX-00AxJK-QV; Sat, 07 Jan 2023 09:40:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230107082710.2609784-1-peter@korsgaard.com>
 <20230107082710.2609784-4-peter@korsgaard.com>
Date: Sat, 07 Jan 2023 09:40:21 +0100
In-Reply-To: <20230107082710.2609784-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 7 Jan 2023 09:27:09 +0100")
Message-ID: <87eds6ohze.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] configs/hifive_unleashed_defconfig:
 explicitly use OpenSBI 0.9
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
Cc: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Rather than relying on what is currently the default.
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---

FYI, 1.2 would probably also work but I don't have the hardware to
verify.


 >  configs/hifive_unleashed_defconfig | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
 > index 0b87f2588f..2b6ee6c08e 100644
 > --- a/configs/hifive_unleashed_defconfig
 > +++ b/configs/hifive_unleashed_defconfig
 > @@ -37,6 +37,8 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 >  # Bootloader
 >  BR2_TARGET_OPENSBI=y
 > +BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
 > +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="0.9"
 >  BR2_TARGET_OPENSBI_PLAT="generic"
 >  BR2_TARGET_UBOOT=y
 >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > -- 

 > 2.30.2


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
