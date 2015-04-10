From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 14:12:17 +0200
Subject: [Buildroot] [RFC] Move host-pkgconf dependency to
 package/pkg-autotools.mk
In-Reply-To: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <XnsA4787599FCF1BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150410141217.4bd2547c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 10 Apr 2015 11:33:39 +0200, Bernd Kuhls wrote:
> Hi,
> 
> is there a reason an autotools-package should not depend on host-pkgconf?
> 
> The phrase "host-pkgconf" appears in > 300 packages
> 
> $ for i in `find -iname *.mk | grep -v pkgconf`; do grep host-pkgconf $i; 
> done | wc -l
> 313
> 
> If 
> 
> $(2)_DEPENDENCIES += host-pkgconf
> 
> is added to package/pkg-autotools.mk we could get rid of all those 
> dependencies in the packages and avoid nasty build errors in the future.

I think it has been discussed in the past, even though I don't remember
the conclusion. On my side, since I don't like useless dependencies,
but I recognize that we often forget to add host-pkgconf in the
dependencies of a number of autotools packages, I made a proposal last
year: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/82327.

It checks before building if the package uses PKG_CHECK_MODULES(), and
verifies that the package properly depends on host-pkgconf in this case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
