From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 17:01:34 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <20160827161601.2fd0e8f5@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
Message-ID: <20160827150134.GF5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 16:16 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:26 +0200, Yann E. MORIN wrote:
> 
> > +.PHONY: $(BUILD_DIR)/.br2-external.in
> 
> Why is a real file that exists on the filesystem a phony target?

Because we want to regenerate it every time we run, in case the user
passes a new set of BR2_EXTERNAL.

With only this patch, of course that does not bring anything, as we
simply touch that file. It becones usefull in followup patches.

> > +# Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
> > +MANUAL_DEPENDENCIES += prepare-kconfig
> 
> It's a bit crazy the complexity that we have just to allow our manual
> to have the list of all packages in Buildroot. I'm not even sure this
> section of the manual is that useful, to be honest. But oh well, that's
> supported today, so we have to continue support it.

Well, I am prersonally not very impressed with the list of packags in
the manual either...

That being said, some users find it interesting and, as you said, we
already have it and the code is already there...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
