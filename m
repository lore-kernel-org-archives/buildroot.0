Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B54EC88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F871806BC;
	Wed, 16 Sep 2026 18:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a31nDt6kI4JD; Wed, 16 Sep 2026 18:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7835180D98
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584729;
	b=WKX72aVCwnecy+q3/Qccmgj84DSjcYBog5YdORNZfN6qh/9gujeQw2W2XLUAWux38Igb
	 hcviS2JYOLOHcSe1hVon2beNq5Po+lJ6uW5eHlakzoL8TdEXXkljZwRIek1Et6H+4/VYA
	 Ze9FcBNR9Sn2nI1828ehy5PBaXk/cx8bbZERNNCCKgF+jujaNdVUm71dyyHScNYIcyrgk
	 CCu3Nhlnd8sVqn7LBhgRIXV1aRsIVLfIOpyJ+v+dzVOlt5Wr64QlYdN/p2mqMapWymoOu
	 qHqzQVfe3JfsleS7k8W8PB255q7m0JmXCsCZhodgZqshcP+lBwVfFEuYgXOWfzJb0Ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584729;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FVSYdkZDxcvLKkMcQKs7NkWiz9kGjMbT65qgelliw54=;
	b=gpL+5l4EDsZfi4swHh9WYJG9I5z/10ona8cexUNobOETrO6/k2mvxfuZ0/aMjWC3q2r5
	 q4HrdqskTh30ecE72I/4eqX7M40F2BVl7uyVYfCxLwa5sbxZg2LoP5g5cRtbqJuFHaUck
	 clwNFXYUnsdDiG61fMoZSWDAtarIVE3M0ZMXgtJjBgzmzs9uFIdVQ4V7heVnxSmgsl3GK
	 pzeSxHJ1W7ydAveAjD9AZnu6KGwedL41qKiRBxRs+fBqC5LC4NsFCFq2DPOxR9Kq6/NrF
	 SvtWDdTYSnSTl+AspKWjgN1ODDU4wVhjCXa0kM6otPQdRGjRes1YiPFMV0WTfkC2FzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584729;
	bh=FVSYdkZDxcvLKkMcQKs7NkWiz9kGjMbT65qgelliw54=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=keSo2LMNksbTDos6p9nJQkG5p+uTIwTMdflgncEHDvN4cR1R8JzCbjKNgEHTgAWt0
	 iUynBGfcTmlY0HLvyFQ3dsaA0fKj5zvqjLMV7Aby4lCblA1fupmqwjOKD1sw4wCUYV
	 BLU/ImekxKk7PRb0aByvIcn8ajR+1jkytUz2SIAEiMrMSmNAJb7JLN+nGokoyHCwj3
	 fGb+xS4wpshWf1X9epocpse/vLeFj8i8ayZK7wwKTSYB6CiKsftYiLU1mN9X0D/I04
	 9Na+cWsuSwfvdT631JTLJmvVG8l4KytH4/tC7T/Cjwqv0VKE4Rornx8oZ9H8i6jBem
	 KZHSxhwfpX6AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7835180D98;
	Wed, 16 Sep 2026 18:52:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 899BF7AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE704008B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3LYJEx1Qnzl for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:52:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2E0AA4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584726;
 b=UV/UyVeL9SN8iUYviEtRPVLLWch/fCh/64Z53Wd2A/hr4pVJzQ2B2fCaP15XPLhWB15q
 28+pX1lVlCYQFIndQi1wanAEsUvuCpnXVBIwIR/oKg5VJ0/vqhj9q3EBIkbZ6V6taT1vP
 Jui8sS7UnCwFncvVaCX1nEuO1CHcUpx2YNVoLpuqhGIAWFFJd5I5HwbKQ7+YSQwaf1lpn
 bvT4TijQAwcw3NjI1wmF42wlB2GeWltoTRae/yb7Eg0Z3SkYIIEeyzQNVN8u9yhIfW5D3
 rBBvU7vgA5Oqef4cGI4x9FKLw4OkIFgeX5uxCGNoD7nRDeqg/f1kcJy4HtzPScAXDRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584726;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=PmplgBkcppqlPOAy42mDJDezVXNMk6Gg/87bf8gxIQs=;
 b=HKfKjcLudUwcE4Nf93eCFUUFuvSr/OhlsOnMb9Orj+X0CyjjR4TthvpHoawFzSQIbRPI
 iqB/fzjTrJoWvHjAcHlI33/brQ45O6VeD9Luh9YFfqy7BiJRf/1HSXijQg8vLCGJHliG2
 fnsSS3rbdVhSxj/GcOPOIwQKB9H52sYbUi+3BDUwRcd2xa0cDtmi46YscttDlpwLfG52t
 2MvtN+6PJY4eS5TE2NypbXQmqih4q13W1jG8swVTRrfEL6KL/+aqXW14fv00Z7hQLcstJ
 mo3ApbqrwYgAZQWTS1POnW1SIiZRTBXTUPQ2DclmOTzPcRbhf296cpYYDZYCkwHin2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Yv80srM7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E0AA4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:52:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5CB714E40747
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 300B860337;
 Wed, 16 Sep 2026 18:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AE1811C7B00D; 
 Wed, 16 Sep 2026 20:52:02 +0200 (CEST)
Date: Wed, 16 Sep 2026 20:52:01 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aqrlTdOwjSMGcrjQ@windsurf>
References: <aqfIorWR8_0zlvgB@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqfIorWR8_0zlvgB@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libpam-pkcs11: bump to 0.6.14
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

On Mon, Sep 14, 2026 at 12:12:50PM +0200, Waldemar Brodkorb wrote:
> Minor bugfix release, see here for a Changelog:
> https://github.com/OpenSC/pam_pkcs11/releases/tag/pam_pkcs11-0.6.14
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

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
