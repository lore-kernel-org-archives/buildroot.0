Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CFBCF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B874026E;
	Sat, 12 Oct 2024 14:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXeWRn0xUWWZ; Sat, 12 Oct 2024 14:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA8D5404B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA8D5404B5;
	Sat, 12 Oct 2024 14:13:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B91741BF3DA
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6F564085A
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xly9BTF0Yfac for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD5BD4084B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5BD4084B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD5BD4084B
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:13:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 848F5240006;
 Sat, 12 Oct 2024 14:13:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1szcs1-00DIMn-2v;
 Sat, 12 Oct 2024 16:13:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <01e6af64-ac5b-464d-aa50-7e950f75b6f0@grenoble.cnrs.fr>
Date: Sat, 12 Oct 2024 16:13:25 +0200
In-Reply-To: <01e6af64-ac5b-464d-aa50-7e950f75b6f0@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Fri, 20 Sep 2024 19:39:06 +0200")
Message-ID: <87a5f9flyy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/configure.adoc: fix
 location of Busybox inittab
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

>>>>> "Edgar" == Edgar Bonet <bonet@grenoble.cnrs.fr> writes:

 > Commit 89d39fc7a392 "initscripts: new package" moved the inittab
 > packaged for Busybox init from system/skeleton/etc to package/busybox.
 > The manual, however, still points to the old location, so let's fix it.

 > Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
