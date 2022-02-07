Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BCFC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78B2B60BF3;
	Mon,  7 Feb 2022 18:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RBqzdNnaQyn9; Mon,  7 Feb 2022 18:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B801660E2E;
	Mon,  7 Feb 2022 18:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C68221BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4104403C7
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJo1SghveqhH for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:24:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B655A403C1
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:24:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D4635200004;
 Mon,  7 Feb 2022 18:24:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nH8go-0002Q9-8g; Mon, 07 Feb 2022 19:24:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220207173215.3041588-1-fontaine.fabrice@gmail.com>
Date: Mon, 07 Feb 2022 19:24:38 +0100
In-Reply-To: <20220207173215.3041588-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 7 Feb 2022 18:32:15 +0100")
Message-ID: <87iltqsffd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ace: needs C++11
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > ace needs C++11 since its addition in commit
 > 3621918d1bc1ddc9312dd1cc8dec6db61e712fe2 to avoid the following build
 > failure:

 > In file included from /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/chrono:35:0,
 >                  from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/Time_Value.h:23,
 >                  from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/OS_NS_unistd.h:25,
 >                  from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.inl:2,
 >                  from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.h:886,
 >                  from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.cpp:1:
 > /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 >  #error This file requires compiler and library support for the \
 >   ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/13376405e313da112f546076a10859e60631d5d5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
