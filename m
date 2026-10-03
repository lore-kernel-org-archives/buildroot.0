Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE578CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC00B60F2A;
	Sat,  3 Oct 2026 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuQL4CwOZE3J; Sat,  3 Oct 2026 15:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C152361084
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043039;
	b=lCPfxOAS+d2w9qfngA1dNStTv9kdGP5kBs/oUJsXWNqBqUxOKlqR9Ze1Pa6uQzEVKd4+
	 r3zWum44lSz2+06t0+u6FHwt9dn6ZPbXkGe377yuRBXZPyUV7WDsmTP5AVAUrmIL/VToE
	 cPhjPYcoSPBu20HCM5lwbUr5nsOHzQuKe34wnO9yiSsMEchkmfv5lx5SAAGQcuhT2/3dI
	 Dy5+uaKDWMxgIzNqDmQAkRlVVDS0FEahPDJV7huJNMJ+KDZRV7jdFQiWjqibuyDibAxir
	 k3heZN0ExoHXFBfkQb33FmfhclTubQPpmPzqGS+5MQExYkHPRo+/lSwmIadkCef3BtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SoYDvb+xZaNaQmDx2o/d0jcnY8Wi36/ojYBJ8yefcuw=;
	b=ZYuZkoEYIgHJY2tOmuZ72LA0kIGIUVxAmKGKzHFDTcSAQPADIzNqBq7W8bk6FdAcnDV+
	 yOG9oO49g2nm5CoYm4Y6VDVXH83PxIloDGH5oBwAZFZe+W10vgk2gf8uK6xguLmvXePYl
	 R1PbTG5DdgCOBiXgFJ3goSME+TgdN43aPx8k3mHr9DeiqFAjKR/G6Qxgm511Be/OfMY1k
	 GJhpMIYB+5AK9TzM2Bf9NYLWwuz3QYc/VYqQrGsQIa8INKbtz+TQORk/S6BMppnzYumXY
	 yWH3G5EsoC3PE3rO9ZtWSn+QYkrttLF/4bT1/9yc0GgYmrqnKjFngZoVLL+2Jiw8XAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043039;
	bh=SoYDvb+xZaNaQmDx2o/d0jcnY8Wi36/ojYBJ8yefcuw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mMKWALzpiqEQBhx0grOkQuSvQF58XDCf3HxSJXdU1s9O+ArjNQ8JRlibZKU8uji9y
	 rO3aUa6KEMvSSrJTnzLIdFKybfVUGXYG0bVDk82UxC5FzKrolnbjd6j+hAplQCE9Bn
	 BI+sInHmStumwrISuPqfGmjLxAlEv9dyLael/ql42dHxS1uGUj+NudyQfDEwF/tGkz
	 wPsbEf3hdUTfngolYVsVI5A5Hr6AIRr5hMyCpsVPiGpfi/16pNDOxnGO71xJT4g2h+
	 4+vEiNhhg+fUANFVTqmEhU32g0ZUNGdQKnNzwj9hACWHgzE7dmtb1SyeMNFqo+PA9d
	 n4WJmnm8qWCgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C152361084;
	Sat,  3 Oct 2026 15:57:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A843A1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A54E14100D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UAKY0WZrNAa for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 263564101D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042941;
 b=Ii5WH7V27pqUrxqAywKepmGXZFBA3vUWyrt6/1hTxKcKCLYqLPFcq/ze4lTq1LxfQHps
 SEKA1a6EzLes16Tej63oelRAnVIgGD3qGZM0/WS0wyX9H168nfxPPMwX3qWZpFg1kCRBu
 mUNNztroEZh1IL0QWyQZMmk5ZJ46dxuliRZqSDtQGnvnbzYFScmXgbYglAszwJhjV2jc8
 UiUp4VrMcyqAdm/JHY/Y73o27StErHf3MnwxNDslMbkFkef9LvlbgPQJB1j8IGkN2eesH
 hSKs249b3IvVlFsU9+RFKMnkm89ddbijT431JFFuquHTU2XzoX2I0yXMFfTHye7O1BA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042941;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=oTFrARaF8AibnuIKF1FNdZovayRJIeN32HTmJDcPU4k=;
 b=hJQd+JJXio7p0iAIZR+Lt+CLENLUuO+QWrvAQKUzacTN+1iSIZoqp5ItuocR+NiMgGFz
 M2dOJRYlmxD+ipHvNWxdRGLA7IMUuQVGRqPb7XFK9bvW6Vm2CcX8fFCUccPOwUZKIk+wJ
 NxrMCPg6DpRqlFwOpPQ3jcJcx6/g8EYziPGmEMPDZy/e3m0eMQ287h3vBn+DrP1oEwCo9
 z8rUzxoCYDgxW4S2ty2AgF1WtoP3HAMGW3a2AKjCPTwBYza+CT+1Ti3tJkbXUdZnLDk6Q
 bWaNZg57aFJ6/xI0548ju6mZHNJhqYRpkdLsgOAy9hu+O7xj1Lg3j8hvJFVZ9shDroA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jafxQpu0; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 263564101D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:55:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 080621A1108;
 Sat,  3 Oct 2026 15:55:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1438604FF;
 Sat,  3 Oct 2026 15:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED2CE10328366; 
 Sat,  3 Oct 2026 17:55:37 +0200 (CEST)
Date: Sat, 3 Oct 2026 17:55:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asElYyxq5K1ER2G4@windsurf>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-35-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003070128.1295458-35-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 035/114] package/python-iterable-io: bump
 version to 1.0.4
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

On Sat, Oct 03, 2026 at 09:00:07AM +0200, Bernd Kuhls wrote:
> https://github.com/pR0Ps/iterable-io/blob/v1.0.4/CHANGELOG.md
> 
> Upstream switched to hatch:
> https://github.com/pR0Ps/iterable-io/commit/07fc1f02298ad9aec22da3e65382c6c7cf6673d4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

This patch was breaking legal-info, due to a minor change in
README.md. I fixed that up when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
