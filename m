Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E4DD43359
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 22:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886B980B20;
	Thu, 11 Dec 2025 22:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4w39CWM1HqM; Thu, 11 Dec 2025 22:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9CCA80B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765492184;
	bh=ifnBp11YGOUk6Tp+hhwixIP9b9W07Yeu3dd+ngWxuec=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HKlUmQZtm5m/z01vs1s12owe190ZBvS9P3OEPGvOp7B+HMoIfG4Zz5r3/p2FPZ6JU
	 DMdmeda44BojD3FOKJcVm5y+foXzuVTG9kqvvr9lBmz1XKADBqHnI3Z5C17QCZSeX8
	 6TfDBfQmYg/e50UjuYplDjJ+ebF9cLfYJ1ZSrTQy/kocCXr+pqWZ3W9l62SLBcn8j3
	 REB7UTGg1YwBe0Fb7PCOYspSwpA0sBlQVY/qCEs36lySH3BxRmjHX4GQ/BTuwBoMwI
	 5fr21DMJvvXhQTjM7riKCB8y2X/6Elg3w+hiad/gGtrOuB8S+Pw67fkWaEG7Yb2eQ+
	 KvKv5UH/39kpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9CCA80B53;
	Thu, 11 Dec 2025 22:29:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D05F2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 067F840714
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97Ltjp5xe4dP for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 22:29:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF85A4070E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF85A4070E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF85A4070E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 22:29:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1038572863; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Dec 2025 22:29:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vTpAI-00000001GJH-2vsa;
 Thu, 11 Dec 2025 23:29:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <20251211121411.210875-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Thu, 11 Dec 2025 13:14:10 +0100")
References: <20251211121411.210875-1-buildroot@bubu1.eu>
Date: Thu, 11 Dec 2025 23:29:38 +0100
Message-ID: <87jyys3b59.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PJr8uVHDRxw8cb1kb2fhb4C0N/p1FPYu72hDR1ZaSokUTipaFxjind8loK99vO5P10KlIRyXONHStibPLzYc1nqrkgQqot4OeNwhERgVeaggtnY/nZuJ/djw0xKyDyqaEJrXW2kVtmcjq+Prgq3N5ZoWAOBm9uiyQEndagNFgdcZIo/uzm5iKPgoq4/v1bWz7AKttUNJK67h0jNczqZ+ixe92HvuYiwtcunsP7Xs3cwSuaW7kVcqOuQTDySH3LslzxvFPWJ/1L4iYuapt0r8NrdiQbVcilgeOrAevnscwhJ0mL8dx+YT92sxtxYqNi91mjQ49UhRpGueKxlnNYLGvA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=MwyObcqRjo4M3aXGsC0aedjkq3KMPP2viHy5FuIxUSQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PJr8uVHD
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 2.6.1
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Version 2.6.0 fixes the following security issues:
 > * CVE-2025-66471 / GHSA-2xpw-w6gg-jr37 [1]:
 >   Fixed a security issue where streaming API could improperly handle
 >   highly compressed HTTP content ("decompression bombs") leading to
 >   excessive resource consumption even when a small amount of data was
 >   requested. Reading small chunks of compressed data is safer and much
 >   more efficient now.

 > * CVE-2025-66418 / GHSA-gm62-xv2j-4w53 [2]:
 >   Fixed a security issue where an attacker could compose an HTTP
 >   response with virtually unlimited links in the Content-Encoding header,
 >   potentially leading to a denial of service (DoS) attack by exhausting
 >   system resources during decoding. The number of allowed chained
 >   encodings is now limited to 5.

 > 2.6.0 also contains the removal of a deprecated but apparently still
 > widely used API. 2.6.1 reintroduces this API. [3]

 > Full 2.6.0 Changelog: https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#260-2025-12-05

 > [1] https://github.com/urllib3/urllib3/security/advisories/GHSA-2xpw-w6gg-jr37
 > [2] https://github.com/urllib3/urllib3/security/advisories/GHSA-gm62-xv2j-4w53
 > [3] https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#261-2025-12-08

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

I see there is already a 2.6.2 release with fixed for regressions in
2.6.0, so I have added that as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
