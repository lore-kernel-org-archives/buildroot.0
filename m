Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C61C6FD18
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 13:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E86607C7;
	Sat,  4 Mar 2023 13:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E86607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msSI3zGZjEs8; Sat,  4 Mar 2023 13:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41559607F5;
	Sat,  4 Mar 2023 13:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41559607F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCEFD1BF3E3
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63E282018
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 13:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63E282018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lt_8hqhY1gl5 for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 13:41:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ABDC82017
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3ABDC82017
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 13:41:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB4EF100004;
 Sat,  4 Mar 2023 13:41:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYS8F-00GmCd-O5; Sat, 04 Mar 2023 14:41:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1675873210.git.yann.morin.1998@free.fr>
 <a2a5d94174a0efd482097b95a7eda50362d8d7a2.1675873210.git.yann.morin.1998@free.fr>
Date: Sat, 04 Mar 2023 14:41:03 +0100
In-Reply-To: <a2a5d94174a0efd482097b95a7eda50362d8d7a2.1675873210.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Feb 2023 17:20:15 +0100")
Message-ID: <87zg8sd47k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/dmalloc: use actual patches
 rather than sed-ing
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Our dmalloc packaging is very old and carries historical baggage and
 > idiosyncracies that we have long stopped doing in the rest ofthe code
 > base.

 > Drop our post-patch hooks that seds the configure and Makefile.in files,
 > and add patches (that could be upstreamed one day).

 > We provide the results in the environment, like would be done with
 > actual autoconf cache variables (ac_cv_*).

 > Note: those are the result of cleaning up for further patches that did
 > not manifest because it was too complex to add proper SSP support to
 > dmalloc (instead, we're going to forcibly disable it in the following
 > commit).

 > Note-2: those patches have not been submitted upstream, as it's mostly
 > dead: even though there's een some commit activities recently-ish, there
 > has been no review or comments or the many PR pending for many years
 > now.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
