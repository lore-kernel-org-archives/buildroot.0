Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E49FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624DE407F8;
	Sat,  3 Jan 2026 11:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GR_qDvx3hX6V; Sat,  3 Jan 2026 11:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A0A74077F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441562;
	bh=keqcewO774pT1+jIwQ3FhhX6LVYJgDhMsapmt/w5e8U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=br554TmmIFt6swiPZJnXuv5dRK4go0msjgO1Ry3BwH38LxMz3nq9NzgYLHWIku2n7
	 Xcu84ow7vzeOUIeuWvFqweiK5FUXjmmnEfdKkV5vECP+Ey8hjcgnQ+CpcxMTFR0jUj
	 TTOAwp7oEOUdlEDfdH36wfThif8mqWpnlKp0l1lNU7R+LWCCMQ9XhydGSpXBiA3luW
	 9xOxk+raEqZMTCgoL9E+kMnFVVTzkgfOoJkvIzV6sKKae/9fGEYo0OK4WBlh2TmIox
	 V8oRnoICUKe7ygBSWkW+Psh0ZNbWmPPBA0Ki7c+JSlifMoI2IK/+QVwF7BarkhRoCo
	 +TevNMvrEzrkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A0A74077F;
	Sat,  3 Jan 2026 11:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC826440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D363F81EA1
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sp3OwJTFEXAh for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C932F81310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C932F81310
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C932F81310
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A886D13F88D;
 Sat,  3 Jan 2026 12:59:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:59:15 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:59:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20260103012555.762154-1-james.hilliard1@gmail.com>
References: <20260103012555.762154-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <02af63fd415c4d0d2d7aa6b3f5905533@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767441557;
 bh=S+zpX3Gy8HqdtIbZBOVorz5QaJ/qz4B8+I3PY2VeK4s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c4NccjW0PKZ3nGj2jFrPolKGa90bDG1Dtg87AYIf2I+POEB745UbI0mEX4thLHqNg
 I2Eg95l+GK7/PjP4vvVpnDHIpBkWiEbt5gW42E5LGdBCxfqMb6uf8FSOrNk7Kvbx9M
 2nBJgIwobX0ovhZTuXeCFbQ5GRKORCu68ucQfV0m256EU4rPqsaLqRuz4OAl6xMGe8
 jOUCTAFCXfG+sv4CyL5PeY3CffkrV7TtAis2mtzSYuqglS7n844Dp7HDfrA6AogCfE
 FfzU6JC+1H/eCrHL06cOirdlgNxhXkeREi6KF1FubzMhyJP1iMkvzS4/v5BmKkyE/F
 MdqSAHjivpCaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c4NccjW0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.42.21
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

On 03/01/2026 02:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
