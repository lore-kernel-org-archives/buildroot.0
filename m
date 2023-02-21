Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F1C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4048B40FEB;
	Tue, 21 Feb 2023 14:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4048B40FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sK_s6a7jATzM; Tue, 21 Feb 2023 14:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8554E40FDC;
	Tue, 21 Feb 2023 14:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8554E40FDC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9854C1BF2F0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7275660FA2
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7275660FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRctji8NmnXs for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:49:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FDE660F5F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FDE660F5F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:49:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BAC0A240004;
 Tue, 21 Feb 2023 14:49:41 +0000 (UTC)
Date: Tue, 21 Feb 2023 15:49:40 +0100
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20230221154940.17aa2764@windsurf>
In-Reply-To: <1676986254-52744-1-git-send-email-gwenj@trabucayre.com>
References: <1676986254-52744-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676990982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nchVOVQt4NkohcTIhLjWJl3hK1c/ab0jflu4EJDecXM=;
 b=RMXALjtBOyp3qnF+M4NNcgCitgF9NNdxwe9O7pfyWfaCBz1Mqqpzrzm+08fHgT5dEPK79z
 TmHFshC+KHxXCmSrcmXQY0k8Ldp1YcTOiWhnSLSe43A92DTkEjTTsQgtXq1B47TC4mB4JQ
 vv43CBOGSigfxqlxZQqEVRiTVwrEJ2UNfa1QMkU4OR1KV0h26W3T+2ipnV/Wyq2sB6bz3A
 SvCi6FPb1ab5EdnUOHYcAAj5DDgIBR28SOomtdHPShKy7A7FPVgjaOT2dBRTjpWOebZPzX
 pcG9EgcNJgYIhAxTZIqqFtgs/K5OWOupJSuf0QUEtTQlLCM6Lzx8xurov5JLPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RMXALjtB
Subject: Re: [Buildroot] [PATCH] package/volk: bump version to 3.0.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 14:30:54 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Remove GPL-3.0+ license, no more COPYING-LGPL: merged into COPYING

Do you have some source information on the removal of GPL-3.0+ ?

>  # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
>  # details on the licensing.

Is this comment still up to date? Probably not based on the URL of the
link :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
