Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A6ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B1881836;
	Sat,  3 Oct 2026 14:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44ChT5__Kxf9; Sat,  3 Oct 2026 14:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E106A81852
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036547;
	b=T+yhlx1xGqTMWskBF0xGnQwtk8n9AF88Hjob6wPukouvbP2vsQoS4wsqGIECkZqUHhpc
	 3RUBo+GIE04BHUiuvle2HKncmDJBOxjp2cjIBd1JeyLsL0ltM0Gq+FYwefpv6l46ldffp
	 HPIUrvMZhqnnuDNRXH+dQbMeLeneCguWc/ur9BO1cf6i+IHeH9ncisjCHErQPJnNJKBJf
	 UeyTRrFaKae1noZoDYxjNVBdSHd011Uy9LLs2zaybyPc9pRp++EHAAc+zE4Y583FsXuYG
	 r/N8RANhU6JH0d9VEZlqbhMjibMFyL0yYh+UChU4qzz4LWDcmmKRyk573BSjcklvPNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i7LMLeOhmbjdPitCcxJNbjhaG54wq0GlVQsiYVbWtCU=;
	b=o9XFmM6/TxCYPLRBRAvZY7UgDA3iLQq36Onvnz3yThjuig2bkKAAnV5yhs0I290gGMGH
	 tdfJjC7nu1w3tonNVsId4fdy8LOm+xNMcrl2rmQ3pXIm/I4FvfhbAKVYQx/K9ixB4qcW/
	 qxXfkto8KjicnE6ZyVacZ+i17cwr2Mdo3x5FvRvhEiKHEjqPPRGDesyZbdq4BEGZz2Q3C
	 8Zaq06S4ea/C1ZtkjmZDhdQtjwi4SvPh4xPib9Xbo3sPW63odfjzvWgNJjmpeHR8q4sN5
	 T8K7Wn8I/6+DoQTLmqm637A3+Z6FxaJ5pF5ey4yBNx1TVGRa5RCUNi+5nFtjIRlOgfw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036547;
	bh=i7LMLeOhmbjdPitCcxJNbjhaG54wq0GlVQsiYVbWtCU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ny0uF+RWPynxSVIeUwx3YDOKYw+YvqKRGqmxsrVtuydlp9WCwevAJDS/xvFrcRVOZ
	 45QWpmOsYUiMVeD24YvbxQTmVW72m/6n52tAn6MuZJH3kBk19qL/I28m1cdkzln0sd
	 UTeVZ680juRhqEDQk58Mw57nxEghvSMS/CqiMTH0Rr1IbZ6Fcj/MY9z2gmKF287t9C
	 MpmbS5v0k5+Vx7YRJavpuNBahPUxoEhBmk6ldJLY2AoUjR6OUXWThvSP3DimseUnlm
	 vE5bDD01rjLxNp8rvbgV0dacGX94en3DPI6R3mwK1+Scxd1nXlSk1iolo61w0XqW09
	 +H3c2v3B7vzQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E106A81852;
	Sat,  3 Oct 2026 14:09:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54382282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A1DC81836
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRWNidcwRb91 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:09:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6D2BA817F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036544;
 b=NiSyMamIube0NGJLpCo59h8n6Q/pwQK+TApsQCqMbW7JIyw7oHUSFUPXhz6e4Fb0hT9m
 PmbavVOQZ/7jqLXOH/7qJJr3ytFRec09eHM7IQBEDtbOqL4+Pz4VsjsuUXCpSfhFCBhMt
 g5XtdayWWypq7Z9LgKVZlLju8xP0t0OgTvoZv2RVCyz/tqui4GMvN0ElpNDLgJcFVZsec
 S0LpfPUvl8BeOpdLfCXIA5LmzctpYFHaeZ/kwWvmGwxEoloFz1bx7ISEjWs4gkxZcQ76K
 v/WPwSBrJhWGJNhEFHCIcFwpZlIm0PKl1X8720J6jT6ZZJJkTZRfvOgnYZqrRq5JJcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036544;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6PiYulGgtCWSNqkqMYfy2SU2goUhWRcp0KdNhGKjl38=;
 b=XSk6G2nXfzmLiQVU0FnMM+1q97j6KGwTGctt96OqZq3W1RSmvZLyzKs8/TEy/Me5urZp
 9VkLx8jA3bllul3n/ogHX3ADc36BHMmfkH2/LGJRi5fi1rUFcQGAEsf+FHP4QvqTVW9ys
 3aZE8GgFhg+NRwlMbK+EG2+tGhgVoH8vxkOaEUoIL/iV6UEgfuq5/4JrttVwbZsL9SBAf
 dPPzRyZ1tb1y6G2yK2SvV8G2q7jtywyJzV0/TLqi7ON0RdXSPZKUE8TG9Xvor26iBxKQg
 dQxJFvLAD+WzcLlHTMkP1BQBN54atc4BY9GoBCMQIUnyzhBX62yf2uPNOre2UM+YaEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RNevuPkR; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D2BA817F2
 for <buildroot@busybox.net>; Sat,  3 Oct 2026 14:09:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 09A3D4E41129;
 Sat,  3 Oct 2026 14:09:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D162B604FF;
 Sat,  3 Oct 2026 14:09:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F17341032827F; 
 Sat,  3 Oct 2026 16:09:00 +0200 (CEST)
Date: Sat, 3 Oct 2026 16:09:00 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <asEMeLWBrsJOB4g0@windsurf>
References: <20261003133922.122516-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003133922.122516-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/lua-lsdbus: bump to version 0.9.0
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

On Sat, Oct 03, 2026 at 03:39:21PM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

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
