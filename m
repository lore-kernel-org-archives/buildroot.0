Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD9EC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40AC4371C;
	Wed, 20 Dec 2023 20:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B40AC4371C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbAvIZUBkkLM; Wed, 20 Dec 2023 20:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6C8843700;
	Wed, 20 Dec 2023 20:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6C8843700
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA9A61BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3A4861566
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A4861566
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAEuzp0X9JZ0 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:55:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C0E961546
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C0E961546
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9803E0002;
 Wed, 20 Dec 2023 20:55:52 +0000 (UTC)
Date: Wed, 20 Dec 2023 21:55:51 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231220215551.3567781a@windsurf>
In-Reply-To: <20231125062409.708253-2-james.hilliard1@gmail.com>
References: <20231125062409.708253-1-james.hilliard1@gmail.com>
 <20231125062409.708253-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703105752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G14TTb8mGKx8ytkXWwghjAGo+7VHAVzmfTBTY9zxGRo=;
 b=lyxgDT89CTKzM58WF6g1aYblGquT9onXELsu4kDjQjpjwLCH3p2eP74qMTUyjhAgsWdqmq
 k6pP0VsFEWMOs6L572SR/l487tVLwpBKCmdqO5ddZdTf0IgJp5qEopkxLTwefN16pEELhX
 Y1pCpf/Y7bkUVC/izx1cVfWjgcN7qRq1rpyx9uolNymKYUnL4TRGo/E1wOgvvec1J1JAH0
 Q/5OHTSMhXy2z3oDgeBR7XpkuZsHq0xvTZEukoxGw6k2IgcdRxqLRuelaRk2WsZFkoy/uB
 pb3fKhYG2h0cMACWTdTgf2eQm4YDPSF6adai89IdGQFIU7f1H7OgG+PhLvCi0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lyxgDT89
Subject: Re: [Buildroot] [PATCH 2/2] package/python-pudb: bump to version
 2023.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Nov 2023 23:24:09 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new python-urwid-readline runtime dependency.
> 
> Add new python-packaging runtime dependency.
> 
> Remove no longer required python-setuptools runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pudb/Config.in        | 3 ++-
>  package/python-pudb/python-pudb.hash | 4 ++--
>  package/python-pudb/python-pudb.mk   | 4 ++--
>  3 files changed, 6 insertions(+), 5 deletions(-)

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
