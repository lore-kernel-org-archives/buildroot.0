Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010EED116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9FC41952;
	Fri, 28 Nov 2025 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gOe5BPVdUtq; Fri, 28 Nov 2025 20:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F6C40B8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F6C40B8B;
	Fri, 28 Nov 2025 20:53:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E88C91A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA35740B8B
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dC7ydj_D-c20 for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B18E40B7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B18E40B7E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B18E40B7E
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:53:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A9FF06012D;
 Fri, 28 Nov 2025 21:53:01 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 21:53:01 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 21:53:01 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org, Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20251128202429.2785183-1-pkerbrat@free.fr>
References: <20251128202429.2785183-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <cd970525252ad6f977e9c4ccad19c473@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764363183;
 bh=vGs7VszDVMuHCXGtXH84PNm/M5bvLkAWO6xpvj4Kjs8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cqdecmrbfhOXpG7kY/YJMVBgLTFOaiDQQcCMhYf0udwRSgTZmJEx8p2iCcHmQDzkZ
 ftY6hSEIkVqehf8mcDbNPU3iMMw+nZkP1IqekheffsoBvQ5kG/WoFWTw7Bxc/tW2WG
 iBwvVghwqo9vyrfTtd/8wc2xUUTQaEM49kO42CwaN9+3riuuigLmV4tIjtYRUbXqrv
 8c5IEWA+rda5HkcsFhXikIqfMQHp0X2cvc7YyDBqOWoVb3JRpYwpuupYNWD36cg1Gc
 DTqNjBJQ2Mb6ot8brQzJF40s97UyzH+7oXsZ94fSli8ILeCj0tmeFzARFKi12CXAXV
 8YadlGWCc3bUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cqdecmrb
Subject: Re: [Buildroot] [PATCH 1/1] package/git: bump to 2.52.0
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

On 28/11/2025 21:24, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://git.kernel.org/pub/scm/git/git.git/plain/Documentation/RelNotes/2.52.0.adoc
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
