Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5819C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 09:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB6480FF5;
	Mon, 13 Jul 2026 09:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JepXawAuJdKa; Mon, 13 Jul 2026 09:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D9480FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783935283;
	bh=0TUzKizSWRgTNCTRCLPH0CaYg2o/OnUOsUlqIF0aOnQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FMSdjwPuk5psS+qdqKOhArbhcDyzncxDhtqvu+t6QH5B8TZwX2X1Iseol5WMiS3MG
	 GjkvndzBEi0cS9AcvXpCukTXn3myFZOds9gquQ5zrcVbqxsbSReZeqfC3bmqiiyyja
	 kzgny6wf7lN2lZWdoE602eCQrBW+mRia1/6X2p3T19gkUnKgqMDSnBiHEWtRAhQ5yp
	 f+UQoSWj8mK0Q3FYwgCA91mz9CoVorrvV+wAb4k06ppwFa9pNhw7zWSn/iK7KLZv3k
	 2jRFrSQH8ldK6JSjFfs80GQ4IZutFoqiMtCTAhzu5SwDbaViOxIAeBijxgrE/rtCVw
	 cQuczwTfKP+fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D9480FDD;
	Mon, 13 Jul 2026 09:34:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F21128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D55C0408AB
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ad-SJlJyi-ws for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 09:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B28B2408A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28B2408A8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B28B2408A8
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 09:34:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4751019F57E;
 Mon, 13 Jul 2026 11:34:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Jul 2026 11:34:36 +0200
MIME-Version: 1.0
Date: Mon, 13 Jul 2026 11:34:36 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
In-Reply-To: <20260712130836.821439-1-fancp2007@gmail.com>
References: <20260712130836.821439-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <beb9c2b1a89549f6c07e887beb2d1378@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783935279;
 bh=pszgxPdp1VDM7Tg7EOd98SRwoQlsLsX0ow68AJNxDHk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Po+NinB6OHhtS9enwAuFXK7B2BQNqtcE+e5vtPHSseZq4J7Zgz/onLFK8VlbLfyRU
 CcEpwpT+1wH/k//E2DSY89Lj/5p+0ZFFwVbln/gHCx0eK8q0sqL9hqkfPWVh3WKdTo
 f3HuHcHxS+ltHGntRdBa2qbTewBW8CjuWP6uzeMYJjhKaUMnGCLzrkdOY4vnYYep5r
 uCtRjZFMYM/ym0AJvt+ObUikfy5ftEMnQ/VzT8IOeURNQoXjeX6aBqyygJL+GOItEv
 /eJs/ToVVC4aMIniYdbAwhSsdOBtKlszkO5OTbWWauZRifPUVf0DUe+WmYY146jaoV
 42thC4Tk1dpKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Po+NinB6
Subject: Re: [Buildroot] [PATCH] configs/cubieboard{1,
 2}: bump Linux to 7.1.3 and U-Boot to 2026.07
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

On 12/07/2026 15:08, Scott Fan wrote:
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
