From: Ilias Apalodimas <apalos@gmail.com>
Date: Wed, 8 Feb 2017 17:43:04 +0200
Subject: [Buildroot] [PATCHv2 1/1] Added keepalived
In-Reply-To: <877f50pwly.fsf@dell.be.48ers.dk>
References: <1486542692-26969-1-git-send-email-apalos@gmail.com>
 <877f50pwly.fsf@dell.be.48ers.dk>
Message-ID: <CADvJCocfcTVx31KuuqMrCWS4zYKH2PAOWMFwee6tELNY_0jo3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will do on first chance!

Regards
Ilias

On Wed, Feb 8, 2017 at 4:48 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Ilias" == Ilias Apalodimas <apalos@gmail.com> writes:
>
>  > Changelog:
>  >  - Added keepalived on DEVELOPERS file
>  >  - Fix package dependecies as proposed(MMU support)
>  >  - Added keepalived.hash
>
> Thanks for the update. This changelog should not be part of the git
> commit, so it should go after the --- line.
>
>  > +++ b/package/keepalived/keepalived.mk
>  > @@ -0,0 +1,13 @@
>  > +################################################################################
>  > +#
>  > +# keepalived
>  > +#
>  > +################################################################################
>  > +
>  > +KEEPALIVED_VERSION = 1.3.2
>  > +KEEPALIVED_SITE = http://www.keepalived.org/software
>  > +KEEPALIVED_DEPENDENCIES = popt openssl
>  > +KEEPALIVED_LICENSE = GPLv2+
>  > +KEEPALIVED_LICENSE_FILES = COPYING
>  > +
>  > +$(eval $(autotools-package))
>
> This looks good, but a quick look at the configure script shows that it
> uses pkg-config so you should most likely depend on host-pkgconf and
> there are a number of optional dependencies that we do have in Buildroot
> (E.G. dbus, glib, ipset, libnl, netsnmp, ..) that should either be
> enabled/disabled depending on if those packages are enabled or
> forcefully disabled to ensure reproducable builds.
>
> Can you look into that please?
>
> --
> Bye, Peter Korsgaard
