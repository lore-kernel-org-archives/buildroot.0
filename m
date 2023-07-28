Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20CAC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DED5421B6;
	Fri, 28 Jul 2023 20:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DED5421B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GUKfJtsV14eX; Fri, 28 Jul 2023 20:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77C3E421E5;
	Fri, 28 Jul 2023 20:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77C3E421E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB5D51BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 959D060C12
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 959D060C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lx8NTBYuVawQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:26:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D93A60BF7
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D93A60BF7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C2AC40004;
 Fri, 28 Jul 2023 20:26:22 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:26:21 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230728222621.3c866b47@windsurf>
In-Reply-To: <20230724172426.49958-1-ju.o@free.fr>
References: <20230724172426.49958-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690575982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjN6jLL632XnCIcVF8uFFdY5PMuXcaL1iiAxEAWl3Ok=;
 b=CAruF0vSd8g3ZkltRyhJ4KQl8o+y3McevVVVpXpJSADFV4VtAZoNHkiB9FtsZOScZnJsuQ
 c69KrjppfbnLv0m05Pch7HlPNzlM4a8dmsZem5sqcKtHpHvgMP8Ia4TU+2xYGunIswWzE0
 nUDJ0JkV5B7tUTl2IOkZCfPma0FZsvob2HV3vNmRmpZoVov+CabbaqBLM/WLB87M2NldHN
 ZHVXpW9QfnUgQJ6xBcDhAxIhlE6aCjQ6u/r7TDsWJmKgBb+IU7NFKC6pmOEp91JjF0yqiT
 dgIwJe2flnDN81maeLMmBpuX/WUlsQbfT3BPsc7rw4m59qyL0+7MsNgqiq83qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CAruF0vS
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: remove superfluous =TRUE in
 DEBUG_ON_SERIAL_PORT macro definition
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jul 2023 19:24:26 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Commit 8e9c8e624f "boot/edk2: introduce a new _OVMF_DEBUG_ON_SERIAL
> option" adds a build macro definition with a "=TRUE" value.
> 
> edk2 OVMF readme suggests to define the "DEBUG_ON_SERIAL_PORT" macro
> _without_ the "=TRUE" in [1].
> 
> The example build.sh script calls build to set the macro _with_
> "=TRUE" in [2].
> 
> The "Build_Utility_Man_Page.rtf" documentation in [3] does not specify
> either what exactly happen when a macro is defined without any value.
> 
> Looking at the "build.py" code in [4] shows that a macro definition of
> the form "-DMYMACRO" is indeed equivalent as "-DMYMACRO=TRUE". This
> was also tested with a qemu virt x86_64 grub2 EFI boot image, to
> verify behaviors remain the same.
> 
> This commit removes the superfluous "=TRUE" as requested by Yann in [5].
> 
> Removing the "=TRUE" make it a bit clearer that it is the macro
> definition itself that will enable the feature, rather than its
> value. Defining, -DDEBUG_ON_SERIAL_PORT=FALSE (OFF, 0, or anything
> else that would suggest the feature is disabled) would do the
> opposite of the desired effect, and enable the feature.
> 
> [1] https://github.com/tianocore/edk2/blob/edk2-stable202305/OvmfPkg/README#L95
> [2] https://github.com/tianocore/edk2/blob/edk2-stable202305/OvmfPkg/build.sh#L252
> [3] https://github.com/tianocore/edk2/tree/edk2-stable202305/BaseTools/UserManuals
> [4] https://github.com/tianocore/edk2/blob/edk2-stable202305/BaseTools/Source/Python/build/build.py#L2531
> [5] https://lists.buildroot.org/pipermail/buildroot/2023-July/671059.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  boot/edk2/edk2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
