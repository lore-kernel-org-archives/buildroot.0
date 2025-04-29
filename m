Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D02C369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 20:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6795607AA;
	Tue, 29 Apr 2025 20:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnoxBE2KKY_b; Tue, 29 Apr 2025 20:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BD260EE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BD260EE1;
	Tue, 29 Apr 2025 20:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB1D1C4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C3460EE1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgEt0sI7EI6d for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 20:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AD2A607AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD2A607AA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AD2A607AA
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 20:05:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3A0575FFB1;
 Tue, 29 Apr 2025 22:05:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Apr 2025 22:05:15 +0200
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 22:05:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: buildroot@buildroot.org, Etienne Carriere <etienne.carriere@foss.st.com>
In-Reply-To: <20250429-optee-4-6-v1-1-1cdb296ef7c8@microchip.com>
References: <20250429-optee-4-6-v1-0-1cdb296ef7c8@microchip.com>
 <20250429-optee-4-6-v1-1-1cdb296ef7c8@microchip.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <78024c39c77004440c3a6e13ed39930b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745957117;
 bh=gkhWTNycbch505jmPxET8wfeZIrSBIN/hK9mlnpBusc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s8ircI4ZchI8sblLtLrLfQXr2hgVCxzIm3FTenvw66FcjrPtOCv/NucdX5+pzZPgf
 BnHJ8WXfPbbWWsy0DsMeWTSWJl9YH+a8qcnBmVmHhkm7KcJ1wk746Cnm/5Daxy7iJt
 Fa23ZrOAxHnFgxaSO8QlijXtz5Jp+LfLNOpPjps9X1dCsszdPhhA3bbktIZi23NRLU
 YBLwX3/zfUe5zVUwtb9ZHAYKIpu5AUai8/XRg3nC1UcazQ0mOJ8R9ScjWauWIjyVmR
 r1Z9u3SRaExEcb7lOyLImMkWimF+e8cqXc5dC7CVAFApQd4ie3xFFEkgSbCkgxW1df
 48B45kDcwyx9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s8ircI4Z
Subject: Re: [Buildroot] [PATCH 1/4] boot/optee-os: bump to 4.6.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/04/2025 08:41, Nayab Sayed via buildroot wrote:
> Update OP-TEE to its latest tag
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
