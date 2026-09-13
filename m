Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6D6C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1620480D05;
	Sun, 13 Sep 2026 19:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqeFADyCQ8nk; Sun, 13 Sep 2026 19:36:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2C6D080CF2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328215;
	b=kBIzISSAuXr7JXDPPaVjJtOq7I+rgChV5V+rSv1wENbC7ZMMoGITMRhm6c7FxxORv0ab
	 hmN7Cz/Quec1f1XgkOTeW2NgWj7V/nYSnkUHaQZGDbWT6XFVLvRX5piaA3gD+nSxjcQ3d
	 I5RITsxskwSuv5lViLO1frWQJovlC0UWwneuKavxtDlJunbW8IUoA2exR5rbhdlCL36y6
	 UfJzZbR4xGt//PhyGnB+FA5Y/PejcXK7hWMg3kcxagTBCeQgimKK7AC6hBenbuc21nuqR
	 z7LY69hMHClUAbHv6E/e9sqPqcCUAukeDt6714y4pck4nSB1++7DTKBaEXkZmwyxF2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328215;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=O36kQxWBpfkc8Ku0vxzNhoLbG5PWXhHA8nYzhrfCPj8=;
	b=ajPyboUtp8kTVlYYyDKLhdrc++gntbsizI2OwAaCV7hLIAO+s9BOBuWurrA5m6jWT3tF
	 DhVwKsikDm7y8CgHJ6sqelXFSMx1deC6ColN2+vTk4wU6YBmir2b7/rfk+vESy4Ih15Mj
	 EUikaXbqz+zzjOHPV3WP12pjzWpXbvsW/9ydbnj08I2BCQOIUZZzPxq81nrty4tuJhB7v
	 ASYmK/Am5aA8i4qhpy1nepf5+ONO72aWkGYq1wwd0JQsif79FhAB4bKGi6EtfHEYV5Rg7
	 sHc4IMew8x0hjzEp3YrYhspPxFXOXAJ2XBk6TZZH+L2NIv70+14uPSjrG44mYMo8qoA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328215;
	bh=O36kQxWBpfkc8Ku0vxzNhoLbG5PWXhHA8nYzhrfCPj8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LUKX4uFp8RNijXNAgILgk/WWHxC/nuY+t1YCyq9zSukoL07fBv7eVo4966mqCgNWR
	 RIyN7bpF5APt402FU93oFmQ59OZBoVYtRkwXSdgmM0WLyWcKpRgmEgLHP0GE4jVr/B
	 LIGAQ8f4wVuAVq3Sirptcz6MzvrLuHLrWt9flM6GvZ2q7lJE8qNKu3nVgAEWKb0zVb
	 h4PorB5txjOxNaHAUT3S0f0R9SXW5trBCQcooe0v/Nfld6ITfMVLL3u6FelHyQ8gyf
	 sYjje2mcAqxO0pP4bHTyb3ZAxKS+bhoY++Wy2xV2+hKPBVI24nbxbCBsX0Te0ABVU8
	 0AloiBSEdE9Jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6D080CF2;
	Sun, 13 Sep 2026 19:36:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DB6B224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F44D80CF2
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7v19Y4nby39e for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:36:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 56B9C80A82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328213;
 b=biMEt6bXMdO6Q9zGcEtg8Cc/k03XMXrNNEYigZHZJ1qx+8lIfw4IZZbC2ElUFUuFwsCj
 5VgkAm+XJG3K4fJHCp7JyMaU53jxoMVDkDbM7rOcaRlNKf7Tjs6E+pfa758qZmOsa7j5r
 pimawM1sjNQui9XRHYgArvweoYu3B6TZxSN4DEaxsjQxWSojhuNRDo/qZr76XDRqdJ+UU
 lOHaJ3rn/Ia2J8UGig30JBF8MDlH8zW/pjx2P+VkLcmN6h8V6wwNdZVvOR5HgbN1missX
 stKpIRbFm+Vg35dOoZFwurjEfgJzqNMMcgR4pHxhaYLTfKbhvoX3KElywNkNP71d4ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328213;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/GQAL5nPWnRiPV0WK+kv1mO2pjIyleegwlDPP4fHGRA=;
 b=WyFzs3GODY6k0XtnlkaJraepklLDphU3dLF13tq/2O34NWm4pRZRzxmGoyLjVqPEyUfM
 JBt8UP+d06/dH6u5P+1LztezYE6Wclq/vO2rjJsrxoe1dqmrdvn/hdy9Ip1AK6nLBSPZs
 VeLZqx0bQyzL2gR/F4ajgOyUOOzeRhYSXhKGIT72cvo53Aa9gUCq/RpwA/LFG1/Vb+Tx0
 2+kee182e+XQj2t7zj+/x2h0F5WX5b3jDoAMovmnt5GLxkLaTjnwGkkbdlvDjApQHImGS
 pZJ6wxzrT9XFhhqrN3YijUANlZkggQqUIDwhrIK3/bjoOUbhpBoE3repF2exul+Avaw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="W8+q/Thj"; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56B9C80A82
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CF82519F593;
 Sun, 13 Sep 2026 21:36:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:36:48 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:36:48 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20260913170133.1695626-1-thomas.petazzoni@bootlin.com>
References: <20260913170133.1695626-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <75ec7478887f4b7a618200bd58b57c66@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: propagate gst1-libav
 architecture dependency
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

On 13/09/2026 19:01, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_WEBKITGTK_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
> depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
> this dependency. In practice, there is no issue, as webkitgtk is only
> available on a subset of CPU architectures, while
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
> all CPU architectures, except Cortex-M, m68k coldfire, and some
> specific cases of OpenRISC, which are not supported by webkitgtk.
> 
> But for the sake of having correct dependency propagation, let's fix
> this.
> 
> The other packages selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA have
> dependencies that are already handled at the top-level
> BR2_PACKAGE_WEBKITGTK option.
> 
> Fixes: e6e549b9e40d42dbb6a551ecaeb040c1e401f21a ("ffmpeg: add 
> BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
