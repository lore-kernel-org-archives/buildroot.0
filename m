Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB4EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8902B821B9;
	Thu,  1 Jan 2026 09:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZImgH_Q2OdfU; Thu,  1 Jan 2026 09:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B6A821B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260953;
	bh=Lezd1tQ4zqeha+uj1t93tnlj7UPs2cdNWNUcwl85OD4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ITTQPTa0qNSXAxhdiCzRBZuaPpY3Lf7R33r43YNC0FgN/wIgDAKEDRvZG+ynXlP4S
	 zODmYZLHGszRvjqG9QbNfQQCliO9gL/YmOYuXmwuVdAwhGxQmVgH4ELI5CBfNA9nN4
	 J3VDNj+1QbfVjOMqcD1myiutqs0Y/GkbZ+DIokPM2omaRvnVUTDyv63fbvHFUYRdf9
	 GC90xrgh0Alzk/T7ugsFxx+ZehGa01bLeEtpDc4mSXOUl9/c5pOnjD1m5HsB8mbZQV
	 m/NToQ6nq8PhLZsgLRN4Qvnq1HOADdeuxx0gZKVLXukcKGIRwWgItV61c9cRKlYOUJ
	 0G8Ewde3JGoHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B6A821B6;
	Thu,  1 Jan 2026 09:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1527B351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1259A82177
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59s9j_S04-jy for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 072278215B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 072278215B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 072278215B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 421B3C1D19A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF63E606B6;
 Thu,  1 Jan 2026 09:48:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53139113B071F; Thu,  1 Jan 2026 10:48:58 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:44 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104644.5aea428b@windsurf>
In-Reply-To: <20251231213503.10450-1-james.hilliard1@gmail.com>
References: <20251231213503.10450-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hBK7fozeEYbyXcflwQKMaATdKMzT2suzgEnpuuPm6UE=;
 b=H8g7kWW6Vzynu82fm8XyvpZPbZ+QyVRSk00y2KpmJttol/ZWnO0dR7u4+M59OsgB9GVH63
 Zv7zmwAxOj8+9qpKUXghaDwM/gI0NvUUa4wDgk6ozssmOPqpdWDTnsndGZ+Mxj0H6du6QX
 /WLz6Ovk9rLYz4kZrZQICalXMW0J8vranZx73yzbI/4BIuySFh8NoBVWm0mvSiQHNoKNi+
 ip36JPOgRapGD71R0SOTpUt7Dy1rb5ldgmIPWwkcqyi0arW/TSqZLhzI7qJ2EcI54hn2sl
 8qGAdxHiJJ0TCrMjs3FOfOiD5mQJP7T8zufOcD6r+ky6B9jjDpXvDhVIzaZGuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=H8g7kWW6
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version
 1.6.2
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

On Wed, 31 Dec 2025 14:35:03 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from poetry to flit build backend.
> 
> License hash changed due to year update:
> https://github.com/lextudio/pysmi/commit/fdd7fe3d201b1d451eaecb858354a0e1bf9fd04f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pysmi/python-pysmi.hash | 6 +++---
>  package/python-pysmi/python-pysmi.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
