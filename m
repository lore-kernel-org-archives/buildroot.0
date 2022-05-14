Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169BCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 20:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C424581B60;
	Sat, 14 May 2022 20:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3qPxbtFy83U; Sat, 14 May 2022 20:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1ADD81A27;
	Sat, 14 May 2022 20:58:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E1D11BF681
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 20:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B6CB817B3
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 20:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEp3aGz8kjci for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 20:57:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7596C81B60
 for <buildroot@buildroot.org>; Sat, 14 May 2022 20:57:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF4E5200002;
 Sat, 14 May 2022 20:57:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npyph-00Cgcj-MU; Sat, 14 May 2022 22:57:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220513211420.942633-1-fontaine.fabrice@gmail.com>
Date: Sat, 14 May 2022 22:57:49 +0200
In-Reply-To: <20220513211420.942633-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 May 2022 23:14:20 +0200")
Message-ID: <871qwv96ia.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.7.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-24882: FreeRDP is a free implementation of the Remote
 > Desktop Protocol (RDP). In versions prior to 2.7.0, NT LAN Manager
 > (NTLM) authentication does not properly abort when someone provides and
 > empty password value. This issue affects FreeRDP based RDP Server
 > implementations. RDP clients are not affected. The vulnerability is
 > patched in FreeRDP 2.7.0. There are currently no known workarounds.

 > Fix CVE-2022-24883: FreeRDP is a free implementation of the Remote
 > Desktop Protocol (RDP). Prior to version 2.7.0, server side
 > authentication against a `SAM` file might be successful for invalid
 > credentials if the server has configured an invalid `SAM` file path.
 > FreeRDP based clients are not affected. RDP server implementations using
 > FreeRDP to authenticate against a `SAM` file are affected. Version 2.7.0
 > contains a fix for this issue. As a workaround, use custom
 > authentication via `HashCallback` and/or ensure the `SAM` database path
 > configured is valid and the application has file handles left.

 > https://github.com/FreeRDP/FreeRDP/releases/tag/2.7.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
