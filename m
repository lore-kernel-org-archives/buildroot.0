Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F195DC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D47261114;
	Wed,  8 Feb 2023 15:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D47261114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuZhHH3p7E6Y; Wed,  8 Feb 2023 15:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE68C6110F;
	Wed,  8 Feb 2023 15:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE68C6110F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1861BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA8C240465
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA8C240465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CClUb0Y_fZg for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:25:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81973403D6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81973403D6
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:25:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7DA5920002;
 Wed,  8 Feb 2023 15:25:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pPmKQ-00GNsl-Hs; Wed, 08 Feb 2023 16:25:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@xes-inc.com>
References: <20230208142358.2721276-1-vfazio@xes-inc.com>
Date: Wed, 08 Feb 2023 16:25:46 +0100
In-Reply-To: <20230208142358.2721276-1-vfazio@xes-inc.com> (Vincent Fazio's
 message of "Wed, 8 Feb 2023 08:23:58 -0600")
Message-ID: <87sffg41s5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: patch configure due to
 microblaze patch
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

>>>>> "Vincent" == Vincent Fazio <vfazio@xes-inc.com> writes:

 > Commit bed21bb9b added a patch to change configure.ac but failed to
 > update configure which caused build failures due to the timestamp
 > difference between configure and configure.ac and the makefile attempting
 > to run aclocal.

 > XZ_AUTORECONF = YES creates a circular dependency where the host
 > autotools need host-xz which also gets patched. Because of this, we need
 > to patch xz's configure script manually.

 > While we're doing this, correct the language in the commit body of the
 > patch, remove a stray whitespace, and fix the offset for configure.ac

 > Fixes: bed21bb9b ("package/xz: fix microblaze compiles")
 > Fixes: http://autobuild.buildroot.net/results/958/9586f21e447ef9923606b1385ff333138406b685//

 > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

This unfortunately still doesn't work as autoreconf is also triggered if
configure.ac is newer than Makefile.in, so I dropped the patching of
configure.ac which isn't strictly needed and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
