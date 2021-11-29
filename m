Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E96C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E21F060BF1;
	Mon, 29 Nov 2021 21:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KM-oCczHi7w6; Mon, 29 Nov 2021 21:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3797360BAA;
	Mon, 29 Nov 2021 21:32:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0441BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490D981A29
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBVvDOHCPd7R for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:32:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E43E181A27
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:32:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 24AC2200005;
 Mon, 29 Nov 2021 21:32:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mroGN-0003sX-HM; Mon, 29 Nov 2021 22:32:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211129064302.2174763-1-fontaine.fabrice@gmail.com>
Date: Mon, 29 Nov 2021 22:32:39 +0100
In-Reply-To: <20211129064302.2174763-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Nov 2021 07:43:02 +0100")
Message-ID: <87wnkqk5qg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl_ttf: drop spurious space
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

 > Drop spurious space added by
 > fcb48a9a6568f09d2c246470de156299d9c5e846

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

 > ---
 >  package/sdl_ttf/sdl_ttf.mk | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
 > index 254000443c..c396830d0e 100644
 > --- a/package/sdl_ttf/sdl_ttf.mk
 > +++ b/package/sdl_ttf/sdl_ttf.mk
 > @@ -18,5 +18,8 @@ SDL_TTF_CONF_OPTS = \
 >  	--with-freetype-prefix=$(STAGING_DIR)/usr \
 >  	--with-sdl-prefix=$(STAGING_DIR)/usr
 
 > -SDL_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
 > +SDL_TTF_MAKE_OPTS = \
 > +	INCLUDES="-I$(STAGING_DIR)/usr/include/SDL" \
 > +	LDFLAGS="-L$(STAGING_DIR)/usr/lib"
 > +
 >  $(eval $(autotools-package))
 > -- 
 > 2.33.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
