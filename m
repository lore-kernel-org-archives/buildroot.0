Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241E5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4FC60B2F;
	Sun, 10 Apr 2022 20:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hrtk1zL4ibP5; Sun, 10 Apr 2022 20:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAFBD60899;
	Sun, 10 Apr 2022 20:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 812EA1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70A1A83E3C
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jbm9fE-emjzA for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:36:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24CC78343E
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:36:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 004591BF205;
 Sun, 10 Apr 2022 20:36:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndeIE-005FVk-2t; Sun, 10 Apr 2022 22:36:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220407212019.1540473-1-fontaine.fabrice@gmail.com>
Date: Sun, 10 Apr 2022 22:36:18 +0200
In-Reply-To: <20220407212019.1540473-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 Apr 2022 23:20:19 +0200")
Message-ID: <87czhon0al.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: bump to version 1.33.1
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Use official tarball (and so drop autoreconf)
 > - Disable ebpf, enabled by default since its addition in version 1.25.0:
 >   https://github.com/netdata/netdata/commit/c857c880f31a89b7857bf01f1f48227c41bf8a93
 > - disable ml, enabled by default since its addition in version 1.32.1:
 >   https://github.com/netdata/netdata/commit/9ed4cea59042aa5e5053c4b4b3529e9d70ab83f9
 > - lz4 is an optional dependency (enabled by default) since version
 >   1.33.0 and
 >   https://github.com/netdata/netdata/commit/b003e5fd40c3b42dfacc87db5a7730b76eff0e92
 > - This bump will fix a build failure with libressl thanks to
 >   https://github.com/netdata/netdata/commit/6b091fafd9c3b0197325b3ef751dbdb317048e2b
 > - Update indentation in hash file (two spaces)

 > https://github.com/netdata/netdata/blob/v1.33.1/CHANGELOG.md

 > Fixes:
 >  - http://autobuild.buildroot.org/results/897d6f1425a645667b884739b2ee6f588fd06972

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
