Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2A4C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73AEA40432;
	Tue, 21 Feb 2023 20:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73AEA40432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2_k7F4tgsO2; Tue, 21 Feb 2023 20:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4E8240374;
	Tue, 21 Feb 2023 20:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E8240374
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7276B1BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 597E941826
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 597E941826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJJTedC1KyGT for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:46:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB6F041824
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB6F041824
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:46:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8F1C11BF203;
 Tue, 21 Feb 2023 20:46:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUZWk-007nEF-CV; Tue, 21 Feb 2023 21:46:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230205132307.41753-1-fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2023 21:46:18 +0100
In-Reply-To: <20230205132307.41753-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Feb 2023 14:23:07 +0100")
Message-ID: <87356yycf9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tmux: add utf8proc optional
 dependency
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > utf8proc is an optional dependency since version 2.3 and
 > https://github.com/tmux/tmux/commit/6c94774b70f72952c4c512e4aa59a207ca1c34f2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

> ---
 >  package/tmux/tmux.mk | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
 > index 281b7d8ee6..b1c0af1a83 100644
 > --- a/package/tmux/tmux.mk
 > +++ b/package/tmux/tmux.mk
 > @@ -11,6 +11,13 @@ TMUX_LICENSE_FILES = COPYING
 >  TMUX_CPE_ID_VENDOR = tmux_project
 >  TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
 
 > +ifeq ($(BR2_PACKAGE_UTF8PROC),y)
 > +TMUX_DEPENDENCIES += utf8proc
 > +TMUX_CONF_OPTS += --enable-utf8proc
 > +else
 > +TMUX_CONF_OPTS += --disable-utf8proc
 > +endif
 > +
 >  # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
 >  # can reject the user connection. See man shells.
 >  define TMUX_ADD_TMUX_TO_SHELLS
 > -- 

 > 2.39.0

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
