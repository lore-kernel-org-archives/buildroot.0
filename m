Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47262D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BCA80AD0;
	Sat, 26 Oct 2024 11:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrjsySsSIwJy; Sat, 26 Oct 2024 11:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 287AB80E36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 287AB80E36;
	Sat, 26 Oct 2024 11:52:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AE1E5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C4364027E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1R_8k2p9gUkw for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC1394029E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1394029E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC1394029E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:51:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61466FF802;
 Sat, 26 Oct 2024 11:51:54 +0000 (UTC)
Date: Sat, 26 Oct 2024 13:51:54 +0200
To: Cody Green <cody@londelec.com>
Cc: buildroot@buildroot.org
Message-ID: <20241026135154.6aef53e2@windsurf>
In-Reply-To: <CAFQdmxL-C6cxpEaOJmfWzxB80W2deVsiu5mJ9J-rgHZO9zVnTQ@mail.gmail.com>
References: <CAFQdmxKcoojruP+5Cebkm_oqCzBx657NddiTJ+nJi_u0AChJzA@mail.gmail.com>
 <CAFQdmxJ-p8TV4wK=TJxUb0D8hGscODzXApgZviemrQiUEf+y1w@mail.gmail.com>
 <CAFQdmxL-C6cxpEaOJmfWzxB80W2deVsiu5mJ9J-rgHZO9zVnTQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729943515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D104pMQQL1CJIV4CeV/rg21xAydyh0OJKPjM6bzza0E=;
 b=eB3mITPKW/ZAOwuMdWhf4Pi3VWlKfIcEsH5LthDoEMFN7inVvPboQur3072wmKaOdTZdXf
 +ANxBu2P3zQgiV+yTvPmP8y7L9sW7KRKR8t1X2/wPz7FKekwFIpfKq7WtXv1YHXGfXGmfY
 fFKAoYjJjGoI/qMNLXFOMxj56ZmrcFA4SFv6FTTZyLYWREFwJ88RtEKFFSxg9WSfgGD4JZ
 jnOXQb4HGIPH2VEOoBfJ7sAsCC7nspcX2KaZSnFMUmXPmgM0DWkq4Pdpmi/9rdsC+keHyp
 DpiCCGjX9+FXFPazdUEy36aYsGiccVNJb8+x0rYqFUwxtyOkvFXOSJpHqeXHZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eB3mITPK
Subject: Re: [Buildroot] [PATCH] package/sysvinit: add version number to
 SYSVINIT_MAKE_OPTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 5 Oct 2024 15:15:39 +0100
Cody Green <cody@londelec.com> wrote:

> Version environment variable VERSION=$(VERSION) is set in the top level
> Makefile of the sysvinit:
> $(MAKE) VERSION=$(VERSION) -C src $@
> 
> Build command SYSVINIT_BUILD_CMDS doesn't use the top level Makefile, but
> src/Makefile instead without setting the VERSION variable, which leads to
> undefined VERSION macro in src/init.c.
> 
> Add VERSION=$(SYSVINIT_VERSION) to SYSVINIT_MAKE_OPTS to make the VERSION
> environment variable available in the src/Makefile.
> 
> Signed-off-by: Cody Green <cody@londelec.com>
> ---
>  package/sysvinit/sysvinit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
