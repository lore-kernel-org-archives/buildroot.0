Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B89C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AC0818C2;
	Mon, 25 Mar 2024 08:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pe3kIIH_KQkS; Mon, 25 Mar 2024 08:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61EA3818D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61EA3818D0;
	Mon, 25 Mar 2024 08:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E85541BF3DB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4FB34060C
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 08:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zb6JWkfI4P0v for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 08:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92E9F405A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E9F405A4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92E9F405A4
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 08:26:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94AD3E0006;
 Mon, 25 Mar 2024 08:26:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rofel-008Shl-07;
 Mon, 25 Mar 2024 09:26:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
References: <20240324001753.1088486-1-nemaakhilesh@gmail.com>
Date: Mon, 25 Mar 2024 09:26:10 +0100
In-Reply-To: <20240324001753.1088486-1-nemaakhilesh@gmail.com> (Akhilesh
 Nema's message of "Sat, 23 Mar 2024 17:17:53 -0700")
Message-ID: <87h6guemzh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: bump to version 9.7p1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Akhilesh" == Akhilesh Nema <nemaakhilesh@gmail.com> writes:

 > Release notes - https://www.openssh.com/txt/release-9.7
 > Drop upstream patch - 001-better-detection-of-broken-fzero-call-used-regs.patch (https://github.com/openssh/openssh-portable/commit/1036d77b34a5fa15e56f516b81b9928006848cbd.patch)

This presumably means we can drop autoreconf. I'll send a patch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
