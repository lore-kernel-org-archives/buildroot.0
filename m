Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B906FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7F880BE5;
	Fri,  2 Jan 2026 22:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyFuZ0WZdb8K; Fri,  2 Jan 2026 22:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EF0B80A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391536;
	bh=tgkjwYCCCh2r1cqogrPzP47f+OOp8g/uXje4SXHR0lQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W/iz35ArW1kXADL7Huj7vy6Ik83TXGWHJ9OeOnxMFfiZeGQRY0UrG/TsUU7rAK9Tt
	 GYuNGyfUK9oHloNy3zT9qBnfNc7XMxKqUq6CeAUlJX+Kq4oUuWGT7tetZrVvcOpKqS
	 3b+IwcDM9CreTL1OCTdjcDUWvyjGpngvYNDQ5hSqAUBoGJqAk9NVLXD6z+SWqlz3zV
	 AgSOJUpULo3PqBugkUpUYo+lHUbAYKB44+h+N6Ubtwgc2omQiifG5pInIixedkyFvR
	 bK++HI3U3aecld/RaFK8MWtgG8A4vq1+3h3rRaiNRRCMjEXlqsm4T1x00FJoxCR2fl
	 NxoXysbvINRmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF0B80A98;
	Fri,  2 Jan 2026 22:05:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F117249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7130F6063B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1gZbus-rkiG for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:05:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A778D60639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A778D60639
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A778D60639
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D7A2B1A25EA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:05:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A6302606C7;
 Fri,  2 Jan 2026 22:05:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5791113B023D; Fri,  2 Jan 2026 23:05:30 +0100 (CET)
Date: Fri, 2 Jan 2026 23:05:30 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20260102230530.7193ce84@windsurf>
In-Reply-To: <20260102210345.45476-1-james.hilliard1@gmail.com>
References: <20260102210345.45476-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767391531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/mIwsdZCpMgCNwP3poYk13fBD9acwl6YRFnNR1nKUfM=;
 b=KgoOyc+ilG/7yVF+7+vNrB/xzFrZprKbmson6LRITKMIM+Mpvxx4xegmRqKfuolEYDnGYb
 ScMZF7sTaSYfDEIMen6iE7b2Do6Uxwz1oH/Q8mwEe3rHz+99Td4C55bI79L1k+TTt5llLA
 2R/WGiKG1lSDvPKIlOsvjrRTqBAqTtPc1i7shOBopEBClnmaynx49uJ3mX4afqzWI4gJAs
 A3fQNMTW1iT3Pjo/7654MdUdNTd++45Ew6N67rkR+fl8hlhnpOeQYN43sJxNO1Q0m2p99C
 Fsj+S41FiBJE0NT0PCDunmeJg2ubd2JusIZkMwLikDqXJ9l6fpPOt/Jc2fzXww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KgoOyc+i
Subject: Re: [Buildroot] [PATCH 1/1] package/python-modbus-tk: bump to
 version 1.1.5
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

On Fri,  2 Jan 2026 14:03:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-modbus-tk/python-modbus-tk.hash | 4 ++--
>  package/python-modbus-tk/python-modbus-tk.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
