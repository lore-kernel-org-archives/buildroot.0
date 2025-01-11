Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9E7E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F306078E;
	Sat, 11 Jan 2025 16:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKAYZCILyAUv; Sat, 11 Jan 2025 16:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB3E86084F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB3E86084F;
	Sat, 11 Jan 2025 16:45:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D91F0942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C75AA608D2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNod9fKXaHH0 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F2166078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F2166078E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F2166078E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:45:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1AF9F19F734;
 Sat, 11 Jan 2025 17:45:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43616])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:45:02 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:45:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109205333.2393948-1-james.hilliard1@gmail.com>
References: <20250109205333.2393948-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3d83267b935820abadc7ecf2659fe4a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736613903;
 bh=HyVPQyhXrlKN7s1zgz4PyvCGKxWh3IQsFSzn9XHci4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dXb4Moa4tTQb26a2S/bQ+9q6QxS3GgJ/52Ksqvb521eFSsQeinaVZY61O2rhwzz1X
 7anVUBciSncx4PUbelkv1XHqF6mqi3Ho3qyOQdLZ7NPVXe1RM8rMsn6Mc4D4Qt1xeX
 5YtH764fEBIk9obAh+42NLNu0U7JJvqnvKUJnFOZmIq25VfLMmugDELV+CtNNrFmrC
 OjhMs6Q8Xn7oSPWqAQNqBpQUzjKxrHhqVz1WRRM2nLYpvnpDCi6DIFSNe8jE18ZfLZ
 /EwxqDkez4Zc5fOIMKg8uxeO4RkBj4BIA5sJKReAGLpQyThk6ZYDPTvrqKXeC71tWq
 X0YZlQdd+4fLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dXb4Moa4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-engineio: bump to
 version 4.11.2
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

On 09/01/2025 21:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
