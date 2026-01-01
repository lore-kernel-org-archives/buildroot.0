Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E40EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5057E40711;
	Thu,  1 Jan 2026 09:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJ3f_jPIFVs5; Thu,  1 Jan 2026 09:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28FB40494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260860;
	bh=MdMgPygvMvqnsVNI5UPkLrSgi2zmyXvTSJVpWud7JTs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kIM1Y2zc4/3IownpCVoHx4NRYGxr8SEeNcmbdvypQVMzBRcQHdlSPNIpJu1gN+siq
	 RD3RPoyp7wj+m/PQmr18XNqeA5hP7rRrt+1rE6Jg7EKmzFVa31hdrseHQQPtYigywN
	 VEMtGfEMdElIZ1B3TfRvrWzgrtkGpZI1IMQKyCRbHoLsvjKAd3veiW44Pxn+cRwy9J
	 aefOrvx3qm3KyyLo2BQ1J/nOgRRrq2Ocvoa1LEfLMavlflBKtbHS8dQtJu3Xr9X0j9
	 JF+ApjBmYb7HR6FTQUU73rqfMVomVBoHZq7WuArRyvplSTZaKVcxST4xdmIumHf9BT
	 HcJnaCSIbNgNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E28FB40494;
	Thu,  1 Jan 2026 09:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FCF9206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6221281498
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5ty02_bOskW for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8266480E7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8266480E7E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8266480E7E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2A6771A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E06BD606B6;
 Thu,  1 Jan 2026 09:47:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C66C1113B071F; Thu,  1 Jan 2026 10:47:33 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Guillaume William Brs
 <guillaume.bressaix@gmail.com>
Message-ID: <20260101104701.20d387c4@windsurf>
In-Reply-To: <20251231220847.250630-1-james.hilliard1@gmail.com>
References: <20251231220847.250630-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bkAhHgWLVRWlbUTVOA83n0W9QAyACFLqfjF37hHcw2A=;
 b=wkcSCYbNGvzuRiuwYgVHddxkSaoWgi1hL1fhUNu0NDSJitSOe7LmKCC6aceHrIdLV9yZbt
 yMBuIfJwf5+vaP7WQi4RwrJSTY0PGN6xgzR4QnHgq6lWcTBiyDwMGXpTwiURlWVE5Hl67y
 tvD+F65pM51RYPDvt54PHo1PV4Av/dq7nScz21yVRd3OoKoFzx9H5ukveYZLXYJEpvt1tK
 ogRu/6zU9hGgHCRGReE92dtCaVmu+R8kvJLF74WaeDy5ZAu7wQkQgvZxBiy/kmTbFK2C2j
 79pKKSfThyjI2tlr7Lmxbj95w+apy2/EjqFMWW4lHtLq1pVbPvsWDv5MfPn7yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wkcSCYbN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: bump to version
 3.0.1
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

On Wed, 31 Dec 2025 15:08:47 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pybind/python-pybind.hash | 2 +-
>  package/python-pybind/python-pybind.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
