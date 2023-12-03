Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BB4C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48C664012F;
	Sun,  3 Dec 2023 21:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48C664012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fkqkVp-QUYc; Sun,  3 Dec 2023 21:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B949400F9;
	Sun,  3 Dec 2023 21:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B949400F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 122F21BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEFB818A2
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEFB818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTfVtBA2K2k3 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:23:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77DFB817A6
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77DFB817A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C53CE0002;
 Sun,  3 Dec 2023 21:23:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r9tw0-009gyy-1Q;
 Sun, 03 Dec 2023 22:23:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231202214529.8858-1-fontaine.fabrice@gmail.com>
Date: Sun, 03 Dec 2023 22:23:28 +0100
In-Reply-To: <20231202214529.8858-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 Dec 2023 22:45:29 +0100")
Message-ID: <878r6bvv3j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: disable gssapi
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

 > PUTTY_GSSAPI is enabled by default resulting in the following build
 > failure since bump to version 0.78 in commit
 > 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

 >  /home/fabrice/buildroot/output/build/putty-0.79/unix/gss.c:133:10: fatal error: gssapi/gssapi.h: No such file or directory
 >   133 | #include <gssapi/gssapi.h>
 >       |          ^~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d6d06b5aa0df070c3880399e044fb3cd3a830aec

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
