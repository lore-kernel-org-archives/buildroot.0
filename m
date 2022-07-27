Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF23C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCBB0828E3;
	Wed, 27 Jul 2022 20:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBB0828E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WTvob-UAb4b; Wed, 27 Jul 2022 20:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA528829F2;
	Wed, 27 Jul 2022 20:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA528829F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE6D1BF39A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB62160E94
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB62160E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2D1VepR_jtwI for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 20:31:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B226060E8C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B226060E8C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 20:31:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D0C040004;
 Wed, 27 Jul 2022 20:31:03 +0000 (UTC)
Date: Wed, 27 Jul 2022 22:31:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220727223102.6daf1e27@windsurf>
In-Reply-To: <20220215015307.855341-4-james.hilliard1@gmail.com>
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-4-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658953863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amcyyTGe8fB64SLMImU8o2jH1hHmSqKEY9TVVLqBbRM=;
 b=meaDl7WeNKfX5E6snsFxpdJtXLXAfA5tabTodOgJK2vngrR68zYs5kTmKYTtIIh703YNTI
 kZaljJLclEKcGwqFBOx7Tkpp9qDJHWenbxTmxF1CgASyzbGrrz145dgXAQ706UbHkTTmGg
 CYRBByKT71tF/nieuOBFy8WXBa6FL23nJqFyK35VgOkdFf+M260pFV7ezhza1I7sT3772m
 4tn5ttgVSSSMIIkZey1XXzIi4C04kGB2RqE6bp5zKz6Ej+Euz/B6USHLVbMjOcuXeZpZ2F
 SSWKL+2apiTnqCNArydC7voJV1a6Ao7sIYqe5vz/h+O8/sFuZOiJotK76HHphA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=meaDl7We
Subject: Re: [Buildroot] [PATCH v8 4/5] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 14 Feb 2022 18:53:06 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Currently the qmake gcc sysrootify path logic causes issues with
> per-package directories, disable automatic gcc sysroot for qt5base
> install and override all qt.conf paths manually to point to their
> correct locations.

Could you clarify which "issues" this is fixing? I am now looking at
this patch because it is the only one that has not been applied, 6
months after it has been posted, and the commit log is very fuzzy about
what the problem is, and how the commit fixes it.

I have just built the following defconfig successfully:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5MQTT=y
BR2_PACKAGE_QT5SCRIPT=y
BR2_PACKAGE_QT5SERIALBUS=y
# BR2_TARGET_ROOTFS_TAR is not set

Basically building with PPD, qt5base, and a limited set of qt5
packages. Could you describe the problem that you encountered, together
with a defconfig that allows to reproduce it?

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
