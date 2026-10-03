Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3E9CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E9A411FE;
	Sat,  3 Oct 2026 12:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZnrOIsbgc0Z; Sat,  3 Oct 2026 12:37:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C6E7341186
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791031044;
	b=fLWz1qrXdt97bGz6Uz5FAbpWPDwehu9B86+zrp7fqyv/eaVXeLFpPbs6eqxOQP9gF1yo
	 kWp6bT5rcwzkJ4/x0HjQvY4h0/pjM5pCVjj6K23LVSAXTzBc3s2G0fegEPVHPy3BjXzFh
	 wXGgLtrtF9ZRsc4DZQFiq+Fdubb5f/fCwKaOB2hYVvU+zG4OHvHGUpZn0a12mNNMeHgzC
	 1Amly5tGPTTE1mxmswDy1BUPq0MXvHxwwdj6am30vEPhiDxgr4PAXnMrj6ovbQHslGRAk
	 wU67iZRqlYTqDahqY+4TwjCY6Ip4b1j9LR6NFTIzC584h8LsLY1Ir1n5McsB/0xGVaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791031044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kwg6cz+XFbP5VzKnxASs2fd7LOy5MF0laBdaCPCNMQk=;
	b=ZvH+EsT71r62pbOq5KRjMH6gh6/Mpjb6pUm4Vuk24JkovHi4pMbJnILzAmsuKkWrB4dY
	 Vf28GWizxlVIX+Nt6SKTiHyIbr1urIe7ghVLCl7FrXOeuyRzXWffOofjEcckERFRd5ls+
	 TbjmRqi8qySGJgNjWJXqQ0ZQEwQYFrUc4Byvx+j4K5IkC4Yh2annJdfgK7urDw7UPKolr
	 EnazSdHQGVbQvxFY6Qgzu61O2xGD13iMnLNvx1yX5/hDn1xsS1NWbnlXYZLZ63ODcnNLy
	 ft76v+gRjeZRoO70SGxqDeudXEqbxg4feva4TFiSoQvyKKfJeSLc4/x9xvJ1+wP0qKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791031044;
	bh=Kwg6cz+XFbP5VzKnxASs2fd7LOy5MF0laBdaCPCNMQk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Me7edBfZLka891Au6crnf3eM5tfyQXClX2F/sjdSR2HTo84AJ3mKsfwleQW2xw7kP
	 6M4MQR57h7h4fJF9DVDCJoGXC2tGHfqkml9gBsrRAA4gs7HZYkyURRo2R1A+Iemi86
	 1vhw5E+Xm5wcHVAIOe1Ay/DmcNGKmrngvcPQkZFVVP2s1XLwQLEi7Sa7qOrYOaJnNN
	 2ltQxgITiznmp7x8f6dEuyLbfP9YPb52ieV1CrOM1A/YbzxuO5bZay8/08mBEAJHoY
	 Qk7O//U3JFy5PzmWTbmnqm1jd1HTXLQaZtT5+sHwExeHosCLpbiHankstRvP5cOOMp
	 vNjsnnxOMHbVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E7341186;
	Sat,  3 Oct 2026 12:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 572082E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54E9760667
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUesIQuFCj7t for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:37:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7295560652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791031042;
 b=kA//FQC1RBerMkIkDVnYv4OW4lOVHWOpv4vo0p9DioFcJ/qwfHwf6YpcvKvlMvpfjksc
 ynH2hRUUTwTkF7PZNravQ8U2Fe2gUkjrWipP/l6PYnOzqIIrV67cI/EvVYDmfjZ6/UDzO
 rNC6M0G0cmKaD1yh3VYg92I/ESbL56Zk2TKitp+SxGrI2/3F3zTaTFUlgg/tk/KmnoRHl
 tpRG7AZTLr4A0ZH7Ml3vEjvWZq/crg96cu+rVdQjA0uh6UQwu4zGWgNsy4t4vIl1xcBVh
 ANK9bDIw14MQSd7qGTrJUyhsqkzsIK32GAlAG+im3Y2RSNfhwFpNa9+nTpH9We0Mfog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791031042;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3OyBkaMszClYI/+cyStaidzi2Ty4cHPY4Fe1lHRa7ZE=;
 b=UFzUbS2DSt3eOPhYY+Uh/tlAdEmyqh/p3locibCVFxnsBLMxigHxqFZll55oSHoaokLB
 NxFftsmlOrQZPovUsjKLtcmApkEIKLnnYMkHFvw7mZG405P0QWrdpeOiFzpYHE4gKB+7n
 4jKxC8umuAKIVcKYGGLrR8EjksxkvAT3l5YzqKvnQ4kkt70JqIyiUtDSfff/hIVufGzke
 lMvAM2pjuyChVt4Vq8qDjJ60hL7b7PN6q591y3GVrMp4ypWKjK3FGyWcCrIxBNcpu7qSn
 wmSW92px5PYEeNk5KPErrzMoRZ/CT+QswGlrTQdU+kwngpYZgNtcFUlbWQHkOl9vMjw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="d0DYjf/s"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7295560652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:37:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 92E974E4112C;
 Sat,  3 Oct 2026 12:37:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66E71604FF;
 Sat,  3 Oct 2026 12:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4033F10328318; 
 Sat,  3 Oct 2026 14:37:18 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:37:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <asD2-ZQ5vk3c3ezk@windsurf>
References: <20261003084453.545653-21-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-21-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-oauthlib: bump to
 version 4.0.0
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

On Sat, Oct 03, 2026 at 02:44:06AM -0600, James Hilliard wrote:
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
