Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB66C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB5BE405A9;
	Tue, 22 Feb 2022 10:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqvKCWs1IlMJ; Tue, 22 Feb 2022 10:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B844F40155;
	Tue, 22 Feb 2022 10:12:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 522A51BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F1AF409A2
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZNV4nB_Oz8Y for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:12:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EACE940892
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:12:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4DE9240013;
 Tue, 22 Feb 2022 10:12:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMS9V-005zt3-R4; Tue, 22 Feb 2022 11:12:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220221220025.2198034-1-fontaine.fabrice@gmail.com>
Date: Tue, 22 Feb 2022 11:12:13 +0100
In-Reply-To: <20220221220025.2198034-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 Feb 2022 23:00:25 +0100")
Message-ID: <87tucr6whu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/flac: security bump to version 1.3.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This release mostly fixes (security related) bugs including:
 >  - Fix 12 decoder bugs found by oss-fuzz, including CVE-2020-0499
 >  - Fix encoder bug CVE-2021-0561

 > Also:
 >  - Replace first patch which was reverted by
 >    https://github.com/xiph/flac/commit/4fbb6d4f2ecf2a96c17ea9880108409f852c08a9
 >  - Disable stack protection (enabled by default since
 >    https://github.com/xiph/flac/commit/f706f2832270a0b7851cdffe62ad37acda9423fe)
 >  - Drop md5 which is not provided anymore
 >  - Update indentation in hash file (two spaces)

 > https://github.com/xiph/flac/releases/tag/1.3.4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin and Peter Seiderer):
 >  - Add upstream patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
