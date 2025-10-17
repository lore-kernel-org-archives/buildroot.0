Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D269CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA95819ED;
	Fri, 17 Oct 2025 16:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id se5qLFv-SmPJ; Fri, 17 Oct 2025 16:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EB0680D7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB0680D7D;
	Fri, 17 Oct 2025 16:37:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5403972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B4F1610B0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIMOh21z_via for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:37:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E8BF610A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8BF610A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E8BF610A1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:37:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 81B8313F8B9;
 Fri, 17 Oct 2025 18:36:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Oct 2025 18:36:59 +0200
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 18:36:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251015171510.1890988-1-bernd@kuhls.net>
References: <20251015171510.1890988-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <3f61165e2349353736fc69fa788e91ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760719021;
 bh=wDAN6GGm14+qJAyzYpIanneCo8tlGLPxLpkZ8bdoAMU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nDraRf4sD9F37X9MiwiXJGuMbAaNf1nsUgCwzmoorHDgP7qeXXcZk0gdozYanMl1E
 ukafr+hVJAJS9V52NTdVuvzq1onHuScGuSsH8bA/X974SX9f5sZlJRPLI0p/SHX1+/
 yLcMGkAQiwPpHXgyYmZo7zKoptKN9P/NFvWSrUYAm3K+fybNGi30oqQLWeWWy42pM7
 ATBCvjFeC+F9BT2D0S2VUnRlBtq/LwRGt5EA+5AZr0qhgoE5IWZnKh0RSoZdZjpmud
 AOoP4rX0Qq2XWsrKMsA1bdOweh1VlgdtcMN3SseD1VyHx20Uz5tRctBFUQfHGc9WO3
 FwRIFDSJp2fLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nDraRf4s
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-pyudev: bump version
 to 0.24.4
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

On 15/10/2025 19:15, Bernd Kuhls wrote:
> Rebased patch 0001 due to upstream commit:
> https://github.com/pyudev/pyudev/commit/6d760e7eefb8ad1df55e69067ccd7d023a1e9be5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
