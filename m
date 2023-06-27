Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0D3EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 06:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A6A9416D1;
	Tue, 27 Jun 2023 06:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A6A9416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFr33rpVIOek; Tue, 27 Jun 2023 06:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A794416B5;
	Tue, 27 Jun 2023 06:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A794416B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC7931BF2F5
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85FD560F4C
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FD560F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KI7Dx1VL9JSC for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 06:16:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6889E60774
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6889E60774
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 06:16:11 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 849A36000C
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 06:16:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qE1zk-008t2U-MV
 for buildroot@buildroot.org; Tue, 27 Jun 2023 08:16:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230626065231.1967152-1-peter@korsgaard.com>
Date: Tue, 27 Jun 2023 08:16:08 +0200
In-Reply-To: <20230626065231.1967152-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 26 Jun 2023 08:52:31 +0200")
Message-ID: <87edlxxwev.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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

Upstream fixed that issue by restarting their reverse proxy, so I
changed it back to refer to the SIGNATURES file and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
