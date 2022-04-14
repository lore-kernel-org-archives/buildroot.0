Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862EFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3027541545;
	Thu, 14 Apr 2022 20:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dILuMGM3qRaJ; Thu, 14 Apr 2022 20:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE23416B5;
	Thu, 14 Apr 2022 20:11:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88A951BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75862404D7
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3MzFd_KHQiI for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:11:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11AA340142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:11:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 690EB100006;
 Thu, 14 Apr 2022 20:11:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nf5oM-00Brjj-9u; Thu, 14 Apr 2022 22:11:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20220413141711.2529851-1-peter@korsgaard.com>
 <CA+h8R2pUPGeTL+gedUxm+mO9sO4NAfnVwBi0w92gFVGX8XTjYA@mail.gmail.com>
Date: Thu, 14 Apr 2022 22:11:26 +0200
In-Reply-To: <CA+h8R2pUPGeTL+gedUxm+mO9sO4NAfnVwBi0w92gFVGX8XTjYA@mail.gmail.com>
 (Christian Stewart's message of "Thu, 14 Apr 2022 12:42:47 -0700")
Message-ID: <87czhjbf2p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.17.9
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
Cc: Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi,
 > I also sent a Go 1.18.1 patch, which now works w/ everything in the
 > tree (as far as I'm aware).

Ok, the 1.17.9 bump is handy for backporting to 2022.02.x first though.

>> crypto/elliptic and encoding/pem packages, as well as bug fixes to the
 >> linker and runtime.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/go/go.hash | 2 +-
 >> package/go/go.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)
 >> 
 >> diff --git a/package/go/go.hash b/package/go/go.hash
 >> index 85e6adfb8c..507887eaaa 100644
 >> --- a/package/go/go.hash
 >> +++ b/package/go/go.hash
 >> @@ -1,3 +1,3 @@
 >> # From https://golang.org/dl/
 >> -sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
 >> +sha256  763ad4bafb80a9204458c5fa2b8e7327fa971aee454252c0e362c11236156813  go1.17.9.src.tar.gz

 > Reviewed-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
