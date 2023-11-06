Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DCBC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C82140457;
	Mon,  6 Nov 2023 21:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C82140457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qoqs2XE0QMh3; Mon,  6 Nov 2023 21:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7251C4032E;
	Mon,  6 Nov 2023 21:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7251C4032E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4661BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DEC82A0E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DEC82A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BUPxGFnN8-b4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:38:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE10D820B1
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE10D820B1
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA41D60008;
 Mon,  6 Nov 2023 21:38:09 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:38:09 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20231106223809.2bc20415@windsurf>
In-Reply-To: <20231105092654.33598-3-bagasdotme@gmail.com>
References: <20231105092654.33598-3-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699306690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEP5Te7IozPfba4VG575fMm1G7KoDLMutLWdyYmRjPU=;
 b=c+W55njXxnel7lTkC0ail+ya2alsdxZPAui7huIDNvGCBHnDGWoA5f4z8BXShkK+ZnpX6u
 Y14RY2FOhs6M/f35DTJy95b4LtvYu2sJ6WDG81+7DmzgYZMt/oN5aJfvbHLYQl5WYzXHq7
 Aw3oltqWtkRnCFwgzT1FOdhUKWYLUcfeu4pw5ojG9Wz5FNtY0Eq1v8Qb9WBU4og+l4kzMr
 9fpfGKMk73Fh9TILc5QKKNDnQQeY40z/2oQn91uOmUMIlhqXQpJBVOdVYwMwZn0qfw2/0n
 Zb2uApxYxWPks2nHEmSphzx9WA72T1KHGB5lIPHQ7BJ/JqtYzTe+tuJ1CR6a9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c+W55njX
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.42.1
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 16:26:55 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Bug fix release bump. For the full release notes, see [1].
> 
> Link: https://lore.kernel.org/git/xmqq4ji4m50l.fsf@gitster.g/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
