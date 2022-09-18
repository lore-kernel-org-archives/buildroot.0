Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054AECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 20:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D9D4240F;
	Sun, 18 Sep 2022 20:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D9D4240F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RMl_L6FKZ7e; Sun, 18 Sep 2022 20:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88B224098B;
	Sun, 18 Sep 2022 20:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B224098B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBF791BF3CB
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 20:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B78A4400EF
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 20:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78A4400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5C2teePh0Xz2 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 20:54:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ECCD400DA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9ECCD400DA
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 20:54:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 122E440003;
 Sun, 18 Sep 2022 20:54:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oa1JS-00EYer-KS; Sun, 18 Sep 2022 22:54:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: John Keeping <john@metanate.com>
References: <20220527113658.731372-1-john@metanate.com>
Date: Sun, 18 Sep 2022 22:54:50 +0200
In-Reply-To: <20220527113658.731372-1-john@metanate.com> (John Keeping's
 message of "Fri, 27 May 2022 12:36:58 +0100")
Message-ID: <87o7vcflnp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/network-manager: support libnss
 instead of gnutls
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

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > NetworkManager supports compiling against either NSS or GnuTLS and in
 > fact upstream defaults to NSS if both are available and no choice is
 > specified.  Providing a choice can shrink images slightly if some other
 > package is already pulling in NSS but GnuTLS is not otherwise required.

 > Since a crypto provider is required and to maintain backwards
 > compatibility, select GnuTLS when NSS is not selected.

 > In keeping with the upstream default, choose NSS when both libraries are
 > available.

 > Signed-off-by: John Keeping <john@metanate.com>

Sorry for the slow response. In the mean time the network-manager
package has moved to meson, so I rewrote the patch to use the meson
equivalent and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
