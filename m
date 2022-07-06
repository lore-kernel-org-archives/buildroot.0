Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1BCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90C440252;
	Wed,  6 Jul 2022 21:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90C440252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHkQZp5P7e57; Wed,  6 Jul 2022 21:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B354B402AF;
	Wed,  6 Jul 2022 21:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B354B402AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4678E1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2006E4049A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2006E4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_Jf7S_ONK-3 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:27:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1611040134
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1611040134
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:27:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D73D240002;
 Wed,  6 Jul 2022 21:27:51 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:27:50 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706232750.0c94dab5@windsurf>
In-Reply-To: <20220628203001.2840929-1-fontaine.fabrice@gmail.com>
References: <20220628203001.2840929-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSVfXCy75tKewPhQ3d4wh+vmS1j9W4fZ7djNp4lvbgk=;
 b=Aoz/2bMnF59sIWJ7bjhx4uE5J3+p18xvkTnAD7gnzivW+2WDQ3I4WcMuqkh6AzBBZfGD+h
 hz8MmeVphGfpStr81VhqoKX9ZfGymhfsccXGT5Pv06mn3bUQD251orRvzS0GHCq4MXCjf9
 8Jaq5dFsB6t0uKRYo9FmZ9r/M38p6KRW38J2eV87qOui3RCHuUFS0qY3AATkBwV2Uvn3iX
 p3YZkXvUP5WEN2s2xxbWQlQlQMB+qZXJv2ZrvGL4hJVVsNO7nYSpNh3GqK0kE9Xlqq3m0S
 ryIuBrNMBaCV/dYz9j+2JtBFihhT14js5kuq7cQdCUu+Zm6tD1Z1QSPYCFng+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Aoz/2bMn
Subject: Re: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.4
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

On Tue, 28 Jun 2022 22:30:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> http://git.savannah.gnu.org/cgit/dmidecode.git/plain/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dmidecode/dmidecode.hash | 2 +-
>  package/dmidecode/dmidecode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
