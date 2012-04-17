From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 17 Apr 2012 10:35:10 +0200
Subject: [Buildroot] util-linux builds and installs lots of unwanted
 binaries
In-Reply-To: <51a409d383cc64319b438fc9b37c8807@zacarias.com.ar>
References: <1334589472.13607.15.camel@sven>
 <51a409d383cc64319b438fc9b37c8807@zacarias.com.ar>
Message-ID: <1334651710.2527.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2012-04-16 at 13:00 -0300, Gustavo Zacarias wrote:

> > recently udev started to depend on util-linux for libblkid. Since 
> > then
> > there are lots of binaries built and installs that did not asked for.
> > Here's an incomplete list of such binaries:
> >
> > blockdev, fdformat, fsck.minix, isosize, mkfs, mkfs.bfs, mkfs.minix,
> > mkswap, swaplabel, sfdisk, getopt, getopt-parse.bash, 
> > getopt-parse.tcsh,
> > cal logger look mcookie namei whereis
> >
> > Now I am wondering about the best way to change this so that only the
> > libraries are built and installed unless util-linux is configured
> > otherwise. I am looking for a solution that can be accepted in 
> > buildbot.
> > And if changes to util-linux are needed, then those should have a 
> > chance
> > to be accepted upstream in util-linux. What would you advice?
> >
> >
> > Regards,
> > Sven
> 
> http://lists.busybox.net/pipermail/buildroot/2011-October/046854.html

Thanks. This works for us. But I would like to see such a change to go
into buildroot and I understand why this patch has not been accepted in
this form. The general idea of overriding the install command is nice,
however the newly introduced option BR2_PACKAGE_UTIL_LINUX_BASIC is
somewhat misleading. It gives the impression that it would select the
basic utilities and instead no utility will be installed unless it is
selected. It should probably be renamed and other options like
BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS would have to depend on it or select
it.

Nevertheless, thanks a lot for your help with this patch.


Regards,
Sven
