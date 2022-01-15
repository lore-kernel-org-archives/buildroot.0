Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA57C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 22:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4274E4024A;
	Sat, 15 Jan 2022 22:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fUdc5EOTwShD; Sat, 15 Jan 2022 22:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9904023E;
	Sat, 15 Jan 2022 22:58:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40D741BF373
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 22:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 358D981886
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 22:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NE4Oen4OPg35 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 22:58:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83F3E81871
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642287480;
 bh=wGOaHyD9GhvsOT3Qka+GZo2NxLNjDphkuqzb7Ca9L9Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=V0olRhYLXzhD+Soxw2RBYdp5pku6P/1FQBoy8grS8xpm5rwJM9vkPs+hWkQpXLajS
 9h0yom6hK76a40vnWj0zY/r0e/ffzz0fgJHmAhdMFKkyMsCKZsslL3/Qb5XM0T4Zmx
 U/F+Y+vK1LZIva2JN60vdWaWiWGyxLuemtw+VBxk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.238]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1mNd3k1jXg-00wTkn; Sat, 15
 Jan 2022 23:58:00 +0100
Date: Sat, 15 Jan 2022 23:57:58 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220115235758.069ce087@gmx.net>
In-Reply-To: <20220109150359.1c4a717b@windsurf>
References: <20200306203410.25008-1-ps.report@gmx.net>
 <20200306203410.25008-2-ps.report@gmx.net>
 <20220109150359.1c4a717b@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:MPYfNt3jrxb+0pGYxvBjDulAg0ATkuU4B/xkKUa0PZKdOMhQvS9
 rR5saSaGSbzdm1xoAIwDsjUdbpfazlRU0dmHjl3FgcyrrLsAqtiqIeDFIrh8WID1tcFfNai
 wU7/e+KN/fb4FuB0Iizm9iFsUK3kblMoYbVxsoEX01U+7D7EBJZAOtt/BFv2F5rjz2eKFtn
 gylB1hXrelOL3BaK5A8eQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ozfEaQvEb6A=:2tcLZ98RWDlnLJgXZlaa+P
 Y+N+ySjcWTihACj4KwsGhNRBHVaeOwsdTaISohGdrPF56MEhafKV0KUO/3Wd4e1P4QQAdczYa
 4JuvLtDZ4jKrlNMtaXWx661237uk+niH/eC41Q46E2AZssnBEgcosLQGNYcuSLAqKmAPCuQiQ
 C0FBKvHJdVt+RJkpDJTZ6QWODNM+e5s5eud32AekgWUqRY1Cru8eR9HbcQqcypvq/HVcnZPLB
 l5zGgDB4m5xMgNwufDpizfL0VCoZp9pYuduZvDCCClh/4WQ+tD6MAP5aXG/JtGtMSZaSZkFu6
 pZAFN6Hf+2fA6FNqw/hHqTrIHxSPi0StJBY4OnF5BtvgcjJ8YHuOtFZgSxGnlUulKWVPqOO/O
 M4GgHPso5ITWxoouzqtXsMyZYdgjtBiNpuMikyrr1e9mCJSMaTm8AD00/lax+vQY9AaFEmU22
 VlY7swaUamAYGLjVpdnTHeQUGEsAkdimO9I9rJj/rDi1OTFx+udOEkmlSSuwTc4Qb4bGeSgUV
 KGpcLT7MIRfXZOZ+zeM+4QwdPBfHhXvdR1woLT5eUoWqWCmsRQlJDRso0tlFsSVPMTzLskxLk
 Bwr42Sx14kyXhJ2gB64J+HgorOVTgFr9vfQgLWyAOH5OE7A9ynxK9zu55CuPsEEDfyKFGHg+V
 ACF4wcSKwI2DKprkP08hZ8/0aPO+Tq2D3prUfNh5Yt19tRMnnDKNySvqx2J7DlPFA3tACYtB6
 6q2F35mda9jHEEsm5eeGd8WGzftq1Ud5D7+L+o9g8CIwHDAlX6HngQzehB78E2BaRt3XuFC77
 8BDT3doH+fT7T/rZZ22hx9L6f9hDEGS1Td/HLUybjnI9r3wUVi03PMr8h3rICN5X6gBwtRbHk
 A960wCJWIdaETFbMDuMGvPkWPq8wQjX9hXEkr9BpVkgQ6xzkoEoeFBj4R3A1G0MN/Av2ilsrO
 0AGOaGwAVmwP4pJk2iI8ISp4+xdVZTp5vWubf6uE2rpbYHVLrZhRhdjvzmd+a+NwEV+rneAYE
 1raOUCj/mAw7kUPvwfpN9DaJ5mBYzpReaqToZVeadVtpttOVr1w6OhtmKQ1RJ7KKmNGLN24/O
 35F62U/3XNbBP8=
Subject: Re: [Buildroot] [PATCH v3 2/2] package/qt5webengine: use buildroot
 cflags/ldflags for arm
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
Cc: buildroot@busybox.net, Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sun, 9 Jan 2022 15:03:59 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri,  6 Mar 2020 21:34:10 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > +define QT5WEBENGINE_CONFIGURE_COMPILER_FLAGS
> > +	$(SED) 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))%g' $(@D)/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> > +	$(SED) 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))%g' $(@D)/src/3rdparty/chromium/build/config/compiler/BUILD.gn
> > +endef
>
> This looks like a good thing. Could it replace the ARM-specific logic
> you had in your PATCH 1/2 ?

Not sure as there is more optional and/or compile defines logic depending on
the various arm-options logic..., the save way seems to be the right setting
of the various arm-options (but did not find a better way as to edit/sed the
GN files...

Regards,
Peter

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
