From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Oct 2014 10:50:26 -0300
Subject: [Buildroot] [PATCH 1/2] automake: update gtk-doc.m4 to serial 2
In-Reply-To: <20141010152856.19129c7c@free-electrons.com>
References: <1412936897-8478-1-git-send-email-gustavo@zacarias.com.ar>	<20141010124101.0388b2b3@free-electrons.com>	<5437B8B3.7070105@zacarias.com.ar>	<20141010130114.71fd0a73@free-electrons.com>	<5437BF0F.8040009@zacarias.com.ar>
 <20141010152856.19129c7c@free-electrons.com>
Message-ID: <5437E422.5030502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/10/2014 10:28 AM, Thomas Petazzoni wrote:

> Come on Gustavo, no need to start being aggressive here.

Huh? It's not intended to be aggressive.

> Yes, that's exactly what I suggest. And actually, we already need to
> add host-pkgconf in DEPENDENCIES when doing autoreconf, if the
> configure.ac uses PKG_CHECK_MODULES, which is far more common than
> packages using gtk-doc.m4 specifically.
> 
> PKG_CHECK_MODULES in configure.ac requiring host-pkgconf in the
> DEPENDENCIES is precisely the reason why I proposed
> http://patchwork.ozlabs.org/patch/340902/ some time ago. Nothing
> prevents from adding a similar check to see if the package uses
> the gtk-doc.m4 macros or not. That would at least warn loudly if such
> macros are used without the package having host-pkgconf in its
> dependencies.

Well, at least from my POV it's making some packages need host-pkgconf
just because they use gtk-doc.m4, we're bumping the version and they're
AUTORECONFed. If they weren't AUTORECONFed they maybe didn't need
host-pkgconf (maybe for other purposes, but not because of the old
gtk-doc.m4) so it seems to me it's autotools/autoreconfs fault, and it
should be handled there.
It has nothing to do with packages that don't account for host-pkgconf
usage without accounting for it in the first place.
Regards.
