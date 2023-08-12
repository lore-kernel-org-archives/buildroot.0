Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40965C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECA6D40556;
	Sat, 12 Aug 2023 19:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA6D40556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdbYhpjroFUl; Sat, 12 Aug 2023 19:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D3314051D;
	Sat, 12 Aug 2023 19:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D3314051D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA341BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34CC64052A
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34CC64052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IuVvlQTPL9T9 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:55:15 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44EB44018B
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44EB44018B
Received: by mail.gandi.net (Postfix) with ESMTPSA id A859EE0002;
 Sat, 12 Aug 2023 19:55:11 +0000 (UTC)
Date: Sat, 12 Aug 2023 21:55:10 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812215510.602a4c92@windsurf>
In-Reply-To: <ZNehEzTstrXcE4bf@waldemar-brodkorb.de>
References: <ZNehEzTstrXcE4bf@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691870112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6yYDtoa8hFhRc5FNUhqJYleA6txoTovBGHpivN1QbIQ=;
 b=K2WUlqAw11Im66GETuHejd3HgXZkqdyvwZ1gYKB2AcMLC/gDZ79hGfDecxPixQTGbsvC13
 NfVeIjwMiMhtybLiYnqp0l296OpMPt9CIRZrK5I/yEG0zTFE6HmVLFHXjpsM9litx0B9Oa
 46PZFClr/y9/xQVPoXD1YQB27CTBqrmbpQQl0Aez8Ma3qfTD2YQXYCbVSR+pRyXoAhMA0t
 taSm4I3ZKgsnOLWmRIT63UILjX7mulKTEptDErWuOgQPQikRmoqpwE+gIUKTi+PolRB/UM
 G7F5OyWp2Rxn8HXm/zedyk2dLC4Z79ZhklhJuzrsuXV5JKWGgCkvLUtoxm5kLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K2WUlqAw
Subject: Re: [Buildroot] [PATCH] configs/qemu_or1k_defconfig: enable ethernet
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Aug 2023 17:11:15 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The issue seems to be fixed. I checked qemu and linux git repositories
> but can not find any information when this is starting to work.
> 
> System gets successfully an IP, no further testing was done.
> Tested with Qemu 8.0.3 and Linux 6.1.x.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/or1k/readme.txt  | 2 --
>  configs/qemu_or1k_defconfig | 3 +++
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
