Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE3CC369CA
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 22:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1CD60B62;
	Thu, 17 Apr 2025 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LTB6u4zjgzQz; Thu, 17 Apr 2025 22:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2566F59A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2566F59A;
	Thu, 17 Apr 2025 22:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C67522D
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D64B40B6F
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 22:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYsirp3Dmxta for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 22:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19BBA40B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19BBA40B3C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19BBA40B3C
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 22:11:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3ECF619F5A7;
 Fri, 18 Apr 2025 00:11:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Apr 2025 00:11:44 +0200
MIME-Version: 1.0
Date: Fri, 18 Apr 2025 00:11:44 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Lothar
 Felten <lothar.felten@gmail.com>
In-Reply-To: <20250417174106.4091085-1-dario.binacchi@amarulasolutions.com>
References: <20250417174106.4091085-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <822c5807b1de242b342226badea7f67c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744927907;
 bh=JVeqO+vjHoPAAZb0QwO6+2WczF156yFP5C8Wx1BCgnI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bbKWhuzq1+I0fbmhzmrZKizetROZW9MhTrPGUgonl7nidKmKFF77zPo13qGEZ/78J
 BjU6TiXB8OibpwFq9nxfZLLbVO9fcMMALxCf8yBORjbPlajrw7BJQy3HfnZzjVLFcR
 9sLx83AVvDCV/Oe7C8BMcVyDijoF41ZkeibAmA5f13Lh2O4QbswwffmS1ZdHXj2z2G
 wvPUKjd9LnSKhNwqjbdv4xhYDLcu48ndV4DJSznS4raks+xVDwC8wqhEqtL/Distbh
 Cs3exWmEAbgf9UIv3alwVv8HXLzsR4GcSjP0aUBrLwhrOT+3FGBoqMTjlyAXD5mLkM
 5xN1VdYwSXbIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bbKWhuzq
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to
 6.12.17-ti-arm32-r9 and U-Boot to 2025.04
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

On 17/04/2025 19:41, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.17-ti-arm32-r9 and
> U-Boot to version 2025.04.
> 
> Tested on beaglebone black.
> 
> Link: 
> https://github.com/beagleboard/linux/releases/tag/6.12.17-ti-arm32-r9
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
