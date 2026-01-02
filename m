Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215CFA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C93A405DC;
	Fri,  2 Jan 2026 22:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgmD2q3W0iLp; Fri,  2 Jan 2026 22:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFD240399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393968;
	bh=0fXjY5PYagKX60SisJeYfSprr7MkJ+Ux5PWbhQ8YSNQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lEHtW8BAtIti6eTxkHQFVODzQYylMtlJ80HvN+GM4I/Xr9sij2EDCOEZ07kP3v2d5
	 yu/GG5kIfm53Ko9NAQB5xrhAWf/ld6rd87WVHLrqwUOf3BN0HrcJRuCz4iy1T1gCtq
	 ah7VEs0hOw1ij9MWMDvTiEWjBTk4rkQpWUVhuW+0JMnUI24AtVcZAo1Aav3Vi12W9v
	 /9jXHl8QgTKF7lDDjt9NM+IdTzD/VpVYx8GuzFWV3yC5qUlxfGMCiGrgDgJB3piN6t
	 XMLDku98ekFiOPG/4c5qRTieKzPshmaVCUgI4Cmqpaec65eB7bdBjedo7oRvbQ1SnP
	 KvPcv/Rxk0ljg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FFD240399;
	Fri,  2 Jan 2026 22:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA1A351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F251401F3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAbNZZhxQs4b for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EF4040072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EF4040072
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EF4040072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:46:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 24BC0C1C840
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E886A606C7;
 Fri,  2 Jan 2026 22:46:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BF30113B023D; Fri,  2 Jan 2026 23:46:03 +0100 (CET)
Date: Fri, 2 Jan 2026 23:46:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102234602.05d03ea5@windsurf>
In-Reply-To: <20260102221425.445648-1-james.hilliard1@gmail.com>
References: <20260102221425.445648-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ODYK47znmXpaM59QGIbKGHPjZci6tphmX0aL5M4uNXo=;
 b=tIucJzX34aS/+Kr4rYzPdXhXEVNi4a1UpExTr4SAn5S2Aal092s0MeZmsLSi99oPdHg+KW
 NBY3TgDactEgJSZ/dbgnoLlg1nRMyHsYX5iA1AWTZm4SeknUma04LH/lBu9fbOVHxrOMqF
 Egj078NCUnDOrq3ipJ4fGdibdKNiW0twhUuNAu09TYeAQhV4l7R38+JXKtPOx0kZaL5xb+
 so5KRzh/p8eiCnsAwcSQmMeliKSy93jR3s7x24w7lxAgH4+mTfLb0CnH/OmhXxoMNG337c
 Ak2HjvlyzHC8c7xMni0FtHQQRLzbN0QxmpFmEF6/OG8vQv1g2kj1ceOjj3H8mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tIucJzX3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lark: bump to version
 1.3.1
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

On Fri,  2 Jan 2026 15:14:25 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-python-setuptools-scm build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-lark/python-lark.hash | 4 ++--
>  package/python-lark/python-lark.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
