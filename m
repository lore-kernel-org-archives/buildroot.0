Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CEC0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 16:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D8C380A60;
	Sun, 26 Jan 2025 16:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LutY9c3lxiC; Sun, 26 Jan 2025 16:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 847A581A92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 847A581A92;
	Sun, 26 Jan 2025 16:56:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 088EB941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCCE4410D1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgV279KIwvdY for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 16:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68730410C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68730410C8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68730410C8
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:56:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3635FB00573;
 Sun, 26 Jan 2025 17:56:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37210])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 17:56:08 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 17:56:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250126113234.4164811-2-thomas.petazzoni@bootlin.com>
References: <20250126113234.4164811-1-thomas.petazzoni@bootlin.com>
 <20250126113234.4164811-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <90eace4b73f3be73e68da690cef1113e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737910569;
 bh=lVBqTFU62figJmlwMEvvMGFeNFNipU8wBhfSTnTKtQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dGbeucNwzoJOW2FjDlN+LA4ZmehLpxzqsuRc2qrbPv7pjskvgxEQQFwLLE6FasD19
 4cA7ZGzOOu3QpWSWWU1jTUmEUxb+oDaY4QlADTecvMjufkdLkx2e7tqoc3J1jLbW5V
 n+1+hnFyxgfDrOofjMCADxiLwTzInGsE4e72DTPsmTyRTlIgJDj0xd2ZJudU7KdXy3
 wItl2wFBBGKKu0tbG710p0cQVJnpE2gzqVJ9HkTFOBkH8RUtQ0IWUlvZNdt22u9xa2
 pdDdCLWPW0NP5TXhwNw1oLguW4H80Is+/8TWVHCeYPrpKkYiNHlzSk+5Idb3MiyzO7
 N5N2Xecw4ieuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dGbeucNw
Subject: Re: [Buildroot] [PATCH 1/4]
 support/testing/tests/package/test_gdb.py: fix ARC test
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

On 26/01/2025 12:32, Thomas Petazzoni via buildroot wrote:
> Since the disabling of the Synopsys ARC toolchain in
> 11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8, the test
> tests.package.test_gdb.TestGdbArc was failing as it was relying on
> this external toolchain.
> 
> Let's switch the test to use BR2_archs38, which allows to use a
> Bootlin toolchain.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696282
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
