Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9DCC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A164092D;
	Tue,  7 Feb 2023 10:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50A164092D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDkgXo5GorxX; Tue,  7 Feb 2023 10:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A4F741748;
	Tue,  7 Feb 2023 10:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A4F741748
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23C781BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF7841296
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF7841296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb9mpSLgEeV8 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4104E4092C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4104E4092C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:40:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A24E810000F;
 Tue,  7 Feb 2023 10:40:07 +0000 (UTC)
Date: Tue, 7 Feb 2023 11:40:06 +0100
To: Jordan Speicher <jordan@jspeicher.com>
Message-ID: <20230207114006.3005f244@windsurf>
In-Reply-To: <20230207100216.889464-1-jordan@jspeicher.com>
References: <20230207100216.889464-1-jordan@jspeicher.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675766408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4J2d+qe8EgAW/aIaOX6BYQ2Kd8vQ/23r0ua6o7LSmiU=;
 b=mjijKwB/0x/Wv3ooABfI7zrDlMoO8jIhYvutUbjs3gLu3FSwW5wIcDkCkh0R1zhHmmaR7g
 eSga2F6z/MZEfOTVPFun+Is1PqtKGDD0Yk9DIKU0JnVekjZw+VsxB2uF+PoD0D06e3oEdf
 oJAlWWWIdPADkuQ4JCCiv5mHkYsXeW8rs9fp5J/bB+EvyKw4mx3K5BSFBHxS1fnWR+4HLW
 NKrNTa3yKi4rL02QDPoWICh2z1iEKggv8YQjmhtkcBzN5P07JHxKbb/08+73XQ0xerzNn6
 tSUjgThUuF/CN4LskXJ5XBJJa/alJUMOH25kFyMDSTMc10benGYXw/ZtR34FKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mjijKwB/
Subject: Re: [Buildroot] [PATCH] package/mcelog: bump to version 191
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 11:02:15 +0100
Jordan Speicher <jordan@jspeicher.com> wrote:

> Create .os_version to specify the version since there is no git
> checkout available.
> 
> https://github.com/andikleen/mcelog/releases/tag/v191
> https://github.com/andikleen/mcelog/releases/tag/v190
> 
> Signed-off-by: Jordan Speicher <jordan@jspeicher.com>
> ---
>  package/mcelog/mcelog.hash | 2 +-
>  package/mcelog/mcelog.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
