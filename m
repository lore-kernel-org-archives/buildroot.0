From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:05:16 +0200
Subject: [Buildroot] [RFC v3 2/4] meson: change from global to per
 package cross-compilation.conf
In-Reply-To: <20180819214917.67c960a3@gmx.net>
References: <20180719204355.10465-1-ps.report@gmx.net>
 <20180719204355.10465-2-ps.report@gmx.net>
 <20180816135745.71ed73f2@windsurf>
 <20180819011512.11fad995@gmx.net>
 <20180819152206.7b15fce9@windsurf>
 <20180819191511.3c38bb60@gmx.net> <20180819214917.67c960a3@gmx.net>
Message-ID: <20180819230516.6f839351@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 21:49:17 +0200, Peter Seiderer wrote:

> Seems to be intentional, see mesonbuild/backend/backends.py#L542 ([1]):
> 
>         if not target.is_cross:
>             # Compile args added from the env: CFLAGS/CXXFLAGS, etc. We want these
>             # to override all the defaults, but not the per-target compile args.
> commands += self.environment.coredata.get_external_args(compiler.get_language())
> 
> With the 'if not target.is_cross' added with this commit [2] fixing [3] which
> suggests adding CROSS_*FLAGS...
> 
> Regards,
> Peter
> 
> [1] https://github.com/mesonbuild/meson/blob/master/mesonbuild/backend/backends.py#L542
> [2] https://github.com/mesonbuild/meson/commit/b595cda4ed0ca699da3052a6bd30ba7d1dae1124
> [3] https://github.com/mesonbuild/meson/issues/1772

Meh. This is plain silly, and completely inconsistent with what all
other build systems do. The idea that CFLAGS should not be taken into
account when cross-compiling is really stupid, as is "Cross build
settings should come from the cross file and nowhere else".

But well, OK, let's go with your solution then. I would still like a
proper .conf file to be generated and move in usr/share/buildroot/,
like the CMake file.

Could you also complain in that bug report, to explain that really
CFLAGS should be supported ?

Thanks for the additional research!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
