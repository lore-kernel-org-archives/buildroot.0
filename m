Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13968C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E54426D5;
	Sun, 29 May 2022 08:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id itjJA6aS-96L; Sun, 29 May 2022 08:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F4094264D;
	Sun, 29 May 2022 08:13:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80A3C1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA7D40126
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVn3_yE6TTT5 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:13:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F4FF400E4
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:13:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F63E240003;
 Sun, 29 May 2022 08:13:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nvE2t-004yaA-K2; Sun, 29 May 2022 10:13:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220513204234.760410-1-fontaine.fabrice@gmail.com>
Date: Sun, 29 May 2022 10:13:07 +0200
In-Reply-To: <20220513204234.760410-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 May 2022 22:42:34 +0200")
Message-ID: <87tu987o4s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to
 version 2.12.1
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Security Issue:
 >  - Potential buffer overflow in pjsip_auth_create_digest()
 >    (GHSA-73f7-48m9-w662 a.k.a. CVE-2022-24754)
 >  - Denial-of-service in XML parsing due to an infinite loop
 >    (GHSA-5x45-qp78-g4p4 a.k.a. CVE-2022-24763)
 >  - Potential stack buffer overflow when printing SDP into a buffer
 >    (GHSA-f5qg-pqcg-765m a.k.a. CVE-2022-24764)
 >  - Potential out-of-bound read/write when parsing RTCP FB RPSI
 >    (GHSA-vhxv-phmx-g52q a.k.a. CVE-2022-24786)
 >  - Potential infinite loop when parsing WAV format file
 >    (GHSA-rwgw-vwxg-q799 a.k.a. CVE-2022-24792)
 >  - Potential heap buffer overflow when parsing DNS packets
 >    (GHSA-p6g5-v97c-w5q4 a.k.a. CVE-2022-24793)

 > https://github.com/pjsip/pjproject/releases/tag/2.12.1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
