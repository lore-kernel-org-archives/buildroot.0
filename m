Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C5FC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90FA6112A;
	Thu,  9 Jun 2022 20:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddemYn08rbIE; Thu,  9 Jun 2022 20:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C9460F86;
	Thu,  9 Jun 2022 20:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 895D61BF384
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7770F60F86
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUbx5ijCBqdm for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:21:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A8860DFE
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:21:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B6031C0002;
 Thu,  9 Jun 2022 20:21:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzOel-002LaL-8i; Thu, 09 Jun 2022 22:21:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220602162449.4160788-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 22:21:27 +0200
In-Reply-To: <20220602162449.4160788-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 2 Jun 2022 18:24:49 +0200")
Message-ID: <87a6al1tbs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: put back
 libuuid dependency
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

 > Commit 8b47feff2ff8ac37355431cb0414822da2c87ea1 wrongly removed libuuid
 > dependency resulting in the following build failure:

 > checking for UUID... no
 > configure: error: Package requirements (uuid) were not met:

 > Package 'uuid', required by 'virtual:world', not found

 > It should be noted that <uuid/uuid.h> is still used in one example:
 > https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/examples/C/glib/add-connection-gdbus.c#L17
 > as stated in
 > https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b:

 > "We still require libuuid for building, because it is used by an example
 > program. Maybe that should be changed, to avoid the build dependency.
 > But that can be done at a later time."

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ac25c42d73161bf4cdfae3e53de8826f0b8dbf9c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
