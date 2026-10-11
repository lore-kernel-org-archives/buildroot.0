Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D7FCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 15:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D7F6060C;
	Sun, 11 Oct 2026 15:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qKDD93pbWL7; Sun, 11 Oct 2026 15:52:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6BE38605D4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791733975;
	b=dMs0Xuj+EROH7DgoogjPefDFWZyfIliD63PleVdnvCgZEvKi7cqEiKKF0gDusNPA1TzU
	 hWgU8SvmE9mug3k1ciEssrzetWEGutALXb3q8OxgikZb20PTQCn37simKdlc6oHBLqCKT
	 wtJ6RMdSIzRPaD9Df/fMn/EyKrLMUqJKdfhUZp3sKE4OAdDMhW/wSO/miRapcv/FpHaug
	 UTLb+MC/kcHU8ogxjqaMvbpZ+d20bC5ltOrXrQMSMjJjZKdeamLXBZOHGJOA8MPqNQQvM
	 UIugh1g23mx9UTnwVLIW5rvKQv4N/nUqWh2mbOu8u1rOSExk7dTpSvqBinOb35jAzYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791733975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LziT2StyWezcSStRIEwtql44RdXCFj47MZp2bq3HPAo=;
	b=PWRE/sFrTOaUo9QVJV2dytUyahMaqfOILsCNqnqs4X3l6FunjcjZzbYHw1FGbL0Fx/z+
	 LYdZ0xq67HXzFV4t7YiI5dvqbNLp5lSdW4utjmOcOBkedzAkVYnhDNNCb7vHKWAfxdKGB
	 XcHJeY9cINuhocWyERZtnSbjCIqgQhW0ZrM063rF9oZ4g2bsehoU0ICrNqxi4UFf/7gor
	 vTe9c7vxZMQVJi95AOiNSsivo+s7p/6fAcPrFjqeXgjUsZiTAzqphMJOncm9xY/AITMh6
	 EnQxqZggoL/UGMjmI1/uzG4AI/Ly8s14b7g7IHNqPxRYwIcYieD6OBMZhSi+kfsYRFQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791733975;
	bh=LziT2StyWezcSStRIEwtql44RdXCFj47MZp2bq3HPAo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ejEtN5f93mah8yYNC5zReDn4IMKBPPTYiosoLzWOrmmL7tMFPlZXlrcWTmi8bX056
	 dk4OTp69YfJ7/GQkAB57zifRJdNiFVvTHpNUzEEtw03FnzI2Nj9a5Gjp3KnCnVfdqd
	 hUn3ysrPjN1egBq3OOg7IVvgqOEhxLjtQlaDNqhVF7OYYNT8lhQTYJUwkF1w0kRaIL
	 jJrnZDhPlSpRR/n3O8fbn950WUvwh9NEldtnut5FWFJZP0118wsj5xTgfkYTIlOtM3
	 nfPFpGHSC2VnZHxgPEf3yTvo8LrtB3JSzNSdca4neAObiVMyj6wnlJRUZf5sfR7eJm
	 CScLH2tSceTtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE38605D4;
	Sun, 11 Oct 2026 15:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65494380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AEBD80AA3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ijud9DR9fT_3 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 15:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3AA5480A98
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791733973;
 b=PS9i2yCFmg+0bu0dUApHCBk07hB9Ql9nb8bsTbFcdti7p/JFMwQ6JrRENUe1te4V7Nus
 lbNIPRQentR9rcMPowniE8uhdVaLHGTvBRDtGCxuipbKAtuLcRsWkTw07+k0WRZpXfFJM
 dYymT0bh3MWxR7OdIZY1ZkRnSVqUHkCffgyItEtIjLs4awYqcBOOuavkwiaBSgLK40+YU
 ui4qClNJ6nqe3bjQbFBS820s0QIL5NakLZdS6bogqtgpbUH5GennygQFcj0vrwXRVceJE
 Q4Jiy1TAjwJijzIxIab8m+mHEHN96IoRCTSBiDeFOGSM56iyc5FUQNeG++SQQ630VFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791733973;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=p9SnFs0xQXpUVjLFDADMhNKfyN828oK/ucL6NyvD6Cc=;
 b=brSgF181G069zqHOFmrByYZU17wy3BEhM7YJYXF40mPdlMWVDpv/yw/1/z4TNAM8rXlT
 TvrY5EJnNHgmqEmraZEPmpTzXrdh+ti6Qk40S/p5wx0XTb64sD49kGbNspBhJEb83d2xW
 1b2SOUOvNj5OSUkQ62mkywk9tUJsktDZy166FAq2Dfw72Ve6dWZz3ipaoEWrH8/c4t1vL
 CZvPo+C4ECbogT1Gb6IgRIobLTxPAhfOL2O1L+W+D0bM7e+VkcdZeIjE57g3QgvZPMjdt
 5hO9Ty9Z2h+NtKYCR3eXRokrKsPTo7NzuY5DARpiFyAhusZrewOdjYnv1ayxtE2fkww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=ZJxesPWO; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ZJxesPWO
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AA5480A98
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:52:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZJxesPWO1bPo30i7mSrOhnsDNtT60P6G6j9kqy8IjSeI+bpDfnkDw3S3Lw4HqXFYF8SG7bK1LK1j1Pz1PaejjP218pZSumw41GjDAQBLmTZ5skZyZDVb4uuPmIHUufam3e2HnvVWdW6dChITT6bgIrYwv3gn5bfYPq20elfpBQw0d7rjAqu3o5zrSs8IaQktnh/63t4i0TIjzCy8h2Nr5CLs09uiOHmLs9PRM/CVRXHqhKb3bbILk89ULjC1FKt4UPaQA9H/QB7pGhCZ5iBcYPxYs5Ptq7emkceYKgAx46QpCTWNaw6ZM0DnRihH0ss+LrRso6+iTmG8gq3BdUp31Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Tgm/zSLEhyAUmTZ3zZByOnqlxPIFiru83HqAx6yLjKY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 197921981; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 15:52:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFvqx-00000009FWE-2DZL;
 Sun, 11 Oct 2026 17:52:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>,  Arnout Vandecappelle
 <arnout@rnout.be>,  "Yann E . MORIN" <yann.morin.1998@free.fr>,  Brandon
 Maier <brandon.maier@collins.com>,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <179172462322.180911.14758630260298969085.b4-ty@b4> (Arnout
 Vandecappelle via buildroot's message of "Sun, 11 Oct 2026 15:38:37
 +0200")
References: <20260405185608.1357633-1-fiona.klute@gmx.de>
 <179172462322.180911.14758630260298969085.b4-ty@b4>
Date: Sun, 11 Oct 2026 17:52:47 +0200
Message-ID: <87o6d05j5c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

Hi,

 >  Applied to master, thanks!

 >  We didn't quite reach the "within two years since v1" deadline :-)

;)

 >> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do

NIT: ${var//} is also a bashism. I guess we could use tr:

for br2_ext in $(echo "${BR2_EXTERNAL} | tr ':' ' '); do

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
