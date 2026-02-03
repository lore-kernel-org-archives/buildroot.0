Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000EFE87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3536605A6;
	Tue,  3 Feb 2026 14:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id of3uNq4lSX_k; Tue,  3 Feb 2026 14:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD2E605ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128614;
	bh=vgbo+fEexr6nTtxl4/BOuD+MR9NYQo9vegpq7D6fibM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rY6MJ/jZWGPhjb9LPf/T0M+GCi4H0YAboaRmiWsVonHNHorETHhVuYES5vGH+alzL
	 EEkKAe/ikhV0FaxCC8cSCXoGLuRrQFy3UQYSTmdIh6w5TxZhYIldH6wosUO/a0GB5Y
	 vNoazE/Ud/x+6MVi6cSvYmXXLlpYF8trn9SpscKZTf/KHwydx27xjwRwVcZcyTqyOx
	 47i9+0PgGRWzHCWgRNI81ZZarc0aXrXJTN1NQvwh9IK9hNcZCR38aKQHlwDlE44cI3
	 z2R2mVsI2/b1X6kSDi/nSxa6WWXA0J4b3YGQckL0ChIMIyvsHM9TLmcjxmz3TnEPqc
	 D7DY/1csYozHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD2E605ED;
	Tue,  3 Feb 2026 14:23:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E00CBF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C10C0605ED
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSu2Hmx-VCUj for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6A58605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A58605A6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A58605A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:23:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D51761A2BB4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:23:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F47B60728;
 Tue,  3 Feb 2026 14:23:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97918119A88EE; Tue,  3 Feb 2026 15:23:28 +0100 (CET)
Date: Tue, 3 Feb 2026 15:23:27 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aYIE02EHNt9C-8jL@windsurf>
References: <20260203141357.790411-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203141357.790411-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770128609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=YKodOLmYb7TnMQWtVc7vY8lNkLUw8DrCsbb1uEwRiPA=;
 b=1897Is/QHtdEOq90NFqVOp72TNYB7xCEvFAdwwNnCPlG6Hx+mKVxNUd0jXSAKIGwbR/8ah
 OujSR/le1tz8hh06lR1IMHDVKaspeTMtK5PcO7j9/0oka7wyQBhnQJeeZA7UI1uxKfebNX
 WYJqnZuxAjjBePe0brDG0N4Y//jF8rVqZDtr7sgr6vfe+fiYNXzqC2IAPG81jao+AXcZgq
 vvOWEOrcHgR1cAfO+ewSXf66/t6RqHifOU6Iyf9jYVX00ry55u0V5KbpPA2hmnKckBlI3x
 TfJNYxfP1CBZm19vC6u62XLYRiEpUbFKBSAV1KJVgG/JtescG4q6DodCBuRTWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1897Is/Q
Subject: Re: [Buildroot] [PATCH 1/1] package/efl: fix check-package error
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

On Tue, Feb 03, 2026 at 03:13:57PM +0100, Julien Olivain via buildroot wrote:
> Commit [1] added the "Upstream:" package patch tag, but forgot to
> remove the corresponding .checkpackageignore entry.
> 
> This commit fixes that.
> 
> Fixes:
> 
>     package/efl/0001-ecore_fb-fix-build-with-tslib.patch:0: lib_patch.Upstream was expected to fail, did you fix the file and forget to update .checkpackageignore?
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/bac34296bfed5282df07496c845d74924beb5da6
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
