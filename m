Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D031C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 18:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E14A0410D2;
	Wed,  2 Mar 2022 18:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkSheUKwyJCN; Wed,  2 Mar 2022 18:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BA94109B;
	Wed,  2 Mar 2022 18:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE751BF398
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 18:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 073714109B
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 18:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTt9MehsU8YA for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 18:36:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84C9F40321
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 18:36:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8ACEAE0006;
 Wed,  2 Mar 2022 18:36:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nPTpz-0001qe-Ka; Wed, 02 Mar 2022 19:36:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220301183110.925959-1-fontaine.fabrice@gmail.com>
Date: Wed, 02 Mar 2022 19:36:35 +0100
In-Reply-To: <20220301183110.925959-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 1 Mar 2022 19:31:10 +0100")
Message-ID: <87r17kb3rg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rygel: disable man pages
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

 > Fix the following build failure raised since bump to version 0.40.2 in
 > commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

 > FAILED: doc/man/rygel.1
 > /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/xsltproc
 > --nonet --stringparam man.output.quietly 1 --stringparam
 > funcsynopsis.style ansi --stringparam man.authors.section.enabled 1
 > --stringparam man.copyright.section.enabled 1 -o doc/man/rygel.1
 > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 > ../doc/man/rygel.xml
 > I/O error : Attempt to load network entity
 > http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

 > Fixes:
 >  - http://autobuild.buildroot.org/results/297859cdb544e980826df28b446a75d32c06d839

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
