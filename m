Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62164F483ED
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8044140BDD;
	Mon, 23 Mar 2026 20:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCN4VBOB5Wrr; Mon, 23 Mar 2026 20:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DE640B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774296025;
	bh=kRYpmHFEyb7jjJKRuNnw2bGHBXT+lq0ywdZSJaze+Qo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jtXCv/reO0BqBwUBidgpZRGlGAesafSqD6s/02D5GUKzIZ2c15SXE2fVdPgDmNSJJ
	 Z+d41l6Cs+mru426r6PI1Lo9PGsPAp9bWze7dHR7fXfALvE1t5Qafkih6LWLsIEAfR
	 ftVHuzweH4aon/2hRMaMVHNae9ikLV6mYZEePF6wQcjNt8FL50s0ck9d65oX5UsubH
	 G3NTJgF9KGGcmzcdiJ6yyGTC4+rPg9mxLRpqWRRuT4ca25aEpghfcRQzQTUy+tOj9m
	 daTGXqn5pYF3LvNCkn9mlqOuJ7GMbeyuYz9R2sDqvtmgGhoO9CwgTjwFaDXDKMm84q
	 iqLh35NaDCu2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DE640B7F;
	Mon, 23 Mar 2026 20:00:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85B0BF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B321821DF
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdOxmpF3aMHT for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 356A4821D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 356A4821D0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 356A4821D0
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:00:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id F1B18780506;
 Mon, 23 Mar 2026 21:00:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:00:19 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:00:19 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <acDu_6w5SkzNa7rN@waldemar-brodkorb.de>
References: <acDu_6w5SkzNa7rN@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <c95497cd01c6b2b6c7f76a83ed4094c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774296021;
 bh=HI9uf5O7FfEtRHZ3jk11dvDC9EzJ+LSNZ9qjvTTRY+A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FjeNQj5UCRqXQRFdM3ojgZeRqcim/v0HB10ArcQOgA9zZLB2yq72tBs6QCgD0Qu+1
 iV5f6ikHOSWo8sCW9tBLX59tkHHqkUb8X/8Y0jq1/ZJCuiwDcNWkT1iRKIvRIjewvI
 8URYJ2q4yF9mAbj5ZOlEcq+RjrXAD10SWy+AqSueh8nufOJhMO8nqlijje79rDlclM
 dFiogHrNNZtKfLd/C4DfgSAqONxOLI0HgS+r1WymnVjEyDg8WwK+HMjUlckmJULu9W
 fZ4piPzznhGckvE7v36/b6ND7qUL4d12sbOo5zHtkP84ATEuiNY97Is6ipqZn92CUN
 lE0jHb3AaRZbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FjeNQj5U
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to 22.8.2
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

On 23/03/2026 08:42, Waldemar Brodkorb wrote:
> See here for detailed changelog:
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.2.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master. I added extra info in the commit log. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/84ece21e8482c98fc4d21f3a791cb516118bc169

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
