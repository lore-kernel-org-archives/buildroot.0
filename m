Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A871C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B94264365B;
	Thu, 30 Nov 2023 22:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B94264365B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZGL0lrBTgsA; Thu, 30 Nov 2023 22:50:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E109F43657;
	Thu, 30 Nov 2023 22:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E109F43657
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12FEC1BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0AEE81CA3
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0AEE81CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77Fw_EUhPvxF for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:50:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA5DC817FF
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5DC817FF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45AB7240006;
 Thu, 30 Nov 2023 22:50:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8prZ-003SrB-2A;
 Thu, 30 Nov 2023 23:50:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231128202113.479207-1-fontaine.fabrice@gmail.com>
Date: Thu, 30 Nov 2023 23:50:29 +0100
In-Reply-To: <20231128202113.479207-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Nov 2023 21:21:13 +0100")
Message-ID: <87edg67t56.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 6.5
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

 > Fix CVE-2023-5824, CVE-2023-46724, CVE-2023-46846, CVE-2023-46847 and
 > CVE-2023-46848

 > https://github.com/squid-cache/squid/security/advisories/GHSA-543m-w2m2-g255
 > https://github.com/squid-cache/squid/security/advisories/GHSA-j83v-w3p4-5cqh
 > https://github.com/squid-cache/squid/security/advisories/GHSA-73m6-jm96-c6r3
 > https://github.com/squid-cache/squid/security/advisories/GHSA-phqj-m8gv-cq4g
 > https://github.com/squid-cache/squid/security/advisories/GHSA-2g3c-pg7q-g59w

 > https://github.com/squid-cache/squid/blob/SQUID_6_5/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
