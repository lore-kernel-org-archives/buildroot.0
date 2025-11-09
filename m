Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9349ECCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693C240713;
	Sun,  9 Nov 2025 21:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99Qu-_RLtTj6; Sun,  9 Nov 2025 21:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B3F4059C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B3F4059C;
	Sun,  9 Nov 2025 21:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5DF125D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC26B6087D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BpLC8B-AIsS for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AED8B6087B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED8B6087B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AED8B6087B
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:45:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id ED8DC780371;
 Sun,  9 Nov 2025 22:44:55 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 22:44:55 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 22:44:55 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20251109103017.499981-1-dario.binacchi@amarulasolutions.com>
References: <20251109103017.499981-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a27e0443784d4e179059f4a1f5e71164@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762724698;
 bh=4tJhYZBJwnkapxMPOkCES9Bxe6e5myXWoPnN0IlrwoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BQVReG0xml+j5mgajNeiHeQvlafRmSUWjdOZh2l0q7S5XsBpN9+a4JdIPdFYT8Lip
 M+biOPNwWztRPRnJpsP29gFnwpPMI1UERxYgP8eKtkUIPFj4ZKkox0zM+VfGS3Ztu4
 ND1QRxxbUD7d7ysNjnzJguoJ4OMHyIckDMa/Ybg7PfraO+MhnIKAh19kPI2EgxKZKH
 DkvyWUMIQJOSJ9Fjzje9d5kVST9xaYCInEu+3G4Pym3EdLFXIG/uOAyPcD3kzomJ43
 JrLyAseMoXFMV3JpjyhvRtAuFJWdmgC07YEEGUrOAw9JU2FpJT2WnJPdrLtNmKXHKP
 TJA1iOk7BViJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BQVReG0x
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: bump to version
 0.27.0
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

On 09/11/2025 11:30, Dario Binacchi wrote:
> For release notes since 0.25.0, see:
> https://github.com/yhirose/cpp-httplib/releases
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
