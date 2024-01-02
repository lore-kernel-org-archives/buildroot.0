Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59898C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05CDC40948;
	Tue,  2 Jan 2024 20:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05CDC40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nANaJm29IoXR; Tue,  2 Jan 2024 20:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF6D40A62;
	Tue,  2 Jan 2024 20:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF6D40A62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38CA41BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11CDB81DE1
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CDB81DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vbngz6S7XAG for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:18:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2061B81AD7
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2061B81AD7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68AE4FF805;
 Tue,  2 Jan 2024 20:18:16 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:18:15 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102211815.163cb443@windsurf>
In-Reply-To: <20240102140526.1303849-1-fontaine.fabrice@gmail.com>
References: <20240102140526.1303849-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704226696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOXKS4L/6d3NrOEvffSLyJdB6p7HfoYXv5R297phv0Y=;
 b=gaemSQPZkK5+W/XogHM70k8zQcTnXItLODnzWIHCFy5onFf7lqS7k01j2nbsVEDDrM/cGs
 z2r/Xcnh9XXaNyri+t5bVROXm3LRtmEhXYIKD0RJXzZBOSwyIz4xQ1+c19sCKwZkHRUpOb
 yFtA3Ji2JcyTtZidLQKKS3QUcjLym8czQuaDMP+v8FvXTruGYvL/Fd4L2PPj9TFGVMUk9x
 YVPmtsthfeYMMj9j5sYppweGXVZbj9Tpi7okbhja+tf0hmrHPOLdhQ9yar8tIP3F0q1Ptn
 WE64JBOFe0LLK4JFPmOlJ5FVIOk3+P4UYj9oMSULAy6WQvtjQnjuW3w1an4BJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gaemSQPZ
Subject: Re: [Buildroot] [PATCH 1/1] package/gli: bump to latest commit
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

On Tue,  2 Jan 2024 15:05:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of manual.md (update in year:
>   https://github.com/g-truc/gli/commit/53106f0b8a3adc4fc6417024c1c90de69753361f)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  .../gli/0001-Optional-building-tests.patch    | 45 -------------------
>  package/gli/gli.hash                          |  4 +-
>  package/gli/gli.mk                            |  2 +-
>  4 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/gli/0001-Optional-building-tests.patch

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
