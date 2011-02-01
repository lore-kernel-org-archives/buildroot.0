From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 1 Feb 2011 01:59:47 -0500
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
 Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
	<AANLkTi=F8BRtskBBKE_Wno=Vy=EHvLjE3bkYagiAuegH@mail.gmail.com>
	<AANLkTikMtTC3zOWCOQDLGWpv3h=-rUiQwVa4fAN07rBM@mail.gmail.com>
Message-ID: <AANLkTik6Pq6j33vqKyZ-fkuGat8KwwEDAxuW08y0cDit@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 31, 2011 at 23:43, Sonic Zhang wrote:

please dont top post

> Some autotools based software packages generate prefix name to the
> binary after running install if you set --target parameter.
>
> For example:
>
> --target=arm
>
> rcp is rename to "linux-arm-rcp" after running install

this is due to program_transform_name which is easily disabled:
    program_transform_name=

alternatively, inetutils should be fixed to not have a --target in the
first place.  a "target" makes no sense for applications that dont
generate anything, and since inetutils falls into that category, it
should have AC_CANONICAL_SYSTEM changed to AC_CANONICAL_HOST in its
configure.ac.
-mike
