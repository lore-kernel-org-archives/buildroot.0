Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E413D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7696B60DD6;
	Thu,  8 Jan 2026 11:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFESlKKpURjM; Thu,  8 Jan 2026 11:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F2E60A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870721;
	bh=gyNj5BeNCONM91p4k7Dxv1MPLnCUGiJB70acWW6EjIc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FTC1tiBJKNL34QYOXQHP/PPef7rm1mRKyDNHAODzkH1Szf7bpkVOG+D44SE2MVd3D
	 7vW0e2C8zfo1pmoYpiQZygYLDSOx6B3UqBRedyL/v3Oqzjs31DzunLHR3o8JmV918E
	 IE1NIrDyL6C9O7IIbEQPcoElLjemeOl8i4lf9JZNVHPz0bwE/7uOrow1e7QK7e8eQb
	 voDIlmGQnXsmrPBtIUS9uJSese//dyFwUY840/sqO8y27WtG7zmWG4DTN4sJ7XPpa4
	 P2G3HBfd7mFkO/eKCWyzTtWAmvOSfcAA6TMYlAeZn5i/mGH3z2jARY8a7lr9944MhC
	 dE6caH3TRV3sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79F2E60A38;
	Thu,  8 Jan 2026 11:12:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2357F2C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE7D40264
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7HYD77Ug5KB for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F294D4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F294D4004E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F294D4004E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 480161A26FF;
 Thu,  8 Jan 2026 11:11:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C946606B6;
 Thu,  8 Jan 2026 11:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D67D5103C8828; Thu,  8 Jan 2026 12:11:55 +0100 (CET)
Date: Thu, 8 Jan 2026 12:11:55 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Martin =?UTF-8?B?SHVuZGViw7hsbA==?=
 <martin@geanix.com>
Message-ID: <20260108121155.133f2ea0@windsurf>
In-Reply-To: <20260106023957.2246995-1-james.hilliard1@gmail.com>
References: <20260106023957.2246995-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OycljZg9kkT1ea2TMcE0feNIIZG9kb1PW+K4iqPpT2s=;
 b=Fm+o5imzTfcu1B5ntJaEqU24P6+VPDtYj98afx/A0H8kpFme+7AvbEUKSYe7yLWK6kBizl
 gSF+w9ECJg9jrdAt/kni7j7hP8JDWxB7732RKAy9orTv74FldgUDUr4nMYXkPgcbhR6FhO
 n60uny0P4bZZ37hDqUROxH9aIjmLyxY+Q0X/vVtWcgyaYg41yl9PAzp2BcOpNk2R3lkxh0
 LnPALlxWqd5eiI/m2KnmZFXM3gWMRDe1VLrdoqjf0Bx8yea7cxXfoMchYLcmHPfb/nEn11
 7sjCTuuWLY2gIYvcuWLtitkQJ7D4QvA+5Gvp6Tb4fCEbasaMxh4cLQ++mwZhZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Fm+o5imz
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to
 version 4.2.0
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

On Mon,  5 Jan 2026 19:39:57 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-packaging runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-marshmallow/Config.in               | 1 -
>  package/python-marshmallow/python-marshmallow.hash | 4 ++--
>  package/python-marshmallow/python-marshmallow.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

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
