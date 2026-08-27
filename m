Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02063C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 05:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0AE80B99;
	Thu, 27 Aug 2026 05:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0Ciu4_vzfEg; Thu, 27 Aug 2026 05:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787808814;
	bh=1IzS1cqkra5+6OBuObl3kdeeREMdACblnfkWQ7zkLkw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IQAUvERF38xbmy6pd/h0mbubTfZHejVxbzHgOXUTp4ylq1FgOqw00ytwB2T8+uw2I
	 BIp9g82sLRgbxmxOS89OqdBoiYomZsRsLMED7Cjy0mwiR+EKFyuF2/jMi+5sCEvrnI
	 cFe4L46NITUkpdqEbrFtfNJ444NOsDoWA4EmQfLVNwGGnoixSHBCSbC8pcWiTJtkym
	 5AUwNL3gQcqi/K6MfqaN+o8O6vOUTrd2Bz4ceFEPSXIUO0rhXjxYvoXKcUAdgmRHFC
	 WCSVJFgo9Tp7ACB/WEdybfhf7xj0TU/fv57R6tSL3SZnAYh4BSmITyzEzOuOYvzSFJ
	 4xmoSubDtGWIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F9680AC7;
	Thu, 27 Aug 2026 05:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB2878B
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 05:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DCC140633
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 05:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQKQORTuNoL4 for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 05:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0F9F40591
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 05:33:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 218201A1841;
 Thu, 27 Aug 2026 05:33:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D31CD604ED;
 Thu, 27 Aug 2026 05:33:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DD0211C78051; 
 Thu, 27 Aug 2026 07:33:25 +0200 (CEST)
Date: Thu, 27 Aug 2026 07:33:25 +0200
To: Matthew Weber <matt@thewebers.ws>
Cc: Buildroot List <buildroot@buildroot.org>, 
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <ao_Loa791DyV_cMi@windsurf>
References: <20260825214203.3708181-1-thomas.petazzoni@bootlin.com>
 <20260825214203.3708181-4-thomas.petazzoni@bootlin.com>
 <CAFt09wMrVryrn14zaNKfjvAbk_Whpw=PQ2k=QWFScq2qNHtQ5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFt09wMrVryrn14zaNKfjvAbk_Whpw=PQ2k=QWFScq2qNHtQ5w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 3/3] support/scripts/check-host-bins: add
 new check on host binaries/libs
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

Hello Matt,

On Wed, Aug 26, 2026 at 11:19:37PM -0500, Matthew Weber wrote:

> I did some testing and found the musl library needs added to the
> whitelist for Alpine.  I also added libraries to the scan which added
> more changes then what I could easily include here.  Here's my mocked
> up check-host-bins and test script.  The test case 5 was modeled after
> the distro tests that xen does to target different containers to find
> whitelist gaps.

Thanks for the testing. Instead of having a full new version of the
script with all fixes mixed together, do you think you could spit out
each fix as an independent patch, so that the changes can more easily
be reviewed? Especially some fixes don't seem necessarily related to
the new library check, but would be applicable to the existing
check-host-rpath code.

> https://gist.github.com/matthew-l-weber/34fae15a4319a81462961eadf0e31164
> 
> Some of this was AI generated, does Buildroot have any rules around AI use?

As far as I'm aware, we don't have rules around AI use. I'm also using
AI to help in some of my recent Buildroot work.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
