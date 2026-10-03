Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B159FCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 867434131A;
	Sat,  3 Oct 2026 12:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntk6sKOhNjFx; Sat,  3 Oct 2026 12:35:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C3950412FB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030942;
	b=IOb04uSZB8VZ1h8rnSpjefzNE4WGQImLK+mGybWz6Zzxf/tEVcfDQmcSfvyf0Q66xTqt
	 7OJyZhDF3xNQgVTVsPV+fSDf4opgI2z2W7YhKg8X1RmZCEaBloDwHtrKwzVn5Qkjo6JC0
	 1CxeZWtwtzrK/f7h+h5CUtzmw8aWXVk4pON43Mf8tzkEVoZJB1EdRc2qMspnTP9J5MeUx
	 RlFFbArFkvEcThGHY9kPrS6if50LBgDuEL1DB5oKkvYe5McFjhiGYV2N6O6KwrClxRpHU
	 iutJfBtVM3AITn98QnLwUc5RQXtJN1Xifln6zhmMUSby0vVfL5l7Fi6THUkylo5pBmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fKgZ131mHQWpXnMH81nl+l6/UGHMXAZyDpcj7Gw9l44=;
	b=hvNNLaAxrj+ZWqhKfJlTQ2//qcak+fLWtK6Y1a3yUSVGOuhNFKq3GXLxd16G7Ta48bBz
	 AqbJu/d9RlX8QhnlwfPWZ2ePNYhNjAg/HYN663meZWLZ3nMyUdZhm3t6fDwWVyu4F7i6D
	 alskYiYXGw37GlzagI/S0RV+x8JgAJHhI9N6M/0VbWxEvjvu98lReDi1oTlyA1OTHL6jc
	 4+A9/qt4sLUwZPy724W/YkirgR7q989YT5tgxgAGlB3WO/MWdDdbRJDhW9Ur4BqW8GCpl
	 oAh/11o4N2IFFAVQwBqXjG0axG++GBOBej7PUO/h7ZAVduPIGe1IF9LgONqEtcZytww==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030942;
	bh=fKgZ131mHQWpXnMH81nl+l6/UGHMXAZyDpcj7Gw9l44=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D47kdMfQ7ZlFdL3m+Nce2CD/v0rbsfOSgSrAZy0vBcE86WzoQrUeoPXxrbggqfgMC
	 RColzVO7NYir5ds1UJaHUJra6ngH6jY56ALhiMyhGSSI0h/vI3GIIDcDBtXyigDieL
	 aBiPzAl5fw3K4PTTDpb0NGovoBTVqP00zxXJwCIuxF31IwR0sufKkM7Gos1YbbOIh6
	 srGc3doAuKLGGiNt+AkCzduoTrFtBeXDLaL5rOX80fImZ9CGi6dmyENUoRuhxqLOjh
	 SuEMBJkphOSq+eOV7Bh7uKNxLrN41fazz/LJ0MVpPvOIOoQe8MBdiyJNJR+xU0CGq4
	 45XbRUtJWxkYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3950412FB;
	Sat,  3 Oct 2026 12:35:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B566132F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6F3060652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoSEFEJ_Wny6 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5B8260667
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030941;
 b=iB2BQZHTnCVqgN7TlZDueL9gcwwRloGJIH3H3YxsUfjyJgTydQrg+zVCGwsEbDy86L1Q
 imeJVQp/cIuNbwIs5o5KOw31Kmbsohm6/WWt+ZJwS4RKBSoXac56wpxIOu945e9/Q9cSS
 T8Qt7XY2Qoh3+8vOrusdDosC/k9w8w/T2vgJKl//z5sSq3yxGd7TuHFvCCe/L1X+nGRCp
 rwLS3KXcvHxptXTjnsESCauGjJ09TpAF1QF+RHXsmQX2nOkp/OnrKFwgkz9+ZtjGa3moU
 xpb1WM356w8WvTBAM3v5gMcc5yLTACeq/fJ6AmXgbjKFpNmx9xFiWaLUeW0nU7mkjlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030941;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0Db51wcJcgjkEyBAw1lNeATYPAJqnC97zzrp9qouwDg=;
 b=ZNZ1GFQq3wEWz5IfPRLF6V3LF2gddWN8qmU5Tck49DwM+RJ+QCoBll6k0sFN+Qe+KdME
 P5f8/KwnwRid8DdW++5D+mqpAVr9h6hYErBPGSaE7saq8VAexZJml63Yvuivj/wwHEWxS
 w02/YSFz8ImWN2MLRqrLDc+6su5xfSD0NzaExttuQEtKTAiD1zvTD5TdSQIV04lQyCTdE
 i7LRn8nYLmNPKfMuyrqsdBKJ9wmgr4aP02Rcdx9vQUNisWNZ2vzUd6Hg5tGvVRpJB7zJo
 ixBMQ3eWZgbS3b63xhMmwXF6b3IB9i6W0EfPe7CfBwlIe1lWxxwPHI8pF5cSsQCgwCw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0cQBO+jh; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5B8260667
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 781D74E41128
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4D62E604FF;
 Sat,  3 Oct 2026 12:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6B2B10328366; 
 Sat,  3 Oct 2026 14:35:37 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:35:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD2lZzyJZJr1ZAr@windsurf>
References: <20261003084453.545653-11-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-11-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gpiozero: bump to
 version 2.0.1.post3
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

On Sat, Oct 03, 2026 at 02:43:56AM -0600, James Hilliard wrote:
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
