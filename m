Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A0AC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838884025E;
	Mon,  3 Jun 2024 15:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQLc7nMshSbO; Mon,  3 Jun 2024 15:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432CE40302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432CE40302;
	Mon,  3 Jun 2024 15:53:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16DCD1BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FDDB4025E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmEb02DIf3tl for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:53:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F155840302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F155840302
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F155840302
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:53:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD235FF804;
 Mon,  3 Jun 2024 15:53:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEA0K-003mIE-0Z;
 Mon, 03 Jun 2024 17:53:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240409111635.5181-1-cp0613@linux.alibaba.com>
 <20240509184233.25d27458@windsurf>
Date: Mon, 03 Jun 2024 17:53:48 +0200
In-Reply-To: <20240509184233.25d27458@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 9 May 2024 18:42:33 +0200")
Message-ID: <87zfs2ggz7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/bpftool: fix riscv support
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
Cc: cp0613@linux.alibaba.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue,  9 Apr 2024 19:16:35 +0800
 > cp0613@linux.alibaba.com wrote:

 >> From: Chen Pei <cp0613@linux.alibaba.com>
 >> 
 >> bpftool already supports riscv, including rv64 and rv32, so support is enabled.
 >> 
 >> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
 >> ---
 >> package/bpftool/Config.in | 1 +
 >> 1 file changed, 1 insertion(+)

 > Thanks for your contribution, I've applied to our master branch, after
 > adjusting the commit title. Indeed your commit is not "fixing riscv
 > support", it is merely allowing the bpftool package to be enabled on
 > riscv.

 > Thanks again!

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
