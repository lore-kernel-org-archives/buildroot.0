Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9360F606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cQsxccp/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EAF680F61;
	Tue, 20 Oct 2026 21:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38M8Pvf-2XRI; Tue, 20 Oct 2026 21:28:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1A5080E34
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531700;
	b=ixW7t5GUS8OI4zqoDrsIEdPT8fhR0dvDYooZsnhEQ/IaMf8BsKUdyPUNA9biEuF9PjBB
	 cHZx+tQ465JJ4HvOrg+jHzKXPcY36XhbWgh4b1+RJBnPZZYDmX4z4/FYn8X3X9DYbqifY
	 T6C7wuuvcf/tfPdUbVMBPGaT4K3vycU7Lo6sl2Ov4E926WHh2TKvvx5Wh/ZK7tA1IExC2
	 WvHHyVB6q4FyUFtfGpCFNxf5bhhEZo+F4y3ukapABxDhR1gyFS1ndgH84nldhAYV8hOJ5
	 ky3ZJ63k+jPunRfidFoBQ2eIexJLr6qAdCWtvJdybpcQQUAzySdqAKja3ZdbTZDFnKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531700;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tb1aHkytVAMH48Tz32COM6y4MBtfQLpWNp/tPxyQbuE=;
	b=bXRqQ56uVDHwcxeHlRqTsvtc5tlgFTVuhilKoLX9V912gvyFU7r8JzyjqqxiVzoaTJ1N
	 UAdO29TbM8TQYsPC3cESQiPFLkip5sV8xRKFt3xyYd7dBd1vMfma3GdTqkhmNdegkNWjV
	 ENCPVNiZkW7RSfVZce8jsx15H9VuooZRRAYjLeTcy36p1uD7ZESkNxg+oyFDPVEqkE4U/
	 T/Wp/pSEG0TM7v9xOVV2FZ8FJl1A3OIXFy4azkQxvkRUubTY0lGdUsGLNhSIBun6Tkeub
	 sjj1Cm64NcOlsOSOAoHVqXGgpkvaJKjHmfm2IvX1w5QGkQ6adSgqfBpdyr2i0M2TF4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531700;
	bh=tb1aHkytVAMH48Tz32COM6y4MBtfQLpWNp/tPxyQbuE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cQsxccp/tPi5vVz1LXf3Tv+V119eA30SmWzGQFSRPqpf51TMaau8eDXrNVNbgcrrm
	 ME09w/bStEOtod64EIX/EMktIYYWtnGcw94/BjUYAUW9nE6PH5Wz4UD1jmeCR3UBjh
	 ADeW6yL4AZkCmtSrNDo7b3RdLuOD3TYdNlAhhExPzXIJzN5eTxco4f0DazQ/C2GhdS
	 pOW8i0T8b6ebSdCr3h8DFb+3xZaW1T9wBqDcePkGrhXVqNcMwYpthflSGf58rjjGYI
	 8ozJZG6qeoiE8M2rE0RTiZ878LMSKDM1bnjNTAxML4GRLXiMYeqS43jxucK/NQ5N5P
	 V659q8xILvlQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A5080E34;
	Tue, 20 Oct 2026 21:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD7A3A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E2E360730
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQPCt0eK55ba for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B540606C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531696;
 b=QrXQivjtAKOU7PIS0WTljjIb9MNy8NAWf+Fo8dMCcshXj9KqcmWAVE7UE3tKFNhq2dLc
 /Cm95msBwP8HFlY2YttgnQ67H9LYnn1/YZUCuWTtPETpp8C34oFGvfKzjjuIrXH1AF07I
 MuPAqxLWbU3EjEEzohJ1S7UhKwVx4ovwLTxBpQRj/890HBUckxSKM5s3ItLLS+XKXNA1Q
 E2pQIBbvLZNLvozFSHymwW3nOEcyWLy6jSkiuzfJAn9vlo86yntw6PoHwOmfFqxO6MCTD
 rprH0zDMfnFRf2g1bREokJDes2HFiv5d0QmrYu7RGyj/GtcWHY9sFQnTMusj2IUoiPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531696;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8TCAHJtlwMS7anue/OZXx/1n7nyOg/GOHyujywQ0xHo=;
 b=C+mTyeO4tpjOKxNnS8OMvLvFlWZCzl4Y7asYywLklDWrXlwqWL2bxuUa06MdiOlyY3Cq
 eDs2noKHXRUfT0s4hyBUH1/puOH32FMR15IKRNJ7/mkZlcJXwtO0x6cirBJuRJ0Q9UEGt
 MtYEHbA/49BDJDM2kAwXv/5cdaUt5QtE0Ldzf78b6xANMz4sEImNZ7VVOZ4Y6DUH6damV
 7WZy4ocrbkJUUosuiYpHedEnzJJDiARHBqDEouU5uWPW9bqKLoPe7jIo2t+SCSztJ6WM9
 sY9NK46LDLqGdjpfmqK9CKrtGHUFCKDuIktDGpeRqW+QT8VfPjDEh4zngaQWPm+HT4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YEgCtDc1; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B540606C2
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:28:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DAAC8C5CD64;
 Tue, 20 Oct 2026 21:29:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 18E3960393;
 Tue, 20 Oct 2026 21:28:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDB6210328D20; 
 Tue, 20 Oct 2026 23:28:06 +0200 (CEST)
Date: Tue, 20 Oct 2026 23:28:06 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <atfc4vXqf-6BsqhW@windsurf>
References: <20261003052506.486458-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003052506.486458-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 5.2.0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 11:25:06PM -0600, James Hilliard wrote:
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
