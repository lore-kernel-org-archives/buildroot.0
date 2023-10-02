Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC53E784A4
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 08:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B32F40B15;
	Mon,  2 Oct 2023 08:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B32F40B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBbAcYNx0so3; Mon,  2 Oct 2023 08:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A0E40B03;
	Mon,  2 Oct 2023 08:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A0E40B03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38E3D1BF4E3
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12B3840B03
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12B3840B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lh0msSweE__h for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 08:42:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92E7D40125
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 08:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E7D40125
Received: by mail.gandi.net (Postfix) with ESMTPSA id 676B740008;
 Mon,  2 Oct 2023 08:42:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qnEVY-000VDB-Oy; Mon, 02 Oct 2023 10:42:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20231001190639.1391551-2-dalang@gmx.at>
Date: Mon, 02 Oct 2023 10:42:28 +0200
In-Reply-To: <20231001190639.1391551-2-dalang@gmx.at> (Daniel Lang's message
 of "Sun, 1 Oct 2023 21:06:39 +0200")
Message-ID: <87ttr9h0uj.fsf@48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
