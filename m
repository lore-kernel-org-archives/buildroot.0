Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA55C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2C560E84;
	Sun,  6 Aug 2023 21:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2C560E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FT02YPIru0sU; Sun,  6 Aug 2023 21:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F5E260F7D;
	Sun,  6 Aug 2023 21:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F5E260F7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD2D1BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE48B40139
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE48B40139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aa-9hg0gUIGI for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:56:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A88DE400C5
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A88DE400C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 511B21C0002;
 Sun,  6 Aug 2023 21:56:41 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:56:40 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230806235640.12d31cde@windsurf>
In-Reply-To: <20230806213742.4097588-1-james.hilliard1@gmail.com>
References: <20230806213742.4097588-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691359001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhxGCxRxbCRy9qIZI/LxU9jgkbXZvs48YX45EFj8tfc=;
 b=gD9emxMhuDTgAbfmD14D2v0Z3Gin5ggxN1Vg8ZCd/r54/avYQQB0PNgEZCJOcNI9H7zUjw
 h8lg47su4qP9R9WzvpI/8C/WAn0sP7zkK5Kab8umHExKB5oJyngRgPDNvC6qGF+lg05Kz4
 bymkb934yG9+N14YflZW5Fdbi98MdB0UtYDGV/NNKw+sBgkfQ4LgkApMLA/+uFfkUN1arm
 5HfTINP+hggTt8K5UhwNXbBnqdNf2gurPDfKKHJ++GBqo3/CM4d+Zm/jr6PZzni2lBAQuj
 q0ULYwZ1fytYXW/t1ptEXa14e8+6pH7ZdRreIJnS6iw4yBHTOh/I1seY8gOROA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gD9emxMh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.31.20
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Aug 2023 15:37:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-botocore/python-botocore.hash | 4 ++--
>  package/python-botocore/python-botocore.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Could you please respin with some details of what it is fixing, in
relation to which commit, etc.

Normally version bumps are now only applied to next, but as this is
fixing some issue, it needs to go with master. But how can I guess if
your commit log is so terse?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
