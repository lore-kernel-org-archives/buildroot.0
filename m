Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30251C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0AE0812DF;
	Sun, 30 Oct 2022 11:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0AE0812DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syflqugHPmQO; Sun, 30 Oct 2022 11:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F076080C3F;
	Sun, 30 Oct 2022 11:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F076080C3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 028B31BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEE74812EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE74812EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvrtWwaz7LiL for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:08:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD963812DF
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD963812DF
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:08:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8ABDB240003;
 Sun, 30 Oct 2022 11:08:27 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120758.5e5bad95@windsurf>
In-Reply-To: <20221030094155.53225-1-fontaine.fabrice@gmail.com>
References: <20221030094155.53225-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0mCJnEbZEgDJ0fKk4wdmLhaje35A+ifZL89xKKopZ8=;
 b=jN7vvk3OFhaLVmVNQofK7vc2o9FC3hpvVgzE17UsnKUgGyPMgtTN3ql5HRJBUE9MIpfaCm
 x1J7rMcZwlqX7bYlB5Y9SPFjo+NUU7pIZtQ1fwbK9JHeAzAz2BArNT3au/k/Kq+E6GnpwN
 QU1bNaD49hJwBgSYjXLFkef6KUhaWGUbNOWIQTDvcwsfy5e8VscoPB6UdAce9+ZDPTyJ5W
 H9hwB3epnmt1oxZq1tV/XDSn+kx+WOsK9lyFhLsMYUt3PK222BVhs+/HrCYb5SbLckyiu4
 YIYJcc9o6t0/gNKWgHvS3vm7xsL4Sw30JjNKKDzL9b97BSI1sFqjaPhzr0OUcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jN7vvk3O
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodbus: bump to version 3.1.8
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Oct 2022 10:41:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch site to get latest release
> 
> https://github.com/stephane/libmodbus/releases/tag/v3.1.8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmodbus/libmodbus.hash | 2 +-
>  package/libmodbus/libmodbus.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
