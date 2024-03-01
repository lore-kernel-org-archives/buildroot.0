Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618BCC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C0506065F;
	Fri,  1 Mar 2024 08:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-7lQuTMzObj; Fri,  1 Mar 2024 08:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 329B2606ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 329B2606ED;
	Fri,  1 Mar 2024 08:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9641BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57AD4405C4
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCf2JtMW6t7d for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D97FE400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97FE400BF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D97FE400BF
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:33:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD0C21C0008;
 Fri,  1 Mar 2024 08:33:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfyKg-006dAb-04;
 Fri, 01 Mar 2024 09:33:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240207104003.A5CE287547@busybox.osuosl.org>
Date: Fri, 01 Mar 2024 09:33:30 +0100
In-Reply-To: <20240207104003.A5CE287547@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 7 Feb 2024 11:39:43 +0100")
Message-ID: <87cysebbc5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/util-linux: propagate
 linux-pam dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=20ee36e0b096185853835aea848b86a7fccd238b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit c77e25c3f113 (package/linux-pam: needs gcc >= 4.9) forgot to
 > propagate that new dependency to the util-linux runuser and su, yielding
 > unmet dependencies warnings (unfortunately, not errors), such as:

 >     $ KCONFIG_SEED=0x8AE589A3 make randconfig
 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
 >       Depends on [n]: BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
 >       Selected by [y]:
 >       - BR2_PACKAGE_UTIL_LINUX_RUNUSER [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]
 >       - BR2_PACKAGE_UTIL_LINUX_SU [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
