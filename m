From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 15:48:50 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <20191016111927.14208-3-nolange79@gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
 <20191016111927.14208-3-nolange79@gmail.com>
Message-ID: <20191016154850.0d093c4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert

On Wed, 16 Oct 2019 13:19:25 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Automatically check for an available meson tool,
> and use it as long as the version is fitting.
> 
> Using a system provided meson is not an official supported
> option, hence this is currently disabled.
> use of the system provided meson can be enforced with:
> 
>    make ... BR2_MESON_VERSION_MIN=0
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Thanks for this, however I don't think we will ever merge this until a
system-provided meson can effectively be used.

What about working on merging
0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch to upstream
Meson, in this form or another form ? This would definitely pave the
way to using the system-provided Meson.

Another (more useful ?) thing to look at: is it possible to use the
system-provided Python for Meson and Ninja, when python3 is provided by
the system ? I think Meson and Ninja by themselves are not long at all
to build, and it would be a much more useful direction for this patch
series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
