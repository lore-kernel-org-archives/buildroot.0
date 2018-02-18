From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Feb 2018 15:30:12 +0100
Subject: [Buildroot] [PATCH] Sets LD_LIBRARY_PATH inside
 toolchain-wrapper.
In-Reply-To: <CANepG=PL=4t10iC=GUi2F5BkEUH27XyCpMAFfk2g3hDQwESgcw@mail.gmail.com>
References: <20180216221845.13337-1-daniel.serpell@gmail.com>
 <20180216234619.3b1815a6@windsurf.lan>
 <CANepG=MckvkieMHtLfR2fsrH1yJzvjUwDiritOk-YvP5-ghE8g@mail.gmail.com>
 <CANepG=PL=4t10iC=GUi2F5BkEUH27XyCpMAFfk2g3hDQwESgcw@mail.gmail.com>
Message-ID: <20180218153012.58e0b0e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Feb 2018 21:43:36 -0300, Daniel Serpell wrote:

> I see that you are using patchelf to make RPATH relative inside host binaries,
> is there any reason to not run that always, or at least in the "make toolchain"
> target?

Because there's no real reason to do that. During the build, the
toolchain and other host tools are not moving, so keeping the absolute
RPATH is fine. It's only when you want to move the toolchain/SDK around
that the rpath needs to be adjusted to be relative RPATH.

> I'm not very good at writing documentation, perhaps the attached patch
> is enough.

Patch looks good. Could you send it with "git send-email", and change
the commit title to something like:

 docs/manual: add documentation for the "make sdk" target

Thanks!

Thoas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
