Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F004C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30B15417DF;
	Thu, 29 Feb 2024 15:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 512Jo3UFiJ8i; Thu, 29 Feb 2024 15:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A01417F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8A01417F5;
	Thu, 29 Feb 2024 15:24:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE1671BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B826C60EF4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDYfuZdE62J9 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:20:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52C6B60ECC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52C6B60ECC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52C6B60ECC
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:20:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9B562000E;
 Thu, 29 Feb 2024 15:20:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiCk-004mXe-03;
 Thu, 29 Feb 2024 16:20:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240205132229.6521F86C15@busybox.osuosl.org>
Date: Thu, 29 Feb 2024 16:20:13 +0100
In-Reply-To: <20240205132229.6521F86C15@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 5 Feb 2024 14:22:21 +0100")
Message-ID: <87sf1bguvm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/libzenoh-pico: disable on or1k
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=ead797bef768a7f3da7a76dd8510eef48181bb6a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The upstream libzenoh-pico code uses asm("nop"), which is completely
 > bogus, and actually breaks build on or1k as the instruction does not
 > exist.

 > In upstream commit
 > https://github.com/eclipse-zenoh/zenoh-pico/commit/7d79a14addcea972e801709413f5c9a5226e3ad3
 > they made the asm("nop") thing "configurable" with ZP_ASM_NOP, but
 > still that requires some special handling for or1k. The whole thing is
 > a complete mess, and upstream should have to use any of that. Rather
 > than stacking piles of bogus stuff on more bogus stuff, let's simply
 > disable this package for or1k for now.

 > Thanks a lot to Fabrice for all the investigation, and interaction
 > with upstream. See
 > https://patchwork.ozlabs.org/project/buildroot/patch/20240110215515.1263859-1-fontaine.fabrice@gmail.com/
 > for example.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/fd0b2c666a1dc1537162d15b27743abd270243ed

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
