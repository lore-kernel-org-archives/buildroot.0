Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A2CC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1ACD60FD1;
	Tue, 13 May 2025 20:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8a_GGgBTbbk; Tue, 13 May 2025 20:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27FAE60F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27FAE60F31;
	Tue, 13 May 2025 20:22:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DABF312A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DED60F31
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHqlJNh7wApf for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:22:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2D9960E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2D9960E0D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2D9960E0D
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:22:50 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:58fa:50e5:f54e:1fcc])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 16172780395;
 Tue, 13 May 2025 22:22:46 +0200 (CEST)
Date: Tue, 13 May 2025 22:22:45 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Message-ID: <53ntuxukthqgcyccgdliovy2r3zvcat7bjqfm4jarqunaw4gpb@7ny4hgiqq7ta>
References: <20250513085628.38864-1-maxime@leroys.fr>
 <20250513085628.38864-2-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513085628.38864-2-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747167768;
 bh=u0jQIn6sWOoFF9BQgMQSvQOp06wnNyi0RJHWPg8bb1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uRZ/2de6bDG9pSrZ6NJ9vD0gX7SZdEbRfZ1HxHhI7Ay1wL5uvIV9ioIzrrpLCJw/5
 IjC1PGmY/bdcVQBtIuvehQyEjZZojrOaINt2isfOrxEZ3l+y2l6of7OR8ZbHrwMDB9
 b0Gs5anaTDlky/74ElJcdBdTvM3nZAx2CI/QFCheTAKSh/EWbpsKvOxnZa0gw/5i0x
 fwfZXk3Q5EQNdA2zY51kSBBpNIAkzl4y2R9YFFIJmqniNxdHXVJAqxah9y1FzURN2D
 1BaHyQRGPZgVZT5POt8Dfe+ro5V8hM3jUvtepVoqk4vI7zBIGgoqprm6KGxlTsLps5
 55Oo9SaP/XRVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uRZ/2de6
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add grout runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

On Tue, May 13, 2025 at 10:56:28AM +0100, Maxime Leroy wrote:
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
