Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C5AE7C715
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 09:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1B8461116;
	Sun,  1 Feb 2026 09:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i79luVlBMXlZ; Sun,  1 Feb 2026 09:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1852160F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769937854;
	bh=1Ij8OA1putRDctmWVajxZqeM90hDQMn6J1SNTWr32eI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqHq2l8uSjnL9Y9x1crMyeiWmmULE5+h/oFviY5p8iqmn//StXvBpayQu8ZCv3q02
	 wQH5ArWj2icCC91MRZtnuVGNi1MaQSArdiP1gymSNGTTr8qfqYWSPL7OjSXkGWLOCi
	 /v7+2VnnFK8f0zmNj3UxwtYJqf53ppROD5DAj2gBGn4O5iCnI/OzkJNNkKLkzGH6dr
	 FUENMkG97kKp5PmM8lSAtTkUK77oKGVYx6Mo9aWlp4YXXG8aodbxB2II+0xz3V8RMb
	 Jq2Z5c4//qIk6MAVqqRBmD3qRlQykoxYREUvpc7zaZaMKsR6xQIkyjWv1N65vRlsJx
	 gNMutNOxznKtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1852160F46;
	Sun,  1 Feb 2026 09:24:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A10F423E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AEF940A71
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYq-6lTyo18o for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 09:24:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86486407F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86486407F8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86486407F8
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 09:24:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1160704138; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 09:24:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmTgW-00000005iR3-33vH;
 Sun, 01 Feb 2026 10:24:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260130204808.132354-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 30 Jan 2026 21:48:08 +0100")
References: <20260130204808.132354-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 10:24:00 +0100
Message-ID: <877bswx1e7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ik1X9iS3JqpRFL+YpgQ8vICZbAMwC7UkQCq9m3/fxJM+e63VZD767yaVX13xWtd9FFsGqhybd/VknR0OKrBR/hN7ysEcoaFdNN/5eow0m4AsvrGIilNDFlJGeQFSpfNwsaXOcL9CFQX2trWCIKg0+W7lz0h5xIN9r1xo2w0ceqyxZueqi6P7lDApD/bEPO8SBjlog/+wYDcN8YQQHISq1yF9G4QAAdw47Q0jgkYFjgVePL4SNqgPGsU0M10RuxoKkSFY+Xmw0D0HOnszZla6DVNR2eUmMISg6eJWz5J0jXZoI1ErcjZu2mysk1urKFH6iCSbEEPEl9txK3HyiO8BZw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=jJ6tWLLy9ppjTdpTr4lrm7rAGClr7mCU/jgrr2phJbY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ik1X9iS3
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.8.22
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://forum.torproject.org/t/release-candidate-and-stable-release-0-4-8-22-and-0-4-9-4-rc/21160
 > https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.8.22/ReleaseNotes
 > "o Major bugfixes (security):
 >    - Avoid an out-of-bounds read error that could occur with
 >      V1-formatted cells. Fixes bug 41180; bugfix on 0.4.8.1-alpha.
 >      This is tracked as TROVE-2025-016."

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
