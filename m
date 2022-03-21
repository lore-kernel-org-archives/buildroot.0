Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26587C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9946041521;
	Mon, 21 Mar 2022 16:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpwlElLP0PLM; Mon, 21 Mar 2022 16:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BA7408B4;
	Mon, 21 Mar 2022 16:54:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 956241BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92B13408B4
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Zg8_z8JleTD for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:54:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7952640899
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:54:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 288286000A;
 Mon, 21 Mar 2022 16:54:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nWLIm-008Sd6-D2; Mon, 21 Mar 2022 17:54:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220320163930.1566656-1-fontaine.fabrice@gmail.com>
Date: Mon, 21 Mar 2022 17:54:40 +0100
In-Reply-To: <20220320163930.1566656-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Mar 2022 17:39:30 +0100")
Message-ID: <87k0cngsa7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: security bump to
 version 2.5.2
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-24128: Timescale TimescaleDB 1.x and 2.x before 2.5.2 may
 > allow privilege escalation during extension installation. The
 > installation process uses commands such as CREATE x IF NOT EXIST that
 > allow an unprivileged user to precreate objects. These objects will be
 > used by the installer (which executes as Superuser), leading to
 > privilege escalation. In order to be able to take advantage of this, an
 > unprivileged user would need to be able to create objects in a database
 > and then get a Superuser to install TimescaleDB into their database. (In
 > the fixed versions, the installation aborts when it finds that an object
 > already exists.)

 > "This release contains bug fixes since the 2.5.1 release.
 > This release is high priority for upgrade. We strongly recommend that
 > you upgrade as soon as possible."

 > https://github.com/timescale/timescaledb/releases/tag/2.5.2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
