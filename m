Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100ECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D74460FB9;
	Sat,  3 Oct 2026 14:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmIUgEnDFhzy; Sat,  3 Oct 2026 14:08:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 36E9A60FB6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036538;
	b=EQb2otfp5C3NqDolDerbsXIP94gWti+Ill1EdmqyZ8Lt611Ix3qdVPRymihe4kNZXCd+
	 zHgDEggoBiCohca5xaBI3AgR59siSaZSDvl+YmLcLqbu1TkuI8S5IsFXvZ7KsVdjMEmKu
	 Dndg2PVjXQyK7LAOjf/KqWjZ5DY4r2UzW+dWU/2Ft39jFY8TKbBE+sbvCkESMXtoiqbmp
	 LOl7PkCnTMxktt7c6kwj4uWHctPL5gRBYX78u79MlBG9gcsLUlnA9nVdUKKMKjH6zh9vI
	 4oDj6hMdclcL+1bV1UreKkgOu7b6bz5UITlVNwuna83UYxUI+u/Bj3mJVZBoao4/2Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036538;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3UlQohdvn35hZvhS5Ya0NslAab4C875M1nrm34VpEhI=;
	b=skh5cqvILPluA2ZCLLkh6moPQvykfGEtX6a/nfXR8bNO7SofOnI2f9LiE3fXoTLfq1z/
	 qRweDgrYhTLZKvYhJrhClBLySaMwPi8g6fGqkrG5Bq5yVGgDjVRSf2f9jTN3vRaGbGRcR
	 CAcDNFnkxuStWRltlC6BqHTiUb4SsAwtgLiewiKGH0A3lv0hLUlX6KKhnH6uzMRslXXen
	 g12zv0rQ2HHc2UuzTBRtjmJE5qPhNPAsHgrNWH0l4xkwmeVPNCWh091eMn/J9YaN/Ajzv
	 EEMmxy1h9w3vesgYbvKw9PGSO0NQVhOwTMUTvnM245E0vhpCFRAFjWIVu4JEYoVgz7Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036538;
	bh=3UlQohdvn35hZvhS5Ya0NslAab4C875M1nrm34VpEhI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M9OW65mcgm8Q1kaZCJAD0BLqjwRqbnbyER3+a6MeBgo0OCbgWuqrPTwuIPOnvXIA6
	 XzAihSui6w9TuJ4gaiN4P1hSkqVAAzDxW+gO1KfgPnebGJ9vjAuGtUbnl22jQQ53S/
	 1V3xIJPzOmwlVsfPojZsPmGbPvqPxAd9Lbcra/YniSLzynbteDy0GK6A6O+7YlQGYO
	 f/jMhqJCYF+mkxFrK2rZkMZzfawwHu20cdvqz2PJ6vHkEWXLMdfygqyli+Uxlrx1lh
	 Z+YgjxjTaJoKr48tHzupmCTuMOCL2at7gCmHFendZGAUQlLgpd6Mtyvtre9pNELo6V
	 XxyGrtZ+oqr1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E9A60FB6;
	Sat,  3 Oct 2026 14:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E45C282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 448BB81836
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NIRfvaI17md for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:08:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 640AC817B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036535;
 b=qc6Da66ETm66Vl1S3r4yKM1xRCk/bOyJE7EPmqAG/ZW7ohGajjkDPojUxGcmzCMoBb70
 U2jP2XEU9eFeOXxtqrLZe3KkeAnDdYm6Fg5u6+KkAPDGfbQI/EJdzjwQhxlpEU0jKbIab
 4GMkMqHjBzSqGzaMG+/IC7eJYmID+E59Y5869PS2G4Ot+r/Qgav1B+tNstiQe7D6eaVbD
 EaR2i2JGAx5qdenZaLtFr4oefiv7UfpPEXhiWvShCeIOztKuIX+OBzJq8yFqFgGmeuG4p
 PV0/g9PcmYdgFTqiQDBemExu/hYX75zYORYMzcKVZMRy5sx1o9ND0ovrNm+LXmnuAlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036535;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=W9ljGYQe9bsuEC+hbMgRdwp08IJXqTbN2ePRlKFCdT8=;
 b=AsKtdSoChFObSTiFB/aZv9wODKallgdazJf668HV5azrWDe3aiCQwVixfuyyOCND58+9
 7ui2jKW9WO0JVoMcdjjU9WcAZGsJGjprIgkoaOQ3Pi2+Y9hr15VXOt7WzsyIb6qZ51SN9
 Eab065f76bPx5aLh+yC/3PZFq0/DBp8TSJ7cni+rZdirvgoEZwucAX5FyLfnztNrD05B8
 P4PQUcSXzMIv1D2feXYZ54gdV1cugw5HOnhdoBz5x84g0PQp23BkWiLBwD3imfsvSi8ks
 kXqb0io+4mqy1dPoDbBuaMSP6mC1rUmxETeQZ+9VYvlF0+ra4YeYMr4GS8VF9FWEKXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RmsIx35k; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 640AC817B3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AFF071A10E4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:08:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8529C604FF;
 Sat,  3 Oct 2026 14:08:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE6271032827F; 
 Sat,  3 Oct 2026 16:08:52 +0200 (CEST)
Date: Sat, 3 Oct 2026 16:08:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asEMcGJkHWINa9es@windsurf>
References: <20261003113701.442358-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003113701.442358-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version
 to 20260925
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

On Sat, Oct 03, 2026 at 01:37:01PM +0200, Bernd Kuhls wrote:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260925
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
