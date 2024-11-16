Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1427D68BD2
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 09:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A77849AD;
	Sat, 16 Nov 2024 09:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwdMGAGwMuSW; Sat, 16 Nov 2024 09:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6623F849B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6623F849B0;
	Sat, 16 Nov 2024 09:48:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B43B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3B3849AD
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYPMpfaxDWRA for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 09:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3492C849A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3492C849A2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3492C849A2
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 09:48:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F797E0002;
 Sat, 16 Nov 2024 09:48:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tCFPQ-006U1k-1B;
 Sat, 16 Nov 2024 10:48:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>
References: <20241114210952.61365-1-ju.o@free.fr>
Date: Sat, 16 Nov 2024 10:48:04 +0100
In-Reply-To: <20241114210952.61365-1-ju.o@free.fr> (Julien Olivain's message
 of "Thu, 14 Nov 2024 22:09:52 +0100")
Message-ID: <878qtjwluz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: security bump to
 version 1.21.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For the change log, see [1].
 > The license hash file changed, due to the year update. See [2].
 > This commit also adds a comment in the hash file the pgp signature file
 > source and key id used for the verification.

 > Fixes:
 > - https://nvd.nist.gov/vuln/detail/CVE-2024-37370
 > - https://nvd.nist.gov/vuln/detail/CVE-2024-37371

 > [1] https://web.mit.edu/kerberos/www/krb5-1.21/
 > [2] https://github.com/krb5/krb5/commit/fec2c44ee93bfd3282bed99509a941d56a6e2c21

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested (compilation only) in:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/1543592409

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
