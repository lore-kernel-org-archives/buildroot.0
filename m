Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A46C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 17:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A64B4148D;
	Sat, 26 Aug 2023 17:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A64B4148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uakqmFvQzoTS; Sat, 26 Aug 2023 17:41:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E08641607;
	Sat, 26 Aug 2023 17:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E08641607
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3C61BF589
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 17:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3D8D40541
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 17:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3D8D40541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ne1_NVIg8qtj for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 17:41:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C08244053C
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 17:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C08244053C
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFC9A20005;
 Sat, 26 Aug 2023 17:41:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZxHQ-003gW0-W6; Sat, 26 Aug 2023 19:41:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230719201005.1641739-1-bernd@kuhls.net>
Date: Sat, 26 Aug 2023 19:41:00 +0200
In-Reply-To: <20230719201005.1641739-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 19 Jul 2023 22:10:05 +0200")
Message-ID: <874jkl8zwz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.18.5
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes: https://www.samba.org/samba/history/samba-4.18.5.html
 > Fixes the following CVEs:

 > o CVE-2022-2127:
 > When winbind is used for NTLM authentication, a maliciously
 > crafted request can trigger an out-of-bounds read in winbind
 > and possibly crash it.
 > https://www.samba.org/samba/security/CVE-2022-2127.html

 > o CVE-2023-3347:
 > SMB2 packet signing is not enforced if an admin configured
 > "server signing = required" or for SMB2 connections to Domain
 > Controllers where SMB2 packet signing is mandatory.
 > https://www.samba.org/samba/security/CVE-2023-3347.html

 > o CVE-2023-34966:
 > An infinite loop bug in Samba's mdssvc RPC service for
 > Spotlight can be triggered by an unauthenticated attacker by
 > issuing a malformed RPC request.
 > https://www.samba.org/samba/security/CVE-2023-34966.html

 > o CVE-2023-34967:
 > Missing type validation in Samba's mdssvc RPC service for
 > Spotlight can be used by an unauthenticated attacker to
 > trigger a process crash in a shared RPC mdssvc worker process.
 > https://www.samba.org/samba/security/CVE-2023-34967.html

 > o CVE-2023-34968:
 > As part of the Spotlight protocol Samba discloses the server-
 > side absolute path of shares and files and directories in
 > search results.
 > https://www.samba.org/samba/security/CVE-2023-34968.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Looks like the 4.15.x version is EOL, so applied to 2023.02.x and
2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
