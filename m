Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A11C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F27C0610B7;
	Wed, 23 Nov 2022 22:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F27C0610B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKWPoUMdFa8i; Wed, 23 Nov 2022 22:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C82610A0;
	Wed, 23 Nov 2022 22:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23C82610A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0D51BF316
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36E2B4196F
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E2B4196F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIdNcEFgXVY4 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:35:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6364196D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA6364196D
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:35:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 192D6240004;
 Wed, 23 Nov 2022 22:35:23 +0000 (UTC)
Date: Wed, 23 Nov 2022 23:35:23 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221123233523.51cc67a8@windsurf>
In-Reply-To: <20221123222401.84489-1-fontaine.fabrice@gmail.com>
References: <20221123222401.84489-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669242924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2PNX5T36CWvx4C14gDbDvT3wEnwlFFTUWmV0IfpN+E=;
 b=pABHXvkYRX9dZw51tWrLI5YWauZ95/tnFS8eW5HhGcKE6nRiQ/OMc3A2vqYIOlDhHd9xTZ
 w262B97u7famDUfzUYdQ4eovhTQD0qnYQeL4pQBZKqfIWf4MRcHbhJIRCzbKiLU/p8ryQp
 7NpKd9CAY/OP8nYkFKHZlXjhlZWMyx++tr7+Y7/EP1KQH2UfjhBOCA+cPmpmze5h0lG8GY
 YIxhK+NM3RJr0i1vAnG4P/W6M71SjZmQGBYeQCOnk5BHgwrFrhLExFEVrnTxiEhRfMQHZh
 pC1SPxAK5+Hn3eD4XjkVeJHJ9qeBSyDUgTD1sYmBmHXQmtfjKM9SmgXsYmgMtA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pABHXvkY
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 23:24:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This release fixes the following Security Vulnerabilities:
> 
> - CVE-2022-42898 PAC parse integer overflows
> - CVE-2022-3437 Overflows and non-constant time leaks in DES{,3} and
>   arcfour
> - CVE-2022-41916 Fix Unicode normalization read of 1 bytes past end of
>   array
> - CVE-2021-44758 NULL dereference DoS in SPNEGO acceptors
> - CVE-2021-3671 A null pointer de-reference when handling missing sname
>   in TGS-REQ
> - CVE-2022-44640 Heimdal KDC: invalid free in ASN.1 codec
> 
>   Note that CVE-2022-44640 is a severe vulnerability, possibly a 10.0
>   on the Common Vulnerability Scoring System (CVSS) v3, as we believe
>   it should be possible to get an RCE on a KDC, which means that
>   credentials can be compromised that can be used to impersonate
>   anyone in a realm or forest of realms.
> 
>   Heimdal's ASN.1 compiler generates code that allows specially
>   crafted DER encodings of CHOICEs to invoke the wrong free function
>   on the decoded structure upon decode error. This is known to impact
>   the Heimdal KDC, leading to an invalid free() of an address partly
>   or wholly under the control of the attacker, in turn leading to a
>   potential remote code execution (RCE) vulnerability.
> 
>   This error affects the DER codec for all extensible CHOICE types
>   used in Heimdal, though not all cases will be exploitable. We have
>   not completed a thorough analysis of all the Heimdal components
>   affected, thus the Kerberos client, the X.509 library, and other
>   parts, may be affected as well.
> 
>   This bug has been in Heimdal's ASN.1 compiler since 2005, but it may
>   only affect Heimdal 1.6 and up. It was first reported by Douglas
>   Bagnall, though it had been found independently by the Heimdal
>   maintainers via fuzzing a few weeks earlier.
> 
>   While no zero-day exploit is known, such an exploit will likely be
>   available soon after public disclosure.
> 
> - CVE-2019-14870: Validate client attributes in protocol-transition
> 
> - CVE-2019-14870: Apply forwardable policy in protocol-transition
> - CVE-2019-14870: Always lookup impersonate client in DB
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/heimdal/heimdal.hash | 4 ++--
>  package/heimdal/heimdal.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
