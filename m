Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B65AC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8777B41825;
	Thu, 29 Feb 2024 15:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qt87yOaifV_O; Thu, 29 Feb 2024 15:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29DC041819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29DC041819;
	Thu, 29 Feb 2024 15:24:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37F8C1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32B484180D
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RE7GMREyv_Rc for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:22:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 669A9417F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669A9417F7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 669A9417F7
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:22:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98E21E0003;
 Thu, 29 Feb 2024 15:22:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiFC-004mie-2W;
 Thu, 29 Feb 2024 16:22:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: ~bubu <bubu@git.sr.ht>
References: <170712853287.18164.6368517214119629150-0@git.sr.ht>
Date: Thu, 29 Feb 2024 16:22:46 +0100
In-Reply-To: <170712853287.18164.6368517214119629150-0@git.sr.ht>
 (bubu@git.sr.ht's message of "Thu, 21 Sep 2023 22:39:44 +0200")
Message-ID: <87jzmngurd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH buildroot] package/python-minimalmodbus: fix
 empty package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, ~bubu <bubu@bubu1.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "~bubu" == ~bubu  <bubu@git.sr.ht> writes:

 > From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
 > Calling `setup.py` build builds and installs  an empty package
 > after upstream changed their packaging. Calling setuptools via
 > `python -m build` builds the package correctly.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
