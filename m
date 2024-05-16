Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E50AC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 09:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF50E827A1;
	Thu, 16 May 2024 09:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOeIvX2hafmw; Thu, 16 May 2024 09:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDFFC82798
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDFFC82798;
	Thu, 16 May 2024 09:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDEC61BF82C
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 09:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A99904061A
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 09:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoTFfdtue0xC for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 09:28:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 110F4405F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110F4405F1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 110F4405F1
 for <buildroot@buildroot.org>; Thu, 16 May 2024 09:28:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7909240004;
 Thu, 16 May 2024 09:28:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7XP7-002w34-0E;
 Thu, 16 May 2024 11:28:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240330185620.995961-1-fontaine.fabrice@gmail.com>
Date: Thu, 16 May 2024 11:28:01 +0200
In-Reply-To: <20240330185620.995961-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 30 Mar 2024 19:56:20 +0100")
Message-ID: <87r0e2p0m6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: drop gmp optional
 dependency
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

 > libgmp is included in coreutils (through bootstrap.conf) since bump to
 > version 9.0 in commit 2ee43bad85693d1c96e14f5b39ccb13a8982f50a and
 > https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=13046444888a7e96f48d28fdd5a6ffe03d4ab036:

 > configure: WARNING: unrecognized options: --disable-gtk-doc,
 > --disable-gtk-doc-html, --disable-doc, --disable-docs,
 > --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
 > --enable-static, --enable-shared, --without-gmp

 > Fixes: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
