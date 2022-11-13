Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72093C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1247981431;
	Sun, 13 Nov 2022 21:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1247981431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Pjuo8gR8pCM; Sun, 13 Nov 2022 21:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 454798142D;
	Sun, 13 Nov 2022 21:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454798142D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE43D1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C1CA8142D
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C1CA8142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JLgWXXwthnB for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:13:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5091981428
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5091981428
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:13:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36E8EE0002;
 Sun, 13 Nov 2022 21:13:01 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:13:00 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221113221300.77901287@windsurf>
In-Reply-To: <20221112123432.1075333-1-yann.morin.1998@free.fr>
References: <20221112123432.1075333-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668373981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dx6W7WlsAvYKWX6aMzDVq3c1R9geerxh3CFOZwpSBo8=;
 b=BNtyeeBe6vWvxKOiN1Q+NnLxSKxNsS6VO+JvqHMSa0c5uPwtI4InzsmL+8EsyDUXEJ+Eph
 OzCcvUOP4zxoZ2dtYgaIY3ujTXGx0eGjqfISBiQLeJaMY3jIJeqSh7z2P40vz5k6QZN6Zr
 q9r6Y8gyWQ0xaguEpKHf5QBJCL6ZflMKEi3LyLGc6oK+PotgxbW967EyXJ0kDZ2AcPdEy1
 nIjhPJecRQWPT3/DmBoeP86LDAu2q9ZuGpIinS5UZj5R5XCkLexEVMe5P5gVguVn6QY2cl
 7aCq/+3Hbh9Ix6jBqGcuQd+mgytUwTj4ToHbVVH24oo4bAbuscblN5M05hBOFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BNtyeeBe
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: audit support needs
 libcap-ng
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Nov 2022 13:34:32 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since v14 in 2018, audit support has needed libcap-ng.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/43abdb85cc2f386d427cec1cfa876e20e3509cb8/
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>
> ---
>  package/dbus-broker/Config.in      | 1 +
>  package/dbus-broker/dbus-broker.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

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
