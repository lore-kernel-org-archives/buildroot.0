Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38754C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2DD643737;
	Fri,  5 Jan 2024 12:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2DD643737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EAfY5M7q9Cx; Fri,  5 Jan 2024 12:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CEE34372B;
	Fri,  5 Jan 2024 12:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CEE34372B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 955F91BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE2682146
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE2682146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwYRxOijvKAU for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:54:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50C1E821DA
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C1E821DA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FF492000D;
 Fri,  5 Jan 2024 12:54:28 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:53:48 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240105135348.6627bb29@windsurf>
In-Reply-To: <20240102224108.2515943-1-fontaine.fabrice@gmail.com>
References: <20240102224108.2515943-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704459268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDmla2pxeZHtCZP0bKjsK5kZS7QXwCoc3fmfUmb3NuQ=;
 b=FpFNfd3svH1fFgkhiWNumU05NCdkAEU2+1BtSXNks6hMI8L5vlbNwEV7IgYzksHNs/dNuy
 UP47rg9jjsKl7oOX40B/czPHcBv2HFYPv42Qsog5I7bhiR/EySOIuScWEVbRZdPYNhFYtM
 pIUAHCBvVFStz3lM/bqfpam+WzUvNB5oImMOvxA09uyRF43xWT8P/DxrExc/j058jDu1oR
 DR2G5KS8E6lAPGsTr5h1v0g4N+xfI8cvomTPrM3FM1MxQH4wtTJ1MNDfXP7cEhg4J56rpm
 6zn7aeG2jfQsfDUMLRjd5ETOF8mno2bQsHWcJw9oJKOonFjHOu9bUNHJtlzd2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FpFNfd3s
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: drop autoreconf
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 23:41:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 1718c2ba6a4db1461b2490aa42ca4f0a2112adae removed all patches but
> forgot to drop autoreconf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/postgis/postgis.mk | 2 --
>  1 file changed, 2 deletions(-)

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
