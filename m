Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EE7C79FA7
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 17:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ABD081366;
	Mon,  5 Jan 2026 17:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQMj1jfWXGIW; Mon,  5 Jan 2026 17:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C48781352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767634716;
	bh=ilJA+ktuWrQsUeDP/DAhuEmtZM/di3XmCOpS9j6Kv/o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gJDNGQeSQjObsUHaAFUAopUufctaRdc9/Xqp2v4GOAvEIWnYVz/eDp1kpOCJ9MM2t
	 r715txlAHzhRdMZxjJX0BEsZ6jT5VuWszmlI+/xWOnMw4pDKS3vDLuNlx/TMGHHMQk
	 JQNNRClLe698FjiGLpSgbWI2pO7JqIc1HUGxZhoVwuWBCQVqpp74W/zLLdfjvc2y65
	 N3EfCs64MTudYHpKNq7TCVIbHHWM+5qpfJ05GrRlQAjTH8Su0qkRpWplN5VK9H5JHv
	 NjybuKnZRKw4eUHx7KidPgtiO1Gr2tTV7gpCGi9aMeHg7daxzLCRh8qs6FW2iN2XLj
	 7udbHG5AKrc8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C48781352;
	Mon,  5 Jan 2026 17:38:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E19FB2DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7EB781352
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Be4NqEAOhhOA for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 17:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C656781331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C656781331
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C656781331
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:38:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 512DA78035E;
 Mon,  5 Jan 2026 18:38:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 Jan 2026 18:38:27 +0100
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 18:38:27 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>, Andrey
 Yurovsky <yurovsky@gmail.com>
In-Reply-To: <20260105165907.775076-1-peter@korsgaard.com>
References: <20260105165907.775076-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <369c5809d90c24b22860b3890c9eeda6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767634710;
 bh=nUX64IhMGWGLT5QqWrLPrXU5U/rsmf1UGIPZ8q/CUUk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EsqwZw7Vvqb3EIeXBRia4u82Ka9T+Hd5i3HB/6yZdfx3lN6rQKA1/9g+1HG4sUHc4
 GPWMZfMUQGYQuwHR+X2NU/sthZ1cdAM+ud/yVc4IZ5Zx/bWQoJSl6/ZId2BvMjvL5o
 KYV1S+nHr/e6rNr9qXqnca9Wy7wj2cWymOylBcK6XoFtv5TsGWKBE3Cx2/EF1kpNtd
 MzLt/dtaN4bt96dqQ23uf20uDOxvza3qjSH/0Lxv/z62rpAjaGvmw88Rwr/18tSBtd
 Qc44N0krKpPDXL8PtCn82F0bkjU78llXxQxj04Rt99kxotp5/iSFVyLWsOpKkCm7Gz
 j05m8fPDcMGqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EsqwZw7V
Subject: Re: [Buildroot] [PATCH] package/rauc: bump version to 15.1
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

On 05/01/2026 17:59, Peter Korsgaard wrote:
> Bugfix release fixing compatibility with Linux 6.19-rc1+.
> 
> https://github.com/rauc/rauc/releases/tag/v1.15.1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
