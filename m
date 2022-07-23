Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC6B61B11;
	Sat, 23 Jul 2022 19:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC6B61B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUk7LxlA-5tC; Sat, 23 Jul 2022 19:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B66560FB4;
	Sat, 23 Jul 2022 19:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B66560FB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 019531BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE74284C29
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE74284C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2gxqI6hArrk for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:16:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0DAC84C25
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0DAC84C25
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:16:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B223A20003;
 Sat, 23 Jul 2022 19:16:42 +0000 (UTC)
Date: Sat, 23 Jul 2022 21:16:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220723211641.6e58c245@windsurf>
In-Reply-To: <20220615231730.2900335-1-james.hilliard1@gmail.com>
References: <20220615231730.2900335-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658603802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzjIPJfdewwsmYiM0xOfd7wDm1JFeMs8TDVLVExfeyo=;
 b=FWIpSaXrOeSrCa6yjWivAssNyMzae3MNkxPgNfKZYGznfnqq/k5yZWFTSUMfZbJvzmtPjR
 kVDa+wv3kYgP2CxnVqLJu4qZVa6W9SWb7LTybE58fjcjgLEOla8LZ4ERste02tQ0oauElB
 BYia7z+OBhxv2+39ZlkcfhLl/mz5KrNPmUc86Pbh+K1zyuAVURZLgmaxp1npOfGsn8lBcu
 OM6cz09AajNX/KopXHD8kE9qIrQll3ki1tCK/wcFvMAEKRAIIY1zGc0gNWdPQLG5CbVBFR
 e6wZwZxVCmpz8JmagepSWqwCFAcqomkzXWG0e7qHbkjpcZ9ObhGd+CcfBtLXaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FWIpSaXr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pyrsistent: new package
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

On Wed, 15 Jun 2022 17:17:29 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                                |  1 +
>  package/python-pyrsistent/Config.in              |  6 ++++++
>  package/python-pyrsistent/python-pyrsistent.hash |  5 +++++
>  package/python-pyrsistent/python-pyrsistent.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-pyrsistent/Config.in
>  create mode 100644 package/python-pyrsistent/python-pyrsistent.hash
>  create mode 100644 package/python-pyrsistent/python-pyrsistent.mk

Thanks but about a month before, Yegor had submitted the same patch,
which I have now applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
