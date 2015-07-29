From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 29 Jul 2015 13:01:30 +0000
Subject: [Buildroot] [PATCH v2] toolchain-external: fix gdbserver
 copying for external arc-2014.12 tools
In-Reply-To: <20150711104535.3b2c1bfd@free-electrons.com>
References: <1427271071-9541-1-git-send-email-abrodkin@synopsys.com>
 <55A0CA2A.1010308@openwide.fr> <20150711104535.3b2c1bfd@free-electrons.com>
Message-ID: <1438174889.16101.0.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain,

On Sat, 2015-07-11 at 10:45 +0200, Thomas Petazzoni wrote:
> Dear Romain Naour,
> 
> On Sat, 11 Jul 2015 09:47:54 +0200, Romain Naour wrote:
> 
> > Le 25/03/2015 09:11, Alexey Brodkin a ?crit :
> > > Historically in pre-built ARC GNU tools gdbserver is located in
> > > top-level "target-bin" folder.
> > > 
> > > Because of that fact if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is
> > > selected Buildroot won't find gdbserver (it looks within
> > > SYSROOT/ARCH_SYSROOT folder).
> > > 
> > > Simplest solution is to use TOOLCHAIN_EXTERNAL_FIXUP_CMDS where copy
> > > gdbserver from "target-bin" folder into SYSROOT/usr/bin.
> > 
> > Since this patch, the arc 2014.12 prebuild toolchain as been marked as broken
> > [1]. This patch is still needed ?
> 
> I'd say no for the moment, I'll mark the patch as Rejected for now.

Indeed this patch is no longer required because in arc-2015.06 toolchain
we put gdbserver in proper place  "sysroot/usr/bin".

-Alexey
