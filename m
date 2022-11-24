Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38341C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF368224F;
	Thu, 24 Nov 2022 21:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF368224F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNOUs8gO_xHc; Thu, 24 Nov 2022 21:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D6C82247;
	Thu, 24 Nov 2022 21:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D6C82247
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4A5E1BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F06841C50
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F06841C50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVHn0KXIMGH5 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:52:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6A441C36
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E6A441C36
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:52:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45D44240003;
 Thu, 24 Nov 2022 21:52:24 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:52:23 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221124225223.7d5143d9@windsurf>
In-Reply-To: <20221118170641.46913-1-bernd.kuhls@t-online.de>
References: <20221118170641.46913-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669326744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7RzNy8RHNZZLc1pluoWjZMVJTjmiS2zFMl6XLL5R4gI=;
 b=iarns2dbKGP24XtKZmxXOSRhs9vI+5CeErkHpr+S/JkNx3IFA0Ad1lG5bS6dneQGmpSwUj
 62wvPZGWbddwIisc7le12MGrs81maYR7gaUI5Y1JvPKHVHjEy7J0jicQEs6PqZp4TJRWkB
 msQcOFtlCxXBrOVunh1BzV2KqLNwOr32IgoVTlv76jzNeRDP5nOoaNrzdbeDRcqB2jYU/a
 1EJ0RvajT7XdblfB8TkkFJGUcvnKQIf5pLBWVuyTgHwlC9bGMe7kKBrOIPGhB4kN5OMZlg
 SZelPAq/ilwPhmrfTQlQFIIV6hxLtYyL3iOyFVKyFllCyplO+32O4z/88vAH7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iarns2db
Subject: Re: [Buildroot] [PATCH/next 1/2] package/intel-mediasdk: bump
 version to 22.6.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 18 Nov 2022 18:06:40 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-mediasdk/intel-mediasdk.hash | 2 +-
>  package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
