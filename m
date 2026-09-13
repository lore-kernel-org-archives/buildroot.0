Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE62C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322C480E38;
	Sun, 13 Sep 2026 10:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xubGWhq0VnBj; Sun, 13 Sep 2026 10:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4974E80E47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789295733;
	b=sTw0YeZUx1I+FtkGeiRRCMmPSvqXhLNzcVQ4DbUyG03HFOcvOKTyVdAsV8/4Zz9VRvJW
	 vvmdy/SZAJooiRyBSE7AxiMj5KrCaWm/7pPtS+2eLDXrXrFnNctkbklK4MVz79TCYgV85
	 TZUN+eo3NEKTg7MRxUyvoZMcQ3MpTzW+ikeZfKP4m5rFEBO9POgmPgP0MixumA5HB/Yd1
	 d17RZUicG0IlO50QG/Pun8dPB3VrwXVsJWfR3zxhX0UQGy1zf/6J+VJkqLrAlVWiDate9
	 GkelY7wXfKT+nEhtpbAYEVvAhNyO8HWdSFUJIOKJBpR7BXS1DzGj1ZigJRNBOsvYHkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789295733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HgAvWF2XSX6fbm/0poOET1p7EOfQhqhABljy5/kt8eA=;
	b=RDSO2d+VuDf+wBgRh87rWr/ZWnenGR+CqxtceBwva7xgl3i10WLE5ymxMyxWxtgv5ceW
	 pTpdRAojnuTCxEauyKAGx6yB/nepEm+yuAvi5wnAOJa8MZMYlYBgkUAMrVlK2dwF0TtBA
	 K361jhYz55Qw5gtlsg/zoobKJBtHsUMbpee7o2k/S8/1TLq+cmmtTT7xBfhs+R7SM9grF
	 cAeS2Km4U886cmrKMscjBjYzO4pKzh2izz67rgbi+8yYxe12Moy9t1CABEQUvzopQptE1
	 cMmjYkHuzFD5vraTwlsNtVCbmap1NFu1Wub1c6nMOYVkxVAzEQ5JsfxW2DTKTQd4T6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789295733;
	bh=HgAvWF2XSX6fbm/0poOET1p7EOfQhqhABljy5/kt8eA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W+VrarBE9dcm1oGnSN9cSzkS0HKVEDAnxjua+HK3Atm35p6GfMfGmuPuxkQa9PzQi
	 TsmlHuq/tfbDQh3f6qef/86bmRjsqzPr+PwqBhCTPsGdkJDUQTcguLwU4/ktZgNJSf
	 VwxgOYlkJ5p0NP2T1g+qN6V5Ag5KS4ChWxl9L1YmPGlzXVbU2AAcOx1oQdio0MCJOq
	 ADrf8CFkn5HWRHnfi5BOGSh/9mmOIbdAv4DxBVJhe8CJxsNvM/7mqOBZZsgL1ZtfWR
	 4XXzMAYZCWYpXha8bCsOCpgqW4ruI7k+jSJ5j44/Z1CmAXXAkrSmaPo4LOVGQL2ugH
	 SJWpX/RkbnUnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4974E80E47;
	Sun, 13 Sep 2026 10:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F138229B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E24C380E47
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqwAMVzIk4dA for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:35:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E0D0E80E38
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789295731;
 b=V5rDRNIRez7kG6a7cfVzXygXCpQ829cJfOuaPbYB/rPUqVD/DVDoInfiE3j26vLuJycq
 vsW/64Ixi4fYPF/G5KKrs2DFkULZOEWFyMZcM4B2eyXgI455Ck2yx8RWlrAoRh1bqo8BA
 6KDYBCFYRxLx3/xDVZLxId7c6sP4g0ojpjLhCQVUEnWdOb6gfo02HX1kk634p46pEhaVq
 RBqw1KOLzATrU/cako2cHGfa/DpEzE3ocq8hK642kq011TAoxxfvb4pQWTTdY3WTeiOJn
 hvrGz2RPIi7vG3FW8wtwYkEUHwXMR4LbbzLJvdWRG9AggXUEtgRo5CLS6WQww4SqXRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789295731;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=D3NZQf3hC3fFjf6zHHt+otpRqTPsmikHDGmEqkwQoUI=;
 b=CPvRZTQRGLXoeZEVASajkBGxv3qX+OHtVcSeg5oCHBoPvJw+JQ8MpQYQc8Sj3ou6KEw2
 28Dsk9aL+jT3dqFDD7U594G9nhAaiLyV6PVuc1759ninDJ+X+f3W0La5PyISvNEEaBmSf
 Ul/IiFfL/XLZbfh5SSlpWMUiRSvXi78i0WtbqOv/HgLhRLyLpeY/l9ZgWtweqsqV0hBfQ
 5mA8CvU3wsbVoieEp0x3j/JGM4hx/c6ldavRcAChkv+lIdJW2mBJohlSdCU/VL5tXjVL0
 4v9lTvXdclWA3ItqhIFZUj1JSW3aS8sYRenVqdqt1QknhX4ZmkA7q7/U9K0UZlgKV/g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q8NNp4Kz; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0D0E80E38
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:35:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B5411B0053D;
 Sun, 13 Sep 2026 12:35:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 12:35:27 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 12:35:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260912165036.903715-1-bernd@kuhls.net>
References: <20260912165036.903715-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <dd7dfa0bc8a6c86c7ca80ad8e3a52390@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: bump version to 4.0.6
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

On 12/09/2026 18:50, Bernd Kuhls wrote:
> https://www.ruby-lang.org/en/news/2026/07/14/ruby-4-0-6-released/
> https://github.com/ruby/ruby/releases/tag/v4.0.6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
