From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:00:01 +0100
Subject: [Buildroot] [PATCH 1/1] system: update lib64/32 symlink
 creation for mips64n32 and gcc >= 5.1.0
In-Reply-To: <CAAXf6LV6pD5u8cx2ycebBn+KOhM6XuSMpnb8kiioZuonvB_URA@mail.gmail.com>
References: <20191216152223.20718-1-patrickdepinguin@gmail.com>
 <20191216162628.63672ab7@windsurf.home>
 <CAAXf6LV6pD5u8cx2ycebBn+KOhM6XuSMpnb8kiioZuonvB_URA@mail.gmail.com>
Message-ID: <20191216210001.377aaf7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Dec 2019 18:34:53 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> > >     16073  
> > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o",
> > R_OK) = -1 ENOENT (No such file or directory)  
> > >     16073  
> > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/crt1.o",
> > R_OK) = -1 ENOENT (No such file or directory)  
> > >     16073  
> > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o",
> > R_OK) = -1 ENOENT (No such file or directory)  
> > >     16073  
> > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/crt1.o",
> > R_OK) = -1 ENOENT (No such file or directory)
> >
> > And then in lib64/ itself.
> >
> > Which means the lib32 symbolic link is in fact useless ?
> >  
> 
> In this case this was Octeon3 which has hardfloat and uses lib32-fp instead
> of lib32. But the problem should be analogous for Octeon2 (no hardfloat,
> with libdir lib32).

Right, but it means that this lib32/ symlink doesn't work for all
toolchains, some toolchains would need a lib32-fp/ symlink... but by
luck they also look under lib64/, even if the user-space is 32-bit.

I'm not suggesting we need to change anything to the patch itself, only
perhaps to the comments and/or commit log, just to clarify the issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
