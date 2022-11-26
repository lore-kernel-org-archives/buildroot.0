Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B90AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4344481E39;
	Sat, 26 Nov 2022 18:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4344481E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCT3MVKV9NFp; Sat, 26 Nov 2022 18:55:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF5581E2F;
	Sat, 26 Nov 2022 18:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CF5581E2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57FA31BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C46341602
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C46341602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1g8-axoq1PvC for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:55:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E611416C2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E611416C2
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:55:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B561D1BF205;
 Sat, 26 Nov 2022 18:55:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oz0Kz-0004AH-Rt; Sat, 26 Nov 2022 19:55:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221123222401.84489-1-fontaine.fabrice@gmail.com>
Date: Sat, 26 Nov 2022 19:55:41 +0100
In-Reply-To: <20221123222401.84489-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 23 Nov 2022 23:24:01 +0100")
Message-ID: <87edtpeeaa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/heimdal: security bump to
 version 7.7.1
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

 > This release fixes the following Security Vulnerabilities:
 > - CVE-2022-42898 PAC parse integer overflows
 > - CVE-2022-3437 Overflows and non-constant time leaks in DES{,3} and
 >   arcfour
 > - CVE-2022-41916 Fix Unicode normalization read of 1 bytes past end of
 >   array
 > - CVE-2021-44758 NULL dereference DoS in SPNEGO acceptors
 > - CVE-2021-3671 A null pointer de-reference when handling missing sname
 >   in TGS-REQ
 > - CVE-2022-44640 Heimdal KDC: invalid free in ASN.1 codec

 >   Note that CVE-2022-44640 is a severe vulnerability, possibly a 10.0
 >   on the Common Vulnerability Scoring System (CVSS) v3, as we believe
 >   it should be possible to get an RCE on a KDC, which means that
 >   credentials can be compromised that can be used to impersonate
 >   anyone in a realm or forest of realms.

 >   Heimdal's ASN.1 compiler generates code that allows specially
 >   crafted DER encodings of CHOICEs to invoke the wrong free function
 >   on the decoded structure upon decode error. This is known to impact
 >   the Heimdal KDC, leading to an invalid free() of an address partly
 >   or wholly under the control of the attacker, in turn leading to a
 >   potential remote code execution (RCE) vulnerability.

 >   This error affects the DER codec for all extensible CHOICE types
 >   used in Heimdal, though not all cases will be exploitable. We have
 >   not completed a thorough analysis of all the Heimdal components
 >   affected, thus the Kerberos client, the X.509 library, and other
 >   parts, may be affected as well.

 >   This bug has been in Heimdal's ASN.1 compiler since 2005, but it may
 >   only affect Heimdal 1.6 and up. It was first reported by Douglas
 >   Bagnall, though it had been found independently by the Heimdal
 >   maintainers via fuzzing a few weeks earlier.

 >   While no zero-day exploit is known, such an exploit will likely be
 >   available soon after public disclosure.

 > - CVE-2019-14870: Validate client attributes in protocol-transition

 > - CVE-2019-14870: Apply forwardable policy in protocol-transition
 > - CVE-2019-14870: Always lookup impersonate client in DB

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
