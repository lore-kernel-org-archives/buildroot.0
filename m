Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB93FC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3986B409E3;
	Tue, 22 Nov 2022 22:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3986B409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hl6cN0xHvgLj; Tue, 22 Nov 2022 22:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A21E40A07;
	Tue, 22 Nov 2022 22:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A21E40A07
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5166B1BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D2978132D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D2978132D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8I5GWkO6JA6r for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:29:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101AB81EF1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 101AB81EF1
 for <buildroot@busybox.net>; Tue, 22 Nov 2022 22:29:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6F791BF207;
 Tue, 22 Nov 2022 22:29:02 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:29:02 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221122232902.5371d005@windsurf>
In-Reply-To: <20221109083440.1254693-1-francois.perrad@gadz.org>
References: <20221109083440.1254693-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFJ/zN07uPwP8IZRySOLoG0CggiiIzgNg6h25icMaQM=;
 b=or3leVPGrVUZruQyAlvm0/Rgze1UPAuL2e/UbfHr78ouM2xD/tOV9PoR3+ud5mYDVf0Gpz
 Fj3iLF2smk3ScbcCIgD66kZJCEpohQb/WkD+V3gMvGHQvNKNVJ2rqHnNJYm6IbBb2yPuMm
 pMUXxocvOWyKPH5V2yJYIag0MNjgVgUKXbHgsgLZZ2/EJeIF/bI5eBimwZa8SCCk7zB3Ul
 J+/jMWkB6VVBwvherrxwEN5wYbsBHCosHULpNYAWnMJWT8dyBElbyhF7A80bfqF6OiF+Sz
 ezBzMVA8qZ+TMUuRuIsyVVMSwLHXU3tVJAV6rXyfADsblX9keACRNcb9js0X+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=or3leVPG
Subject: Re: [Buildroot] [PATCH] package/lua-mqtt: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Nov 2022 09:34:40 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |  1 +
>  package/lua-mqtt/Config.in     | 11 +++++++++++
>  package/lua-mqtt/lua-mqtt.hash |  3 +++
>  package/lua-mqtt/lua-mqtt.mk   | 11 +++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/lua-mqtt/Config.in
>  create mode 100644 package/lua-mqtt/lua-mqtt.hash
>  create mode 100644 package/lua-mqtt/lua-mqtt.mk

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
