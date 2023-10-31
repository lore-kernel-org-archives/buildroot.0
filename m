Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0652C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 18:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8536083EC3;
	Tue, 31 Oct 2023 18:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8536083EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD0epBF2p7PV; Tue, 31 Oct 2023 18:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0BF983EBD;
	Tue, 31 Oct 2023 18:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0BF983EBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 211FE1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 18:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE4FA83EA7
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 18:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4FA83EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DX5q7_o_PA1 for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 18:04:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1CCA83E9C
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 18:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1CCA83E9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 013BD1BF203;
 Tue, 31 Oct 2023 18:04:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxt69-004KuF-0O;
 Tue, 31 Oct 2023 19:04:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231031145830.14831-1-fontaine.fabrice@gmail.com>
Date: Tue, 31 Oct 2023 19:04:17 +0100
In-Reply-To: <20231031145830.14831-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 31 Oct 2023 15:58:30 +0100")
Message-ID: <8734xq1xem.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.6.4
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

 > [Medium] A fix was added, but still under review for completeness, for a
 > Bleichenbacher style attack, leading to being able to decrypt a saved
 > TLS connection and potentially forge a signature after probing with a
 > large number of trial connections. This issue is around RSA decryption
 > and affects static RSA cipher suites on the server side, which are not
 > recommended to be used and are off by default. Static RSA cipher suites
 > were also removed from the TLS 1.3 protocol and only present in TLS 1.2
 > and lower. All padding versions of RSA decrypt are affected since the
 > code under review is outside of the padding processing. Information
 > about the private keys is NOT compromised in affected code. It's
 > recommended to disable static RSA cipher suites and update the version
 > of wolfSSL used if using RSA private decryption alone outside of TLS.

 > https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.4-stable

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
