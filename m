Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772BDC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475F360730;
	Fri,  1 Mar 2024 08:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9g-OA8y2fMCT; Fri,  1 Mar 2024 08:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 665026079A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 665026079A;
	Fri,  1 Mar 2024 08:39:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCB6E1BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA3F36079A
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNpbYCvu4DS5 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA83960730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA83960730
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA83960730
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:39:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF9964000A;
 Fri,  1 Mar 2024 08:39:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfyQc-006dcd-0L;
 Fri, 01 Mar 2024 09:39:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240207142542.5284687589@busybox.osuosl.org>
Date: Fri, 01 Mar 2024 09:39:38 +0100
In-Reply-To: <20240207142542.5284687589@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 7 Feb 2024 15:25:23 +0100")
Message-ID: <87zfvi9whh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/petitboot: propagate
 dependencies from kexec/kexec-lite
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=c721a583790ef9e35e2a974450bdcbc5662621c8
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 719921bebe17 (package/kexec: bump to version 2.0.27) forgot to
 > propagate the new dependency on kernel headers to petitboot, which may
 > select kexec, causing unmet dependencies warnings (unfortunately, not
 > errors), such as:

 >     $ KCONFIG_SEED=0x84462FFC make randconfig
 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_KEXEC
 >       Depends on [n]: BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=n]
 >       Selected by [y]:
 >       - BR2_PACKAGE_PETITBOOT [=y] && (BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]) && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_HAS_UDEV [=y] && !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]

 > Propagate the dependency from kexec, and add comments about dependencies
 > also inherited from kexec-lite.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Laurent Vivier <laurent@vivier.eu>
 > Cc: Julien Olivain <ju.o@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
