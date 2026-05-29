Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8755CCD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D3F56132E;
	Fri, 29 May 2026 15:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HX0bvxajSw_n; Fri, 29 May 2026 15:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E6161373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780069201;
	bh=xJQJqv9OoIErL/f5cvwase+HiKY1tiFmfIsGUNdWigQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fXWMlmaqCIFfNlwHQakoM0piWso7PzHNSWeoln1hmO+j+NRTst34WVqidjUmkEv7w
	 FwoPrhjdlZ5Q+PSSN/nMvYr3tf1b6ecx72ipC9/sSJN3xP2eVM/n59OG3Ml1P312Gx
	 2GHrx7SWYw+c7hl1xRmNtxwioVkDpri6gle6eeMU4vg0CWk1FQ3/mcaN9KDSwuk4d6
	 3dJzAsGlp7IwEfuAq7ywBdFI+5XJZxIUl/7fdmCA4nQdW2Hy40FmiQQyDpOkhZfJx+
	 coemBTKWFTE7ab/BAK47dxcfC6Bh15q5+zL9WlzC5XGe/dnp58QIuXvnF/8zagVZKs
	 nqztjlVYEdILQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80E6161373;
	Fri, 29 May 2026 15:40:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DA1FD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC02D40457
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUamLaoA39po for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A68D3401F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68D3401F2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A68D3401F2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AD7034E42D8C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 85061601FA;
 Fri, 29 May 2026 15:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 059F010888CBC; 
 Fri, 29 May 2026 17:39:54 +0200 (CEST)
Date: Fri, 29 May 2026 17:39:54 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <ahmzOn-HCerqP8EV@windsurf>
References: <20260529150631.447940-1-thomas.perale@mind.be>
 <20260529150631.447940-5-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529150631.447940-5-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780069195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=eVvQIzWYKrYokiAhzPm/WP2mk+Jz6hHsMr+biRCWfZM=;
 b=0A52ant1OtOxzY6xAomW5MiezL42glqAIK3Hw0HO+U7OTfmAJEQWPfQlevuulbIu3+IUrk
 0K+cCSvZjA4RpDQUnSOjckhR9/cfUBdWP2qV7Ag0j04slrmJ23iQyFSfdqIj+SnYtbu8Ci
 dJ7aBteuxdDw2Zxucy3GCOjoAa+SxCv7CjueJFtqISgJc/4+zgeA8IdSbQzuHCRz4sU6Hl
 3UL7GVYDKRKo0NCjA1vlZ7pVgbQWtc1XbveSVchJKmbnMpcGaJoDdI9qnLevfosBLqSHqt
 vecQeXQF8XLzuwzAq7F0Gs8RDjflSei+Y8W9lGTIMdA/RgPVANlRGObFbGbPkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0A52ant1
Subject: Re: [Buildroot] [PATCH v2 5/5] package/pkg-generic.mk: replicate
 IGNORE_CVES to host packages
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

Hello,

On Fri, May 29, 2026 at 05:06:31PM +0200, Thomas Perale via buildroot wrote:
> For host packages, this commit adds the same `ignore_cves` list as their
> target counterpart and make it available from the `show-info` output.
> 
> When generating a CycloneDX SBOM with `make show-info-all |
> utils/generate-cyclonedx` and running an analysis over it with
> `support/script/cve-check`, multiple vulnerabilities
> entries would be created with different analysis for packages that have
> both a host and target variant that include IGNORE_CVES entries.
> 
> This is the case for the grub2 package that include ignored
> vulnerabilities that patch both the target and host package but aren't
> declared as ignored for the host package. This resulted in
> vulnerabilities marked as 'exploitable' for the host variant while it
> is patched.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
