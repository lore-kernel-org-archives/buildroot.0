Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974A9C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C7960B65;
	Wed, 27 Jul 2022 09:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C7960B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYXuPiAKePLA; Wed, 27 Jul 2022 09:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E65E60B50;
	Wed, 27 Jul 2022 09:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E65E60B50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC9151BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5C2840901
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5C2840901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOfw_nE0aep9 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:56:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 660624087A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 660624087A
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:56:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4233D20008;
 Wed, 27 Jul 2022 09:56:53 +0000 (UTC)
Date: Wed, 27 Jul 2022 11:56:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727115652.6bc7ec15@windsurf>
In-Reply-To: <20220727082027.731020-1-fontaine.fabrice@gmail.com>
References: <20220727082027.731020-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658915813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkLsetSjsUTNBAUXTBgljAbX3QszN3cL2vzPQZSfcms=;
 b=F8UOvfv4K9IqHtg5jY9PEIeNS91LnYkEkyd69GC47hcnoL+0J4T23tcL1Vw6+sXZIdD3DU
 b/gBJyqvPUuuyaBl+6fbnxjHiym2dNqaL9+5+v50TQI+dEzM3MW/Dq72EhbA6jQO6mWxh7
 /Zd0Q3cLCnZpXcpP642x9UJ9EifQ+zmoTEp4BLNlfdGP0C7eqzjgcqxXaH38Y+r4RY8cXA
 NiVszMYF4Gzl9MMIShPuce89OooFxrDOGhJaax3dKE8mYRQ/6LzOFGM5XU3igSPXYXNTw/
 Tkm0eho1wHcPIWFyudimfph4xR4FUGFeQQgyeNRuMcnTbzwwucL8C2fscP6qCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F8UOvfv4
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: fix NLS build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 10:20:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with NLS raised since bump to version
> 16.1 in commit 6f3131296484767f037d3535ab69f328e94351db:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/11.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: src/libpulsecommon-16.1.so.p/pulsecore_lock-autospawn.c.o: in function `.L0 ':
> lock-autospawn.c:(.text+0x1f8): undefined reference to `libintl_dgettext'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/58ce701da2896125507048b29ded75cf9bcd6e35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 2 ++
>  1 file changed, 2 insertions(+)

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
