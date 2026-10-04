Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F851CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D93AE80DBF;
	Sun,  4 Oct 2026 16:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cPdU236CRjc; Sun,  4 Oct 2026 16:09:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1903880DA8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130157;
	b=OSe+SgCQElhRrcBtZ+LzoMweWySRRXWODzzQoTkWnHZOncChS7hwJfLl4qfBFsSu7rfl
	 qEkdZnkUgONRLFeFV4kLh6xk0ps6YYuJ9bZeh1uQlQeS5uvCuA+AVxHcs5E/lTvqG93Ik
	 985AtfHzTb4pR3CylbMc7SS9gJebsccCbczUqGj53qWyzb01zRkwobiw8lUXkR/vcc98b
	 iMK4AFQoLdnS4rVtjtIkYUt+/w0u+OBAi9gVK0dROihl64st1x9E3eZx3/N7lcr1l1nfA
	 uvyL9wADN/3O85jTjihibI7J+As4ZYgHLmHCdphNSXZx09xpcEpsalCACu1s3SXOTDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6oCkYtnm55Mn4OPYtZSyJDByNoXOyI90lL0B7nwC0rM=;
	b=IARnL/202fpoPCBTEQwXA+H2g9Rf90/mQmm5YBJiV6PSNJt1a6RY6TADTMXMyS4fsVXh
	 01qy09tZMgceHCIwXX5NtJBeorqYvg0hlcTgiYbhwuPn++ZErLbIIK4PJi/jgbugqAZLG
	 YBHqvROtx9Wvhdg/1gWKkt2kHTxcTroWtuG/nODfNs6vDuz+DHzYIL3d8wSUFpaNavU8i
	 +Nvl0yuo9gijFxtprg9wxhX4VeUI3FnZw23u8A8QsFmjtTzlqKlx+E/nCjDxgPv8Ku1Kt
	 5z1iOnvPPCYXIEA3Xsw+vxkfXRZtC0nfhTwXLEaObleDVFJ4st2mEtv/Nb70ymhhRnA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130157;
	bh=6oCkYtnm55Mn4OPYtZSyJDByNoXOyI90lL0B7nwC0rM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qA7wIQ+i/imEdcDM7MnrahwdJp3jfvVf6ZDvpVNXeN90unqCghjFS6CU9eGUqRW8I
	 9CysI+VDkgLm/fTOBIJQxEle1y35BzRWBD1jdB9CmhsPp/vvuUSEnCi8pnno3+86Hw
	 1tUeFDwezKdwI4bJpXseeSCJOVHaIKbm1PEH9ZB7fI4nRkapydHD8X36DhatFQndre
	 wGfH078Kkz/GepZzkr40uelQY9Z9Wkyl0jDBtjw+QuA5mpKltNs5GmXZAKiBQPtwuX
	 fLzRBuHxxdEwHP/x4WyVsm0WroT3edrGyeghi/MZXikd87UdSIlx4ZyRiGx8CI3LN8
	 PGeFLM4QLQ1rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1903880DA8;
	Sun,  4 Oct 2026 16:09:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF1D2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2294406AE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNzSHBrRg-kH for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:09:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DD64A406AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130155;
 b=RYk4UUP2urPzlOTlIX45Xch6wP3Vf0hgEm/j1ZOHp5K7WdkkCgNdeSae7QePNHq3d4Ry
 IfPh19aQyPi1kZZubTAnvPvIcW8lc9J0p5HjmA1c7xKA0VoHUa1OAiJ5YGPS1EMelQ75s
 i6X/kmxo6JP6Y7/nVJHbzaHoyVAMIdFa8//gbqc1FSKDW+Hlsv5aeV5JwvyGrCztx3FvZ
 +NBG3RCgjQGoddzF7qwYdZP+S9QiX17AX4DeUiherme9yTRcOBeMtTb+G49JsfANt5jEa
 d9+OdfC7gJsyX9a2XrqWhvdrvJfBKFpzQfM7/yPNhaJG8npQltL8Gs/6euUNkIA7XSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130155;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Hrf27E8fIiF2j7dQz/wvRnPGNbBqp4POH46pStzY5+4=;
 b=ZwHMB3jadXpbtHuATBCDZgRLahDm2F5HynuekcQ8WKMqFccKX4rtyjcAzpZlCXdIQLpT
 y5fHurHeKrSWnDMXmA/c1Bvh7rnrDEot6BJ0CEsGX1nWaw7591ZOcEleH/USpWrH4M0+U
 FGmGIVEF+hPOayGvtSJ9LtgZi1RHeWk61K6DWXWig12HuvUHmxQsvrMzeQB12O8Gi9VMz
 iq3YmW9k6Cz7mB8cTB5DmOEhcDZxPP0UtjaZqLtcJRKhz88U7af8YCUyRer/4nnYQ9snz
 MMPpfy/oQu4Mpwx173fDvO9AIBfCcf1l/99JiIM44MlXy+tAzT6Ro5/3Q5jdSqBSKOQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YME6JQAE; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD64A406AC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:09:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DE4E14E41163;
 Sun,  4 Oct 2026 16:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B3E80604FE;
 Sun,  4 Oct 2026 16:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87E0010328192; 
 Sun,  4 Oct 2026 18:09:10 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:09:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
 =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <asJ6IYUBrjCOv-O8@windsurf>
References: <20261003210833.735937-20-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-20-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: bump to
 version 2.1.3
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

On Sat, Oct 03, 2026 at 03:08:10PM -0600, James Hilliard wrote:
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
