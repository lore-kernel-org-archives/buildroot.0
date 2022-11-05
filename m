Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32579C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE36381CA0;
	Sat,  5 Nov 2022 21:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE36381CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvPnHJDI5v7G; Sat,  5 Nov 2022 21:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03C3481C21;
	Sat,  5 Nov 2022 21:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03C3481C21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCD61BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE737404D0
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE737404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpTy3xVNX72f for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:04:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C247F404B5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C247F404B5
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:04:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15B32FF803;
 Sat,  5 Nov 2022 21:04:00 +0000 (UTC)
Date: Sat, 5 Nov 2022 22:03:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105220359.46d62b83@windsurf>
In-Reply-To: <20221104130655.538206-1-fontaine.fabrice@gmail.com>
References: <20221104130655.538206-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667682242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTSyOmrGUQYhftmELholjlNYviJwoH5bLtWbecqEVZc=;
 b=JX0AxFjivGYzhJaMhnj0h/ES1XAcWloRQFCN/HIIaPr4oJe9ZRXlWoRI2aV2c+KsNVWTNm
 1LPsjFbtIzCiXv3/3b47IrcG7xDJ5xJmJ9HURKkrz1CJdKfYbuXzMfkPt+KyurxNh9awiz
 Rpxx0nRiR6UyOEra5795B5sAZyoJhSMudsyqJEL3VZ8cVoDE9AAzh4I025auqZ7mHHJs+a
 dlAqLQoVDbgtTNUeLifoTqajc0L0DVe25dz8eK3pId6e/QMlqX2PiHdPuZRp7o2OIVYFnZ
 16UrS3DV0YfebYCdtCBGHPcOUPhW6kg/iaJVQ37uY3oKU31cAeK8yGfySdhETg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JX0AxFji
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 5.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Nov 2022 14:06:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> LXC 5.0 will be supported until June 2027 and our current LTS release,
> LXC 4.0 will now switch to a slower maintenance pace, only getting
> critical bugfixes and security updates.
> 
> We strongly recommend all LXC users to plan an upgrade to the 5.0
> branch.
> 
> - Switch to meson-package
> - Add an upstream patch to fix the following build failure with glibc
>   2.36 (unfortunately upstream doesn't plan to fix this for 4.x:
>   https://github.com/lxc/lxc/issues/4183 and patch is only working with
>   meson, not autotools)
> 
> https://discuss.linuxcontainers.org/t/lxc-5-0-lts-has-been-released
> https://discuss.linuxcontainers.org/t/lxc-5-0-1-has-been-released
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f77e2dc44c9a224f280e08089a890e85c302274f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-where-struct-mount_attr-is-declared.patch | 186 ++++++++++++++++++
>  package/lxc/lxc.hash                          |   2 +-
>  package/lxc/lxc.mk                            |  41 ++--
>  3 files changed, 208 insertions(+), 21 deletions(-)
>  create mode 100644 package/lxc/0001-build-detect-where-struct-mount_attr-is-declared.patch

This patch doesn't apply on master. Could you check, rebase and resend?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
