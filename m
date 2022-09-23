Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE9ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2C141A62;
	Fri, 23 Sep 2022 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2C141A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9XJf6XBezqD; Fri, 23 Sep 2022 12:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BA341B32;
	Fri, 23 Sep 2022 12:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13BA341B32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 781BF1BF349
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D4960B22
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D4960B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11hn6lYluZX1 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:19:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0884960AC0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0884960AC0
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:19:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9A42240004;
 Fri, 23 Sep 2022 12:19:30 +0000 (UTC)
Date: Fri, 23 Sep 2022 14:19:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220923141929.0e1cc005@windsurf>
In-Reply-To: <20220922201621.11592-1-james.hilliard1@gmail.com>
References: <20220922201621.11592-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663935571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piDX+8+SUxkCkrlIlyU7K7AsD9GxeVYx3VVZMlOXhok=;
 b=JRFyDrVZUeDuAZeup1LSWTWPE0JhHWcJ2cYm/PR1VZ36xXCRhO/T+BzOksWVAFVYmRm7lh
 uoPPeoNkat2CmckQO/Kp/FXPcF8lKYcgvGRrjkTa5kAxjC1XXwo+ro1aYyCkSAsLYcUVBE
 t/8Rq+gMDn4RiJd75JPADGKfAZ7DmFRujVvmWZhLZ+y1oeh4jXQ3UbwgnDSEJkCAe5/aSv
 jVAMKUbakICx9VNCEGuX8RauEbQL3mOLKzBZSzZKBfmqa2vc7flBDAcq0TJMlDpTnAXDdn
 gmeTQIFC61pcDqwYB5Gpno/zX7qs+NBBiBB0gIB+Jq9LPpnNO/fiViL6biiVpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JRFyDrVZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.8.3
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Sep 2022 14:16:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash change due to year update:
> https://github.com/aio-libs/aiohttp/commit/afe2280fd3520c914b35bfe52a7118017344966b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohttp/python-aiohttp.hash | 6 +++---
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
