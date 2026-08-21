Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545CC5DF9B
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0855460AB9;
	Fri, 21 Aug 2026 22:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWjV6yGywh6g; Fri, 21 Aug 2026 22:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787349897;
	bh=n0j2HZWTj4rz0ikpoo2adNaZJGXylxFFm+9Kfu8TRl8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ST/QyA5WU4cmnsNK0KdgxjXYeX74fclvHyYRZ43L60/pIVPOAlTVnUbUKx+KXkNoy
	 2dtLPmJ0pstv0dtoHzz4a5qRPgt8NMs6PeLtKWhJnBtfTUOoUoAaHY407n2WpJ654R
	 oIHKhAC2TuQjnlmJhHRhctg1D729+zTTAQWpqp6p5mGO7IsC6E/tMG2g7Orh8mNFLY
	 W3JhyeXVg14GBtdykXfoH5M9BxbHRe/h12WQUYVcneHclwqyQ9CzOHfmJ6xTUHdAkM
	 6dSwqLnpaV+kaBCoG6yh9EUSAi/TePkIRYP/flVToh3LtYbo5+u1i7iLr9MJeebGsx
	 W/rBcVzH8votw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4989860614;
	Fri, 21 Aug 2026 22:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 572A9118
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D06660614
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9huValc3KWiE for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 22:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 537386060A
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 22:04:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E10F62003C6;
 Sat, 22 Aug 2026 00:04:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 00:04:51 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 00:04:51 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <bf210af2584f4d87783ac68fbe94236a5cffd65f.1787213987.git.yann.morin@orange.com>
References: <bf210af2584f4d87783ac68fbe94236a5cffd65f.1787213987.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <4daa5336102b928ab61bfbf2e030719c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/distribution-registry: needs
 NPTL
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

On 20/08/2026 10:19, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> distribution-registry calls pthread_getattr_np() which is only 
> available
> with NPTL; i.e. always available with glibc (where it originates from,
> since 2.2.3), always available with musl (which has had it since 0.9.10
> in 2013), and only available when uClibc has NPTL (since 1.0.0 in 
> 2015).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/9395500a8baee6c6142f96d7bc97e81725c2e754/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
