From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 15:54:47 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <54451174.5060309@zacarias.com.ar>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
 <54450BF5.4000202@zacarias.com.ar>
 <20141020152759.4f438890@free-electrons.com>
 <54450F51.5050801@zacarias.com.ar>
 <20141020153719.034df3be@free-electrons.com>
 <54451174.5060309@zacarias.com.ar>
Message-ID: <20141020155447.21c7c7ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 10:43:16 -0300, Gustavo Zacarias wrote:

> >> gustavoz at asgard ~/git/buildroot/package $ find . -name \*.mk -exec grep
> >> --with-filename TARGET_FINALIZE {} \;
> >> ./perl/perl.mk:TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
> > 
> > Only removes stuff.
> 
> But it will alter your package size measurments outside of package
> scope, you need to account for those.

Yes, this is already taken care of in my script. There are lots of
other files that get removed (header files, static libraries, etc.).

> > The skeleton can be made a package of its own.
> > 
> > See, I'm not too far away :-)
> 
> Yes, it's called baselayout in gentoo, base-files in some other distros
> and so on, you probably already know them.

Yep.

> But nobody made it yet.

Indeed, but it wouldn't be too hard to do I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
