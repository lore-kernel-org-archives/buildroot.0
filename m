Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F469C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 08:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E87FF60FC7;
	Wed, 21 Dec 2022 08:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E87FF60FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Whiyo0fTwuYp; Wed, 21 Dec 2022 08:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A3960FD5;
	Wed, 21 Dec 2022 08:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A3960FD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60A1D1BF3F6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B4EE41548
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 08:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4EE41548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MiJUfcvdeQDS for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 08:10:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B3C414C8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6B3C414C8
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 08:10:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B9CA540004;
 Wed, 21 Dec 2022 08:10:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7uAx-000Nno-Rq; Wed, 21 Dec 2022 09:10:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221208202104.3041-1-fontaine.fabrice@gmail.com>
Date: Wed, 21 Dec 2022 09:10:07 +0100
In-Reply-To: <20221208202104.3041-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 8 Dec 2022 21:21:04 +0100")
Message-ID: <87wn6lqisg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: security bump to
 version 0.9.2
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
Cc: Koen Martens <gmc@sonologic.nl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-46149: Cap'n Proto is a data interchange format and remote
 > procedure call (RPC) system. Cap'n Proro prior to versions 0.7.1, 0.8.1,
 > 0.9.2, and 0.10.3, as well as versions of Cap'n Proto's Rust
 > implementation prior to 0.13.7, 0.14.11, and 0.15.2 are vulnerable to
 > out-of-bounds read due to logic error handling list-of-list. This issue
 > may lead someone to remotely segfault a peer by sending it a malicious
 > message, if the victim performs certain actions on a list-of-pointer
 > type. Exfiltration of memory is possible if the victim performs
 > additional certain actions on a list-of-pointer type. To be vulnerable,
 > an application must perform a specific sequence of actions, described in
 > the GitHub Security Advisory. The bug is present in inlined code,
 > therefore the fix will require rebuilding dependent applications. Cap'n
 > Proto has C++ fixes available in versions 0.7.1, 0.8.1, 0.9.2, and
 > 0.10.3.

 > https://github.com/capnproto/capnproto/security/advisories/GHSA-qqff-4vw4-f6hx
 > https://dwrensha.github.io/capnproto-rust/2022/11/30/out_of_bounds_memory_access_bug.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
