Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0229D3C923
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98C2380B46;
	Sat, 19 Oct 2024 18:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyPuaGd1rCKl; Sat, 19 Oct 2024 18:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF87B80D08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF87B80D08;
	Sat, 19 Oct 2024 18:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8EE27D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6E380B46
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ue2IGMaSMkAH for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23EE380D0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23EE380D0D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23EE380D0D
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:40:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2A19FF804;
 Sat, 19 Oct 2024 18:40:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2EMz-00AxMG-0u;
 Sat, 19 Oct 2024 20:40:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Olivier Schonken
 <olivier.schonken@gmail.com>,  buildroot@buildroot.org
References: <20240930171041.398061-1-james.hilliard1@gmail.com>
 <87ttdvfuqy.fsf@dell.be.48ers.dk>
Date: Sat, 19 Oct 2024 20:40:09 +0200
In-Reply-To: <87ttdvfuqy.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 01 Oct 2024 22:12:05 +0200")
Message-ID: <87jze4c4xi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.4.11
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> Drop cups hash patches which are now upstream.
 >> Rebase remaining patches.

 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 > cups 2.4.9 fixed a security issue:

 > https://github.com/OpenPrinting/cups/security/advisories/GHSA-vvwp-mv6j-hw6f

 > So I've marked this as a security bump and committed, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
