Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4F8C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B2FE82733;
	Mon, 17 Oct 2022 08:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B2FE82733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jDhPDH_xJoJ; Mon, 17 Oct 2022 08:38:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DD488268B;
	Mon, 17 Oct 2022 08:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DD488268B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B06EA1BF38A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C0B8408ED
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C0B8408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Wn_upn-l9OQ for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:38:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B6294056E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B6294056E
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:38:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0786A1C0003;
 Mon, 17 Oct 2022 08:38:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1okLdI-006Mev-0g; Mon, 17 Oct 2022 10:38:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221016210931.54469-1-fontaine.fabrice@gmail.com>
Date: Mon, 17 Oct 2022 10:37:59 +0200
In-Reply-To: <20221016210931.54469-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 16 Oct 2022 23:09:31 +0200")
Message-ID: <87fsfmalqw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: security bump to version
 4.4.3-P1
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

 > - Corrected a reference count leak that occurs when the server builds
 >   responses to leasequery packets. Thanks to VictorV of Cyber Kunlun
 >   Lab for reporting the issue.
 >   [Gitlab #253]
 >   CVE: CVE-2022-2928

 > - Corrected a memory leak that occurs when unpacking a packet that has an
 >   FQDN option (81) that contains a label with length greater than 63 bytes.
 >   Thanks to VictorV of Cyber Kunlun Lab for reporting the issue.
 >   [Gitlab #254]
 >   CVE: CVE-2022-2929

 > https://kb.isc.org/docs/cve-2022-2928
 > https://kb.isc.org/docs/cve-2022-2929
 > https://ftp.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1-RELNOTES

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
