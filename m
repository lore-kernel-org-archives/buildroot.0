Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212C606D807
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CurrYarj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD8460844;
	Wed,  4 Nov 2026 22:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKu6CRiN11LT; Wed,  4 Nov 2026 22:20:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 23BB2607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830859;
	b=BQkkCzejDHcFwKU2C6u5Pw25dDXWi0NsjzXuA7WjOGZRCtoIcNgtYM8FHHlnF95O5Rkl
	 jkoPTgNlC8jrvn7hEJl6r6M6twNSKxgPXw3TXGZ1XioCscKjPcvfKtO1jZu/WS0jt5Rmv
	 1Ci/XveYC0RutyFN+zdS4GAn2jijikFnnYGZy7zh9+no1dE1A2BeOPuRfRD+erpkVjCS8
	 uHYLFk84rmJ5sWMDf7xLeFFoqZLp7jHXwmcDYGSvlZRAaobQr9uHo93GLJDaJ0KIoQlUy
	 4f9JhpnKicbuqDLoWtkPgM3g/GYkvjfzsCE1OpAutk1ycm5H2lLG+ITs+WQLAGOLNPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=36CaYS0o08U11lvTfIzuXGOSfmltj7QzERVqBg74uSo=;
	b=ImDgOgy7//gPJMZKm4A6jifREyKQBr5KDIy+uH6SN8h9fd5iBqS7wyNNiyRRz+VxUMzo
	 5A4rIRtvsZmu+Mo5rr5xL9FolTcbQeQGSXrq7ZOurgYuh8wBv/8sV87Vcw3YfHrfvx21p
	 eKJPMpQpT8axs994/u5K+UWdiTGgbfGZMCp8B8qSSCIS4hEs+EgbaS1IbramWmqlgyJri
	 mqTnf4rdK1Tr+oWY96VKwGDAFnvChRpPDHagskrDgJVV4RFhBS9dVbyAvXmUpeG8R85hv
	 qdN00blG6t7C87r7pG/4dnKDhCUwITFJykKcZtC6NLn46lfFXYydvNHigaz5iCql+sQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830859;
	bh=36CaYS0o08U11lvTfIzuXGOSfmltj7QzERVqBg74uSo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CurrYarjj7PMGYBh77F5Q+bjGD43aoO7V9cqdWtiP0s2PX/ssmObEIlggPrSK4h52
	 x1vLxC7OsPoIx842po57aQGYrnOmM1RC/Rh9zK77z0NRoix1iXU0YAi78+vn/Hluy9
	 nhFMw2sLwnqrXg/hDjelYZeRiRefgP+95jSbhSnIhIK997nKBamRWGlKPkrWeZepXS
	 drwnBMXvgU/Mhfh/T4bFE31Wrie/UXQCW9/lDNSFPOconXthMbk2MWJ5YK9ac18oYI
	 uO8IgIaYjeHbtQpc2B7G6gG4/bYdmYifmxfJjvxYhXyyP8arl7jhJ2JeVIzYLwU/ug
	 ey1TM3hHqdO9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23BB2607D5;
	Wed,  4 Nov 2026 22:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1760AB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1878607D5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRJcoN_8reFr for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 185576078E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 185576078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:20:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D0BAF4E403FF;
 Wed,  4 Nov 2026 22:20:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A20615FD65;
 Wed,  4 Nov 2026 22:20:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7943B103291FD; Wed,  4 Nov 2026 23:20:53 +0100 (CET)
Date: Wed, 4 Nov 2026 23:20:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <auuvwXLiIOxUlVGL@windsurf>
References: <20261102181345.3238554-3-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102181345.3238554-3-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: bump to
 version 4.14.3
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:13:34AM -0700, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

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
