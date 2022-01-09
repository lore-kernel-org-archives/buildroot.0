Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F197C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA338402CA;
	Sun,  9 Jan 2022 13:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Y6Dx6g4SRt5; Sun,  9 Jan 2022 13:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13DA1402A7;
	Sun,  9 Jan 2022 13:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D29D81BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFFE0402A7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lc3F78WrUAkX for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:27:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE71C4027F
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:27:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4B2B3200003;
 Sun,  9 Jan 2022 13:27:16 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6YE7-0004FJ-Jy; Sun, 09 Jan 2022 14:27:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>, nolange79@gmail.com
References: <20220109124415.8A8BF82CFA@busybox.osuosl.org>
Date: Sun, 09 Jan 2022 14:27:15 +0100
In-Reply-To: <20220109124415.8A8BF82CFA@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 9 Jan 2022 13:48:26 +0100")
Message-ID: <8735lxca4s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/systemd: Update description
 and kernel options
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=eb49354eb34842f88218fcf9ef60576b85653e38
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > realign the configuration to the README.

 > enable CONFIG_AUTOFS_FS (kernel >= 4.18) as well as the someday
 > to be removed CONFIG_AUTOFS4_FS option.

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 >  package/systemd/Config.in  | 22 +++++++++++++++++-----
 >  package/systemd/systemd.mk | 16 ++++++++++++----
 >  2 files changed, 29 insertions(+), 9 deletions(-)

 > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
 > index c8c5a9c47b..27a12bc947 100644
 > --- a/package/systemd/Config.in
 > +++ b/package/systemd/Config.in
 > @@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 >  	depends on !BR2_STATIC_LIBS # kmod
 >  	depends on BR2_TOOLCHAIN_USES_GLIBC
 >  	depends on BR2_TOOLCHAIN_HAS_SSP
 > -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13

Is that correct? The corresponding BR2_INIT_SYSTEMD dependency was not
updated.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
