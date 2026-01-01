Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A68EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5F7E40847;
	Thu,  1 Jan 2026 09:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNPbAjTFM6FP; Thu,  1 Jan 2026 09:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B133E4083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260928;
	bh=Trc1bN7oAaAsgrKDm+LNV9CsfmrMUp0wNNI2cw/Lqxo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QT4MnYHu2DtRbtx1p0iADbY5lNUqengRKOfTMfBiA0NR+NdlnmszhrNUE9/aUHxnM
	 MaLc5UKggfFeOUrQwEP14ThWIhTouimRT0E3umTzUYQFE7PMDMyK9RrCq6NArIiWKy
	 +8EaQ8FCu0gjACqAu2DtlwTKZK2BEj1Zyv+nGqv7UjXr+cmv+I9ln5g6dzEFWLYESz
	 Hd4nUgm63qxGhCsj9cLJuggo8d+wr7yaVmzydUeO6OIcvk+44V+rONHO3XaIvo6nWz
	 m7xzuimJqtw6SKF63B1E9No30Uf4ufDQFUTQ5c35YEOMDSxKwP3ucx6HKvhnivMyI9
	 ibDcED8/iHKaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B133E4083B;
	Thu,  1 Jan 2026 09:48:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E7CA206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 303D1607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3Mgosc7t3B3 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27701608EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27701608EF
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27701608EF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6E2EA1A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44753606B6;
 Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AD2A113B072B; Thu,  1 Jan 2026 10:48:43 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:32 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104632.724a5599@windsurf>
In-Reply-To: <20251231210932.4168952-1-james.hilliard1@gmail.com>
References: <20251231210932.4168952-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CcSw+GjspU0Kddo1IbbQEs2/EVaeaV8EVkfH2V8V5ug=;
 b=K75B4elALbm79jpyHAxDMAK/0/835bVIFlLl34JZZGGDLE0ZxZdVN8WeymgrmGME2+M+UX
 WJB/BaW9MIBJRONxEUuSL0jSTsgaJMHsyxQcp6sr194L8XnvWffsELDNwOXrubng57cyRr
 2qabRds1bg/Y+1nFaC2FKGLqMprEgjfu+wPRu6lkgy8Ph6da+skL1zPCi6vRNEDADvhY9z
 iEFXHshQ9OFlKQ+VJ8kniroWL3IJkYbruStZ7tIXklzsKW1nY00IywDRCqYGYLmXtAHJ6x
 Hi670WRSwAAdFz3SP3ixaqxSVLmLxaKactIHswFynNIJM/9NlehlfLVs+lQCXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=K75B4elA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-reedsolo: bump to
 version 2.0.13
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

On Wed, 31 Dec 2025 14:09:31 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Enable optimized cython build.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-reedsolo/python-reedsolo.hash | 4 ++--
>  package/python-reedsolo/python-reedsolo.mk   | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

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
