From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 14 Dec 2016 15:48:09 +0100
Subject: [Buildroot] [PATCH 1/3] package/gdb: add support for gdb 7.12
In-Reply-To: <20161214152028.4b2caf8f@free-electrons.com>
References: <20161214134058.29826-1-joerg.krause@embedded.rocks>
 <20161214152028.4b2caf8f@free-electrons.com>
Message-ID: <1481726889.3994.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2016-12-14 at 15:20 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 14 Dec 2016 14:40:56 +0100, J?rg Krause wrote:
> > gdb 7.12 was released on October 2016, it's time to include it in
> > Buildroot, which this commit does.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> We have one patch on gdb 7.11.1. Is it still needed? I know I
> reported
> the problem to Mike Frysinger, so he might have fixed it upstream,
> but
> I haven't followed. It's worth double checing.

The issue address by the patch 'Revert "sim: unify SIM_CPU definition"'
should be fixed by this commit [1].

I double checked by building gdb 7.12?without the mentioned patch for
the target bf512 with this [2] Buildroot toolchain configuration
successfully.

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdi
ff;h=474a2d9f5f8a080e30812525729c3a8b7baa61d6
[2] http://autobuild.buildroot.org/toolchains/configs/br-bfin-full.conf
ig

J?rg
