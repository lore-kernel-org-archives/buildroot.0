Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02661C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3273404A9;
	Tue,  6 Feb 2024 10:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3273404A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piGxoCyyTXYC; Tue,  6 Feb 2024 10:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0661641DAC;
	Tue,  6 Feb 2024 10:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0661641DAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3211D1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09294403CA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09294403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTLHuQIEq7I7 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE9DE400FE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9DE400FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 434BE60005;
 Tue,  6 Feb 2024 10:35:32 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113531.5d2aae93@windsurf>
In-Reply-To: <20240109075433.4054341-1-james.hilliard1@gmail.com>
References: <20240109075433.4054341-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XEHfpmyWW4pCVCFpPe3Mv3wfzbHylCIApMTzz3AXEM=;
 b=WbckGrZE7u7cKl8Uo9Rvqkrw0RKcOKknFRYbk0ekntyHieO+KT3rX++Z0jb4W+JeqOgIK3
 wXKqdQl+cTk9eD3bNK84APnVbHd6bP0QUp1JFWE2P3iUrxRP+6rHIcxlFdDqH3L1bHBsGD
 f+I6QLEBVCKbqZynLO7jkrGcAROVqE0lIHX31pWNVg8FMdRirVJNol/yOR5eQIqLCWx/Ob
 iO8X5RqYTFxm2GUoeaBOCXM+515oKpPGWK7ityWlUoIIg6snfcExU5nm91Gdd42dB7c5WE
 2X9ioNaZ8nnQoxnDbA2T7AkTJMbOv+tqia5vnkYalWFIH0pjZ7KSJtuLuFZ3aQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WbckGrZE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to
 version 2.26.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 00:54:33 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-google-auth/python-google-auth.hash | 4 ++--
>  package/python-google-auth/python-google-auth.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
