Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A954C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC77460BF4;
	Mon,  7 Nov 2022 22:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC77460BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6x4oMMrR3G1h; Mon,  7 Nov 2022 22:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3658060BE7;
	Mon,  7 Nov 2022 22:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3658060BE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5B431BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F5D341496
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5D341496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLoyPzgIS8Ji for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:17:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C10F410C5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C10F410C5
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:17:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 795EB240005;
 Mon,  7 Nov 2022 22:17:20 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:17:19 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221107231719.6609e0d9@windsurf>
In-Reply-To: <20221106160651.316930-1-james.hilliard1@gmail.com>
References: <20221106160651.316930-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPap2KH/485Uw2q2+Sly4k9GOui8vnuTTybEPtUbucc=;
 b=hjNlrHJwQu4sQVRo5IJLCev6nDiAFsC/r6hnWcNfoHjcMdNKAOOcB3LdMgCIB+I1Ze0aQ/
 J48U7TceVBGx+HxMqnYWzhtUkboUjyvck+11BoT/XKQedtz3849CClEFvVUHAH/7snWsSQ
 X6d1cPeAe6vu4hqA8es2Jqb0A3v/RT4GfVYjnqjjhBmk2qTeEc2zygu/PhtwO0jBF6hgLh
 BnWg0kgzErkhLKM3nMJLDDIbS9Phrl5UJ0oUwHkiGnMJnduh+mo4YHv+r1dKZT/AnMJrj5
 FSO5yfeRgWitch+YRRRcJwy4/5t5tEsm2jmJE3VavcbC1/jzJzOVMchgMdf+eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hjNlrHJw
Subject: Re: [Buildroot] [PATCH 1/1] package/python-unittest-xml-reporting:
 bump to version 3.2.0
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

On Sun,  6 Nov 2022 09:06:51 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer needed missing license file workaround:
> https://github.com/xmlrunner/unittest-xml-reporting/commit/c43427611390fba83ca13fbb5311bd8fece5048f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-unittest-xml-reporting.hash              |  6 +++---
>  .../python-unittest-xml-reporting.mk                | 13 ++-----------
>  2 files changed, 5 insertions(+), 14 deletions(-)

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
