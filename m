Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD7C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A00141732;
	Tue,  8 Nov 2022 19:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A00141732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAmYfz2BzvTX; Tue,  8 Nov 2022 19:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8361741720;
	Tue,  8 Nov 2022 19:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8361741720
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA401BF21A
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77D4960E00
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D4960E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xyLZZN4u0dK for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:59:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 714A160D96
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 714A160D96
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:59:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6550C1BF208;
 Tue,  8 Nov 2022 19:59:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1osUl4-000T88-Iy; Tue, 08 Nov 2022 20:59:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20221029075855.1236307-1-bernd.kuhls@t-online.de>
Date: Tue, 08 Nov 2022 20:59:42 +0100
In-Reply-To: <20221029075855.1236307-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 29 Oct 2022 09:58:55 +0200")
Message-ID: <87wn85gqtt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.15.11
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Added patch from Gentoo to fix uClibc build:
 > access.c:(.text+0x1e8): undefined reference to `innetgr'

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.15.8.html

 > https://www.samba.org/samba/history/samba-4.15.9.html
 > o CVE-2022-2031:  Samba AD users can bypass certain restrictions associated with
 >                   changing passwords.
 >                   https://www.samba.org/samba/security/CVE-2022-2031.html

 > o CVE-2022-32744: Samba AD users can forge password change requests for any user.
 >                   https://www.samba.org/samba/security/CVE-2022-32744.html

 > o CVE-2022-32745: Samba AD users can crash the server process with an LDAP add
 >                   or modify request.
 >                   https://www.samba.org/samba/security/CVE-2022-32745.html

 > o CVE-2022-32746: Samba AD users can induce a use-after-free in the server
 >                   process with an LDAP add or modify request.
 >                   https://www.samba.org/samba/security/CVE-2022-32746.html

 > o CVE-2022-32742: Server memory information leak via SMB1.
 >                   https://www.samba.org/samba/security/CVE-2022-32742.html

 > https://www.samba.org/samba/history/samba-4.15.10.html

 > https://www.samba.org/samba/history/samba-4.15.11.html
 > o CVE-2022-3437:  There is a limited write heap buffer overflow in the GSSAPI
 >                   unwrap_des() and unwrap_des3() routines of Heimdal (included
 >                   in Samba).
 >                   https://www.samba.org/samba/security/CVE-2022-3437.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
