Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A1FC61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 09:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A60E80BE2;
	Wed, 26 Aug 2026 09:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QadhPEkaAg_m; Wed, 26 Aug 2026 09:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787738103;
	bh=+viG5SsqJnTrrkzbG7FB7kIHTE3lo81ZBSVNWUcMyJI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=kisb9UyW4wpGAhNycEM3zQWy6pYL/6jcsV/chwVShCE9rZkZrKSLxNQrmMulT4wpd
	 xvH2EPBLCpHCyu0eXpDTBv9ij1CgU8PKdgWJEsafoRNL/8r0QoRbwRalr9nkqLh5xe
	 7fEIWYib2U37G9ZwbBt+UC9NtOnkkw1roMCmFMkAq1iiT0kzClxbylZlyr7UaZ8KF6
	 rgKe58CTVXGD+zxPohbf78PV0EN9YjGTLdlwTgD9I7GZWDqhfdaB6MnwlK5xVFyuuH
	 BlFMPHmPPpf87Dh96cU9oowX5KOsXwNXtANynpuYbL20CALe+6SJ8bwskLLFGOnVw5
	 HHk6xmqo0uzGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9534A80BEC;
	Wed, 26 Aug 2026 09:55:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92FE73C3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 09:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7924E40130
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 09:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8wbI6vxtg3E for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 09:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E00D400F2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 09:54:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3706D4E413BC;
 Wed, 26 Aug 2026 09:54:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 054D1604EC;
 Wed, 26 Aug 2026 09:54:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BAEA711C7ACD5; 
 Wed, 26 Aug 2026 11:54:55 +0200 (CEST)
Date: Wed, 26 Aug 2026 11:54:54 +0200
To: Manuel Diener <manuel.diener@oss.othermo.de>
Message-ID: <ao63j4Ubi6sj2PkF@windsurf>
References: <20260826091851.467182-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260826091851.467182-1-manuel.diener@oss.othermo.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-questionary: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Manuel,

On Wed, Aug 26, 2026 at 11:18:50AM +0200, Manuel Diener wrote:
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-questionary/Config.in               |  7 +++++++
>  package/python-questionary/python-questionary.hash |  5 +++++
>  package/python-questionary/python-questionary.mk   | 14 ++++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/python-questionary/Config.in
>  create mode 100644 package/python-questionary/python-questionary.hash
>  create mode 100644 package/python-questionary/python-questionary.mk

Thanks a lot for your patch. For Python modules, where issues usually
pop up at runtime rather than build time, we usually like to have a
small test. Could you have a look at adding a test in
support/testing/?

You can look at the zillions of tests
support/testing/tests/package/test_python_*.py, it's really trivial to
add one more test for your new package.

(And don't forget to update the DEVELOPERS file to also include your
test case.)

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
