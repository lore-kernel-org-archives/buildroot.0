From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 11 Oct 2017 22:14:34 +0200
Subject: [Buildroot] [PATCH v2] evemu: fix PATH_MAX related compile
 failure
In-Reply-To: <20171011220646.21c208a5@windsurf.lan>
References: <20171011091452.11162-1-ps.report@gmx.net>
 <20171011220646.21c208a5@windsurf.lan>
Message-ID: <20171011221434.6d8e41b2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 11 Oct 2017 22:06:46 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Wed, 11 Oct 2017 11:14:52 +0200, Peter Seiderer wrote:
> > Fixes [1] when building with musl:
> > 
> >   find_event_devices.c: In function 'find_event_devices':
> > find_event_devices.c:60:14: error: 'PATH_MAX' undeclared (first use in this function)
> >    char fname[PATH_MAX];
> >               ^~~~~~~~
> > 
> > [1] http://autobuild.buildroot.net/results/607/607bb29231f80a138e1b5423bc01c89e36efe78c/
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - use limits.h instead of linux/limits.h, change patch commit message,
> >     add musl reference (suggested by Arnout Vandecappelle)
> > ---
> >  .../evemu/0001-Include-limits.h-for-PATH_MAX.patch | 35 ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 package/evemu/0001-Include-limits.h-for-PATH_MAX.patch  
> 
> Applied to master, thanks. Please don't forget to submit the patch
> upstream if not already done. Thanks!

Upstream submit done already, see [1]...

Regards,
Peter

[1] https://lists.freedesktop.org/archives/input-tools/2017-October/001434.html

> 
> Thomas
