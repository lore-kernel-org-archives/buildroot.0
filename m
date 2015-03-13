From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Mar 2015 20:47:32 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/softether: Fix iconv-related
	compile error
References: <1426107668-9110-1-git-send-email-bernd.kuhls@t-online.de>
 <8761a7jhks.fsf@dell.be.48ers.dk>
Message-ID: <XnsA45CD3828E448berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Peter Korsgaard <peter@korsgaard.com> wrote in 
news:8761a7jhks.fsf at dell.be.48ers.dk:

> > -ifeq ($(BR2_ENABLE_LOCALE),)
> > +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> 
> Hmm, what does this really change? LIBICONV=y if !BR2_ENABLE_LOCALE, so
> these should be equivalent, right?

Hi,

I am not sure if I understood your question correctly. Currently libiconv is 
only taken into account as dependency if BR2_ENABLE_LOCALE=y, but it is also 
possible to have BR2_PACKAGE_LIBICONV=y if !BR2_ENABLE_LOCALE, just as you 
said. But the current code in buildroot git and my patched code do not 
function the same because the current git code ignores libiconv and leads to 
autobuild errors like these from today:

http://autobuild.buildroot.net/results/182/182e658723d654d45c683dc2bc0b959c82
c37826/
http://autobuild.buildroot.net/results/1e4/1e4af4642691ea9681b39eb1ce4f8107e8
c3ff5f/

Regards, Bernd
