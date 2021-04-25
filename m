From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Apr 2021 21:52:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.6
In-Reply-To: <CADvTj4oiaTvOJOF9HVmmfPieG_+LAQ3z2R_K+vtP_wiPtAjwEQ@mail.gmail.com>
References: <20200706010444.537633-1-james.hilliard1@gmail.com>
 <20200827234830.534955b4@windsurf.home>
 <CADvTj4oiaTvOJOF9HVmmfPieG_+LAQ3z2R_K+vtP_wiPtAjwEQ@mail.gmail.com>
Message-ID: <20210425195257.GC298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

Sorry to come back so late on that one...

On 2020-10-15 23:50 -0600, James Hilliard spake thusly:
> On Thu, Aug 27, 2020 at 3:48 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Sun,  5 Jul 2020 19:04:44 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> > > Add pipewire optional dependencies/configurations.
> > >
> > > Remove BR2_PACKAGE_PIPEWIRE_GSTREAMER config option and enable
> > > automatically based on dependencies to avoid recursive dependency
> > > error caused by the gobject-introspection python3 dependency.
> > Could you give more details about this recursive dependency ?
[--SNIP--]
> > > diff --git a/Config.in.legacy b/Config.in.legacy
> > > index 7a5435188b..4541acc979 100644
> > > --- a/Config.in.legacy
> > > +++ b/Config.in.legacy
> > > @@ -146,6 +146,16 @@ endif
> > >
> > >  comment "Legacy options removed in 2020.08"
> > >
> > > +config BR2_PACKAGE_PIPEWIRE_GSTREAMER
> > > +     bool "pipewire gstreamer option removed"
> > > +     select BR2_LEGACY
> > > +     select BR2_PACKAGE_GOBJECT_INTROSPECTION
> > > +     select BR2_PACKAGE_GSTREAMER1
> > > +     select BR2_PACKAGE_GST1_PLUGINS_BASE
> >
> > But isn't that going to cause that circular dependency you're trying to
> > prevent, since you're selecting BR2_PACKAGE_GOBJECT_INTROSPECTION here ?
> Looks to be related to a conflict involving these:
> https://github.com/buildroot/buildroot/blob/master/package/python-gobject/Config.in
> https://github.com/buildroot/buildroot/blob/master/package/gstreamer1/gst1-python/Config.in

Sorry, but this answer is too terse to try and understand the issue... :-(
In the meantime, pipewire has had new releases.

To ease acceptance, could you split the patch in a small series:

 1. a first patch that drops the option and relies on pacjages being
    enabled

 2. a bump still keeping v4l2 mandatory, and disabling all new features
    that have dependencies

 3. a new option for enabling v4l2 support

 4. as many patches as needed to add new options for new optional
    features that have dependencies

This should make for simpler patches, easier to review.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
