Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D661D42BBF
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4500401C2;
	Tue, 12 Nov 2024 20:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKkng-bOPRnC; Tue, 12 Nov 2024 20:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB3C4401DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3C4401DA;
	Tue, 12 Nov 2024 20:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF72ADB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D41E66078A
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYIIF1d4pNwF for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 20:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 595EE60631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 595EE60631
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 595EE60631
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:07:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E574FC0004;
 Tue, 12 Nov 2024 20:07:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAxAu-00D0XS-0j;
 Tue, 12 Nov 2024 21:07:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241026170153.B2C1983FAE@busybox.osuosl.org>
Date: Tue, 12 Nov 2024 21:07:44 +0100
In-Reply-To: <20241026170153.B2C1983FAE@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 26 Oct 2024 18:59:41 +0200")
Message-ID: <8734jw9pwv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/ltrace: mark as unavailable on
 musl
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=859bd545821a838454577c4c1c9106837cda51cb
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc enabled elfutils on
 > musl, as well as all its reverse dependencies, including ltrace. Turns
 > out that even with elfutils fixed, ltrace doesn't build on musl.

 > Fabrice proposed a patch to fix it, at:

 >   https://patchwork.ozlabs.org/project/buildroot/patch/20231104155857.110364-1-fontaine.fabrice@gmail.com/

 > but ltrace has no active upstream, and some aspects of the patch don't
 > look correct. So err on the safe side and make ltrace unavailable for
 > musl configurations.

 > Fixes:

 >   http://autobuild.buildroot.org/results/a3a5c46e8562d3f091a9b4b205322168fbf9d16b

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
