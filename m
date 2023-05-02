Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8827FC77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 09:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CED8A80BBC;
	Tue,  2 May 2023 09:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED8A80BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPqOFjylk7UV; Tue,  2 May 2023 09:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911E48207B;
	Tue,  2 May 2023 09:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911E48207B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 193101BF36B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 09:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6B564026F
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 09:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B564026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fraC3T-vfRX9 for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 09:18:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E525401A4
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E525401A4
 for <buildroot@buildroot.org>; Tue,  2 May 2023 09:18:23 +0000 (UTC)
Received: from pwmachine.localnet (unknown [213.94.16.214])
 by linux.microsoft.com (Postfix) with ESMTPSA id BD94321C3F1D;
 Tue,  2 May 2023 02:18:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BD94321C3F1D
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 May 2023 10:18:18 +0100
Message-ID: <2680134.mvXUDI8C0e@pwmachine>
In-Reply-To: <87edo0jyxt.fsf@dell.be.48ers.dk>
References: <20230428104403.10889-1-flaniel@linux.microsoft.com>
 <87edo0jyxt.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1683019101;
 bh=D7iYFclahpFV4jxbKAGEq8gsS1QNw9DUI8iajhhL4Ug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sEsXDTXvf+WYRpUBvf1/bMuFqz8oV1/e3iIKfZqvqdj7YuW4I74N2GNDMPhS/+lNr
 FkuNb4I6dy2vnR7zsxQ3Myes8nhlTJn6uQ9xERJR74q16AZXkGvoCPJoDZdaOKKY+Y
 BbBlAVAHZ32aai8X8A0bxZo6ZgtX6zbRNg2a975E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=sEsXDTXv
Subject: Re: [Buildroot] [PATCH 1/1] package/tbb: bump to version 2021.8.0.
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le lundi 1 mai 2023, 08:25:18 WEST Peter Korsgaard a =E9crit :
> >>>>> "Francis" =3D=3D Francis Laniel <flaniel@linux.microsoft.com> write=
s:
>  > - Remove upstream patches as they are no more needed.
>  > Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> =

> Committed, thanks.

Thank you for the merge!



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
