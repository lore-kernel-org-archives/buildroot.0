Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A809C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D179560E76;
	Mon, 12 May 2025 20:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UOmHtecbi3b; Mon, 12 May 2025 20:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D33BF60E66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33BF60E66;
	Mon, 12 May 2025 20:23:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 498A7153
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37F5F41044
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hJUOJZCf-PA for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1DF840A11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1DF840A11
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1DF840A11
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:23:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0CCF313F8AE;
 Mon, 12 May 2025 22:23:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 22:23:42 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 22:23:42 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250512125000.1099442-1-buildroot@bubu1.eu>
References: <20250512125000.1099442-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <80ec3fc48b249a2a8877cc687f098eef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747081426;
 bh=Mzp1NVtl+SPfBmNs1DndXBBaeIgZP7vfRoynoylBvbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s1nYvyKq72KjD+yPgsnYMI1YGmBPB3477Lporo+JdxQWwKEaTtY+8sHREGXqpbKQC
 1FTCUwqDUJ12HT+ruEnQZoYgv/TzZjwhla2hvq7o/EcvFG8ML1/dEJ5vEtqIJ3oWu4
 DYRfaQNsWk/m9UbyyNqgg7bvCeFgo3pu0/KbsHLI8VOwiZf3/TpgRZ3gPErYej05Ov
 mJHc1KaRhOgp2VEotJzaJ95bCnwI+f71Al3bjAsP/vri4x/Hw1dFjQmDQFC2+nyYOB
 Em9p0Vky/QhGj123MBPLVmYAmjWrdnyfq4kQNPw2K/UMxHfy9P/i7eT9iuspJt6fmL
 cQsi3g7B5CWMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s1nYvyKq
Subject: Re: [Buildroot] [PATCH] package/python-jc: bump to 1.25.5
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

On 12/05/2025 14:49, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
