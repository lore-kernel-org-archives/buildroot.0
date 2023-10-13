Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F1FCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA8160BDC;
	Fri, 13 Oct 2023 15:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABA8160BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ix3cnKaQFtB0; Fri, 13 Oct 2023 15:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1201860BEB;
	Fri, 13 Oct 2023 15:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1201860BEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7237D1BF37E
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BEC860BEB
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEC860BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epaDqRJuSI4N for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:17:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3329D60BDC
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3329D60BDC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24C216000F;
 Fri, 13 Oct 2023 15:17:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrJv8-007LTL-MJ; Fri, 13 Oct 2023 17:17:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20231001190639.1391551-2-dalang@gmx.at>
Date: Fri, 13 Oct 2023 17:17:46 +0200
In-Reply-To: <20231001190639.1391551-2-dalang@gmx.at> (Daniel Lang's message
 of "Sun, 1 Oct 2023 21:06:39 +0200")
Message-ID: <87lec6361x.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/netsnmp: security bump to version
 5.9.4
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

>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:

 > CVE-2022-44792 handle_ipDefaultTTL in agent/mibgroup/ip-mib/ip_scalars.c
 > in Net-SNMP 5.8 through 5.9.3 has a NULL Pointer Exception bug that can
 > be used by a remote attacker (who has write access) to cause the
 > instance to crash via a crafted UDP packet, resulting in Denial of
 > Service.

 > CVE-2022-44793 handle_ipv6IpForwarding in
 > agent/mibgroup/ip-mib/ip_scalars.c in Net-SNMP 5.4.3 through 5.9.3 has a
 > NULL Pointer Exception bug that can be used by a remote attacker to
 > cause the instance to crash via a crafted UDP packet, resulting in
 > Denial of Service.

 > The pgp key was changed [0] as the old one expired [1].

 > [0]: https://sourceforge.net/p/net-snmp/htdocs/ci/90a6d98aae21fcdff06b5be139eb4d44ae96a9de/
 > [1]: https://github.com/net-snmp/net-snmp/issues/595

 > Signed-off-by: Daniel Lang <dalang@gmx.at>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
