Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47AACA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 437DF40449;
	Sat,  2 Sep 2023 07:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 437DF40449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le0-K4QCPo6y; Sat,  2 Sep 2023 07:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 833404035D;
	Sat,  2 Sep 2023 07:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833404035D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7B71BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7DB441E3E
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DB441E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSVTpqgogt7v for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:36:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14EB341E88
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14EB341E88
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF2D0240002;
 Sat,  2 Sep 2023 07:36:00 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:35:59 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230902093559.7a2dae24@windsurf>
In-Reply-To: <20230901220659.522842-1-ju.o@free.fr>
References: <20230901220659.522842-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chhhHnbdQVuiEC9B7w3WpVjTBO8sUGGZXR+/9gvjynY=;
 b=QTPJBglawsUsrHd/MnUYB3lscbq+JrqDNQZUPBgkjHy/C5JRPPTWn3AYbFHNPtCrgQxetA
 7/WYxCglAex6shEvW6BY5vz5hPmJLcpmSCzDW0NumBMc8j5NAxgFVNPqyCvd3gzI47cQ/g
 94HBjLYAJk3qhxp6ImwIGE32BFKMhgV6eAJLQURq+x4gJqcnFSH6M2E4jXdHunvEfZFggq
 GEH5zuDJPzA4zzIy3IWjHgC/q3bQjTBW6l+MkiUmtGAgiliiCYFpKryq1G7KMjbniS9lYA
 rXyaQnlgPGG+mP8bz/SHoEhVj7HL+ZBQOgk5V3yT1vVUdW7ZC6FpI8msrdtX2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QTPJBgla
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpgme: always use
 gpgrt-config from buildroot staging
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

On Sat,  2 Sep 2023 00:06:58 +0200
Julien Olivain <ju.o@free.fr> wrote:

> gpgme updated its gpg-error.m4 macro files to detect gpgrt-config at
> several occasions. Those changes are included since buildroot commit
> 13f3b8e124 "package/libgpgme: bump to version 1.20.0".
> 
> gpgrt-config path needs to be forced in _CONF_ENV to make sure it
> will work in all host environments. See the log entry of commit
> d7f2d8403e "package/gnupg2: fix build failure when host provides an
> old gpgrt-config" [2] for a complete explanation.
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=history;f=m4/gpg-error.m4;h=gpgme-1.20.0
> [2] https://git.buildroot.org/buildroot/commit/?id=d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libgpgme/libgpgme.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
