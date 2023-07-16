Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30952EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4A581AF4;
	Sun, 16 Jul 2023 09:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4A581AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmqda0ZqsG9K; Sun, 16 Jul 2023 09:14:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D85181AF3;
	Sun, 16 Jul 2023 09:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D85181AF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07B6F1BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E32D140272
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E32D140272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wenHZldn6Tsq for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:14:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E821540354
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E821540354
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:14:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C99520004
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:14:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qKxpd-00CrS9-7C
 for buildroot@buildroot.org; Sun, 16 Jul 2023 11:14:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230626065231.1967152-1-peter@korsgaard.com>
Date: Sun, 16 Jul 2023 11:14:21 +0200
In-Reply-To: <20230626065231.1967152-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 26 Jun 2023 08:52:31 +0200")
Message-ID: <87fs5ocj6a.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to version
 4.0.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2023-1992: The RPC over RDMA dissector could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-09.html

 > - CVE-2023-1993: The LISP dissector could go into a large loop
 >   https://www.wireshark.org/security/wnpa-sec-2023-10.html

 > - CVE-2023-1994: The GQUIC dissector could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-11.html

 > - CVE-2023-2855: The Candump log file parser could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-12.html

 > - CVE-2023-2857: The BLF file parser could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-13.html

 > - The GDSDB dissector could go into an infinite loop
 >   https://www.wireshark.org/security/wnpa-sec-2023-14.html

 > - CVE-2023-2858: The NetScaler file parser could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-15.html

 > - CVE-2023-2856: The VMS TCPIPtrace file parser could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-16.html

 > - CVE-2023-2854: The BLF file parser could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-17.html

 > - CVE-2023-0666: The RTPS dissector could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-18.html

 > - CVE-2023-0668: The IEEE C37.118 Synchrophasor dissector could crash
 >   https://www.wireshark.org/security/wnpa-sec-2023-19.html

 > - The XRA dissector could go into an infinite loo
 >   https://www.wireshark.org/security/wnpa-sec-2023-20.html

 > The SIGNATURES-4.0.6.txt file seems to be corrupted, so instead refer to the
 > announcement mail.  Issue reported upstream:

 > https://gitlab.com/wireshark/wireshark/-/issues/19169

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
