Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C3C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6812A40447;
	Tue, 23 Aug 2022 19:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6812A40447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jv07_l6THozM; Tue, 23 Aug 2022 19:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 892B140323;
	Tue, 23 Aug 2022 19:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 892B140323
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20B3A1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F098E60B15
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F098E60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p67HObZtIyr3 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:29:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D2B60B30
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8D2B60B30
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:29:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77BB0240004;
 Tue, 23 Aug 2022 19:29:18 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:29:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220823212917.79c0ba30@windsurf>
In-Reply-To: <20220822071102.3890085-1-james.hilliard1@gmail.com>
References: <20220822071102.3890085-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661282958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8klAGutz2kXqhgUf42hEfdvtIcWfudaTi1PyM/d8Rsg=;
 b=JuJoAOlMxoWDolIkIej59tyvAGMpB5tdfJZv3682P9WM2kY4nh7hen/XnbJeJqLgIISPUb
 I0U6Jamn80ZbnaozKCBPJgN1i7KqA/rUQ4Zsyxq8ubCLkLaDsa/fPZxtaeLkkSxuRDLlnW
 nWfQcTFcKc1+qAPkb5DLLopYnob/5jyuWXCxCIc/mhSVBbiCguj8X2PEYgg6MvwHMm8bkW
 KzTTgLQYesX6jLriDTYfPF+2ZwwNaTO0MDTrBRAgh3NjXwOYJXMLsUOQmWYzKyhVdisfDR
 jGOtaqWR6lk4y1m/d6563M5Uj/1fBi8lh75WV/2cyyIBG0UCh9P4bffGTjAOSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JuJoAOlM
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump
 to version 2.1.1
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

On Mon, 22 Aug 2022 01:11:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
>  .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
