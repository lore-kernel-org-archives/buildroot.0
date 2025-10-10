Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1833CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 06:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EA341239;
	Fri, 10 Oct 2025 06:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjboGktfOsDB; Fri, 10 Oct 2025 06:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC9A2412A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC9A2412A2;
	Fri, 10 Oct 2025 06:20:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 136C914B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC926412A2
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmA_ntSZjtZt for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 06:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE9BC41239
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE9BC41239
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE9BC41239
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:20:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -854225636; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Oct 2025 06:20:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v76UC-008nKn-35;
 Fri, 10 Oct 2025 08:20:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20251009191708.3411-1-thomas.perale@mind.be>
Date: Fri, 10 Oct 2025 08:20:16 +0200
In-Reply-To: <20251009191708.3411-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Thu, 9 Oct 2025 21:17:08 +0200")
Message-ID: <87ecrbwa5b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Tsqi97jyH+MccLDb9k4ETQj9Q7BFwzPcjzs85Rxi8AZzcplRi30affj0nnHohJ1WRHhwTFDZuTXPzIrfquI6abDqlYf+cMhiWoSubBvAo1zRimhyHIS/uQmr++g4xMTphsCMLyukgUqw5XrSkhWinoB/LEcVCqzgm5jONPTkwRrBRGgWGqz+WqZUWqcE2GM5dH9JjFRM3QoPcZBYLxmUWG/wsAl5G5TdojnT2yZPDB7uwcGYvLoi7vozvuZUezVwWDQ2hn5L1l/nLd0KYyvsy7vmC6LXggf3X3zxbVebaDwaufAYLJrNbXtpaK+lhHzUEj52I4cPVyMT8fzzNllf7g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=OCiNi88V7vdEA/HTh45AGivCHRt0aaQYnESyYyNs/vw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Tsqi97jy
Subject: Re: [Buildroot] [PATCH] package/squid: add patch for CVE-2025-59362
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following vulnerability:
 > - CVE-2025-59362

 >     Squid through 7.1 mishandles ASN.1 encoding of long SNMP OIDs. This
 >     occurs in asn_build_objid in lib/snmplib/asn1.c.

 > For more information, see:

 > - https://nvd.nist.gov/vuln/detail/CVE-2025-59362
 > - https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

It looks like 6.x is EOL. It would be great if someone actually using
squid could bump it to the 7.x series.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
