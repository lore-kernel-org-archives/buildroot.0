Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A29CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD35C812AB;
	Wed, 13 Aug 2025 16:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WMWJ-1GwhSc; Wed, 13 Aug 2025 16:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BC9811B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BC9811B8;
	Wed, 13 Aug 2025 16:30:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84C5E1C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B52560A82
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1EkpQfqeFpA for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DAEE60B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DAEE60B63
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DAEE60B63
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:30:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 586C8B00572;
 Wed, 13 Aug 2025 18:30:45 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 Aug 2025 18:30:45 +0200
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 18:30:45 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20250812074333.1208878-1-nemaakhilesh@gmail.com>
References: <20250812074333.1208878-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5f2d49129155db39b5a2e14fbbf47758@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755102647;
 bh=d5JKSHeNUUTjhbe2kq/3IU/1b8bV14C9yo8m0LrzM9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VBaZwQsJ4xOOnBvcKNGcVLN7JtJ0MHVvQF41sMa2WKqJY5jfa2JDcvMgvkp3x7Hli
 lwk5xMYYUAhDF7JfBewjjB24NWD51AKS7flpBz26NllPMGQgE3QKV4wVvuKuCCZoLC
 NX8Wvp+FqkQCBHLeNlZm8s5OyGlyKoUi8VJt8/GZc1M9U3N659kChEkS9YH+xlh/u8
 b00qL2dXEuJiWjQcsdvmG4aYS9HfQplTkwHGADEpBg318nae85km+sLcnUW8SnnKlm
 Kr7VmBXSlZPyjAGACVW28M8BsVVXV94F9lGyKHMXD67Ko54pD3kveswNGgbaW8J3WL
 pIXxkv2iVjtUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VBaZwQsJ
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.16.0
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

On 12/08/2025 09:43, Akhilesh Nema wrote:
> Release announcement:
> https://lore.kernel.org/netdev/20250803143154.2d700ad4@hermes.local/
> 
> Changelog:
> https://github.com/iproute2/iproute2/compare/v6.15.0...v6.16.0
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
