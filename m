Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC80C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:09:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D39EF6113E
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D39EF6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B34F402F7;
	Tue,  9 Nov 2021 08:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IB4tAWsPQ1Nf; Tue,  9 Nov 2021 08:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87505402F1;
	Tue,  9 Nov 2021 08:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5723E1BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45C5240319
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aGSt9iYJP5ON for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:09:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FEB6402E0
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:09:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 57E0C100004;
 Tue,  9 Nov 2021 08:09:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mkMBz-0006ND-J3; Tue, 09 Nov 2021 09:09:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211105211423.941806-1-romain.naour@gmail.com>
Date: Tue, 09 Nov 2021 09:09:19 +0100
In-Reply-To: <20211105211423.941806-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 5 Nov 2021 22:14:23 +0100")
Message-ID: <87h7cl4uog.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/systemd: enable selinux xdg
 module for refpolicy
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
Cc: Antoine Tenart <atenart@kernel.org>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Without the selinux xgd module enabled by systemd package, refpolicy
 > fail to build due to policy/modules/system/systemd.te [1]

 > policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 508447:

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470

 > [1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/modules/system/systemd.te#L288

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Antoine Tenart <atenart@kernel.org>
 > ---
 > v2: enable xdg module from syslinux instead of refpolicy (Adam, Thomas)
 >     http://lists.busybox.net/pipermail/buildroot/2021-November/627371.html

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
