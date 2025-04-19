Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C23C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 11:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341A96064C;
	Sat, 19 Apr 2025 11:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdjrEZ-KLT7X; Sat, 19 Apr 2025 11:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C84606B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C84606B6;
	Sat, 19 Apr 2025 11:19:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CCF122F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E25B8154F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzkflYH8e_7P for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 11:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67FC68154B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67FC68154B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67FC68154B
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:19:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3A29360136;
 Sat, 19 Apr 2025 13:19:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Apr 2025 13:19:29 +0200
MIME-Version: 1.0
Date: Sat, 19 Apr 2025 13:19:29 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250418214143.2790625-1-thomas.petazzoni@bootlin.com>
References: <20250418214143.2790625-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <93d4543023f52ff3bb54b6b9198bb9c2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745061571;
 bh=xbpDcj90AssyyveWuNzxKY2+0O7SfDgPibxFtYVZ/qU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mBquy6FkSFeXe1cquajCNSs2RUb6FfSeppZb3UW2j4I6sSs66/rqpk+MU+qP50ZGx
 ievTi+/FqR8LYwwzhHZZjO8+yXxRnPPaHEOLnAPYoTfwX/PQ9zFfu2GrHLb9CF2xP0
 F2epDJQvrH01wrn6H9PjdsKRJqIoQB1Fe5ipNjgF46H7p9nPQXwEKSpFYyM232eSFn
 jAALGO0k6eQv498xMXpk12+549Zz0YyQEkS4LZtHS/fIoeZfflanrB/WBTMBaXCth5
 64M8uG2idPCv8FAukfoflk8wKluaMsWxvx14Csm13V3rdW4vsBALwofCPZtNjUgPgY
 58MdheAY/SOzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mBquy6Fk
Subject: Re: [Buildroot] [PATCH] package/libcap: add patch to fix build on
 ARC, OpenRISC, Microblaze
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

Hi Thomas,

On 18/04/2025 23:41, Thomas Petazzoni via buildroot wrote:
> Following the bump of libcap to version 2.76 in commit
> e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
> ARC, OpenRISC, Microblaze. The bug was reported upstream at
> https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
> subsequently fixed by upstream commit:
> 
>   
> https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7a2eee56607218d017af8d26c2c41dba83629708
> 
> Which we backport in this commit.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/c99f461ac757d2934a353818a302a67ef3ad5cf5/ 
> (ARC)
>   
> http://autobuild.buildroot.net/results/8cae72f02d25a48287320d9c991f41761487e353/ 
> (Microblaze)
>   
> http://autobuild.buildroot.net/results/74e2c4d37c5b0ae2749c7d77ca7431bd0d510971/ 
> (OpenRISC)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This upstream patch seems to fix the build issues for the mentioned
architectures. I applied this patch on master.

I also tested with "test-pkg -a" and it seems the xtensa architecture
has the same problem. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1776425781
https://gitlab.com/jolivain/buildroot/-/jobs/9770003981

I believe a followup patch will be needed. Could you have
a look please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
