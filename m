Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C5AE9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD1881919;
	Thu, 19 Feb 2026 13:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43Jx5c8hQGAu; Thu, 19 Feb 2026 13:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6886817AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771507813;
	bh=vaEagjg7FVfQRzKfEZKvvSCZXBv2eRGPRQsmbm75pjg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OMSOLNFNUXxgyIXfclQOcNS99aAfQ+pJNqtRXoqxarTVpokiw9loj+acJtVA1V/Ga
	 ErKt4rX+zeZtOrLyg5cruCpoKOcVcI1JoHHKuYGmV3VSJVYHh70wQPQ9NIXBFXqPC6
	 xTpS43z6djhiDe+Mf/TUuZW2rAgIdyTIccYghFeAb3tgZ+UJY/qK+G2HJ9BLGGg5mE
	 DTrAAJJAGpD1mpxEtQ/994AfZ+PcfDCsL4sLyMB+tl1vKcUgMLIuAQ9ELrEKzx6aRL
	 f+g8YmziN/hyfTRntVeqGiNtx5prcjr0aBmeZFuJgFvlVLYD+5hivPzMfLKM1Mx4IY
	 k7M8EmQjBSx3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6886817AF;
	Thu, 19 Feb 2026 13:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9352206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EFD960866
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49Q3XmSqnG0d for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FEC1606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEC1606FF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FEC1606FF
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:30:11 +0000 (UTC)
Received: from [192.168.112.49] (unknown [61.8.147.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 519E82C8428E;
 Thu, 19 Feb 2026 14:30:08 +0100 (CET)
Message-ID: <c2739122-0ec6-4eda-adb6-4e2e12756df8@bubu1.eu>
Date: Thu, 19 Feb 2026 14:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manuel Diener <manuel.diener@oss.othermo.de>, buildroot@buildroot.org
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20260218140031.3124335-1-manuel.diener@oss.othermo.de>
Content-Language: en-US
In-Reply-To: <20260218140031.3124335-1-manuel.diener@oss.othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1771507808; bh=O8W0PXFafB1eURJGTH7IVqeTydFyObjyKXWzQCZWSfA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=nKyOcMZhbxVlpeIpqUL3ZvxtOuW++7g2+V0FxR3lVrAW0xqI3ILhVlzQCPK5/sMpX
 umr7dXN9fcZ1XD02Hm0mkpOrAPPSbVbqATwRqdzelbmkplGgbzzxuNAqMudGN1DS3p
 MiOlZeY03HMRQOacMS7PDJe7iqrqLuDZsZRerzmo/O+jjVwkctBhjSpw1qjmzZj0gx
 FRrmKQSCeNhKn6CECvNW61oKPhWYp7AkNZEwmDTv61iiEr1qQvlhNIJOxWJ9PLpsxv
 DRDe68mAT0heAy7fEaPa7qtV6OtIODpJG1ExSdX8k1V+z72pRUZ1hcMdw9I7nX+Lx3
 164+YsQyoAVmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=nKyOcMZh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.12.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/18/26 15:00, Manuel Diener wrote:
> See the release notes here: https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.12.0
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
> ---

Applied to next, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
