Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF51C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51C5C80E49;
	Sun,  4 Jan 2026 14:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rBV3WDRln2H; Sun,  4 Jan 2026 14:30:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1A380E2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767537018;
	bh=ncq+Xch49bzsFKXjyjLfoy8dBMYFdhUXghYfPPvyW6g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FHxWY89mifJJW27Gt70d1qcydAwIFuXDK4DrdeQSDt3wzpkDfK3yhfPXXJiqDbLSs
	 gE0PDlcsXTUdlZFvGFfmaHIITOadxiTZM/NQazJAMQ2W0G4Xakv/iwmIp+zaEs2xdP
	 kKmM8HU6457qjxUPXoWfnpT0fDUZ/dxvOIYNcVFoeMIvXOnbqERod9tvhELP2A7E2c
	 8IhROLUaolrjX5UqrPfPRMKkfeni+iM7xajPhPrk6waIRj60tbqJ24q0SwKNy2GjP2
	 R3NYhl367rXfoNpXg3l4082QLLBfXHvMjuUEi8Hr+ibex6Lkq2yqWUyw6vNVoGMPI8
	 UiguFfHuHKLAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D1A380E2F;
	Sun,  4 Jan 2026 14:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD53229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68AAE40522
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vci5zhGEq0r for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:30:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FB424051C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB424051C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB424051C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:30:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1A5F4C1C96C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:52:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E026E6072B;
 Sun,  4 Jan 2026 10:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B183E113B071B; Sun,  4 Jan 2026 11:52:52 +0100 (CET)
Date: Sun, 4 Jan 2026 11:52:51 +0100
To: Preyas via buildroot <buildroot@buildroot.org>
Cc: Preyas <preyas17@zohomail.in>
Message-ID: <20260104115251.61b20331@windsurf>
In-Reply-To: <20251220111707.59273-1-preyas17@zohomail.in>
References: <20251220111707.59273-1-preyas17@zohomail.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767523973; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XYcg3kapiWJ29vgWq/7wb1rpf290C4tHvoP5v66eAXo=;
 b=fXFZJFUGBZFcJMWRcjnjoRzvf96LgpU4ee8lJoV2Mxzg3DUCYo1MA+lm9wYsTY+CmtnDnG
 qOm4U38awMVSpBpyjoPAtG+Boa65l6JdJGg4XsbqmEoGtKH0ujrVLJWFLh1JTr02i1F4+4
 RJGzSNNSvdSrrGrguE0lE+y8i0FYVD8yS1uNYukLwxULHi5hvp8FfXMheZrleiBWaBK/QM
 b46l731LYRYKi9nn9RZms7PRQRz1HWbOtkyj8MFiYbA9YE5P4qRMtU8Ftr00z9Jw6F1yor
 AGw/Gqcqs8xHztnCXg0mA2QurYpJMXEEhmt503XRtBGxPLsIT7/TUbppCqnuVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fXFZJFUG
Subject: Re: [Buildroot] [PATCH] docs/website: switch HTTP links to HTTPS
 Update outdated insecure http links to https for buildroot.org, eLinux wiki,
 autobuild,
 and git-scm. Also fix downloads host from buildroot.net to
 buildroot.org.This reduces mixed-content issues and keeps references
 current.
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

Hello Preyas,

On Sat, 20 Dec 2025 11:17:07 +0000
Preyas via buildroot <buildroot@buildroot.org> wrote:

> From: Preyas Sharma <preyas17@zohomail.in>

Thanks for your patch. However, the commit title is a bit messed up as
it is way too long. You might want to learn about the difference
between the commit "title" and the commit "body". Check for example
https://www.conventionalcommits.org/en/v1.0.0/.

Also, we cannot apply your patch as it is missing your Signed-off-by
line.


>        <p>If you are not already familiar with using Git, we recommend
> -	you visit <a href="http://git-scm.org">the Git
> +  you visit <a href="https://git-scm.org">the Git

There is some spurious/unrelated indentation change here.

Could you rework your patch and send a new iteration?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
