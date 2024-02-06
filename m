Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6060BC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 220EC8234B;
	Tue,  6 Feb 2024 17:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 877WtM3N6_iT; Tue,  6 Feb 2024 17:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D1F82390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D1F82390;
	Tue,  6 Feb 2024 17:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EFE11BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77B1D41E6B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B1D41E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8D14A4m2fvv for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:30:58 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AEF141E81
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AEF141E81
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B24D240004;
 Tue,  6 Feb 2024 17:30:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXPHc-00E8rB-0a;
 Tue, 06 Feb 2024 18:30:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240131111301.497468-1-peter@korsgaard.com>
Date: Tue, 06 Feb 2024 18:30:56 +0100
In-Reply-To: <20240131111301.497468-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 31 Jan 2024 12:13:01 +0100")
Message-ID: <87mssd5wkv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH-2023.02.x] package/{glibc,
 localedef}: security bump to version
 glibc-2.36-128-gb9b7d6a27aa0632f334352fa400771115b3c69b7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2023-6246: syslog: Fix heap buffer overflow in __vsyslog_internal
 > https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0001;hb=HEAD

 > CVE-2023-6779: syslog: Heap buffer overflow in __vsyslog_internal
 > https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0002;hb=HEAD

 > CVE-2023-6780: syslog: Integer overflow in __vsyslog_internal
 > https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0003;hb=HEAD

 > For details, see the Qualys advisory:
 > https://www.openwall.com/lists/oss-security/2024/01/30/6

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
