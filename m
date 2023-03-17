Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14A0C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 08:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86579415D3;
	Fri, 17 Mar 2023 08:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86579415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJMOF5UxkllL; Fri, 17 Mar 2023 08:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BF341568;
	Fri, 17 Mar 2023 08:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BF341568
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA5A1BF276
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14F5F6131A
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 08:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F5F6131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMQsKlea3NMl for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 08:35:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC21860F49
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC21860F49
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:35:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D76624000E;
 Fri, 17 Mar 2023 08:35:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pd5Yl-003bKl-Dx; Fri, 17 Mar 2023 09:35:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230311120925.9147-1-ps.report@gmx.net>
Date: Fri, 17 Mar 2023 09:35:35 +0100
In-Reply-To: <20230311120925.9147-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 11 Mar 2023 13:09:25 +0100")
Message-ID: <87zg8byduw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/uqmi: update patch for fix
 compile error (gcc false error reporting)
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Update the patch to to avoid gcc false error reporting (apply pragma ignored
 > only for gcc >= 12.x (as the warning '-Wdangling-pointer' was introduced
 > with gcc-12.x).

 > Fixes:

 >   - http://autobuild.buildroot.net/results/df380f921b74527b77290a658de0c57680083afa

 >   .../build/uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f/dev.c:213:32: error: unknown option after '#pragma GCC diagnostic' kind [-Werror=pragmas]
 >     213 | #pragma GCC diagnostic ignored "-Wdangling-pointer"
 >         |                                ^~~~~~~~~~~~~~~~~~~~

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
