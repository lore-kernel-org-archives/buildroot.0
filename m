From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Sun, 30 Mar 2014 19:58:29 -0300
Subject: [Buildroot] [PATCH 1/1] mysql: fix build failure on MIPS
In-Reply-To: <20140331001907.58b9e8c1@skate>
References: <1396216131-3222-1-git-send-email-kuyurix@gmail.com>
 <20140331001907.58b9e8c1@skate>
Message-ID: <CA+kK6WvRO57oWubKV7biB2kupO+G-FQ=kVB67ikSefHjdAyMbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


> In any case, why do you believe the problem is specific to the MIPS
> architecture?
>

You sent me a link that there was a build issue on MIPS. The patch's title
is a reference to that issue.


> See for example
>
> http://autobuild.buildroot.org/results/7b0/7b06ce77b72db980493260602a5104e2c39e1bf5/build-end.log
> .
> It's the exact same problem, but on x86-64.
>

I didn't know it affected on x86-64, anyway the patch submitted will fix it
too.

Wouldn't it be simpler to just not build mysql with -Werror ?


If you build mysql without -Werror, that "error" message will be a
"warning", and my patch is a fix to mysql source code.

When compiling with certain GCC version, the issue shows up



2014-03-30 19:19 GMT-03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Marcelo Guti?rrez,
>
> On Sun, 30 Mar 2014 18:48:51 -0300, Marcelo Guti?rrez wrote:
> > Fixes:
> >
> http://autobuild.buildroot.net/results/6b61f90d1a36ba43ff568933bb74975128380516/
> >
> > Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
> > ---
> >  .../mysql-0006-fix_build_failure_on_MIPS.patch     |  115
> ++++++++++++++++++++
> >  1 file changed, 115 insertions(+)
> >  create mode 100644
> package/mysql/mysql-0006-fix_build_failure_on_MIPS.patch
>
> Wouldn't it be simpler to just not build mysql with -Werror ?
> Unfortunately, I don't really see a simple way of doing that without
> modifying mysql's configure.in.
>
> In any case, why do you believe the problem is specific to the MIPS
> architecture?
>
> See for example
>
> http://autobuild.buildroot.org/results/7b0/7b06ce77b72db980493260602a5104e2c39e1bf5/build-end.log
> .
> It's the exact same problem, but on x86-64.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140330/6daf58b7/attachment.html>
