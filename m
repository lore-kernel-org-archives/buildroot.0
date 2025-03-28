Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402DC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BAA703C2;
	Fri, 28 Mar 2025 18:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUl4lxSBqzC2; Fri, 28 Mar 2025 18:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD0227068D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD0227068D;
	Fri, 28 Mar 2025 18:54:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C65C19A
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 727FB4F2A0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WCl7n03V1u5 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 89DBE4241F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DBE4241F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89DBE4241F
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:54:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A1B4219F57E;
 Fri, 28 Mar 2025 19:54:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47098])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:54:52 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:54:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250327182808.944041-1-bernd@kuhls.net>
References: <20250327182808.944041-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <cad9ad4a6a6ae8962ab6e4cdf8027453@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743188093;
 bh=dFCPlAD1hE5sVTAIEVz+5m1DxJtKxYHg2179NETpA1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DvRYJonyuU1NCoVEa0Kc8r8YrPf2cPb8R+zwbPe55n3D+xd0hPgwbbDjH2bHUrG4w
 I5vntNylVAqedvD9IXPbbnIsmFAlEHBoD+DjZgYOU0szPKsTPrKF59tT73WP8SqAj2
 lnGiRd+t42S9Dl4NqD2NmwAkQcTnfAkXLtzRVlzUrio60zIXiP5k+zvq1zMSYmbuGX
 ydfQV8Je/3BvO0LJpbDKzNS3eGu7Q/rXx+NRirn19HykAGv7q8+ODczHrtAMTmtZTX
 Rd6ozk686XAMX2uGIXNNRHgDPb2BgThX4RiSpzSEHGgZGxMcJH94t1s/l5a8kszSJL
 yVqsPWEAhhnEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DvRYJony
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.16
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

On 27/03/2025 19:28, Bernd Kuhls wrote:
> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-16/18062
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
