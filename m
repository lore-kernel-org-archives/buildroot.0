Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F0BCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0101D606E3;
	Sat, 10 Oct 2026 20:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joL-ZI3T9cdv; Sat, 10 Oct 2026 20:34:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA1A060632
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664483;
	b=tTpnSaDmtN47dtxnjc4bbKqZc643tT9r+yQBVTimApL1UIC5tXCP1IJmcT0Jdfd/gCBQ
	 Os1vhElTCDLj+8B4YZHe+E/IOtPhVdbYg+9hAhramghbNuwblxh3KnUhhHO6CTz8ctU+r
	 RNtyp7WTrCGyufk7PxyMwVqdwluO5MbnSZ9zpQtCUWbwBgjvcl/PkQpjm8pmwD0IrVebv
	 bJAQ1oc2BBwjQRAJRXMZFBB8bqa43NS2x0+eUd7302aXsJmo7H65GbsI3wgN8t5+1zu0K
	 ypgT+ptG3boq3/EO9cNw6r/8dk4+f544/eYd5xGiwzBWNRCbjkd+tkZONKm702fpO0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664483;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rS4ef7dmJ1+EtDW8DWb1NegPzOUcIEOfoJvGJ06P7Mk=;
	b=hscx8Mt5m+hzlmtGixo0BU/aYzYSyH5pUrVYyROKdQGzCjPSO9CQb3nP15Pa2Ia3rgCj
	 qbwgzSODF6/+BL2U+U5m3LtpPg2A4U0wNtccVPr2yK1MLkI2eU7ypV4xw58zW8lysPOsE
	 hIG1rgvNi9xH6vUW4aFy28tgZ+hDGUlWhivSftLFMa1b0vYnr9pqtWC701GSJbOInHMll
	 KCHF5LHb4a8kZo4g3TZrKy5pvXzFb7P1d0NTQ51snjAiRy0cMygROuCjvxe3VC6nyHaI3
	 ny/bdCrHfHKSY0n8RqBGg7q691vqbxc05xixJNOcb9d78hmORV4/JDSvmPNATAZoWgQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664482;
	bh=rS4ef7dmJ1+EtDW8DWb1NegPzOUcIEOfoJvGJ06P7Mk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=laYm4LM2Gai1ztpIFiqA6Pk0vX2Q0cSwDFW1AxlCnLi+2zZfQamSXK8S+Udtld/Pb
	 QGPAi3tQ/DDEZYwUTnl+mGZCHUXQGNrBlwrKRT0KNDJiknTtHINEAFGkkTotem1gj+
	 xP2R4lR74Bz75AbgTQGTKiuBAnGo3CVNOKIo16ThllhaQ/ur3nh/zFcnoXFNxaiSaf
	 3oEA9fO0DkpFrgNVYu5C6P0qQnuACQyx4zcOJ7uznS+gv+3jbNcX1BLuxW+gtvXExv
	 RIs9lC0Ine347qlNBihBkt25FGc8r6c4VO5OGH0Jt1DmRpmqvVW3EIyQn56g/28DGt
	 OLbezkwfjgHFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA1A060632;
	Sat, 10 Oct 2026 20:34:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D70B3156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8254810C5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEk74Aynv6xa for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7DCDF810C2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664480;
 b=lsaRHZHCOKeu66SQmupi7hao+Niv2E27eesprGN6watsXkRBcv3Ca/vfkMpGvMw7DGXN
 P6OCGFaL6sR/ynHWjd5FnyPs6iaYPDDIDZmVtI1AjgZxtj33nlI5H6Qs5oM/X3BoZG407
 gDUEANZ1a8T61Oo5AUitkk1YFv4+kD4aaSf+rEeP4Nt/uaXWItQWSYBE6kvVhe/LZ8iHN
 0v0q2tE0qpWsFo1r2GlktRrDQpxPBX4JsYSm0vTllqoXSS6c7bcl5Q2z+TEddCVOF3aO9
 q7gatkJr0ut88G2IBJwL0/GyKgVkvCOK+Tm3q5q2JNDtXsv9qTG2U7xQ5KCiBKoUKRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664480;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0ra8nC8TXk4zS1qxzfZKYSodjO1PBCpCo27SCObOYRA=;
 b=JPcb92YJOFqOFMkQkc4WiVH9wS4rX3Rk3geht9Z5W+oWEK+MBFj6ruD+MNh/z9dLTRQl
 sUxjA0I/I99i9Qk7jsYJS8Vfc73pgQZJ491dFXYy9ZDHgwpIbeLceC/IN48CU061xuprV
 rzFvWBoWklg24vg5NRVweFsB9e/DsLacQvhk8IwcNZ1BSkD8ISs9bxnYRcPP27oLh87bb
 Pt+ZKqh2HNMY3BzlylqXLLmGirlpgCTp3sf7pCHAaILrZYU9oIHPhAvMb7UbdPMo+88Jm
 2u95vqB8dk1QtKL3fEZgDGHkX7XhKrKRwieMXTcOCC1qCIdQOyi0kujI5mYijbuyROQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cUdMGCLJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DCDF810C2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:34:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 482B81A11CD;
 Sat, 10 Oct 2026 20:34:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0E7096075C;
 Sat, 10 Oct 2026 20:34:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5E4111D70985; 
 Sat, 10 Oct 2026 22:34:35 +0200 (CEST)
Date: Sat, 10 Oct 2026 22:34:34 +0200
To: stephan@asklandd.dk
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <asqhIhzhU4O5knwN@windsurf>
References: <20260314232106.2944800-1-stephan@asklandd.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260314232106.2944800-1-stephan@asklandd.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/util-linux: fix mount helper
 lookup path
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

Hello Stephan,

On Sun, Mar 15, 2026 at 12:21:05AM +0100, stephan@asklandd.dk wrote:
> From: Stephan Henningsen <stephan@asklandd.dk>
> 
> When using /bin/mount to mount filesystems that are not supported
> directly by the kernel, it delegates the mount operatin to helper
> programs, e.g. mount.fuse.sshfs.  Normally /bin/mount searches
> these directories in order for a helper: /sbin, /sbin/fs.d, /sbin/fs.
> 
> In reality, Buildroot installs e.g. mount.fuse.sshfs into /usr/sbin,
> and as a result /bin/mount fails to mount sshfs entries defined in
> /etc/fstab.
> 
> The patch changes the default search path at configuration.
> 
> Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>

Sorry for the delay, I've now applied your patch. I hesitated a bit
between your patch and --enable-fs-paths-extra=/usr/sbin (perhaps only
when MERGED_USR is disabled), but oh well your patch is simple and
straightforward, so I went for it.

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
