Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A004C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D2F405DC;
	Fri, 25 Apr 2025 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NX42P2UciZU; Fri, 25 Apr 2025 16:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A4F4065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12A4F4065F;
	Fri, 25 Apr 2025 16:11:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08490C1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E32F5605C8
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9XyOlqLz9yp for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30D60605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D60605A6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30D60605A6
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:11:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DC5E719F74B;
 Fri, 25 Apr 2025 18:11:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:11:46 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:11:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250424094807.2799328-1-elmehdi.younes@smile.fr>
References: <20250424094807.2799328-1-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <3b4e5aed7850ad1352fa1453cc495715@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745597508;
 bh=+bYj8d23oKhvA9BPIFwVX9oXdGiBwVOic/Zz9E7hHKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZeQ2KRKnoQ7FADu1upJpNpayAbzOoD/PsWHBg6iYMCSzJyCxKNmGiN1+9bTKG3yP/
 Qldsr6RcAEY0jjthIxvdy39K74tEmNPEFSQDK9wsJkSvgYGAOLuL1lbPFhkk8jaJYd
 uVsDEjhhoBBJqjzX5IO69BtjVtMAwcpYUCJDZWgv9Z7CH4YhPJ9ngutlueq74ea/cY
 DUeyaDK3U1AleRA26HDO/i64zZHpqzqVcZRcH//T01qvYzqtdDn7DRvQDrf9T4ge/M
 2ZHY3fCu9GAyaQwR5zVMZ1cvhHRhcG2MGGyLjvFjSJspfrwzqtLUQSPHGbJpawzyBa
 ZZvUMw8XK7ypg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZeQ2KRKn
Subject: Re: [Buildroot] [PATCH v2] support/test: new bat runtime test
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

On 24/04/2025 11:48, El Mehdi YOUNES via buildroot wrote:
> Add a runtime test for the 'bat' package to verify that the binary 
> executes
> correctly in a minimal Buildroot rootfs.The test cheks that:
> - 'bat --version' runs without error
> - 'bat' can read and display a text file
> - the displayed content matches the expected string
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
