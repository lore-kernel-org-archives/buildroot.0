Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70584CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C826D60659;
	Fri,  2 Oct 2026 19:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0lAQ8vnsHNu; Fri,  2 Oct 2026 19:38:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5FEA56065E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969923;
	b=OH7bsRat4p7mp5UKyT23F3Jnsc+5sT4i6UN0MXN9M9Ng3iooHZcbgHNqsjo7JrVDGPlw
	 qWiyhCkruayp3HLVLj4xvKUonOC00yL+qiTINg4KLixW4SlPPqTJmG79w0Yo9bkwodLP4
	 8vstJz+FCQgh8hErl5iMojUCI50LAPQlMhqxU8WCTOVilqL1yfbshE2JKGOyMi3Lvn6kW
	 /lYHLbJxnurjElqZ2cZt6iAAOe02hWtitN5wzfbU5REnOI/75c2Vc3EI9DKrobrk3plEW
	 FeB4dpETIupVI+7PYi6Pb4P+ntQFyEU+Tx6KJuLpSJoFNm+ni8aBQOodbdFlueareYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lFBIhy/KmQCPR28hkyWWBZLE0zhLZtQXdjAD1yHDrq4=;
	b=nURlxZPkeQySC/OKxgMNEcFrcEhX9Aebp+67HK6HsXB9W3i0UlnOTsDNjg2PXlx8ZhSe
	 gq/aKC6F6bSWWbPynciUhCtRqknZyB+2b2ePwaTLKHd5HAh6GSrbgDYmW1D7Ikviihv02
	 yfDzCw4koV+C9cU0arpi5EH5E0gVR8fS9HSFl+Mn9+LHCRtsRc/mDoYptRFbOZLAEOtYD
	 Wkx7xvg52VKSp+znoKzBcPhRkWo1UqMabHhWDgicV/yLcK+IUhxz6hRcQhtLIcP3stHsy
	 yyfn0ZrRpuwk+06lPiQYfgM81Ys3X1nHetVSC66iUTMqc0EIvdIuT5b69NilhxtW2ig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969923;
	bh=lFBIhy/KmQCPR28hkyWWBZLE0zhLZtQXdjAD1yHDrq4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nfnwbQ3IUomql6J4qmb21l7khsGV/i/a5xngd0vQdRW5nvnF3E3GsDbOlYaHcN7ci
	 Papk2St9DYS7msnCz6HAk84/YKoCebF9VGCSpVo38TxRJvCtqcc2mRP9FwGlEyrBhv
	 L0W3r/1z7LSNeT7O9FxVSNSntuaY47N4VUQ1qRlkbpNzFszMIyy79srnArFVuOWeTE
	 swQFVHrqyI2Mekrrgtzk2yL+PaCVxdwEb7RiTjd4cl1iKz9bHc1agJin5LbA/jhfQq
	 D7LZ3ax7WbPqFTBIdSWEmoBa6fKFpvb8UHRm98452/ZcdPga8tUXws+eEImxFO4GhZ
	 vQdowgwrYNhDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FEA56065E;
	Fri,  2 Oct 2026 19:38:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71592282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 627F840B6E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6G8-MFImdTe for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:38:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8E6C740B5C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969920;
 b=o26Q9yHjKTaUVYmwiNpzsV41Cd1mKX+Mw8ELIQtWBdDDpfEmGyAURYAyfH7InUpvVHnJ
 1Y1sbx3kuadr+dTH7gh3wyv+ErY+g1wKpHHy/B+4oZiwZxqjmuJeO8zaE9uqv+NJWsLJi
 YLNxZMsWrP5I2+lZ+lanFXZfSazWRwRXpPXSJ0tAbwQ4yzvqdyESMzwGeh64trtL2Njoi
 LS0dPDLdbvOTJzbxRtr3wK+DD7/PI4zQPj0JQ7MGvjeM0B/HdVSEDbyKSOpYntm8oMO3F
 Fh9PHT9bJE0+nN5gFzaiXGNbUxW7sQeHeo1cpm47Y+wlLrVyPqA5H0WANd+IZIoBoYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969920;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=KIqfknrJ9c0eCTLsD0PeU+4DRptfyI2CtAayvxhrcNY=;
 b=Iq/LQzO7La4ASYD7iMMFRERLcDwRBM1n7Hw64N6frB87C8qUqp4vCL9VtrfecKcuOzgw
 sZUboi5hB7dXh3RnbzowxLwjlxEgw5+e+8TYdCabtCQr1VT+AFiJDMeIfJXUh0gu9SdGM
 LP4qO4Hh/WZXxCI1I88VVlFXSzmMEldcs6+JYOWtaYp04euNhN/86FCcGBRZ6MvjdfmmO
 fIiUu+o/IQFPIxOgSrMRa7139c4molWU3tk0j7TS8RlSh2uIQ44VOEjJY5bapgyTZ5CMM
 pbD6h1vTJHrNREghkDvblqd5GZVGcgscmXvRgDArM8YSxKCqOAIQu0DhdMcxmgTDDVg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DkCLHVnh; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E6C740B5C
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:38:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 018431A10EC;
 Fri,  2 Oct 2026 19:38:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BBF8D603DC;
 Fri,  2 Oct 2026 19:38:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BF8B1032827F; 
 Fri,  2 Oct 2026 21:38:33 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:38:32 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <asAINYlIsyN0Ll_i@windsurf>
References: <20261002185156.3350834-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002185156.3350834-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.5.1
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

On Fri, Oct 02, 2026 at 08:48:03PM +0200, Giulio Benetti wrote:
> Drop local patch that has been upstreamed.
> 
> https://github.com/harfbuzz/harfbuzz/blob/14.5.1/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
