Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FD3D42BBF
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 20:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB21402EB;
	Tue, 12 Nov 2024 20:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jL8l9GY8Kgw8; Tue, 12 Nov 2024 20:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 405FF402EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 405FF402EF;
	Tue, 12 Nov 2024 20:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADDA8725
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F043402EE
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1vkSNMw84Ri for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 20:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72BA7402EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72BA7402EB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72BA7402EB
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:15:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 646BBFF802;
 Tue, 12 Nov 2024 20:15:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAxHx-00D1FH-2A;
 Tue, 12 Nov 2024 21:15:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,  tim609@andestech.com,
 ycliang@andestech.com,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240925072151.571744-1-peterlin@andestech.com>
 <20240925072151.571744-2-peterlin@andestech.com>
Date: Tue, 12 Nov 2024 21:15:01 +0100
In-Reply-To: <20240925072151.571744-2-peterlin@andestech.com> (Yu Chien Peter
 Lin via buildroot's message of "Wed, 25 Sep 2024 15:21:48 +0800")
Message-ID: <87ttcc8b0a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 1/4] package/andes-spi-burn: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yu" == Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> writes:

 > From: Yu-Chien Peter Lin <peterlin@andestech.com>
 > Add a new package for Andes AE350 SPI_burn tool to program
 > flash memory.

 > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
 > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

..

 > +	help
 > +	  Andes Technology SPI_burn tool to program bootloader and
 > +	  device-tree blob onto flash memory of AE350 platform.
 > +
 > +	  https://github.com/andestech/IntelJ3

NIT: Why did you chose such an odd git repo name for a spi_burn utility?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
