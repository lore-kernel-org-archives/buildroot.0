From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Thu, 16 Apr 2015 09:17:49 -0400 (EDT)
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
 <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
 <alpine.LFD.2.11.1504160836530.19987@localhost>
 <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1504160912290.18180@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2015, Samuel Martin wrote:

> On Thu, Apr 16, 2015 at 2:40 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > On Thu, 16 Apr 2015, Samuel Martin wrote:
> >
> >> Hi Robert,
> >>
> >> On Thu, Apr 16, 2015 at 2:21 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >> >
> >> >   [apologies if you've seen this before -- i posted it yesterday but
> >> > it doesn't seem to show up in the ML archives.]
> >> >
> >> >   if i'm starting a new build, how can i take advantage of the
> >> > gigabytes of S/W tarballs i've collected for doing OE/yocto project
> >> > builds?
> >> >
> >> >   i want to set the equivalent of a local mirror -- would i set a
> >> > value in the "Primary download site" config option, with the format
> >> > "file:///pathname/to/all/my/tarballs"?
> >>
> >> You certainly want to set BR2_DL_DIR [1].
> >>
> >> [1] http://nightly.buildroot.org/#env-vars
> >
> >   i'm not convinced that's what i want ... AIUI, that variable defines
> > where the downloaded SW tarballs will be *placed*, and i'm happy to
> > leave that where it is as a local dl/ directory for the build.
> >
> >   what i want is to define a local (on-host) mirror for tarballs that
> > will be searched before going out to the net. i definitely don't want
> > the fetch process to try to *place* anything in that local mirror,
> > only to *fetch* from it.
>
> For alternative mirror, there is a couple of options in the menuconfig:
> Build options ---> Mirrors and Download locations

  i know, i referred to that very config option in my original
posting. what i'm wondering is if that config option -- "Primary
download site" -- can be set to point at a local directory on my build
host that's already loaded with S/W tarballs i've built up over the
months for use with my OE and yocto builds.

  the help for that option says only that, "Valid URIs are URIs
recognized by $(WGET) and scp URIs of the form
scp://[user@]host:path." last time i looked, wget doesn't support the
"file://" form of URI, so i can't use that.

  is there a standard way to do this?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
