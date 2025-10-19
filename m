Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE92CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5093C40D32;
	Sun, 19 Oct 2025 19:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8Y0bo6BoTyH; Sun, 19 Oct 2025 19:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F0B40D3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F0B40D3B;
	Sun, 19 Oct 2025 19:45:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7628843F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7318B40D3B
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiTG0yDLpCsA for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F33540D32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F33540D32
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F33540D32
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:45:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5708B5FFAA;
 Sun, 19 Oct 2025 21:45:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 21:45:31 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 21:45:31 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>
In-Reply-To: <20251018161509.1061905-1-dario.binacchi@amarulasolutions.com>
References: <20251018161509.1061905-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <89e9425d1011efdc1660f85e74e4e4a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760903133;
 bh=Ig6imGaHD8K6lzbhF0OyB8VaKUe37rV1tos4TrpfDoo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R4MnFz0gittrooEuaKyNXZp1LIfbwOvAsEKpi72CheU70fvOdwrldK2Q2D0RmzxlL
 nznGL51UvuVNigNe9l0mValByb7Ofclj3CyiUwPFPZ7aYvNxp4dEzdH1mp/0aogKzl
 7lJ5Sel1Wz1lsow4Bxo26nnC/eQ0JT1FXkH3Zx9IAIoMS/dfN+GnqKaCbW4X/frlGF
 ogwIFI8Oh3MWa1R9AFtGyFRJ9tmJ4REbNXrFcALAqBjxI3tjIj2Fv6HG1fAmnRig0F
 f7mwDt5/tHmYQefhpUa0bZu015e7/dc+FVZyP4oOocRNddFzi0JgCQTlSMIlR/c0th
 YNf9V8EIvpcBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R4MnFz0g
Subject: Re: [Buildroot] [PATCH 1/1] package/leptonica: bump to version
 1.86.0
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

On 18/10/2025 18:15, Dario Binacchi wrote:
> Release notes:
> http://www.leptonica.org/source/version-notes.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
