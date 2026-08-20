Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6565FC5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3120080FAA;
	Thu, 20 Aug 2026 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_viKPio_StM; Thu, 20 Aug 2026 20:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787258500;
	bh=amZ6FodyjFRTePggQZbJSjXyOkYBjlgeAiaIVW9dDYQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U26fUDtyDbRPIIK4QDrmDTmjwyDXKmIV9eVgiN6xmNR7l4/9MJ6IrihEls/qQGabb
	 O7e2pdS6d0db8qg1jwgGpsn1xzKm86YDj7gwMa6ygUC53CRPwMtVwkS99/J3k9ZJg9
	 CzJxdQHEVT8mpZSkFqtA44f3tJSomjyzzTM0zkr/IAhgfyElcFAseKseIKZCZrFwHj
	 Oy6vVAcrsy6yBpaotXhxvtVJZ1xXQ0f625fuCEcL66dkxWIpeI4n2o7SJGmqB+pIbr
	 xNRIGdSWH+mdq31ZBaJjsB1lVgPTBfohIHlYsZcdpoRZh8f3NoHZbgRrF/uVZZnBXi
	 J7clbvcW1uzHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A51280FA2;
	Thu, 20 Aug 2026 20:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 686D6EA3
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E2B960883
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YATr_Z2MAJIN for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:41:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 667AC60823
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 088631A1770
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:41:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D0A665FF59;
 Thu, 20 Aug 2026 20:41:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1A8A11C76810; 
 Thu, 20 Aug 2026 22:41:28 +0200 (CEST)
Date: Thu, 20 Aug 2026 22:41:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aodmZpj2VIl4gQwe@windsurf>
References: <20260527185007.3533507-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527185007.3533507-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/uhttpd: bump version,
 fix cmake 4 compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, May 27, 2026 at 08:50:07PM +0200, Bernd Kuhls wrote:
> This bump includes upstream commit
> https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=ebb92e6b339b88bbc6b76501b6603c52d4887ba1
> which fixes cmake 4 builds. No backports necessary because the cmake 4
> bump commit e46695bbe4ab583f39f9448f3ef3e044efa28808 is not present in
> any older branches.
> 
> Updated hash of header file which is used as license file due to
> upstream commits:
> https://github.com/openwrt/uhttpd/commits/master/uhttpd.h
> 
> Disabled new configure option UCODE_SUPPORT which was added by upstream
> commit:
> https://git.openwrt.org/?p=project/uhttpd.git;a=commitdiff;h=3ceccd02d86bf4d6609f46d8b30963cc52034cc2
> 
> Fixes:
> https://autobuild.buildroot.net/results/cc2/cc265d34aed684b88032edd04ca0fc88186ec676/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master (because it fixes a build issue), thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
