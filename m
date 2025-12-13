Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3E2D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 16:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43893834F6;
	Sat, 13 Dec 2025 16:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IW1wZr2zpGN1; Sat, 13 Dec 2025 16:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3765183051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765641794;
	bh=+cOb2xvMjm9X4Mjz2JUvivIlMa02AXgkK33XQl9tkDs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PjEw2Ard6+I9RT9taoeorbPenM4XCvgPLjbAhVpXtl+rMePc9Hs+PXHMtd5sIL076
	 Pei7i6jmAVOOi6w8BUSLXTb0gy3QLBo1dmwPkiXwfGiKYJ6ExA/oRHBo8m0xINWlIH
	 aTd402dJ3vpwZ8vRrInKz0rocrB64x8V031lgthznprC/NABaD24QovpJ+da9PlS5a
	 UaOchgoE4umhlLku4zPAGwmNyCi0R/w8XT8dsy2nffKTx65q6gTxb9KRaAwuDtqZSS
	 933BL11LNmftIy7izT9kvXdYWO5wyy1Q0Vq8eJsmZmRKmzEiWbt6kDP2VY2d1etA9F
	 aw0jgrfC939dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3765183051;
	Sat, 13 Dec 2025 16:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 505C9117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3652A83051
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdQUYsx6V1up for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 16:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C1838302F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1838302F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C1838302F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:03:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E839313F86A;
 Sat, 13 Dec 2025 17:03:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 17:03:07 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 17:03:07 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20251212104211.3810112-1-giulio.benetti@benettiengineering.com>
References: <20251212104211.3810112-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1dfc3b8daabc84ce17218371f0d2a68b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765641790;
 bh=5Eot4Ng1ZkfsVHz1VC6+cczfmbRoOsQYFNrXC4SokPY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cR/yVWbiuUo/O0/x+5Y8CCGbsffgAuVPyPK5VzP8cc9rozOgjfl4BuJleqdXgmAPg
 0RYR66Essy9MFbGEk4Edjuh9a7CLc1hzCJ2Zpy640fq3JlBLZapZTRak4WLLbK4wV2
 y2j7YLGW60nwTnKGePVjynY9sVnqHZbHPNxoVeJjMHg5FQvXDphDAt34LROmxvwm8S
 fDxjfFzlM5UA1hWIJGWF1M5W44p1nS4PgxbY4kIqbdz66nUruztTmZaPdpN4WXyHYr
 fTTIRybjQOrrijb4bP6r8eiYI4uzyApuYdLx122A+FzyEV90rNKB0aIXPegS813W/N
 MJIpId4bkgKTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cR/yVWbi
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.119.1
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

On 12/12/2025 11:42, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119_1.rst
> 
> For release 3.119.1 tarball change from nss-3.119.1.tar.gz to
> nss-3_119_1.tar.gz so let's fix it accordingly.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
