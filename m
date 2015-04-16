From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Thu, 16 Apr 2015 13:33:28 -0400 (EDT)
Subject: [Buildroot] how to point at a local archive of S/W tarballs?
In-Reply-To: <08725FB3-EB32-4438-9E8C-EE6113D8D022@gmail.com>
References: <alpine.LFD.2.11.1504160820540.17663@localhost>
 <CAHXCMMKL_0tT08zgSgHhC9OVVJiTUdYe6USEasqY5PqygkPwVg@mail.gmail.com>
 <alpine.LFD.2.11.1504160836530.19987@localhost>
 <CAHXCMML2jMy_yF7dNyM4LKBTMhH6MMwrEi5OyJ_ep2ia2NeknQ@mail.gmail.com>
 <alpine.LFD.2.11.1504160912290.18180@localhost>
 <20150416170525.GA4405@free.fr>
 <alpine.LFD.2.11.1504161307160.1401@localhost>
 <08725FB3-EB32-4438-9E8C-EE6113D8D022@gmail.com>
Message-ID: <alpine.LFD.2.11.1504161331240.2952@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Apr 2015, Thomas De Schampheleire wrote:

> On April 16, 2015 7:07:32 PM CEST, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >On Thu, 16 Apr 2015, Yann E. MORIN wrote:
> >
> >> Robert, All,
> >>
> >> On 2015-04-16 09:17 -0400, Robert P. J. Day spake thusly:
> >> [--SNIP--]
> >> >   i know, i referred to that very config option in my original
> >> > posting. what i'm wondering is if that config option -- "Primary
> >> > download site" -- can be set to point at a local directory on my
> >build
> >> > host that's already loaded with S/W tarballs i've built up over the
> >> > months for use with my OE and yocto builds.
> >> >
> >> >   the help for that option says only that, "Valid URIs are URIs
> >> > recognized by $(WGET) and scp URIs of the form
> >> > scp://[user@]host:path." last time i looked, wget doesn't support
> >the
> >> > "file://" form of URI, so i can't use that.
> >> >
> >> >   is there a standard way to do this?
> >>
> >> Short answer: no.
> >>
> >> Long answer:
> >>
> >> BR2_DL_DIR is used both as a way to look for existing download, and
> >as
> >> the location where new downloads will be stored.
> >>
> >> So, if you set (in the menuconfig or on the command line)
> >> BR2_DL_DIR=/path/to/your/local/cache it will be looked into for
> >existing
> >> archives, and Buildroot will also store the ones it downlaods on its
> >on
> >> there.
> >>
> >> If you really, really wish no to shared the download location, you
> >could
> >> get to run a simple webserver locally that you would use as a
> >primary.
> >> But then Buildroot would also store the archives it downloads from
> >the
> >> primary in its own dl/ dir (hence duplication in that case).
> >
> >  ok, that answers the question, thanks very much.
>
> Using BR2_PRIMARY_SITE with scp to localhost is normally more easy than
> setting up a web server, assuming an ssh server is already running.
>
> That said, adding support for file:// in BR2_PRIMARY_SITE is trivial to add. In
> fact, I used to have such a patch in a much older buildroot version.

  i think that would be useful as i'm in the situation of wanting to
have a massive archive of S/W tarballs available for students in
various embedded linux classes that they can take advantage of for
their builds, but i (unsurprisingly) want that to be a read-only
directory so they can't make a mess of it or arbitrarily add anything
to it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
