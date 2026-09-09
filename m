Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333F5C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 15:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7645680816;
	Wed,  9 Sep 2026 15:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4Pm32X4b_6d; Wed,  9 Sep 2026 15:02:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BB5FD80DE6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788966165;
	b=J4kKmJqNUtv75rD0e9m0CGVEPbJ+XHxkZ7Q9nkGDb11Ekk8V1jdn6XG5G2gFhVFbKs3Y
	 qGFZ1oOnoUtpAHhwSlpGngWY/OlqUfhAbcEwuCuuyQITQJF1ZJS1JubjwaokmjGUQYf95
	 Ea/XQJvNo/aMN+J1WEZvMttUZ3+Vk+BMjIZzddHnc7bjmqrVHqpn9NkZ3ooCgZVc5rODE
	 zByLvJND67GmFUTDnITqJznoTcHz4irhqBxId2fCivz9+I4cAfQpxi7u1ztoKa7SmrDLd
	 l/hOrJOtSMhpZovSb+wAG0dqf7njsyD+Xxcn8MHUry/4Z9ga7OvqaaeAEEPblwlMxvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788966165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=INolxX90yOodSQyf7iAWB5ulb2iOx9UftbHdODy7vWw=;
	b=Oo+oUn/nrXy52o6XeFN7J96YIMMruiwXQHljpT571c/qhCYxioPHMAruRPojrmBt5TUB
	 gk/4EfBDiMR6oLe6mp8HelxO9/lVXzdC5C4YbVORcFg/1tnIgc2RoD3BPydaz1PqvvCVQ
	 fFNycDC1zqZYspMayPehHBEWe1p4YEde1cqyOf88d8+l3PIKP3bB1n86eZX8kmiJ0mzCW
	 RgyATj9G2u7zNFcptbM8tLo+bwsUtGc300CvYQ+zSN/HWj75YAH+oD3nW2MHbsuRlUiti
	 2MruBt7Gaimr9pyVzSnkxbpuoXNzq6W38J/IloY20QZV+O6mwqeo/M2pe67agdGIwgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788966165;
	bh=INolxX90yOodSQyf7iAWB5ulb2iOx9UftbHdODy7vWw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GvugdxZOdw3M+Li+1RtyxpONdryr7bX/mh5wO+X+T8IH9rpIXx0PJ+Y/pCt0aiHXb
	 2jcc1Sw/lx2oXH+AqoszbI4YLfPaj89R+J1fmSA1CNPeEKl5XGCe0AvcMWRWzPOHcz
	 YuJreXT9Ig1jewjdchumqVLAa2Ki+iFUi8wjZicmbl5I8S69ddioACmunL7OaaqoDd
	 9Gr826z7mZZaIqT7+31psuEkN0kcJKC3SEcbQ22AGAprZR30baUc+94Y538t8Zb0iX
	 Xasn9fJjHpB5oUcAoSM3WU9kY3m9io6vWB0Q5XHHV1BWQuaxLHXZScRemYp5YsvJA3
	 njb/+s4JJqU0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5FD80DE6;
	Wed,  9 Sep 2026 15:02:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 970804CC
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88CBF60773
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuVXUpqZCadB for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 15:02:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15163605F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788966162;
 b=XmmsPJa0Gg0GwhgJq0CZSF6O+igEgJnuB/Bew4m+2Mt3nYBd73Zyrt/g9Op2OhFiMvTq
 OCRrY2ptbaKiYl5CUfi9zUVfpJEJUjqzNHtIq/KU98CEJnAqtnqFjsyVnj2PeT7x6rmxh
 V0ctK2mrOSYaVz9UTRvsW8VE1anZi/DRueGrMo9Z/qkQxOaRj9Ne1JO3My62PgFClWOsX
 wVb4CxJoGzm+AHWlueLUnI2pPEv1Lhgqv1frImj0HlCgycfak+omuxNBCVRId9qqchMog
 BSuS4gGEDe/4ybX0tEg0SSdFM5Xa7/UIneS4AunQo8xsXIbiUEy+Eq7ShBzRvKfVnZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788966162;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=uQqgjCfwWJKyEK2x47Y1gaUMKIez9CGCAcmvZgUm0PE=;
 b=dkY++xnsKEs/WxbZpoa5RJeGJA/A9TfqyiC8+ciTiyoUxSSk/eohDTbKDVURK/LfmR+T
 OBWhKm8hQru98miJDTcRsX6HV5WUCikq1tCHUB2Ej35MV7ELGOH3Qkux3uHoOfPbmgzoY
 UwQvXaV7evwkFPrOGU72q2UfRZdhyQ83T6PAmD+6jxOQzgtMkJ1VnrIEJaFw8ke57hcJM
 7sXrR2HvI1DKlS1RaTLhFh//KgVwZShozklqxKUJde/diuqktncTxa2G3KZ44WLl/nsfn
 2PkFVUCAQFU21eSnQEWmkH+3M4j2WUtc47ZHKtPqsfcIZkeqmJqqcMJcZlZUS6zJcVw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kOBbIbVV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15163605F8
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 15:02:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DA4D21A1A77;
 Wed,  9 Sep 2026 15:02:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AEB2860448;
 Wed,  9 Sep 2026 15:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 945F811C7AF57; 
 Wed,  9 Sep 2026 17:02:34 +0200 (CEST)
Date: Wed, 9 Sep 2026 17:02:33 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org, Joachim Wiberg <troglobit@gmail.com>
Message-ID: <aqF0_2EnA9zUcLlw@windsurf>
References: <20260830180758.97741-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260830180758.97741-1-alexander.sverdlin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/mini-snmpd: bump to version 2.1
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

On Sun, Aug 30, 2026 at 08:07:55PM +0200, Alexander Sverdlin wrote:
> Fixes:
> - Reassemble SNMP requests split across TCP segments, and drop
>   over-large messages, by Noam Rathaus
> - Fix encoded-length accounting for decoded OIDs, by Noam Rathaus
> - Zero-fill memory from the internal `allocate()` helper
> - Build the interface trap OIDs without a run-time format string
> - Avoid needless variable shadowing under `-Wshadow`
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
