Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1D7ED7B9D
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 10:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB05D84C5B;
	Tue, 14 Apr 2026 10:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCHGbeH2_XKE; Tue, 14 Apr 2026 10:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1941F84C56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776163015;
	bh=TLLQm/6VOlIWoxZ2yzYn344W8JKpeJbeaeoGutFS1pI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sD3+3PAA7EMZT4s1xh7TvaffIaQien+f/t38ZCcNEWqaZRkOV4rdqo/vRNozRv0lb
	 vmxE2g0PJ1pnVjRwRfrOXP/Dgz0zFHK44FzB+VElvI/us/QVaqSy6tqjaKWiWycDfn
	 9ADr6lPrlrchJbOWtdBl9AWnIWiG8/cjTBZpBH0TynXGR5RHxDzyI9vK0acLn4z731
	 32lIliVDTedClyztE1ZxAI1TVtHb+NqMmzSLwp90yMwFvuYiNAfKLHtCLbRz5vmFVQ
	 Zf8Yc6YuTNNSboCSo9MXpru1VDXm555E/iazTPfpzGkjR8YXuvozh0+Jzf6o1dtFow
	 eSGweE0yFJX5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1941F84C56;
	Tue, 14 Apr 2026 10:36:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF99A375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 953DC61CD4
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8dcSc486EIL for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 10:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85E9061CCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85E9061CCC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85E9061CCC
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:36:52 +0000 (UTC)
Received: from L13942.iliad.fr (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 62BAE780506;
 Tue, 14 Apr 2026 12:36:48 +0200 (CEST)
Date: Tue, 14 Apr 2026 12:36:47 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <ad4Yv6qMXXQf3kTB@L13942.iliad.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
 <20260413151148.42226-3-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413151148.42226-3-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776163010;
 bh=p1HYWA8nIX62zI+n+/3PXIHh5EgIEOGVXVn5TteETJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jNPsegFxhr5AbffOEWgzgLPEf2HvorbrUYBLAm6taoDhd1kw5McSEO3If+guIeyB2
 ymdvmmtMO6jRe6OuGgfWa5J7AnUqU38OFfbcIzn8sqHgbapBOa0qAO0fGZtELFiU/j
 RpigSUjo/m1oLt3Q/UpBkJSXolCBdShIUF5sQRH/yzTaZlCzHlS7Podg1loicbnL2M
 bN9laWpovgpBuDTyxL+V3KKy8T5P1RyThk6x0kuoTY0vgGKYY8zafsEniaCIwX/CQE
 RIRTmx18AHorzgItZDPY03Yr6ZK+m0G0rNSdMYdksMc7tS/Zj1rcggQp+pp4GgBgs7
 e9emb0t41eT/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jNPsegFx
Subject: Re: [Buildroot] [PATCH 2/3] package/dpdk: add option to disable
 target installation
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

Le 13/04/26 17:11, Maxime Leroy a =E9crit :
> Introduce BR2_PACKAGE_DPDK_INSTALL_TARGET (default y) to control
> whether DPDK is installed on the target. When disabled, DPDK is
> kept in staging only for build-time use.

Can you explain why we need such specific trick with the DPDK ?

From your comments below, I guess it means:
  - DPDK has its own internal build logic with both .a and .so build
  - for performance purposes, on many targets, we link with the .a
    so it is useless to install the .so on the targets.

> This is useful when DPDK is only needed to build applications and
> is not required at runtime on the target, e.g. when an application
> is linked statically against the DPDK libraries (such as grout).

> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
