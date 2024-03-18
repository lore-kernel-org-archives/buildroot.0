Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8813FC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49ABE405D8;
	Mon, 18 Mar 2024 11:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPe0ShqvzHDh; Mon, 18 Mar 2024 11:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ABAB40650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ABAB40650;
	Mon, 18 Mar 2024 11:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 633031BF366
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E11E408AA
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owfn_RFtHXkG for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20BDA40650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20BDA40650
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BDA40650
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:39:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BB4DFF809;
 Mon, 18 Mar 2024 11:39:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmBKu-002bTT-2m;
 Mon, 18 Mar 2024 12:39:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240226173202.1032744-1-fontaine.fabrice@gmail.com>
Date: Mon, 18 Mar 2024 12:39:24 +0100
In-Reply-To: <20240226173202.1032744-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Feb 2024 18:32:02 +0100")
Message-ID: <87frwnhiqb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: bump to version 1.13.2
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure raised since bump of
 > expat to version 2.6.0 in commit
 > 9dad5e7d7f7bc03e648621b9be6974e7ae39a467 thanks to
 > https://github.com/pocoproject/poco/commit/75f7042b70092e79c6b770b18d033a061c84e2c5:

 > src/ParserEngine.cpp: In member function 'void Poco::XML::ParserEngine::init()':
 > src/ParserEngine.cpp:510:17: error: 'XML_SetBillionLaughsAttackProtectionMaximumAmplification' was not declared in this scope; did you mean 'setBillionLaughsAttackProtectionMaximumAmplification'?
 >   510 |                 XML_SetBillionLaughsAttackProtectionMaximumAmplification(_parser, _maximumAmplificationFactor);
 >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > https://github.com/pocoproject/poco/blob/poco-1.13.2-release/CHANGELOG

 > Fixes: 9dad5e7d7f7bc03e648621b9be6974e7ae39a467
 >  - http://autobuild.buildroot.org/results/7fad881f85d3b89abdee35388088965f05ead277

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
