From: Paul Jones <paul@pauljones.id.au>
Date: Tue, 15 Jun 2010 20:33:19 +1000
Subject: [Buildroot] [PATCH] Display current action in title bar
In-Reply-To: <20100615115613.29b5b01a@surf>
References: <1276523235-26299-1-git-send-email-paul@pauljones.id.au>
	<20100615115613.29b5b01a@surf>
Message-ID: <002201cb0c76$2dd52a10$897f7e30$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Tuesday, 15 June 2010 7:56 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] Display current action in title bar
> 
> On Mon, 14 Jun 2010 23:47:15 +1000
> Paul Jones <paul@pauljones.id.au> wrote:
> 
> > -# MESSAGE Macro -- display a message in bold type -MESSAGE = echo
> > "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
> $(1)$(TERM_RESET)"
> > +# MESSAGE Macro -- display a message in bold type and in the title
> > +bar MESSAGE  = echo "$(TERM_BOLD)>>> $($(PKG)_NAME)
> $($(PKG)_VERSION) $(1)$(TERM_RESET)" \
> > +		&& echo -en "\033]2; $($(PKG)_NAME) $($(PKG)_VERSION)
> $(1) \007"
> 
> I've tried this here in my xfterm (XFCE terminal) and it doesn't do
anything. Is
> my terminal emulator too crappy ?
> 
> Anyway, I'm not sure I'd like to see Buildroot hijack the title bar of my
> terminal emulator. Or maybe I'm missing the point of your patch ?

It works using the Gnome terminal and Putty. I'll try it on some others.
Since the terminal title is usually set by the PS1 variable that means that
as soon as builtroot stops running it will return to normal. The Gentoo
build system does the same thing and it is quite handy to see what's
happening.
 

Paul.
