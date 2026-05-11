Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DA7CD3427
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 09:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B923D83C26;
	Mon, 11 May 2026 09:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGGv9b6DaUCt; Mon, 11 May 2026 09:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311DD83BBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493514;
	bh=4xcftx6JHtFLPh13JKBIHbP7WxHoACd5bbIllevvO6s=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTBzFHgQ9XYVSJD9MEoi3m6e9kvkahS4dvDsXxFTP9fX2ZJlK5ncfXTX+QIQDgOdx
	 ukzAD6CBemWN2B2qzj4twDAFOKpCusqZN2iitkKYWrlLdOthOpXYPMo8KEElv0HymR
	 hijnU0nsh4I8SbyNKegztZEEw4VuVZi5F63uY+6aAziWgb3KJPxRdlp+w9AbWoLg3A
	 xzjYq61vA5S0ruWSwtoWU3wbkTMRvozdeRgGqK/8qjNw1ntHLApBmj+l7HUC9HHu9D
	 vBLJkWKR0CXJaMH8A0QDWteABFaoLlKeA9qju2Fm2id/7wBHMWnDHrHS60aLQA4dA8
	 Mdggv3teA9GKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311DD83BBF;
	Mon, 11 May 2026 09:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 907F3223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825A8411D2
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKDfW53WfQKZ for <buildroot@buildroot.org>;
 Mon, 11 May 2026 09:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04FB3413AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04FB3413AF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04FB3413AF
 for <buildroot@buildroot.org>; Mon, 11 May 2026 09:58:30 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 857318888; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 09:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMNP3-00000009C7R-2nzT;
 Mon, 11 May 2026 11:58:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
In-Reply-To: <875x4u1dqi.fsf@tarshish> (Baruch Siach's message of "Mon, 11 May
 2026 12:45:25 +0300")
References: <20260511093310.2189957-1-peter@korsgaard.com>
 <875x4u1dqi.fsf@tarshish>
Date: Mon, 11 May 2026 11:58:21 +0200
Message-ID: <87lddqp8si.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BqTvTqPbe4M06YBUvdLkOAgq3n1gVQCb+h4gYFI0sG2zSUemy3+UkqqF0Fr7jsowVBY5FFMhVHgOYa29q35919cRs9G+oKpfUiUu6mX/fO2N+T56JWJw+HBBWXM5Xg6WB6K55TJSlJ40d9P0eyo01eVXoGAc1w81ZVgH12zjD3NS2Eca7we50uWqcFc8qFGYcoys6njwvByYVOBi67AEIhR8lYAw9ilSxuU/XyqAhqSkh6Vs4AwtSnMOLM4cG9XrgQvf5UmZbNh9zWzhsXIzfPiMEZywqN2owoeK2D7uvEoIQtttI5fuJtq+Uh075DvHn4Qq4HKTfARc1/Yyfbhr+g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=bEOlpuDPWeKn/RRxaO3XngrNf9oHf7GYxKqvaI+BKmU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=BqTvTqPb
Subject: Re: [Buildroot] [PATCH] package/dropbear: bump version to 2026.91
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

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, May 11 2026, Peter Korsgaard wrote:
 >> Fixes:
 >> https://autobuild.buildroot.net/results/6372e58671d3719b127dcb69642420a07f441790/
 >> 
 >> Bugfix release fixing a build regression introduced in 2026.90 related to
 >> reallocarray.
 >> 
 >> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2026.91
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Duplicate patch
 > https://patchwork.ozlabs.org/project/buildroot/patch/20260511053836.208037-1-bernd@kuhls.net/

Ahh, it wasn't there when I started the test builds yesterday. I'll
apply Berns patch instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
