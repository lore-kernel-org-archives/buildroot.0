Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF1FC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD3B1404DF;
	Sun, 12 Mar 2023 12:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD3B1404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uyi8a8AsQLkm; Sun, 12 Mar 2023 12:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D68940518;
	Sun, 12 Mar 2023 12:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D68940518
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB571BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3B9E60B65
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B9E60B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjOPgizfxiqt for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:30:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B5B60AAD
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79B5B60AAD
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:30:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8BF2A100005;
 Sun, 12 Mar 2023 12:30:53 +0000 (UTC)
Date: Sun, 12 Mar 2023 13:30:52 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312133052.68f7bf74@windsurf>
In-Reply-To: <20230306184050.7107-1-ju.o@free.fr>
References: <20230306184050.7107-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678624253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHttj7jkNLMK61+tF0fDNi8yVpT51OPaUI3HI4drzrU=;
 b=pCdGb2gMbjkaM1uUK+xnycmJdMw7NpXmtppKQfdn7FaaiC9ju4Jmzktcuxu9nSmM502O/n
 bRvQTYfbyN4A0gScg5txdfo/NY4aYe0/Tz6yDA2HPE3mJt591DKrD7NFqzG4EAbjaESKKd
 NgPJDFamfUj5s6R1RGiQAnRP1P1f08PdW9qBLV7KdPBCBKJ3hnCRYsrjqWeSQEx7Wfdle3
 MKDCPoXVz7yA9nvPykfyVhMiMqOuGC8fLROx6gSrXOUB2DdKA3f9Vw6OmwPI668G0Eub7S
 DPBMs95f+qTKMln1MtNSWoM5L9VTKcENOyh8F3oo4VxnvogiRfmMscyBJASV0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pCdGb2gM
Subject: Re: [Buildroot] [PATCH next 1/1] package/unrar: bump to version
 6.2.6
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

On Mon,  6 Mar 2023 19:40:50 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Uptream does not provide a change log.
> 
> The package now needs a C++11 compiler. For example, the source file
> "blake2s.hpp" is using the "constexpr" keyword.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a, with commands:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
