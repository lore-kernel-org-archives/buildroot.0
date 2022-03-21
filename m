Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74EFD405F5;
	Mon, 21 Mar 2022 07:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmM01yipkosE; Mon, 21 Mar 2022 07:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9444059F;
	Mon, 21 Mar 2022 07:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78DEA1BF316
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EB4A60C07
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIhZ9sTBIuwE for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:46:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6309860B08
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:46:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F458FF803;
 Mon, 21 Mar 2022 07:46:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nWCk3-00Fexk-K0; Mon, 21 Mar 2022 08:46:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220315211222.E6D258408A@busybox.osuosl.org>
 <87czigmpsx.fsf@dell.be.48ers.dk>
Date: Mon, 21 Mar 2022 08:46:15 +0100
In-Reply-To: <87czigmpsx.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 20 Mar 2022 19:39:26 +0100")
Message-ID: <87lex3kat4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/gcr: depends on !gnupg
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=5783a418f4b30931068b81f850fc06cd8d3d9732
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 >> Since gcr selects gnupg2, it's incompatible with gnupg. Add this
 >> dependency and corresponding comment.

 >> While we're at it, also hide the existing comment when
 >> !BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS.

 >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

Hmm, this doesn't work with the v1/v2 rework, so I'll revert:

package/gcr/Config.in:1:error: recursive dependency detected!
package/gcr/Config.in:1:        symbol BR2_PACKAGE_GCR depends on BR2_PACKAGE_GNUPG
package/gnupg/Config.in:1:      symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_GNUPG2
package/gnupg2/Config.in:5:     symbol BR2_PACKAGE_GNUPG2 is selected by BR2_PACKAGE_GCR
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
