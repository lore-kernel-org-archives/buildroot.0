From: Martin Banky <Martin.Banky@gmail.com>
Date: Sun, 10 Oct 2010 14:34:38 -0700
Subject: [Buildroot] Changing install location of a package
In-Reply-To: <0D753D10438DA54287A00B02708426976450782937@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B02708426976450782937@AUSP01VMBX24.collaborationhost.net>
Message-ID: <AANLkTi=ZZM0xD0-Hwh_HwkAMZ3D+Bwfhz_cp1i-1ACCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hartley,
     Yes, you would need to setup the .mk file to install the package into a
different location. It will depend on the package type. If it's an autotools
package, then you will have to do one of two things. The choice would be
based on whether the existing options are acceptable, but just need to be
added to, then add/change (PKG)_CONF_OPT, or the existing options are not
acceptable, then redefine (PKG)_CONFIGURE_CMDS. If it's a gentargets
package, then the only choice you have is to change (PKG)_CONFIGURE_CMDS. If
it's a manual makefile package, then you will have to add/change the
configuration step, if it has one, and/or the installation step, if
necessary. I would suggest that you read buildroot/docs/buildroot.html. It
has a lot of good information about creating and changing packages.

Martin

On Fri, Oct 8, 2010 at 2:59 PM, H Hartley Sweeten <
hartleys@visionengravers.com> wrote:

> Hello all,
>
> Is there a way to setup a .mk file for a package to configure and install
> the package
> into a place other than /bin, /sbin, /usr/bin or /usr/sbin?  Or is this
> actually handled
> internally by the .configure of the package?
>
> Thanks,
> Hartley
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101010/f6215b45/attachment.html>
