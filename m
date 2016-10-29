From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 10:33:43 +0200
Subject: [Buildroot] [PATCH 0/2] fs: fix fakeroot issue with SElinux
 contexts
In-Reply-To: <cover.1477729581.git.yann.morin.1998@free.fr>
References: <cover.1477729581.git.yann.morin.1998@free.fr>
Message-ID: <20161029103343.7e4647b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 10:26:38 +0200, Yann E. MORIN wrote:

> This series is an attempt at fixing fakeroot, which has issues with
> SElinux contexts (in extended attributes), as reported as one of our
> bug report, but also reported in Fedora Core and Debian:
>     https://bugzilla.redhat.com/show_bug.cgi?id=1238802
>     https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=799858
> 
> Since there has been absolutely no activity on the upstream (== Debian)
> report since it was filled more than a year ago, follow the path
> suggested in the FC report, and switch to using pseudo as a replacement
> for fakeroot.
> 
> This can probably go in right now. If there are issues, we can still
> revert this before the end of the stabilisation month.

There are lots of other references to fakeroot all over the place, both
in fs/common.mk, but also the relatively new option we have to call a
script within the fakeroot context.

Do we keep them as-is, or do we rename everything to "pseudo" ? I find
the name "pseudo" very confusing, while "fakeroot" is a lot clearer, so
perhaps it is OK to keep everything named fakeroot even though in
practice we're using pseudo.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
