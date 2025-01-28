Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9C6C02192
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 18:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE3F412FE;
	Tue, 28 Jan 2025 18:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpGFTzXF7m8v; Tue, 28 Jan 2025 18:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2725412FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2725412FA;
	Tue, 28 Jan 2025 18:08:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B55D9AF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A16C0811BC
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHH9tsklPfxn for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 18:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDBAD81138
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBAD81138
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDBAD81138
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 18:08:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B56C6B0057C;
 Tue, 28 Jan 2025 19:08:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41390])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Jan 2025 19:08:52 +0100
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 19:08:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <Z447tvu5eNQC9iBB@waldemar-brodkorb.de>
References: <Z447tvu5eNQC9iBB@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <aff367d0ff342f227904142790ec2386@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738087735;
 bh=DeAkp6gcSSZpTj2dK/L7AlzWPNV5jo2SEfk4yII6Yho=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NgIkozTyk4yfkat+V0eLyy/qPuNGDsunOicMRkhIzp/TXXwKg5XbpoHBhFGHVzsYj
 1pgOeh7YePQCikFcvW9/wBQrNWoNZiDh1Y4Rn1izjw2loFpSck7jA03erxWtdlrxkw
 eVvKDg/q33KCJzyxf/vFfChdbob8mODvW8cM/JKfuOZPXrDsOdbAufpjorO+hjpOfw
 ASbyI1f98UxkI8Z4jmYjquIjBtr9BayTJEpKIvpXE9FqJ0TeaUmeLn7xcq8Q0S6QV+
 rQWn5Oi4uyT4Bcopq+8a+j/gWGZEpXlIiRZ0yiF4Jz9B1hGIbW7C5MvWXUIiDY4/0c
 5oBka4g/godBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NgIkozTy
Subject: Re: [Buildroot] [PATCH] package/uclibc: deactivate time64 support
 for older kernel's
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

On 20/01/2025 13:04, Waldemar Brodkorb wrote:
> For Linux systems older then 5.1.0 we need to disable time64 support
> in uClibc-ng to avoid compilation failure.
> 
> Fixes Buildroot's arcturus_ucp1020_defconfig.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
For info, I fixed check-package errors.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
