From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 21:02:16 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <87bm6svqpy.fsf@grinn-global.com>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com>
Message-ID: <20181113210216.37879bd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 18:20:57 +0100, Marcin Niestr?j wrote:

> I have investigated the issue on my side. It turns out that gzip is
> really the issue here.

Thanks for the additional investigation!

> You can find differences in package here:
> https://git.archlinux.org/svntogit/packages.git/log/trunk?h=packages/gzip
> 
> I have also checked output of gzip command on another PC with pigz
> configured as gzip drop-in replacement. It outputs even different file,
> with different sha256 hash.
> 
> I think the overall conclusion is that a host-gzip package is needed,
> just like host-tar. In the meantime I will send v3 of this patch with
> proper hash (the same as you calculated above).

This is getting really horrible.

On my side, I have updated to Fedora 29, which ships tar 1.30, that we
consider as broken, and therefore now for everything single small build
that I do, I'm paying the price of building tar, which is super
annoying. This is especially annoying as tar 1.30 is only problematic
when *creating* tarballs of git-fetched packages, which clearly does
not happen at every build.

It would be truly horrible to also have to build our own gzip. Maybe we
need to somehow revisit our requirement that we need to have
reproducible tarballs for git-fetched packages ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
