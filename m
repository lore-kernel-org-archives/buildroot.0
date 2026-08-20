Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0497DC5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC84A80F8B;
	Thu, 20 Aug 2026 20:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id de_o26whqxhz; Thu, 20 Aug 2026 20:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787258845;
	bh=5bL188S/1cKq9H5Bhs7TliGyEloA674/N+BIMh+Q+vI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gCIzu7VNadFR0rU5ZznKFaW4DKEeP1v6BkB6JBz9pWn7kidjElsfjNGesIGOD98U+
	 4hRsIeymZqhgfHqfwzpVTj/IPDVvC2r1pDRkZfNkkfwVfZhteCid0lDnmHsSopp3qn
	 ZK1MFSHN3LzAwWrwyExgVoEPE3+PJFUso2FN/uNsK2wX3RWgtJZS74vplCZ8z4ENBS
	 UTte5hojJGt2z6jUHWatUooQKsQkXvFzBPQblZjyMalPG/pPYTdsfGJbuB4kx/i7vb
	 rIKKrJP2og3fF/2jD3QqQFDNwx5q/LCfzeYg2DeyArpmA+HDr5rZ/3jWaIuu65tUxY
	 9WynkioElwptw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAF0F80FA6;
	Thu, 20 Aug 2026 20:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3232D336
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AB63400B1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wka-1CWRLcbh for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BED74008B
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:47:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 469784E41308
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:47:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A69A5FF59;
 Thu, 20 Aug 2026 20:47:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ABF2D11C7681A; 
 Thu, 20 Aug 2026 22:47:14 +0200 (CEST)
Date: Thu, 20 Aug 2026 22:47:13 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <aodnYtE4laq3em8i@windsurf>
References: <20260624140645.185318-1-thomas.perale@mind.be>
 <20260624140645.185318-2-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624140645.185318-2-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH 01/14] docs/manual: add vulnerability
 status and justification
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

Hello Thomas,

On Wed, Jun 24, 2026 at 04:06:32PM +0200, Thomas Perale via buildroot wrote:
> In Buildroot, we can put the ignore CVEs entries in different
> categories:
> 
> - Vulnerability fixed by a patch.
> - Vulnerability ignored because the internal tooling detect it as a
>   false positive
> - Vulnerability ignored because the database is wrong or not up-to-date.
> - Vulnerability ignored because it doesn't apply to Buildroot
>   (platform/hardware specific, ...).
> - Vulnerability ignored because Buildroot is using an upstream fixed
>   version (based on a hash for instance) while the CPE metadata
>   reference the latest known version.
> 
> Since the introduction of `_IGNORE_CVES` the justification for the
> vulnerability were added as a comment on top of the ignored
> vulnerability. With the introduction of the rule for the `CVE:` trailer
> it's now possible to distinguish the vulnerabilities that are patched
> from the one that are not-applicable for another unknown reason.
> 
> This commit add documentation to introduce two new variables:
> 
> - `<pkg>_<vuln-id>_STATUS`
> - `<pkg>_<vuln-id>_DETAIL`
> 
> This allows to have machine readable variables that are exposed and
> contains the reasons why a vulnerability is set as ignored instead of
> storing this knowledge in a comment on top of the `_IGNORE_CVES` entry.
> 
> The `<pkg>_<vuln-id>_STATUS` syntax is based on OpenVex statuses syntax
> [1][2]. This varialbe only needs to be used if a patch on the Buildroot
> tree isn't present.
> 
> The `<pkg>_<vuln-id>_DETAIL` is a free text field that allows to add
> more information to justify the status.
> 
> [1] https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-labels
> [2] https://github.com/openvex/ospec/blob/main/OPENVEX-SPEC.md#status-justifications
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Thanks for this proposal. Overall I find it nice and well-aligned with
the Buildroot spirit.

Two comments below.

> +* +LIBFOO_<VULN-ID>_STATUS+ informs about the impact of the vulnerability

Shouldn't you indicate that these properties only make sense when
<VULN-ID> is in <pkg>_IGNORE_CVES ?

> +  +<VULN-ID>+. This variable needs to be set only if the referenced +<VULN-ID>+
> +  is not fixed by a patch present in the Buildroot tree. It support different
> +  labels based on
> +  https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-labels[OpenVex
> +  statuses] and
> +  https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-justifications[justification]:
> +  ** +fixed+: referenced by the package Makefile already includes the fix but

I'm sorry but here I'm unable to parse this sentence "referenced by
the package Makefile already includes the fix", is my English too
limited, or does the sentence really has an issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
