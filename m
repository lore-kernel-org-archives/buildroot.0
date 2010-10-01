From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 1 Oct 2010 11:33:12 -0500
Subject: [Buildroot] libpng install question
In-Reply-To: <AANLkTi=2p=Zesb=ruU5MVfQdJGy7nSG=OL1FPXMFEtd3@mail.gmail.com>
References: <0D753D10438DA54287A00B0270842697644545753B@AUSP01VMBX24.collaborationhost.net>
	<AANLkTi=2p=Zesb=ruU5MVfQdJGy7nSG=OL1FPXMFEtd3@mail.gmail.com>
Message-ID: <0D753D10438DA54287A00B02708426976445457B84@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, October 01, 2010 1:14 AM, Lionel Landwerlin wrote:
>
> libpng12-config and libpng-config are part of the libpng package, so
> it is normal they are being installed on the target. However they
> shouldn't be installed unless you've selected to installed development
> files in the buildroot config.
> This might be a small regression introduced by this commit :
> http://git.buildroot.org/buildroot/commit/?id=55ade5c7964e15f9b1eba061ab840cc4c25e4e37
> Are you using a recent version of the buildroot's git repository ?

I don't think that commit is the problem.  It just changes the install step
from "make install-strip" to "make install".  But, I could be wrong...

Yesterday, after I noticed the files on my rootfs, I did a pull of the latest
buildroot git repository so I should be current.

I also just checked my .config and BR2_HAVE_DEVFILES is not selected.

It looks like something in the configure step for libpng is causing the
-config files to be built and installed on the target.  Also, is the old
library (libpng12) needed?  It appears that it can optionally be excluded
also.

Regards,
Hartley
