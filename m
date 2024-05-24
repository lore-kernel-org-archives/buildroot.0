Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB0C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA41831E7;
	Fri, 24 May 2024 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQTOqF9diEeG; Fri, 24 May 2024 12:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2DD083265
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2DD083265;
	Fri, 24 May 2024 12:32:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08AB41CF71C
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E917040407
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5u8i_VCLq0Q for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C200400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C200400A6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C200400A6
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:32:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A836740012;
 Fri, 24 May 2024 12:32:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAU5r-00Fvrc-07;
 Fri, 24 May 2024 14:32:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240516163144.640424-1-fontaine.fabrice@gmail.com>
Date: Fri, 24 May 2024 14:32:19 +0200
In-Reply-To: <20240516163144.640424-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 16 May 2024 18:31:44 +0200")
Message-ID: <87msofl7ak.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: security bump to version
 0.81
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
Cc: Alexander Dahl <post@lespocky.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The only change between 0.80 and 0.81 is one security fix:
 >  - ECDSA signatures using 521-bit keys (the NIST P521 curve, otherwise
 >    known as ecdsa-sha2-nistp521) were generated with biased random
 >    numbers. This permits an attacker in possession of a few dozen
 >    signatures to RECOVER THE PRIVATE KEY.

 >    Any 521-bit ECDSA private key that PuTTY or Pageant has used to
 >    sign anything should be considered compromised.

 >    This vulnerability has the identifier CVE-2024-31497.

 > Update hash of LICENCE file (update in year with
 > https://git.tartarus.org/?p=simon/putty.git;a=commit;h=f2f28ac0386eebbd45ea605818d31d62d219f589)

 > https://lists.tartarus.org/pipermail/putty-announce/2024/000038.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
