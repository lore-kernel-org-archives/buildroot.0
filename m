Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA6DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F361608CE;
	Sat, 10 Oct 2026 08:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U336g4wYl-P4; Sat, 10 Oct 2026 08:33:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ED7066066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621213;
	b=qGkBb1fV2P94JJSwHTJwHdr3KMade9Hbv6bjCgZGHJBpEcZGskYu+rZhJ2FJorpVgL5E
	 9zcb0CzvbK14695EWys7X9afFnhETim5FJKsAJGld/xKvoHOeKlVfhb/4vIFsg8BfEMRY
	 jOWVKhZf+8Vnf7OZN00ySduX37EaivaG95VdbBhxzW2+uCCR5gqOfJKLGisTVFLtdBAGX
	 EI7c9T85sxfuS5ASFP0G/2y2iCIAsySEUZALvx3LGX++CWG3FgZcwCuw1ZDqRc5F0nUe7
	 M/vA1mKQrC2JyKb5qv7JF41u0rzg5FIG4fxcoY+Nti4Tss46hZJWwcUdfZqO4CHblVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=c8RP8KT+l3LYRvMh40higPihug60Fb6DI12lSCkeths=;
	b=Bn+sVBmHoD/Zbbzk6YL1LjAbbm6PEx+TBbkuktd2NA8AQUYzdno2/PvIxnSz4oyuzd0n
	 2Wc3rHmJ7Fzfjc1cBVU0YxP+KfGZX1hb35Osx7UYk710Z3j7Rd6IVkhWPhBXmReBqGw3g
	 2Bb7f3hihKFkcqncH+hUJCckesdLpV+RBbN8Ecg9GhTPm0Ptwi70n+q9Q+8hqQ0oYYnvf
	 TiqpvsLUWCQOpvcvRO9r8EWsC59kPiAuggF//ZIrnQ/+fAa3gVVf3x92nw9Ts3JWJGwfv
	 FEuSlJv6iWhJXhvUkYuTznrrisVVAWFfxVSfjBr+sXx8CkQe/8MjwRCCx93NYdMQJLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621213;
	bh=c8RP8KT+l3LYRvMh40higPihug60Fb6DI12lSCkeths=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TsBKI2T12HHgxn74gfQuInei4sxhP228ZJG/cmfvA72fjmvYaJ4UMvdQflqLLxrlv
	 6q2Bw1/i0PKG1Tc7GTWrXGvE2+OavbO3R1pdfWtMMc/txVD6pS1S8e/8b9r759ZykS
	 Lg4SSCvz8sEUkuZna8hQ7BlHBuzk28HZ/4oz/HWaurCbhAHN3xpgasXyk5c1x734OB
	 JF9vy7WLmW0kpb7OwhOSYOV4DE7Rw5icCCPdnjZ2NH+KFnSXL+ss/d+x47tAeSKDPb
	 DuKhuoiMU0rwN7WQN+axF06+1kGrZYze85+8AHJdW8OUserIFS11wBFM3Z2xaSSwfj
	 zJtMU5ld+uazQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7066066D;
	Sat, 10 Oct 2026 08:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 966AB1DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93EA0813CE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5ISpGGkxPdV for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:33:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 28875813C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621209;
 b=RmQLQb5YcxMS44Eg5GpNbYOVgc3Q/DQRvOv3+z+q2wcuNKAJIQYSrxq4SHwRqQ4X4++S
 6wXe5OGkcpFSR7dcm1N5E76V+1I8/HLZ1579wGZX8/eGaWxgIqEnxHoy/l9J6ZXaci0Ql
 KIuIDUbbnZAw0rPJ9khYml7jc6+ATIPPXZiLAoQuUwc7atxSiFvgVvEQ+nK++H5sTHusT
 35Mu1eXb5T4daqPPREcnrNQbcLHSFWwop7jURSLmhpYYuJc/pPkvBZnpF4LE1vl8/te3Q
 /e9HMPmxvFnj5S1Yyr8EB6JJoeB2OczQkipNh8p3SquAAIXPUXJqRITzNfCTdWFjGBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621209;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=NWCUQXAED491dRidtA4m0awrmjQujF6xjyySFCfSv9w=;
 b=md05OTxUMWwHvJL4n4bk1nnkuPX4u3FE7LesPa7avaSUrr9OilFCN9kgphZB7grSHMaB
 sufU/0zl99qipTmoCW+4T7lQQOmKQOjCZ0cFS86dsQD/aIlskOOfTQqN2EC9sBxkGzQeb
 kO148cNqhDbWesK41Quy4k99S6IZ/uq+I6lQ7+wUOP1fqmHLe/yBRyIbykeGLjjCI2Tfz
 eTBLMnhgtq/GiWfguZkpUqKfhqXpK53oyGskyKMGb3fIxFtTc1QWuzbM/Rc6wthilbcHh
 +HUIUqfA4by4hcZcJbK3AZVh2jcJlI0Mg7eq8fmtlAv0T6wym0K575h82hhMEdOPnSA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jtPB0QNv; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28875813C9
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 08:33:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 449654E411BB
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 08:33:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 046B16075C;
 Sat, 10 Oct 2026 08:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B215211D70211; 
 Sat, 10 Oct 2026 10:33:23 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:33:22 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <asn4EgwWMncL9NZe@windsurf>
References: <20261005134056.94384-1-francois.perrad.86@gmail.com>
 <20261005134056.94384-2-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005134056.94384-2-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/prosody: bump to version 0.12.6
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

Hello,

On Mon, Oct 05, 2026 at 03:40:56PM +0200, Francois Perrad wrote:
> Lua 5.4 is recommended for this branch,
> Lua 5.1 (& LuaJIT) is deprecated.
> see https://prosody.im/doc/release/0.12.0#lua-version-support
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
>  package/prosody/0001-enable-syslog.patch      |  4 +-
>  package/prosody/0002-add-pidfile.patch        |  6 +--
>  package/prosody/Config.in                     |  8 +--
>  package/prosody/S50prosody                    |  3 +-
>  package/prosody/prosody.hash                  | 11 ++--
>  package/prosody/prosody.mk                    | 12 ++---
>  support/testing/tests/package/test_prosody.py | 51 ++++++++-----------
>  .../rootfs-overlay/etc/resolv.conf            |  0

Could you comment on why you need this empty /etc/resolv.conf in the
rootfs overlay for the test?

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
