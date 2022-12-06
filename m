Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80EEC3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA2A4035D;
	Tue,  6 Dec 2022 22:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA2A4035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3ZcKb4lon6G; Tue,  6 Dec 2022 22:11:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9364162D;
	Tue,  6 Dec 2022 22:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9364162D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A14CC1BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C60F81E7B
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C60F81E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZGEkeVoRXfs for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:11:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F72481E79
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F72481E79
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:11:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83746240006
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:11:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1p2gA9-00FZGT-HB
 for buildroot@buildroot.org; Tue, 06 Dec 2022 23:11:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20221125140907.3796987-1-peter@korsgaard.com>
Date: Tue, 06 Dec 2022 23:11:41 +0100
In-Reply-To: <20221125140907.3796987-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 25 Nov 2022 15:09:06 +0100")
Message-ID: <87sfhs5giq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/netsnmp: security bump to version
 5.9.3
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
 > - CVE-2022-24805 A buffer overflow in the handling of the INDEX of
 >   NET-SNMP-VACM-MIB can cause an out-of-bounds memory access.

 > - CVE-2022-24809 A malformed OID in a GET-NEXT to the nsVacmAccessTable can
 >   cause a NULL pointer dereference.

 > - CVE-2022-24806 Improper Input Validation when SETing malformed OIDs in
 >   master agent and subagent simultaneously

 > - CVE-2022-24807 A malformed OID in a SET request to
 >   SNMP-VIEW-BASED-ACM-MIB::vacmAccessTable can cause an out-of-bounds memory
 >   access.

 > - CVE-2022-24808 A malformed OID in a SET request to
 >   NET-SNMP-AGENT-MIB::nsLogTable can cause a NULL pointer dereference

 > - CVE-2022-24810 A malformed OID in a SET to the nsVacmAccessTable
 >   can cause a NULL pointer dereference.

 > Drop openssl linking patches as they are merged upstream / upstream changed
 > to use pkg-config for openssl since:

 > https://github.com/net-snmp/net-snmp/commit/8c3a094fbe9ebe38ed762488082d52c6d4e04ddb

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
