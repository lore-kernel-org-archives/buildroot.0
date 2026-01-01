Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9878CEEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F23A40869;
	Thu,  1 Jan 2026 09:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nw6wWtdaWgTG; Thu,  1 Jan 2026 09:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE8F240833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767261005;
	bh=UmJbtgIvX3XHxbOp3ZauG6UGIlLP3SRZUMS4PgqkRZI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rbpCUZWMYmC2S2gn3iMmVLQxFZAavL/2eb2QPHF8A5V1PrhHnRhB/yZ2raqNmeZb/
	 p7bMnMRUz9VAYpwzgcB8NRm8K22rXLoFhyLNZ5n2dOu6d2CgN1facq7+oMMhWJM7tD
	 9SFNhs8QMHW2tWF0QvFCQP/ndhOPm0mSE07z6gUhpLa/NAmzohPYTOYhiTcDjbHiv1
	 3Dv/a1DrOcWwoIIlP5pGiicjfgJVZZ/ZggHKqHC+pUgvT9OvmkMGQiR7YRJuaW9apc
	 Z81IvAQ5YvX+G5UpAgUM3Zsx1WV+8NlC2AHq/tFzPJBAJjtN0xZexIHImw0OMsmLtO
	 hHvZ+N1Vog1LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE8F240833;
	Thu,  1 Jan 2026 09:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41192206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 248EA821DA
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HrUWniggnTB for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22E0B821DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22E0B821DF
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22E0B821DF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 76E801A2438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:50:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D742606B6;
 Thu,  1 Jan 2026 09:50:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B32BB113B074C; Thu,  1 Jan 2026 10:50:00 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104648.65331805@windsurf>
In-Reply-To: <20251231215209.210254-1-james.hilliard1@gmail.com>
References: <20251231215209.210254-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767261001; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iu/M6RJhgQDBdxJNIYPt9ISZVroNGOmMKc49j+Qih3E=;
 b=p0UuIzy5qin/s3+2lTctMfAMl5FzCPBYawLC4498IBWL/ZqVB74DfYqYc3y++nsQt83KI3
 +qR+kzkrt549gzmByYpVLp85BqUdc3iDbG5vzB8ciX2eVxga2YXgpKzlf87m20u0WgXNAD
 +ZWoIhLkFEfBtpnsV2sn/NUu+0w/kd6T+XTnhk/Wd5yC24Se8p4E7JsJWutAcB2/HIL0H+
 ZAk83wpPUQ63zPy4cs1xXU2/4nIV3SYvKrFoKZ8UHaeOJFuh/c89UfmykxyOGaNI2gJL66
 zgZWkLG7JlYjIrgWLyZILwyThhImtjqHrZj96LDuHEi7ja2m+6U+WqS/EG723w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=p0UuIzy5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyparted: bump to
 version 3.13.0
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

On Wed, 31 Dec 2025 14:52:09 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License file renamed with no content changes:
> https://github.com/dcantrell/pyparted/commit/78876337d9e0037fc8034f839c2b918a99d05e3b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pyparted/python-pyparted.hash | 6 +++---
>  package/python-pyparted/python-pyparted.mk   | 6 +++---
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
