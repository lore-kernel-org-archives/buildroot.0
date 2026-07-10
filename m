Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC4BC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A38409A3;
	Fri, 10 Jul 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIYTlolTp1Cg; Fri, 10 Jul 2026 16:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BF4840874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701504;
	bh=z7qsLCjoAvby+ek9mWYA5pFmaOBdpnIVIfPHsTeotaA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dr4lPDxKWnqv5oo7nDmrUJHAG6A4Ma0PVM8OHnnJvq0jA2zaH1gizd9qGLOstx68C
	 1katDqxbGoDEXrS74zi3LhIWN0ZA0WV40jJV0rugii9LQPDO0et8fplFJwOBcT9qsL
	 SH9yo+OodyDVVpwydvChmnhQsmBHGN+TxV01s+DM4W2cl1uNcDMeN9elkgrrK7OBaJ
	 CkEc03kS+3RlBq+RmByK5ntO/UOIqCU3m3lOGj1jDa8EzBVB+htTQdtBu5o628g0ya
	 sdBqQEL2+Y64A1MIdtgjgdHhv2RCuEZOJ0iu5HZJMSyfA21bElu+MMjr5kc0+h5yoo
	 e5NSG/Y6FtW/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BF4840874;
	Fri, 10 Jul 2026 16:38:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54C562FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469E0606B4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvH7-weFzBG1 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 682C860644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 682C860644
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 682C860644
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:38:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 30DB560139;
 Fri, 10 Jul 2026 18:38:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:38:19 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:38:19 +0200
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <bb6119f10459ad2ecba91904dbb3bc122f381a5c.1783685047.git.baruch@tkos.co.il>
References: <bb6119f10459ad2ecba91904dbb3bc122f381a5c.1783685047.git.baruch@tkos.co.il>
User-Agent: Webmail Free/1.6.17
Message-ID: <449ea13ce2b9470dbe64cfe961cad105@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783701500;
 bh=Ln9mwavE07ZGFyElQgHTI/hVe6NnA/F5RKsp14KdE9E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nlvMxw+pEvV/EP8g8sYAJTFSa9uMWCw+Mbf9ESaBgwssWa0cemnNX1JI7SqHiCLXS
 9mFLwY/mk35zWTOcEJkVxcQqKhOCZPy09zU/Km0Wm8in46pzPwmtSJL8QyWuj2HhKp
 4U+IM46avGULPcvXMyYroMlzmBcf+5Y1/2gFoBs+krXS/rn6SL6jcQ+pQfLU30zCiK
 aVQrvGZkqmYcOMteF+x24wt5Y027iVWoQdeY8EXfb4qsQEnf3EQcJ0IAuj/m+NMS+n
 SRXx9oTr87miNaTBdStRSm4fn66BZ3ONntKvO8Z0QSdrlsUV5IWT2ULcAF66XY43Z8
 Y7yD4yOUGlaqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nlvMxw+p
Subject: Re: [Buildroot] [PATCH] package/socat: security bump to version
 1.8.1.3
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

On 10/07/2026 14:04, Baruch Siach via buildroot wrote:
> Fixes CVE-2026-56123: SOCKS5 client buffer overflow. Only signed char
> platforms are affected.
> 
>   http://www.dest-unreach.org/socat/CHANGES
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
