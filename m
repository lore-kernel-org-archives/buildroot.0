Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFE4CA0EE4
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 07:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A0084884;
	Tue, 26 Aug 2025 07:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJzyYq0TXxii; Tue, 26 Aug 2025 07:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E5CD84878
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5CD84878;
	Tue, 26 Aug 2025 07:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD508B0B
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB2B41C5A
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Fftq6sRvZNK for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 07:00:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 947AE4076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 947AE4076C
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 947AE4076C
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 07:00:02 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 3E0C6BDE02CC;
 Tue, 26 Aug 2025 08:59:59 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 06:59:59 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Horst Noecker <horst.noecker@cellomation.de>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.73751.1756165330.2108631.buildroot@buildroot.org>
References: <mailman.73751.1756165330.2108631.buildroot@buildroot.org>
Message-ID: <3a19733885c4da8194cfe95b063323b3@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1756191599; bh=S+M7NTH4zIRFvL22RM4bSWQYPxlLqFoMwHJI4v5DnCc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=V4pVDiYq9bR+GF1pylKb3WnVH2/H8P61soaIhkRbzLHcqiupqrD6vmeuNy1l1CKou
 4B/zmCpWmXDXLsRI1XUINcMHrYuI1ayGXTRK5VwR9nsyf/HPsmOPF0d9NcVU3ysBFf
 51wPE3PFmSWCZoDcv93MiOeAqkPsLpdZYAGx7lkg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=V4pVDiYq
Subject: Re: [Buildroot] MariaDB 11 for buildroot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Horst,

On 2025-08-25 17:32, Horst Noecker wrote:
> 
> Dear Buildroot community,
> 
> 
> I'm trying to build MariaDB 11.4.8 with Buildroot for Aarch64 for a
> RasPi4 / Compute Module 4.
> 
> I've been doing this all the time by downloading the sources,
> configuring it with cmake-gui, using the toolchain built by buildroot,
> build it and put the binaries, libs, etc. into an overlay being then
> packaged into the image by buildroot.
> 
> That worked fine for years - also with MariaDB 11.4.x. - but only for
> Arm32 (ARMv7a, gnueabihf, etc. etc.). For Aarch64 the only version that
> works is the latest 10.11.11.
> 
> I've also tried to adapt the mariadb-package from buildroot to have it
> build inside by builtroot itself.
> 
> The build itself works for Arm32 and AArch64.
> 
> BUT: no matter what I do, when trying to start mariadbd (i.e. the
> server) it gives a segmentation fault without any further hint (in the
> log file it only states that it started and immediately stopped).
> 
> 
> If anybody has any clue that would be awesome!
> 

Which standard library do you use? MariaDB is a C++ project and uClibc 
does not fully implement thread local storage on Aarch64, which is used 
by C++ exception handling. C code works, C++ code dies with SIGSEGV on 
the first try/catch block. musl functions correctly and glibc should 
work.

Kind regards,
Andreas

> 
> Kind regards,
> 
> Horst

<cut>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
