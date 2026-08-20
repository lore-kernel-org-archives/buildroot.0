Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE64AC5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3360C80FA6;
	Thu, 20 Aug 2026 20:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEdJedpb3C3k; Thu, 20 Aug 2026 20:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787259254;
	bh=fhI39HYGwZVMGYvXvutb4/TyKuzqZoD7F3ubw46rmaY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nPdvMnyeeYx3S+ky3psUaqcEL1Dvb3JAVuePldRlgFwf5+RbhoMciP+cIZ1Xfl3MJ
	 Bd0kfkyieXU/xTbZW7T7M9y6usgHgLV++1QMDCO5e7YK2zpvfD3u+NEzGZ4fKsCGS0
	 v9A24QMEpWRcGQfOzP1npxfbaAZxlr8QSEbbToisprDi3hOmGMWQSTKZR2ctDmjSfO
	 82aaBF7nPA3Oht93a7pm6jI1MubAAWs0Fuu1555SmIp+ZhQ0LWfYtODGBSi3opZP9N
	 R6qv855WXrZAkEC00o3myr3F2RqrQ3X26PuN7rJB/sfixsHWIPuM+GzgWcrtZYXzG3
	 KT4HehZ/6HCHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6882480FA8;
	Thu, 20 Aug 2026 20:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 89D84279
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B4F580FA8
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwPfsldC5qdB for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04C6F80FA6
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:54:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B01664E41308;
 Thu, 20 Aug 2026 20:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 69D9B5FF59;
 Thu, 20 Aug 2026 20:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D2DD11C76828; 
 Thu, 20 Aug 2026 22:54:01 +0200 (CEST)
Date: Thu, 20 Aug 2026 22:54:01 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <aodoOoem3oIva28M@windsurf>
References: <20260624140645.185318-1-thomas.perale@mind.be>
 <20260624140645.185318-4-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624140645.185318-4-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH 03/14] package/pkg-utils: show-info
 expose vuln details
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

On Wed, Jun 24, 2026 at 04:06:34PM +0200, Thomas Perale via buildroot wrote:
> For each `_IGNORE_CVES` entries the status and details are exported if
> present.

Perhaps this wording could be a bit nicer?

"This commit expands show-info so that for each CVE listed in the
<pk>_IGNORE_CVES variable, additional information will be provided:
the status and details, according to the information provided by the
following variables:

> 
> - `<pkg>_<vuln-id>_STATUS`
> - `<pkg>_<vuln-id>_DETAIL`
> 
> For a hypotetical 'CVE-2025-1234' that affects the package 'foo' with
            ^^^^ h missing somewhere here ?
      ^^ an ?

> the following declaration:
> 
> ```
> FOO_CVE-2025-1234_STATUS = fixed
> FOO_CVE-2025-1234_DETAIL = some details
> ```
> 
> Will result in the following show info output.

The sentence doesn't work:

"""
For an hypothetical CVE that affects package foo with the following
declaration will result in the following show info output.
"""

You want to change the last part so that it gives:

"""
For an hypothetical CVE that affects package foo with the following
declaration, the show-info output will look like:
"""

> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 17b0aa1760..c6e509e9d1 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -154,6 +154,25 @@ define _json-info-pkg
>  				) \
>  			)
>  		]
> +		$(comma) "cves_status": {
> +			$(foreach cve,$(sort $($(1)_IGNORE_CVES)), \
> +				$(call _json-info-pkg-cve,$(1),$(cve)) \
> +			) \
> +		}

Don't know how we do this for the other show-info stuff, but do we
want to enclose this in an $(if $($(1)_IGNORE_CVES),...) test so that
we don't have an empty "cves_status" property for all packages, and
instead only have one for packages that actually have ignored CVEs?
(Even though admittedly it could still end up being empty, as we might
have ignored CVES but no status/details).

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
