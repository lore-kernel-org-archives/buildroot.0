Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C55C27C77
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 05:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C83C80FD7;
	Mon, 17 Jun 2024 05:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PtD_dN7XPkx; Mon, 17 Jun 2024 05:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 390EA80FD8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390EA80FD8;
	Mon, 17 Jun 2024 05:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 987C51BF2AB
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 05:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8434380FD8
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 05:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtJUSCJTzdJI for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 05:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8865280FD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8865280FD7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8865280FD7
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 05:54:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 936F61C0004;
 Mon, 17 Jun 2024 05:54:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sJ5K3-004Pm3-37;
 Mon, 17 Jun 2024 07:54:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240616142048.1001850-1-peter@korsgaard.com>
 <Zm9OZq0a8stlLLKh@landeda>
Date: Mon, 17 Jun 2024 07:54:31 +0200
In-Reply-To: <Zm9OZq0a8stlLLKh@landeda> (Yann E. MORIN's message of "Sun, 16
 Jun 2024 22:43:18 +0200")
Message-ID: <87jziop10o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH-2024.02.x] package/glibc: security bump to
 2.38-81 for post-2.38 security fixes
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2024-06-16 16:20 +0200, Peter Korsgaard spake thusly:
 >> Fixes the following security issues:
 >> 
 >> GLIBC-SA-2024-0004:
 >> ISO-2022-CN-EXT: fix out-of-bound writes when writing escape
 >> sequence (CVE-2024-2961)
 >> 
 >> GLIBC-SA-2024-0005:
 >> nscd: Stack-based buffer overflow in netgroup cache (CVE-2024-33599)
 >> 
 >> GLIBC-SA-2024-0006:
 >> nscd: Null pointer crash after notfound response (CVE-2024-33600)
 >> 
 >> GLIBC-SA-2024-0007:
 >> nscd: netgroup cache may terminate daemon on memory allocation
 >> failure (CVE-2024-33601)
 >> 
 >> GLIBC-SA-2024-0008:
 >> nscd: netgroup cache assumes NSS callback uses in-buffer strings
 >> (CVE-2024-33602)
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
