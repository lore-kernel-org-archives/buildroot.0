Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6FC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F215741E3F;
	Tue,  6 Feb 2024 14:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F215741E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Y0QBnqOzlV7; Tue,  6 Feb 2024 14:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5175B41E39;
	Tue,  6 Feb 2024 14:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5175B41E39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F56E1BF423
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2810E41E38
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2810E41E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urGbDsDxXIVQ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:25:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E28541E36
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E28541E36
Received: by mail.gandi.net (Postfix) with ESMTPSA id 062921C0005;
 Tue,  6 Feb 2024 14:25:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXMNj-00Ds4E-14;
 Tue, 06 Feb 2024 15:25:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240115212003.7847-1-fontaine.fabrice@gmail.com>
Date: Tue, 06 Feb 2024 15:25:03 +0100
In-Reply-To: <20240115212003.7847-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Jan 2024 22:20:03 +0100")
Message-ID: <87jznh7jr4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tcf-agent: fix powerpc64 build
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Translation of ppc64 to powerpc has been removed since version 1.8.0 and
 > https://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/commit/?id=94fa43963538afffc1fff77623cd1561a05d0e21
 > resulting in the following build failure since commit
 > 81802e263a12e173e0e1028449d1e1e11b2e5974:

 > In file included from /home/buildroot/autobuild/instance-0/output-1/build/tcf-agent-1.8.0/agent/system/GNU/Linux/tcf/context-linux.c:58:
 > /home/buildroot/autobuild/instance-0/output-1/build/tcf-agent-1.8.0/agent/../agent/system/GNU/Linux/tcf/regset.h:25:10: fatal error: tcf/regset-mdep.h: No such file or directory
 >    25 | #include <tcf/regset-mdep.h>
 >       |          ^~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/821049a692d4a64fa45b73e8e18eb48c36d46e6b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
