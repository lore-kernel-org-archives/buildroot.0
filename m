Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3904BCCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4086066F;
	Mon, 19 Oct 2026 13:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRKHA7NzeDEv; Mon, 19 Oct 2026 13:11:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3AAC6060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415459;
	b=DWDo0BQ+/vshaRYpaaigFquL1P8Z9jaQHzUs2XaAm18JGzx63tiM5ZJbaNCeaW6Suo7u
	 YDFBle6hv2q0xYf9MXhG6MUnuAgEnyRI8R6mUwEgP6kgDX17jSYL4uJmAYO4rHGC2KltF
	 QBPGc1eEI3LIzewJZkDuD9HEs75wZXs/IO1WxbwLOW25akNPpcO0FGPI6ZL2poOb2DGBD
	 jRh8GFxy69nzniWMkY81v+dNrioNeYfdFopzKVkIT5L/jXafXq7UotpNjY1My5r4WAjch
	 2amIc54taSgyHeEl8lxl1GZaIawnYKvoG6gvNTtq4/2w+7WJlSTpTjlsDpKYW3HmuIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1LpDrEWjHKxnYBtbAHyWitJwuuNHbTPWpa5UAttfA2g=;
	b=Xe4dhoLMrubmGHd/i4q5egt6IHgPSf01DtMKHcrAjPZvKE+fou30mKuveM2sfUe+es5g
	 D6KinhVjIebThl51cUVHZtLnMkJItHhkEK0yxI7c3d/aS4G5k5/QPd1CwjN6TA2eMEbCS
	 bAjnsjlDCD6rekLsbzPMc9z0hk4PM7Ed5yWVZIN2eDDxARV84dO2vzQMaEiAWuhqX57DO
	 IVaybLX05rq2PrwJmu1M6F/IOQtpr2reW7BLLzVnqYqKVZUJ7Qi1kIsrKeKpauRhcW/FU
	 pRWqONAfzdWW/rnKBxGpcnbw1f/cWwhmv5JOOacAG64hF1Gw6D2euQSmZbgIqIafeNw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415459;
	bh=1LpDrEWjHKxnYBtbAHyWitJwuuNHbTPWpa5UAttfA2g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jc9XU46YXsWQCp6Ws2KWx+qUS0xgZCDUthkPkH9cL0nsFJDmN3J1VVcgm2rN+B7y1
	 gIXAlcRqC0/+Mk5Fe4YiqMi8BB4HTvuqW21Q1yC5yqHFxemIuYREssWoT2JInOfxrd
	 TiQW12xtKob41n6SS+OwkGX7q7SfYUN2MufdzVLvy5baqIWxYCkVUyUDp+JFNU260z
	 PFMesnXK/p6JRGLlpoxesuPHfzw/9U3HFlq0z7raEZh3vZEll6x1nRBkMqHXkDUxOG
	 qb+QTnJIbN9ggJs5TDp1F94/FcbupJYwtla2zITO0FPx4kqkfjDeiH5QSqeugIyWnK
	 xIaan6Ru1jpRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3AAC6060D;
	Mon, 19 Oct 2026 13:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D2E22B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCF446060D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJJwxHc11FuU for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:10:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 276A3605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415457;
 b=imRz+eB6Cvt94FqUcZJKFRaCWDjmt0mZ1IfYqYrvxvHxfZ6mQk/9f5RWu5Ar3aNpLXvq
 XEFRgAacrKji9GxA3ajhFtN2yRhwDFBfybBIUqWNiK2siKn9xYHhORLHdcOB7xxV/YuTZ
 doV3PVyoIOe13Z/aFIe9t3LxCxaHvC1OF+46pKkCfcU6EYwWKpW1R+dV4CJcmu/XbPpzb
 XwaZxU3r5smEuTm2rKVpCErJ9raBkPK6VPfSI1/8BawhLU/gDCfMQlva/tQEw1QqiPTCl
 rq1cKcH6NXmBiKsEzNU9yBYlj9mpeiDi6R2tUcbbarfdrh03kH377YQ1aq5Ct1FlU6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415457;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QeLa8pr7iy/NmwHeOC4HSh1VyXLJfXdZwmbOF9Oegmo=;
 b=eMKpytfTADKaTtF6mhI6SwyIsG31qltDwwZ2fu9SnOBT5MjWir4N1XWAOXsaUapsx67y
 9QJqE6BaPAcPztHYbhlpCBm7NotIX+J9A9tBSjAWth/0ilLETZGtQRo3ce31tYE+/4m5R
 Rz552SVKSzwnlfrlSj462NqWF2PJHVqyMlX0+vfDYvKNLlpMhmd/3G3s0xn/YpoTbmfTV
 XHgXywqeZ2vw+IwvrIhMTmfp6X1SPjLIsSc5I8Z6RkVU+iV+6gUlHZpLSxn67413i6Rza
 P3B5kwZKEHwQmtJeXiUQhdkQHFw3OgKv06P5qWfAAL0Emvuc/DPBMg413my//D9FoUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JGa1Wxge; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 276A3605F3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:10:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A21C2C653EB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:11:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D25B60582;
 Mon, 19 Oct 2026 13:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1004310328D37; 
 Mon, 19 Oct 2026 15:10:47 +0200 (CEST)
Date: Mon, 19 Oct 2026 15:10:47 +0200
To: Stephan Hoffmann <sho@relinux.de>
Cc: buildroot@buildroot.org
Message-ID: <atYWuXFqwgpWM9Xb@windsurf>
References: <20261019121726.184892-1-sho@relinux.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019121726.184892-1-sho@relinux.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libhttpserver: bump to version 2.0.1
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

On Mon, Oct 19, 2026 at 02:17:26PM +0200, Stephan Hoffmann wrote:
> Version 2.0.1 fixes an unauthenticated remote denial of service in
> version 2.0.0. A single multipart/form-data request containing a file
> part without a name attribute can terminate the server process. The
> issue is rated high severity with a CVSS 3.1 score of 7.5.
> 
> The release also replaces the blocking-start pthread mutex and condition
> variable with C++20 atomic wait and notify operations. The existing C++20,
> GCC 11 and threads requirements cover this change.
> 
> https://github.com/etr/libhttpserver/releases/tag/2.0.1
> https://github.com/etr/libhttpserver/security/advisories/GHSA-q8g6-h8wv-pr43
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>

Since it's clearly a security related bump, I've updated the commit
title to "security bump to version 2.0.1" and applied to
master. Thanks!

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
