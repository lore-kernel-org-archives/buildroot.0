Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959C1C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 20:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62385600D4;
	Sat,  8 Feb 2025 20:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b67fIOSzQ-g9; Sat,  8 Feb 2025 20:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F191605E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F191605E9;
	Sat,  8 Feb 2025 20:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 691AB1B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E03D83B1D
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 20:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5FR6wex0Y3K for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 20:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1CC283B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1CC283B1A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1CC283B1A
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 20:47:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 43D1CB00571;
 Sat,  8 Feb 2025 21:46:57 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:40214])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 21:46:57 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 21:46:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250208150413.172911-1-thomas.petazzoni@bootlin.com>
References: <20250208150413.172911-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6a3bf489c4d92e7693837ca5ad9b0e5f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739047620;
 bh=QJ2n6BHJjnd+Co83X950g28GkVfyNXo/ULG3Y4GousU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g0gx3pGW0R9t6te41jnO6S5ZLbQbEZy76PTDx1PmQPcxtGLKXIpjHfBe22FPA18s4
 A5le5PIZlHC/jYWjf8BduUvDC79pXXgD05gKJyPocCMRB40VPxvSaAda5bgsJYPSw5
 +ZnwG0npPidCZVt7DsHntbrpMhFBaGd1GQc4tn+zWCidRq+D8oGj625bwAjh5L63Kq
 +SGBRChAMO78ux5nfW+gjWSp3DMPAPqKnWqshwbB72nxwBVc9gydGAFe31Ow0c4tuI
 qK5OsHX2+awWt+zWNIeHgZt5O/xIPQ1tZHDq7PEq+8/WPLW3VLhiGL7inFO5o2RV80
 96OnVCKC6/YDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g0gx3pGW
Subject: Re: [Buildroot] [PATCH 1/2]
 toolchain/toolchain-external/toolchain-external-bootlin: drop
 Microblaze/bleeding-edge
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

On 08/02/2025 16:04, Thomas Petazzoni via buildroot wrote:
> GCC 14.x has a significant bug where libatomic lacks some important
> functions, causing the toolchain to be pretty much
> unusable. Therefore, let's drop this toolchain entirely from our
> listing for now.
> 
> See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118280 for more
> details.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/dd081ca3c5746b980b0bcdf1f12b1a26c6b7ef86/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
