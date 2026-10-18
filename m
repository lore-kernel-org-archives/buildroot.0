Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A440ECCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BB140781;
	Sun, 18 Oct 2026 14:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPLok4T8s249; Sun, 18 Oct 2026 14:27:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F57040758
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333662;
	b=D0pXvijKbQQYI7GgmsHYKQmFWw8XsiodZg/1SnfRUOhtGoLwOOG/Lfru/GYnxoyFawyL
	 rrs3OyvTpnlhYls4F9DAU0q5E8fNU084pqsXmUZaKgpG7tKw4dfk95agrI5eEMt1Jkxwm
	 A0291pe54oGcJ8uikYI3FIoQDKFw00n7F9sPaFfdJhCETi7XHsp7NjY/w7q23Bd0Tr95D
	 lQxuYgz8fFQDHrXuurrHkA30y6TAkBR9PsCWSOuNNT9U/Gf15SlIdu4FSsW7ZX6wwP8rb
	 hbSgEYWo16bws9P4yl7N4XUh9inBomfS8ttkf/tPp13S08PNZEQX8WbeCP5LKIxzm6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=g5mc41lcFySDBbCUq91R4Nd59WxSLgU857x7lgi/+OdiXkjKiMc0v8MtENFJrIveLk5I
	 1P5jRehz32oUi9lOh7kAg3CjiJPPEyIaShUgY7qYAc+N1lUurqoc2Qm3q0c528WcthIc5
	 nQ6CTGYhfQc4eXIyFA0W4h3h4WDA/35dirTjmtw2d75crfsKamXQhl6RZLEMNRhv8QYkn
	 mQgUJ4FDVKVovHcDD7CkaBsU+Pib4A9+qzwxxmNdx8xOaUefBg8cibComc0BHxup3J9s+
	 vveBoLVtnZOXA9hGDE8Jwk21NYp/Z/TeA21Q2mnotXfQakwZaiR1AfSS2coxuaviF0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333662;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jDJWUTyebyqMsc+A+AGYVRPYcOopWAVOtEenaOvf01scGtiYXj9ogNiCt21eaLro6
	 DbFEm4n+3C9x7mTGwH2YsV4wCsDyQzqXTI28v5jdNQzj7Isv8UFtXJ6dinJ5eF03dj
	 WuNjQqN4VSewwQb3Dzx/1jU9YXEtKhyUIdXmiIOxIaVn50cYmmz/VJoZsqHk3jLlbE
	 VKvRpI+dpSP1oo0ramuHgR1uaWv7hmOC0a/ZjIMzV7L6puorvuUqxbfaVWaOvRd+oI
	 APcSYQLcDKeJjspk5AeHCeXRnE+yPJ8Sv9fMKPaGcJEygRn5vVMRP2YhF2LQo94JZZ
	 huP7nPNCDfEEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F57040758;
	Sun, 18 Oct 2026 14:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 601C361
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5195F4009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cu0-_29W0BNM for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:27:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 62C594005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333659;
 b=P3fny93oEfXQnpn1ujOlHWs1LktWWRS0bS1wWgGKdBVnJjO8wjFH9b/l87DPoLBTvXMk
 qwRo4d0j7XBcHnFJPoUlqzM6VzuwJiej5vP6vDXU87K0ou4pRAzzLtDoSw3WV6Yt67SDX
 Yyuhjsy1FsTSsftFhWk4GPXkyUGQcnVMo2D0T6Q2fZi2NXndGX2CJZ/3zebOFszudBvn7
 IABpjyTKIUSwVah451T23lROPSep581DO1gcNEEISkGzse/KQICGNh6x5NCgtLnP13bKF
 VKfnXH2IQwBgUaa0d+f9Cz0FqtLjdZel96c4QnnjHM7M2SdvvzIQ644BCFOXlrdZ08A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333659;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=NiTmfAhrgrtQZC4wbCjCwzIM/yHDpQ3wJ5hNCxbTo8zQHJL4+JKKzHzI4xUolk4xNP7E
 Yt5ZdaFZnVlEOC1YySdQ5Oxe7vWEfBF64kVwTMkO/crq/6wUyyf0TolBmMx5DhccV3/9T
 O4WRy3zxhtaedhZPA2j5uPsLZVj4eNgK47lK8Cjdhs2hz6EnA4Qfq/dKv1t8IZvBd5SeI
 t6sA5HMxBkl8xBOmVsDyPhv9VSvfL8czQIa8plW0lIWdXNdJ8PLeyITi6wTxl0rLLw/FO
 wo7cC6fRTpiHcr9oe6k0t5Dq0X3mz8rRwfgOsVfPY4076RhfF3QJlNSZDGzx/DCAMcA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qiNH4X3Z; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62C594005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:27:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0A1586013B;
 Sun, 18 Oct 2026 16:27:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:27:35 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:27:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-6-james.hilliard1@gmail.com>
References: <20261015215210.3426895-6-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <879e23bc52fd97a51af59cbf5ee614ab@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-fonttools: bump to version
 4.67.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
