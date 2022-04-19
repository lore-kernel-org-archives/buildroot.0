Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C8BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 18:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE1183323;
	Tue, 19 Apr 2022 18:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7paC_N3CY-T; Tue, 19 Apr 2022 18:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B603831D6;
	Tue, 19 Apr 2022 18:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2401BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 18:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473D260797
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 18:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55p39JffC0iX for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 18:43:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0694160A9F
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 18:43:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C04DB240005;
 Tue, 19 Apr 2022 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650393826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhYZMfADVDqFlmPC4Nyd/HEFk/LsSnErLUE+l7dicEE=;
 b=nCFZobIoJoCUrwIuGW82IyvTKD9I23Hkd9y+u4b31tmFb3IPji+1gmxi/K3ntgc1VkGG91
 HCMYkcF3vF8ixOnNJUleGiRkltyzKdbeepj/wOeuLi7lrwdZ4r2/MJX7tagm+6xOMmKtvi
 ce1N0nzQ7m8u3+FBT1vda0t08C7OmNPq28Mf+ehjQpe4VDwIctq/Qx1ILqNmeaEDLxLu4H
 TDVXPny7n5UhsHoCfK9/QfcUaSFcfKzPv0Spa9e6RaoJ+aRsDGaBMV2VhQmAuFKwvmQkdv
 uxQ8kFqLqJUKrQiIpwmJk+7II0VbR3ndxOelaFcNh9DBAnHMRdtMa0Sti2XeQw==
Date: Tue, 19 Apr 2022 20:43:41 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20220419204341.0adf3f55@windsurf>
In-Reply-To: <12997361.uLZWGnKmhe@pwmachine>
References: <2098999.irdbgypaU6@pwmachine> <20220417104244.6d681b10@windsurf>
 <12997361.uLZWGnKmhe@pwmachine>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-04-14
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Apr 2022 18:41:44 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> I think upstream code has actually a problem buildroot test infrastructure 
> highlighted.
> So, from my understanding, the best solution would be to patch upstream 
> libbpf.
> Indeed, I do not think adding a buildroot package will solve this problem.
> 
> Were you suggesting than by adding a buildroot package we could add a local 
> patch to fix this behavior?

What I meant is that pahole bundles libbpf as a git submodule, but can
also use an external libbpf. In the context of Buildroot, we would very
much prefer to have a separate host-libbpf package, with host-pahole
depending on it (and not using its own copy of libbpf).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
