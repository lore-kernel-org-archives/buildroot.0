Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E735606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E/Il6SSR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BA340478;
	Thu, 22 Oct 2026 16:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Q0T6sVOq8qI; Thu, 22 Oct 2026 16:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D784F40562
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792685623;
	b=dp4EcrTqHQOfoW+Vl1fCTaaMLY7/d6WNphHeuTAS0pDYJffmnww4VVzDNZ31lqo9ohSo
	 o9durfgve/A3MFCAYalz3cuSldhUbUWn9QffZErL41JqDoMqZ68+LqnS+rSk2mbVW0eNS
	 EyKi72KJCbxHv7MraKVQ1LnmGlMQalQYEEFqr/Fg8VGgubVk2BKW233Qp1wo1z/h84/g3
	 RzxMtS2NzuVEFCrj45UxpEmh7RUSaOJTznt/C3MHd2Dv61vAaXFUQORMNAomstJEKPTRn
	 njjqc4BEa5xLCI+HM+pgfKTQw/Ip3u8afzBoYG77nEdBa00OAwgE6n+xfdgfbYCPxvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792685623;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1lTJe3o14KCWUkqU5k0nhHst6BqYH3RVh45sUXixG9Y=;
	b=enSlPrhxhJNENrmjC44SCTHFbo79mmSvshkVm31CiplXoTiNYqh+hEOwPeLOqzxnKLNL
	 HNOLfhyNKjVK8T5wgdnXHb+Q72JO2/vC1uGsjRt2JLbbCjZb41tnZ7JQI6ZvaUfdIsD20
	 /lVEIreKHS/qsMHjTnOOiu0vAOoIFR5KAY0rZpyYY7/G33FZeXTYlDfpaw8ULdB3BCPjz
	 t0owJgFjNsQ3UmHe2/sIjB/d18JyQRBbRtZnRdTlCNFQK1FmKTWftkkyO2YdXZ3fMCyCu
	 9yew7JPMIk+/Jd5XAukWXXiVl6n39WYufFjTKJ0TgzkVbTqadN+/j5LA5XJMFk/WbUA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792685622;
	bh=1lTJe3o14KCWUkqU5k0nhHst6BqYH3RVh45sUXixG9Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E/Il6SSRcvjrmjZnr4rzwPxmapVwguzUQbCJ3PEiGDFb5w4qhQGQi5bkCm46jfC1j
	 xXjGMEyqLI0AuHJ5C3IM6UT5WZrcbWQhBJzcfLKa1IKWtjBsqIy97gtsfycgNnrWYu
	 rMSya6cqklFr76GcOhd4i2d3onGLX6gslBsWkkHFM0NQhEPpUCbGvkakQlrWU3xEno
	 BJ+PPR839Epna1cGwyIMHx0YOI7j4MGgveE1tMtl1WDH90Jc4OYKpfsOPLPKtygnVg
	 pTWyZBOv2PljfQjPaLzeYgEp8l0gAaEPFVHtsXIttvbixIsWb8WKOHldvsIR7Ci4sx
	 27Glfq+7omUUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D784F40562;
	Thu, 22 Oct 2026 16:13:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6645B769
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4948F807E1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55EPeJsiYhDP for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 16:13:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE4028099D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792685620;
 b=E1TXWpi/zISiJF0fM1jR8glAGMio2yMUwJjDom6kgRiJ14htJGK+O/YzIPuPcVQWnK7/
 OGLnFQz1sjq1pnuz4ixzBtNwIZr/82P2cDb/JUzLiZz2NvGWwzNHEFCj3IKj+rmuaddHE
 +IlLO1OYtQXBRf2OvyhxC3J8VIe008cYo65e9Ayy8x/2xtSYMzGmEmO4k7nbq8zeqCtn9
 7gTyoE8Y5WVnpdwE0DBu+OAYL38FjfoJiNBSR2nq7GCFqEiCzLIdyz/QPAg0LcMZJmSob
 XG5HiEdFWrplZ+kDUeTe4mspX+i9ZnTA8DWJ2ru4TFm1qy1efdZoEksMNL+r80HYqMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792685620;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3DZf3leo4lNCfsh96b4bgyJkEbp1RSErJlPbtlU+d4g=;
 b=RdmQOQhobkRmAQx9u9RsrFlA43tIsUWUWfoYGh1zvt3X2LgcgS448SD5lvtp4jVcABG1
 xWrseY4vyFZ550W/hG2fZzm8Fs7RhNE+0oGahoaqNN1ekiZgcd/b4cQt0jGl2hVzdbRX1
 ZATYNCqqd5l23QJEps5B9E1wLYyMcIKKRCvufPCneWaXRhfFiXugriMhwDL9FGE3C6CC/
 EviR5683QWs1r7McjYps7qX+Hju2uk3hKJWpckGNCkFJCuZjdo2q/AewZE2eR4C/0R7xy
 EIh9l55cUBCi5IZGh+SfPgHJxQbvW/ez8EHiGqYLwxKBy88syzQUtQMi1S7riTR0q4Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jCPGib5h; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE4028099D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:13:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B1621C58479
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 16:14:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E2BD60763;
 Thu, 22 Oct 2026 16:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EABB10328E54; 
 Thu, 22 Oct 2026 18:13:29 +0200 (CEST)
Date: Thu, 22 Oct 2026 18:13:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <ato1zt06yaEmJRzt@windsurf>
References: <20261006195933.2225477-1-james.hilliard1@gmail.com>
 <asX6R74TC4XMSXDo@windsurf>
 <CADvTj4qdSJ-iWg8qTr-9uZNbRhMEN_SpzTTR7sPnN_+MoMizbw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4qdSJ-iWg8qTr-9uZNbRhMEN_SpzTTR7sPnN_+MoMizbw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: use cargo environment
 during installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Wed, Oct 07, 2026 at 03:45:07AM -0600, James Hilliard wrote:

> > Thanks for the patch. Since when does this problem exist? Of course it
> > exists since x.py support was introduced, but did it become visible
> > because of a new package, or package update?
> 
> I think it's caused by this: https://github.com/rust-lang/rust/pull/156196
> 
> >
> > As it's a fix, we need to have sufficient information in the commit
> > message about which commit introduced the issue, so that our LTS
> > branch maintainers can understand whether it needs to be backported or
> 
> I think that would be this commit:
> https://github.com/buildroot/buildroot/commit/e8c8bd9bc56a827db90c3bb2e71e4613a5a2c730

Do you have a reproducer for this issue?

Your original patch is at
https://patchwork.buildroot.org/project/buildroot/patch/20261006195933.2225477-1-james.hilliard1@gmail.com/.

The failed issue is at:
https://autobuild.buildroot.net/results/02b/02b2fc6ba7329852d7bf6ae4935c120c4de47b3e/build-end.log,
which ended with a timeout. I see:

Dist rustc-1.98.1-src
	finished in 17585.096 seconds

which seems extremely long. I did a build on my (fast) build server,
and it took:

Dist rustc-1.98.1-src-gpl
        finished in 119.230 seconds

but the build completed successfully.

Do you have more details about what's happening, why passing more
flags don't cause a timeout, etc.?

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
