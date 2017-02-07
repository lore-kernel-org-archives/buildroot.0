From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 8 Feb 2017 10:14:01 +1100
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix autobuild failure
In-Reply-To: <CAHXCMM+WNSDxudxn5NtFFB_xr5cQYOKuwAaOt8wPn9Qn77AMUw@mail.gmail.com>
References: <dafa5878ec5dd9e55107657faf46560fb7aeb9d3.1486440154.git.sam.bobroff@au1.ibm.com>
 <a4955e4a-4a46-1ae4-6db4-98302ebaf54b@lucaceresoli.net>
 <CAHXCMM+WNSDxudxn5NtFFB_xr5cQYOKuwAaOt8wPn9Qn77AMUw@mail.gmail.com>
Message-ID: <20170207231401.GB10569@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 07, 2017 at 11:59:36AM +0100, Samuel Martin wrote:
> On Tue, Feb 7, 2017 at 11:15 AM, Luca Ceresoli <lucaceresoli77@gmail.com> wrote:
> > Hi Sam,
> >
> > On 07/02/2017 05:02, Sam Bobroff wrote:
> >> See the included package patch for a description of the issue, which
> >> causes the doc target to be rebuilt, which fails and breaks the build.
> >> Fix it by removing the doc subdirectory from the build.
> >>
> >> Fixes
> >> http://autobuild.buildroot.net/results/53ed571327c814a23fcf03c7ad5bcd551b6732a6
> >>
> >> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> >> ---
> >>
> >>  package/openocd/0003-disable-docs.patch | 37 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 37 insertions(+)
> >>  create mode 100644 package/openocd/0003-disable-docs.patch
> >>
> >> diff --git a/package/openocd/0003-disable-docs.patch b/package/openocd/0003-disable-docs.patch
> >> new file mode 100644
> >> index 000000000..36fb152ee
> >> --- /dev/null
> >> +++ b/package/openocd/0003-disable-docs.patch
> >> @@ -0,0 +1,37 @@
> >> +doc: do not build
> >> +
> >> +Due to the way the version file is handled by a special script that encodes the
> >> +file modification time as a human readable *local* time value, a clean build
> >> +will sometimes, depending on the local time zone, attempt to re-build the
> >> +documentation, which may fail.
> >> +
> >> +We don't want the documentation so fix this by disabling it.
> >
> > Can't we instead add a --disable-docs flag to openocd and upstream it?
> > The patch you proposed is not for upstream, so we'd have to carry it in
> > Buildroot potentially forever.
> 
> I think some people will appreciate this ;)
> This patch [1] is in the github mirror, but never got in gerrit for
> proper submission (shame on me!).

Great, that's a better long term solution :-)

So for now I suppose we should just take that better patch into
buildroot until it goes upstream (that's generally buildroot policy,
right?).

If it's easy for you to do, would you like to post it here then? If not
I'm happy to package it up as a v2 of my patch.

Sam.

> > --
> > Luca
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> [1] https://github.com/ntfreak/openocd/pull/4/commits/2c0cc66d5388e07679ac9f07c1ce0f8469931f02
> 
> Regards,
> 
> -- 
> Samuel
