Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48701C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC2080F14;
	Wed, 29 Jul 2026 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLLvIcxNacOp; Wed, 29 Jul 2026 20:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92BF580EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785355608;
	bh=wcl2G5SEmrSpdUvf+aSZK0wHkmPYsKZAZ36sw/p/20I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XAku/6lZ/Tk9o6izKV1jzy63IeWe437d/V9qzHOb9TMV8qqo5s4e0f9ifW1+pREE6
	 YZ7u2Dvk/YMFcVUQhrjUVMqFCKhJJ6kTMEAuPmCcC6qtCSCPtt70Ge2s0pap3lTSMZ
	 I8l0OW8N25gnmZEIX6H5z8SFXgVjOd8AYy7UskUtQNRZpWrRAFdnSB7tk3R06+fZcG
	 rJjUOnJeSlS8tKO0oapUdQmlyw1ZekuW1iDMHNI/UyXTZVKNgNtHf453tLu0nceT4/
	 Y/0xMOanyVU3Y0dZSNGsgymMN2ehb0MQlCWzvyBpTR6pFVHqA1Quj42akycDDWeHAB
	 MrxSSnxTKa7iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92BF580EEF;
	Wed, 29 Jul 2026 20:06:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E73D526E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8DEC80EDC
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfBmfipqPAeC for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C92B280EE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C92B280EE2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C92B280EE2
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3726619F5B2;
 Wed, 29 Jul 2026 22:06:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Jul 2026 22:06:41 +0200
MIME-Version: 1.0
Date: Wed, 29 Jul 2026 22:06:41 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
References: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <97e33a29d164afe4a7a17f532874a8ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785355603;
 bh=y7FFUX1yGJLJNfXNpiIBqNUWsBTaan1sUlynnTeP9Yo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XVTI0UqMmcf8m6gGXNYEzNCF3b+hq66LD1S1jvjgoK4tn1x38CwGmsEl7KVxcr46M
 zIus1urYc4Z2ezHc/+l7ZfFMoMw3gNMZO1fYjt2Gp0ehxn3j7SYAK9yia3XkqWXmwm
 dHvcLldWR1Qy1/+jmuGTDrNcody83VE84qDIauyHtYxDDLXadI75RPnM8gjicOmyyw
 c3lKPiJHJUsQP8mHdZi0iHfzGIgAkpwSY3q8vwJLrRUwIpbqnlpdOAZWWFuFTIq17K
 GD+pln238cWzBws3oP7sQOV4WkA9TkdGlTH9lqAnCtiUqoSzYwncoD7s4sW7g3jeMq
 bX2rIt7+Wn+jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XVTI0UqM
Subject: Re: [Buildroot] [PATCH 1/4] mender-artifact: bump version to 4.4.1
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

On 27/07/2026 11:49, Adam Duskett wrote:
> - Update License hash due to year change to 2026.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
