Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D601C43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 06:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB29E40B86;
	Fri,  3 Jun 2022 06:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61RxtktMsuEb; Fri,  3 Jun 2022 06:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB2B9401A1;
	Fri,  3 Jun 2022 06:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5660F1BF847
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 06:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4688F8417D
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 06:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fe1VTTkr9pN8 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 06:46:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A0D484161
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 06:46:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 302FCFF805;
 Fri,  3 Jun 2022 06:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654238802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZKylUNyBnOEmO2HtjvQ7YA/b/N0TX6b7ZBy1pIcZXU=;
 b=KRtPBWkoXxG/zXavon0xJR//EgKp0MJzsf9EWpy5CYxNfNsBYYtQSoggoxPOAV9pbZWjv/
 2QlQYjT4o02qQpJmM4SvbyPSSee0tHQPGy/StSZr+YzkXDTs63OzWkqzbnVNvWdQ7uWKX5
 LzEIMhrYeKiSw546f7F84WeSWhLiWs8rxVOUoaz7ieK9mzATSFGxA6udXHDvwKova+fQqS
 Fjs3jAMuPfW8A2YoRXIgsUWwEP4BJfwhLL+WukAOaLgq6BcZ/zwfkYRdBogajubu9bN5I2
 x5920Ey9T9H1CcvkXIeETh8p250UN7CnMZxmTBRZYUHyZ+IqlZNPf6NT8Pl3vw==
Date: Fri, 3 Jun 2022 08:46:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220603084641.5b6da6f5@windsurf>
In-Reply-To: <20220529211314.2953343-1-fontaine.fabrice@gmail.com>
References: <20220529211314.2953343-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 May 2022 23:13:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Mutt 2.2.5 was released on May 16, 2022: this is a bug-fix release,
> fixing two issues with libgsasl authentication.
> 
> Mutt 2.2.4 was released on April 30, 2022: this is a bug-fix release,
> fixing some regressions with Maildir/mh mailbox path normalization that
> were added in 2.2.0. Please see the UPDATING file for more details.
> 
> https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-5-rel/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I know we normally don't take version bumps in master, but this was
clearly a bug-fix only version bump, so I took it for master.

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
