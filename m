Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20769C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6D4A6066B;
	Fri,  1 Mar 2024 10:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8Bfacc5Z6OQ; Fri,  1 Mar 2024 10:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1931560671
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1931560671;
	Fri,  1 Mar 2024 10:09:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 657951BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5324780BEB
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4enB0SmtZM9 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48B3880BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B3880BE4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48B3880BE4
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:09:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F001E0003;
 Fri,  1 Mar 2024 10:09:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfzpx-006gzF-2a;
 Fri, 01 Mar 2024 11:09:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240107114345.2795252-1-fontaine.fabrice@gmail.com>
 <275220a4-24b2-4f21-b8bb-fae239a56d37@mind.be>
Date: Fri, 01 Mar 2024 11:09:53 +0100
In-Reply-To: <275220a4-24b2-4f21-b8bb-fae239a56d37@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Mon, 5 Feb 2024 14:26:48
 +0100")
Message-ID: <87edcu9sb2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to
 version 4.1.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 07/01/2024 12:43, Fabrice Fontaine wrote:
 >> This bump will fix the following build failure raised since bump to
 >> version 4.1.2 in commit ce2bf7b96b9dba57bb31aca583283736af27afcc:
 >> *** Error compiling
 >> '/home/buildroot/autobuild/instance-0/output-1/target/usr/lib/python3.11/site-packages/bitstring/plugin_test.py'...
 >> Sorry: IndentationError: expected an indented block after function definition on line 6 (plugin_test.py, line 8)
 >> https://github.com/scott-griffiths/bitstring/blob/bitstring-4.1.4/release_notes.txt
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/e6fac4cac16de94862e3b4697dd88e856bc9a398
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  Applied to master, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
