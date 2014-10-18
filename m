From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 19:44:56 +0200
Subject: [Buildroot] [PATCH] modplugtools: Added package
In-Reply-To: <5202496.NH7UHFfB86@hyperion>
References: <1413565811-7196-1-git-send-email-maarten@treewalker.org>
 <54427584.5060903@mind.be> <5202496.NH7UHFfB86@hyperion>
Message-ID: <20141018174456.GE31723@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten, All,

On 2014-10-18 19:19 +0200, Maarten ter Huurne spake thusly:
> On Saturday 18 October 2014 16:13:24 Arnout Vandecappelle wrote:
> > On 17/10/14 19:10, Maarten ter Huurne wrote:
> > > diff --git a/package/modplugtools/Config.in
> > > b/package/modplugtools/Config.in new file mode 100644
> > > index 0000000..53e9672
> > > --- /dev/null
> > > +++ b/package/modplugtools/Config.in
> > > @@ -0,0 +1,9 @@
> > > +config BR2_PACKAGE_MODPLUGTOOLS
> > > +	bool "modplugtools"
> > > +	select BR2_PACKAGE_LIBAO
> > > +	select BR2_PACKAGE_LIBMODPLUG
> > > +	help
> > > +	  This installs the 'modplug123' command line tool to play music 
> files
> > > +	  using libmodplug.
> > 
> >  Small nit: I'd say "MOD files" rather than "music files". Or does it play
> > other formats as well?
> 
> It plays various tracker formats. I tested it with S3M files, for example. I 
> considered "tracker songs" instead of "music files", but I wasn't sure 
> whether "tracker" is still a commonly understood term.

Eh! I do! :-)

Wikipedia considers them to be "module files", and are to be played with
a "music tracker":
    https://en.wikipedia.org/wiki/Module_file
    https://en.wikipedia.org/wiki/Music_tracker

So, "MOD files" is OK, maybe something like:
    MOD files (eg. .mod, .s3m...)

> > > +MODPLUGTOOLS_DEPENDENCIES = libao libmodplug
> > > +
> > > +# Only play through libao: some platforms don't have OSS support and
> > > for those +# that do, playing through libao is still going to be
> > > sufficient. +define MODPLUGTOOLS_REMOVE_MODPLUGPLAY
> > > +	rm $(TARGET_DIR)/usr/bin/modplugplay
> > 
> >  I don't understand this. The executable is really small, and it builds
> > correctly (otherwise you wouldn't even get this far), so why bother with
> > removing it? Someone who cares that much about their rootfs size will have
> > to remove a bunch of other stuff from the installed system anyway.
> 
> It wouldn't execute correctly on target systems that don't have OSS support. 
> Since OSS has been deprecated in the kernel for many years (*), my hope is 
> that most embedded kernels today don't have OSS support.
> 
> (*) I tried to look up how long, but it predates the move to Git in 2005.

Yeah, I wouldn't bother with OSS.

But then, be more explicit in the comment, and/or make it configurable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
