Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FDEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A900C833C9;
	Thu,  6 Jan 2022 22:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylVB9OteHzZ3; Thu,  6 Jan 2022 22:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1696983367;
	Thu,  6 Jan 2022 22:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C30821BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A19B040131
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCt6wzqgRmNl for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:29:18 +0000 (UTC)
X-Greylist: delayed 23:45:58 by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C2B9400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:29:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id BE2AC200002;
 Thu,  6 Jan 2022 22:29:14 +0000 (UTC)
Date: Thu, 6 Jan 2022 23:29:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220106232913.370ee876@windsurf>
In-Reply-To: <CA+h8R2qv7gBPc2KcgT=5tjDr475haSYMZwLzu4RbYFO3xV4-HQ@mail.gmail.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-9-thomas.petazzoni@bootlin.com>
 <CA+h8R2qv7gBPc2KcgT=5tjDr475haSYMZwLzu4RbYFO3xV4-HQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 08/11] package/sentry-cli: re-add package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Thu, 6 Jan 2022 14:04:56 -0800
Christian Stewart <christian@paral.in> wrote:

> I get a build error  with "make host-sentry-cli":
> 
> error: failed to run custom build command for `libc v0.2.71`
> 
> Caused by:
>   process didn't exit successfully:
> `/build/host-sentry-cli-1.59.0/target/release/build/libc-a39b7215be30da0c/build-script-build`
> (exit status: 1)
>   --- stderr
>   /build/host-sentry-cli-1.59.0/target/release/build/libc-a39b7215be30da0c/build-script-build:
> /lib64/libc.so.6: version `GLIBC_2.34' not found (required by
> /build/host-sentry-cli-1.59.0/target/release/build/libc-a39b7215be30da0c/build-script-build)
> 
> I guess this is a rust-related issue? I think it's complaining about
> the glibc version of my build system.

It build fine on two machines here. Could you provide more details
about your host distribution? Perhaps provide a docker container that
reproduces this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
