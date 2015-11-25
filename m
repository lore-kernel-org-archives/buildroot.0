From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 24 Nov 2015 22:09:44 -0200
Subject: [Buildroot] [PATCH v2] libgdiplus: new package
In-Reply-To: <20151124182309.5bd10f9a@free-electrons.com>
References: <1448361491-14651-1-git-send-email-sergio.prado@e-labworks.com>
 <20151124182309.5bd10f9a@free-electrons.com>
Message-ID: <CANu7NGuwTUEG780u9N_Er6O+vUasr7XZ68U6NsbyKZofNhrYMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2015-11-24 15:23 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Sergio Prado,
>
> This package looks almost ready to go, there are just two remaining
> things I believe. See below.
>
> On Tue, 24 Nov 2015 08:38:11 -0200, Sergio Prado wrote:
>
> > diff --git a/package/libgdiplus/libgdiplus.hash
> b/package/libgdiplus/libgdiplus.hash
> > new file mode 100644
> > index 000000000000..8642d5cbf66a
> > --- /dev/null
> > +++ b/package/libgdiplus/libgdiplus.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed:
> > +md5    6e9a80ba921e4842acd5a12b14c78dc9
>  libgdiplus-3.12.tar.gz
> > +sha256 7eadc5105c6352d456c5f8699dc89260bf402e82ce6668e7e0c625519f9e5b44
> libgdiplus-3.12.tar.gz
>
> Only the sha256 is useful here. It's a strong hash, there's no need to
> add another weak hash such as md5.
>
OK.


>
> > +LIBGDIPLUS_VERSION = 3.12
> > +LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
> > +LIBGDIPLUS_LICENSE = MIT
> > +LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
>
> This is the part that I didn't like. I looked at LICENSE, and got
> confused. Then I saw the discussion you had with Arnout about all the
> licensing mess in this package.
>
> So what I'd like to see here is:
>
>  1/ A comment above those two lines that explain the situation (that
>  the LICENSE file is incorrect, that the real license is indeed MIT,
>  etc.)
>
OK.


>
>  2/ A bug report being made to the upstream project to ask them to fix
>  this mess.
>
Done: https://bugzilla.xamarin.com/show_bug.cgi?id=36227


> > +# there is a bug in the configure script that enables pango support when
> > +# passing --without-pango, so let's just not use it
> > +ifeq ($(BR2_PACKAGE_PANGO),y)
> > +LIBGDIPLUS_CONF_OPTS += --with-pango
> > +LIBGDIPLUS_DEPENDENCIES += pango
> > +endif
>
> You could also report this bug upstream. Since upstream uses github,
> it's pretty trivial to report bugs, so I think we should do it when we
> discover problems.
>
You are right. Done: https://bugzilla.xamarin.com/show_bug.cgi?id=36228

>
> Can you respin a new version of the patch that fixes the hash thing and
> adds more details about the license?
>
V3 is on the way.


> Thanks a lot!
>
Thanks!


>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151124/0cfdbb65/attachment.html>
