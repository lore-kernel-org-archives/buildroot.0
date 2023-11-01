Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D72C4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF158431B0;
	Wed,  1 Nov 2023 16:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF158431B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lm5AXE76ZY2M; Wed,  1 Nov 2023 16:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6686431AB;
	Wed,  1 Nov 2023 16:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6686431AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BAAA1BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5959D431AB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5959D431AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpQllNsLOuYs for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:30:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56AE840180
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56AE840180
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3911F60002;
 Wed,  1 Nov 2023 16:30:37 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:30:36 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231101173036.192ae048@windsurf>
In-Reply-To: <20231010121909.1476603-1-giulio.benetti@benettiengineering.com>
References: <20231010121909.1476603-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698856237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fFkZiLUvf7NI963dOC0KgbPtr1lI9VgNQh2zlcLYdY=;
 b=hFerkjep8Sl2qxhA4ejrH2VAKT8zV4BTQ3htTQIBDtXw7tHyBp3p6s7C0K3XsvixpUzMql
 qjwQCLs3JEBEnGzmr+87WfcV6Ilb+ZbDSe1DCzxI04056D6GGQxmAe6QL8B8F2EpYMDLB3
 JnQl9sAv94ndBJg7+3ob/zQCdILmOPJD0rUnibjYscgiJpm4PmwvkNorEt3g4Zg6Mh9/Bo
 kOFyyEoyC29wg8azbuQYtXhiGuHSZzBXv4Ee6xryA4BN5ioGezc6RUmL9YYcG/Wf9aSIAW
 cOaXjdYzUl6iZOtIdQXzvsFtU+aEzZReNaFl0+YbPkVPjRNtBti5HhKB45SP9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hFerkjep
Subject: Re: [Buildroot] [PATCH] package/libfuse3: bump to version 3.16.2
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

On Tue, 10 Oct 2023 14:19:09 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libfuse3/libfuse3.hash | 2 +-
>  package/libfuse3/libfuse3.mk   | 2 +-
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
