From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Feb 2017 21:52:42 +0100
Subject: [Buildroot] [PATCH v1] libv4l/ir-ctl: fix musl compile
In-Reply-To: <20170214224346.152cb954@free-electrons.com>
References: <20170214203450.7449-1-ps.report@gmx.net>
 <20170214224346.152cb954@free-electrons.com>
Message-ID: <20170220215242.33f75058@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 14 Feb 2017 22:43:46 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 14 Feb 2017 21:34:50 +0100, Peter Seiderer wrote:
> > - add copy of TEMP_FAILURE_RETRY macro
> > - use strdup instead of strdupa
> > 
> > Fixes [1]:
> > 
> >   ir-ctl.c:(.text+0xb06): undefined reference to `strndupa'
> >   ir-ctl.c:(.text+0xe01): undefined reference to `TEMP_FAILURE_RETRY'
> > 
> > [1] http://autobuild.buildroot.net/results/b8b96c7bbf2147dacac62485cbfdbcfd758271a5
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  .../0002-ir-ctl-fixes-for-musl-compile.patch       | 59 ++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 package/libv4l/0002-ir-ctl-fixes-for-musl-compile.patch
> 
> Applied to master, thanks. Please submit the patch upstream. Thanks!

O.k., submitted upstream (see [1], [2])...

Regards,
Peter

[1] http://www.mail-archive.com/linux-media at vger.kernel.org/msg108551.html
[2] http://www.mail-archive.com/linux-media at vger.kernel.org/msg108552.html

> 
> Thomas
