Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75682C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26EC9847DB;
	Thu, 10 Mar 2022 22:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3aJCMBzxYXH; Thu, 10 Mar 2022 22:32:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2712F847CB;
	Thu, 10 Mar 2022 22:32:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 611201BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59CCB847BE
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQGaOO6k1vwj for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:31:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48B69847CB
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:31:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DFCF3200002;
 Thu, 10 Mar 2022 22:31:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nSRJw-004Fy4-5D; Thu, 10 Mar 2022 23:31:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220218105557.705926-1-fontaine.fabrice@gmail.com>
Date: Thu, 10 Mar 2022 23:31:44 +0100
In-Reply-To: <20220218105557.705926-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 18 Feb 2022 11:55:57 +0100")
Message-ID: <87wnh1xwvj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-twisted: security bump
 to version 22.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-21712: twisted is an event-driven networking engine written
 > in Python. In affected versions twisted exposes cookies and
 > authorization headers when following cross-origin redirects. This issue
 > is present in the `twited.web.RedirectAgent` and `twisted.web.
 > BrowserLikeRedirectAgent` functions. Users are advised to upgrade. There
 > are no known workarounds.

 > Update hash of license file (author added and update in year:
 > https://github.com/twisted/twisted/commit/13aa59746a73769b05a51c2198b28f5602dd382f
 > https://github.com/twisted/twisted/commit/adfdf23477abfcd09a867347993fc1d207cfb4dd
 > https://github.com/twisted/twisted/commit/7e65fbeed3d74a4eb1c40d7a6df5651782becbc8)

 > https://github.com/twisted/twisted/security/advisories/GHSA-92x2-jw7w-xvvx
 > https://github.com/twisted/twisted/releases/tag/twisted-22.1.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
