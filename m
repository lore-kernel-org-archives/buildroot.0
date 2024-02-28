Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8D4C54E41
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 11:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4A660AA1;
	Wed, 28 Feb 2024 11:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QuDwv5dADVw0; Wed, 28 Feb 2024 11:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55BA60D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A55BA60D5F;
	Wed, 28 Feb 2024 11:25:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 681C01BF30B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6198B41566
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QxxMb7p6AMSt for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 11:25:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEEA24155F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEEA24155F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEEA24155F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 11:25:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCBCDFF802;
 Wed, 28 Feb 2024 11:25:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfI3p-00Gnqi-0Q;
 Wed, 28 Feb 2024 12:25:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240225092421.1468140-1-yann.morin.1998@free.fr>
Date: Wed, 28 Feb 2024 12:25:17 +0100
In-Reply-To: <20240225092421.1468140-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 25 Feb 2024 10:24:21 +0100")
Message-ID: <87msrkrftu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/openssh: fix dependencies with
 refpolicy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 2c5a82a29ceb (package/openssh: select linux-pam if refpolicy
 > upstream is selected) did not account for the linux-pam dependencies
 > before selecting it, causing unmet dependencies warnings (unfortunately,
 > not errors), such as:

 >     $ KCONFIG_SEED=0xCF227CF4 make randconfig
 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
 >       Depends on [n]: BR2_ENABLE_LOCALE [=n] && BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
 >       Selected by [y]:
 >       - BR2_PACKAGE_OPENSSH [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION [=y]

 > 2c5a82a29ceb made the choice of having openssl bear the responsibility
 > to select linux-pam when the upstream refpolicy version was enabled.
 > Semantically however, the responsibility really lies within refpolicy
 > itself, since that's what imposes linux-pam to openssh.

 > Move the select to refpolicy and drop it from openssh. Then, ensure that
 > linux-pam is only selected when it is available.

 > That means that one may get an openssh that is not linked against
 > linux-pam, when the linux-pam dependencies are not met; refpolicy (by
 > way of libsepol) also has a more stringent requirement on gcc version
 > than linux-pam, so most probably the missing dependencies would be
 > locale, wchar, or a static build. We consider that situation to be a
 > corner case that we do not want to address.

 > In the future, we may have more similar situations, whereby refpolicy
 > would impose other packages be linked with otherwise optional
 > dependencies. If (when) that were (will be) the case, then the proposed
 > mechanism would quickly become ugly; we could then re-assess a nicer way
 > to do that. Until then, this is good ebough.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - simplify the logic: have refpolicy bear the select

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
