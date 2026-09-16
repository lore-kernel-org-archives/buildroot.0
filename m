Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3065CC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E830E60627;
	Wed, 16 Sep 2026 19:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sj9RFwm3fn1t; Wed, 16 Sep 2026 19:50:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1953060633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789588211;
	b=WdZB/gz9qpJidjO0isV/xCNflfC/9Pn5JrdliMxivmC6DLRjdc8Z/b+JZpYJodKUihwa
	 I2gVpQnAS/m81RmtkxFuSP6eALSQWlaKBZPmEz/tOUv4yEihZcpC9vOg8tMIMzDYVRFGy
	 ENbfimPTSy+T82br957iUhCPzD8ZLfv59+BtqdBRTY+ZxGUP6t75nlMkqzhTZLtgdt3sj
	 SDvqr5NvuGW5nVHGbhkAp1VK/XE1fb8s7DoAwC7CrQd2QjaLWv9pkRB32BrhpYp3kNi17
	 y+ByoI+3cpDVVSXEuvdMV6cL+s62ykemAZvgiBzOuPDUYmi1szrpXGB3SJAD/Y1YD6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789588211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zGob/P1bt4KyW6ZS51B4q5iaQ2flE1br9dXnwO24YCw=;
	b=JNEuzC1HFgVqMi3twKmszJBk8aP4gNQadegTWEzwqKG2FWbr0Tzyyn+t4936qr5fcmEe
	 YVOyLO1dVdPrqlLe6oYgxxWNniBt0li3STGurkklW/uqUVNQwunifT/OA16MMtAMVASSk
	 9NEkuScifNcGAeLrv48rkQzmjWn5wA+vl+BkW9BC41uuW4t7yHd+/38cgAXTXtYDGV1O0
	 xYESVST/FC7XLVKRSkrbcWnYz0nxklMD3hwpOMA9pppavvUPpxJq0T3knK+t2NAtKnDvC
	 9xSY6T3GD62wzTuq/RtzbbX3uw7mv8YmMxrd7l2iONomZ8gTq1i6Pi7N/54F3gLl38Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789588211;
	bh=zGob/P1bt4KyW6ZS51B4q5iaQ2flE1br9dXnwO24YCw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D6Jvmx0SMQrKCV2Dmoj+PPBCDd7YcuVSxs5Z7r68mX1Z7Oqp962Kk+odc+nDm6v4h
	 OFezYFlndf6SbkHCQdsvWGKUbRkKQ/EeUO2y82tQVch10J/MzmR2HXTELSSrybzNtS
	 OAmG7XO6Pt56A7VO9rOJyR+7gfbeaC0bAykQjxXqsLEAUjDXp+9+nF7EXS25L+ingO
	 5Or44KHg4HpBHVGEpG8TsHomApF3LYSCcvCyvt80VfrbO0kteIGh8NQeOyPAxopONs
	 Uip8E3YiKV5heT9bJCGTatwCoGyFMfGMLCiQmRmqe1+T+VkErp5EaLMotpKfC9MwxH
	 rGXKfCc2g/5+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1953060633;
	Wed, 16 Sep 2026 19:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEDD042D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B553F60633
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKf9Nl0JCjQ8 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:50:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C2CFD60627
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789588209;
 b=N9K/brE5dGRLWnPOwcbBzgan72JhDlJ6eeIL3Qrr3XXWs8cmokSMggDkYXrVYHTtJmAA
 UZx8S14vZyq4NIgS8kOHEgPiVNDNrqlg+ioJh1WSxzTVPdhYW5G9tGjbo3vYZiF32K/wS
 ZMF27ia8PPzIbUewlv8AMQ0rrJgb02RoQC7TXp11f1GpuVqXCf7cOPsUqR1svg1Hw9VA/
 U8+JgAttJqpjx7U+gjSMUTBPeVksi2fCdc6K3FMFzLIolTsQQMHdcbNlf/OfcVd5vDkwU
 MEpKnLbd6N/vKPAWVPKtkHuAl2wQxQritptlXqSjF40+x4zCPIGM2+DPR02Lu1MBjIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789588209;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3bLFQnpuBz6hyc3Jubc+mxHXgstaibE0p6LrqehQujs=;
 b=R9M82n7pZf6LrBInBa1qOny/gqIs743sxkCSW/dxmk01/Zb63S9mG96HSDNcAEkon6Am
 +4Lz/tF9xNHra4kHuffIaaSOPD18q33TWVLSiQpgvGYiOO6PsppJHxgUvSwh96kK6ICOr
 xXPz40OagOOlai61+mJWfjocp5ZQdEHn7UdxtfJ27jmbLiYminEUZDUcHkoxFQOYg0QNt
 mcRs1OVEK4l/uTbF+7kaYMWBJ4ovqLi4HikykEWaZboVGkxJ+Vf9C91gIwtrZdsS6Ju8b
 6vXxIwH1b2DHyiIdO7WlkzFfv2da+4dIbcnJLpgp26uGZKZr2kTkPJCeHjBTmweNEKQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oFYdKQ+r; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2CFD60627
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:50:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0F090C5CD6B;
 Wed, 16 Sep 2026 19:50:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF99160337;
 Wed, 16 Sep 2026 19:50:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16D9411C7B00D; 
 Wed, 16 Sep 2026 21:50:04 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:50:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <aqry5x_otkgKITRU@windsurf>
References: <20260908191348.1892945-1-bernd@kuhls.net>
 <20260908191348.1892945-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908191348.1892945-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/libest: bump version to
 r3.2.0-9-ga464ba8a6
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

On Tue, Sep 08, 2026 at 09:13:48PM +0200, Bernd Kuhls wrote:
> The only commit in this bump
> https://github.com/cisco/libest/commits/main/
> is patch 0005 which was removed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
