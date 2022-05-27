Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4086AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD03784AB1;
	Fri, 27 May 2022 09:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrQYIA-Z3wTQ; Fri, 27 May 2022 09:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E90784AAE;
	Fri, 27 May 2022 09:43:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 915DF1BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 800DD41221
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mQxbBN759Ea for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:43:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A2CA41328
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:43:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C90110000A;
 Fri, 27 May 2022 09:43:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuWVL-001mQ1-4S; Fri, 27 May 2022 11:43:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ehmanns <universeiii@gmx.de>
References: <20220428134207.16521-1-universeiii@gmx.de>
Date: Fri, 27 May 2022 11:43:35 +0200
In-Reply-To: <20220428134207.16521-1-universeiii@gmx.de> (Andreas Ehmanns's
 message of "Thu, 28 Apr 2022 15:42:07 +0200")
Message-ID: <87ilprjooo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tftpd: add include of config
 file to init script
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

>>>>> "Andreas" == Andreas Ehmanns <universeiii@gmx.de> writes:

 > HPA's tftp server init script does not support include of a
 > configuration file. So changing daemon parameters would cause
 > a modification of the init script.
 > Similar to NFS, dropbear, DHCP, SNMP and other network services
 > in buildroot, this patch adds an include of /etc/default/tftpd
 > to the init script. So any user can change the default behaviour
 > by adding its own configuration file instead of changing the init
 > script.

 > Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
