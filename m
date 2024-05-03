Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F376AC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 07:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E96408E0;
	Fri,  3 May 2024 07:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdoRDRYyvAP1; Fri,  3 May 2024 07:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60483409DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60483409DF;
	Fri,  3 May 2024 07:09:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2BCD1BF2AF
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD2774060E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 07:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRrzRg9Vn3UV for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 07:09:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A4E1D40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4E1D40133
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4E1D40133
 for <buildroot@buildroot.org>; Fri,  3 May 2024 07:09:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C95260007;
 Fri,  3 May 2024 07:09:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2n39-00BbCt-1R;
 Fri, 03 May 2024 09:09:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240407170706.2785735-1-fontaine.fabrice@gmail.com>
Date: Fri, 03 May 2024 09:09:43 +0200
In-Reply-To: <20240407170706.2785735-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Apr 2024 19:07:06 +0200")
Message-ID: <874jbf4big.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.7.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Vulnerabilities
 >  - [High] CVE-2024-0901 Potential denial of service and out of bounds
 >    read. Affects TLS 1.3 on the server side when accepting a connection
 >    from a malicious TLS 1.3 client. If using TLS 1.3 on the server side
 >    it is recommended to update the version of wolfSSL used.
 >  - [Med] CVE-2024-1545 Fault Injection vulnerability in
 >    RsaPrivateDecryption function that potentially allows an attacker
 >    that has access to the same system with a victims process to perform
 >    a Rowhammer fault injection.
 >  - [Med] Fault injection attack with EdDSA signature operations. This
 >    affects ed25519 sign operations where the system could be susceptible
 >    to Rowhammer attacks.

 > No official tarball provided so switch to github and set autoreconf

 > https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.0-stable

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
