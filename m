Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F8FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:08:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3629F61101
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3629F61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA4B81770;
	Wed,  3 Nov 2021 22:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJmZP0jd5wFM; Wed,  3 Nov 2021 22:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 479708100D;
	Wed,  3 Nov 2021 22:08:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C85901BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6E62403AC
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXUKO9JDoiUe for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:08:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91E5C40165
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:08:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8D6A340002;
 Wed,  3 Nov 2021 22:08:02 +0000 (UTC)
Date: Wed, 3 Nov 2021 23:08:01 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211103230801.45c0b713@windsurf>
In-Reply-To: <20211030215521.2155435-1-fontaine.fabrice@gmail.com>
References: <20211030215521.2155435-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/softhsm2: add p11-kit optional
 dependency
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
Cc: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Oct 2021 23:55:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> p11-kit is an optional dependency which is enabled by default since the
> addition of the package in commit
> 53873b6daecd2a97740833cae7c5b4cdb185a6b2 and softhsm2 needs help to
> properly install files:
> 
>  /usr/bin/install -c -m 644 softhsm2.module '/home/buildroot/autobuild/instance-0/output-1/host/nios2-buildroot-linux-gnu/sysroot/home/buildroot/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/share/p11-kit/modules'
> 
> [...]
> 
> softhsm2: installs files in /home/buildroot/autobuild/instance-0/output-1/host/nios2-buildroot-linux-gnu/sysroot//home/buildroot/autobuild/instance-0/output-1
> package/pkg-generic.mk:330: recipe for target '/home/buildroot/autobuild/instance-0/output-1/build/softhsm2-2.6.1/.stamp_staging_installed' failed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a05bb71cfe016f793c89b2a035835718836039c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/softhsm2/softhsm2.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

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
