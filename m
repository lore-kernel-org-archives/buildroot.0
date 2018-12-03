From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Dec 2018 09:11:24 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: bump to version 2.58.1
In-Reply-To: <CAPi7W802dzjZhNuw-07vtBvuoFRGnhc+qhZf=ZhH3Ra11GrHuw@mail.gmail.com>
References: <20181014075852.2976-1-fontaine.fabrice@gmail.com>
 <20181202140053.6ed28a05@windsurf.home>
 <20181202172323.GB2649@scaer>
 <CAPi7W802dzjZhNuw-07vtBvuoFRGnhc+qhZf=ZhH3Ra11GrHuw@mail.gmail.com>
Message-ID: <20181203081124.GD2649@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-12-03 08:23 +0100, Fabrice Fontaine spake thusly:
> Le dim. 2 d?c. 2018 ? 18:23, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2018-12-02 14:00 +0100, Thomas Petazzoni spake thusly:
> > > On Sun, 14 Oct 2018 09:58:52 +0200, Fabrice Fontaine wrote:
> > As you can see on the autobuilders, thius breaks all glib-using packages:
[--SNIP--]
> > So, the solutions I have for now are:
> >
> >  1- fix each package and pass them GLIB_GENMARSHAL=$(STAGING_DIR)/bin/glib-genmarshal
> >     (similarly for the two other tools)
> >
> >  2- teach pkgconf to replace even more variables. This is not very
> >     satisfying, and we won't be able to keep up in the long term. We
> >     hould at least teach pkgconf to look for that list in an environment
> >     variable, at least, to avoid tweaking the code over-and-over again.
[--SNIP--]
> Thanks a lot for investigating, I'm more in favor of (2) because most
> of the glib packages don't have any environment variables.
> However, it should be noted that a lot of glib packages (libsoup,
> gdk-pixpuf, atk, pango) have switched to meson in their latest
> upstream versions.
> Meson has a gnome module to find and call genmarshal, mkenums, etc ...
> and this module does not use the pkgconfig file to find the path of
> these binaries.

Well, dbus-glib is in maintenance-mode only, so it's not going to be
updated to meson I am afraid (or should I say, relieved?). So we still
have some fixing to do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
