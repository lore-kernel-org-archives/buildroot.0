Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA8C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B122840879;
	Sun,  3 Dec 2023 16:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B122840879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rIcAObRtCyEb; Sun,  3 Dec 2023 16:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB9A4081F;
	Sun,  3 Dec 2023 16:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB9A4081F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2DFE1BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC3A081344
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC3A081344
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_Bpgr3DMfnt for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:40:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C57858132E
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C57858132E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 238961BF203;
 Sun,  3 Dec 2023 16:40:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9pWD-0095z6-1j;
 Sun, 03 Dec 2023 17:40:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231203150646.1953347-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 17:40:33 +0100
In-Reply-To: <20231203150646.1953347-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Dec 2023 16:06:46 +0100")
Message-ID: <87a5qr1bpa.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH/next 1/1] package/elfutils: drop -lfts
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

 > As spotted by Yann E. Morin in
 > https://patchwork.ozlabs.org/project/buildroot/patch/20231022154133.1619344-1-bernd@kuhls.net,
 > -lfts is not needed since bump to version 0.183 in commit
 > ef92e86e845134868011cb0b801509a0755f855e and
 > https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=da855fc9cd415c288bfcb9de1f3d5eb329de0557

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
