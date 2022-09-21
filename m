Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3A0ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C91A461076;
	Wed, 21 Sep 2022 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C91A461076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qM-zxv0vjoxB; Wed, 21 Sep 2022 20:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31C860FC0;
	Wed, 21 Sep 2022 20:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31C860FC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 527B91BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B711813F8
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B711813F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udWTwhZmn_zJ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:44:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18ECA813ED
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18ECA813ED
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:44:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB293C0003;
 Wed, 21 Sep 2022 20:44:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ob6Zp-002O1u-3O; Wed, 21 Sep 2022 22:44:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220917102605.D6A45841A3@busybox.osuosl.org>
Date: Wed, 21 Sep 2022 22:44:13 +0200
In-Reply-To: <20220917102605.D6A45841A3@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 17 Sep 2022 12:14:12 +0200")
Message-ID: <87mtascvaa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/runc: bump to version 1.1.4
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=ec8e8aaa3af7ae717a3b107d0731a5932f1beb8d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This is the fourth patch release in the 1.1.z series of runc, primarily fixing a
 > regression introduced in 1.1.3 related to device rules, as well as other bugs.

 >  - Fix mounting via wrong proc fd. When the user and mount namespaces are used,
 >  and the bind mount is followed by the cgroup mount in the spec, the cgroup was
 >  mounted using the bind mount's mount fd.
 >  - Switch kill() in libcontainer/nsenter to sane_kill().
 >  - Fix "permission denied" error from runc run on noexec fs.
 >  - Fix failed exec after systemctl daemon-reload. Due to a regression in v1.1.3,
 >  the DeviceAllow=char-pts rwm rule was no longer added and was causing an error
 >  open /dev/pts/0: operation not permitted: unknown when systemd was reloaded.

 > https://github.com/opencontainers/runc/releases/tag/v1.1.4

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
