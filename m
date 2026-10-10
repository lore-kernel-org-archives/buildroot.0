Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447C4CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEBF2608DA;
	Sat, 10 Oct 2026 14:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16l9nwSLB-3H; Sat, 10 Oct 2026 14:30:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D8286064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642657;
	b=rpS1jjorv+4aS9lQbzBIbGfegzlYQeg/Xw6zBhHoydCofpt14A7OXEMKH95fSBXgOl/G
	 m560yaxzLBqaS2jai4B7xS5TGPyQZB876F1ZrCM/E+A3wmhi3ZLRgovkJvh8NH7J6rgXn
	 8gXGdgOPC7AvfgI1CQLwVlGL3vuS/eB+bfiCnXleDr/hw7pOKNVEckFcp2j68/iGn8aac
	 HLJSHvROI7Mf48BTcElQZeUPetSeJ5m5m6R2gKzvdTUoJzFbB2svQMDn8ME3/V5nuZJTi
	 E1WMBlC34ouyYQzxXhkgEvX2W8RDVbhavMpbix9PYF1pmN8TpAPdGTk+wKdAU3ejATQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YDSIk9ocGkgly4nRSxnNSCA9boP6nB5bTP+6HGVkBDQ=;
	b=sqHJ6Hx4ao/Yk1XGAeT29BcBSxCUz5eLRBgV1CQKhB6n/pXiU7JDWSzBJcuetselQuWB
	 bw4tngmrEJFQBimjIeQ0d55izrT3CoS8oWpyzNU6XEb12BDNOAVC/tJup48otvd5lSVVF
	 yhPfzzYxZthY6WT1iit2+P9sYxb8YufE+L4I7WToY9SivNVRFJ+gC1TuYregx/XAkxRJG
	 pUPdIR8WU7qOboOlPPpozSbsY6WkQ2ZRMjysOKj7MQ7eKwmd82iq5kl8cOxhQui0fakpS
	 tYOcG7X2bFeye0cIh9HgMypwGjUBv0vDSrYF+gFgdsIVYwWiDs1YhQ0jy62BEWs8Xrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642657;
	bh=YDSIk9ocGkgly4nRSxnNSCA9boP6nB5bTP+6HGVkBDQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dw9DjaOFHUv3CBFPTk3FnY0TZxG1XCRgPlIxiPYjX1O9cYdGo5PKBp0v+trEpiNW+
	 KOxBjOKCPAS7Gmj6DA0zE9W68AmLgtfXzCa9bV4GMyHKhoRPFwmr0iAfs/c0jCX/rQ
	 OasHjiVkSAFFakFCZRTq+abvglgyB9hEltRzHN+7mYlSIj4whJ4o3QRgIm6Cm1Bj6c
	 FKTOr5MfhpjhNYiORrQM1VV8fGJyKnn3PhTGtMAzBa1bYkha+LmyiLkSzV5n33jdru
	 klYPhjukbUjZwero/cDNY21nFfxQOVfZnpNW1ZUUivX7a33fQRaTeki4v/x6YV7eoS
	 CBQxpuSDzxldg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8286064D;
	Sat, 10 Oct 2026 14:30:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E6E8156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8EB3400AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ughzineMaOG4 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:30:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0B6FC40071
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642652;
 b=d0j99vvlcvv0gZfeKygsdcVI3izoHwD6YlYUVfVvX7YeoVMZF9G5FDqq1cFYaFSniuUT
 vJMzoGLgH3ZrYNyQIIMYWTMJU8aSEdQHGQ6huKDSNFVzvc79clJxIPibW8OWlMBBThDBC
 DDLJ51udjdieAz5uCUzq2N/ilUfilvq7tpM4tXqwcTNJoTNoG1gfrAfsX4220b9b4mgel
 pA0h6hCxip9LzgfBiFXgxRwnwbCOPG/EIpnQFapFQQjDVluoSBvjfWVGzvxVUIbjdhaEw
 ua3Z+wK2g0hnzdWzcEpwrJSs2snRI8GBDOw5SXGu6xMCdB8+0PR0JDTAyRKSRAQzqrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642652;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SiycPLbcKqa8R6GaBAK0ldQ5YHOctRLW27K57ihrx8o=;
 b=L0i1eECXoirTNsem9qA8KMw+9OULPrh8tnTt/uWAkk9bkYQgq+gFBOnuDPPHjtoju+A5
 j/9ecvRqM2GCK7PQ/supmq29OspgAlwmiaCuUms7NQco8uSCaCCW8kNaDE7VcTsxXQm1D
 TPPc8fq+fOZ4uthAbUr3aiLsNbqA+zPQqvLxgUaRv3hr8TmQ0N1jVrJjTZobvP6cUJA2y
 q1HOtzEqqFlCoXz2S0qmDdMPQkAGkhGYuPR+QktWYjpXntZWtzaLuwRUn6wGHxxv6BEjc
 nKnAIVmO3wfKpNiiYvMkiuTm5HyDcn6LJ+Oke7TqEeaRzPLNFM0VcYR5zGsb/QY82cQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zNZXJunU; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B6FC40071
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:30:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E20E81A11B9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:30:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A9E326075C;
 Sat, 10 Oct 2026 14:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A67D11D70778; 
 Sat, 10 Oct 2026 16:30:46 +0200 (CEST)
Date: Sat, 10 Oct 2026 16:30:45 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Message-ID: <aspL3CWXADiYIzh2@windsurf>
References: <20261002075640.2350126-2-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002075640.2350126-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/4] support/testing: sqlitecpp: new
 runtime test
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

On Fri, Oct 02, 2026 at 09:56:30AM +0200, Michael Nosthoff via buildroot wrote:
> build and run an SQLiteCpp example to check database writes and queries.
> 
> Assisted-by: GitHub Copilot:GPT-6 Sol
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 

Thanks, entire series applied. I had to amend the commit logs for
PATCH 2/4 and 3/4 because it was missing the details on which commit
introduced the issue. I also pushed a minor fix commit to adjust the
Config.in comment that was incorrectly referring to C++11.

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
