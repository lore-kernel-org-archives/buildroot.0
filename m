From: Mario Lang <mlang@blind.guru>
Date: Mon, 11 Dec 2017 23:40:16 +0100
Subject: [Buildroot] qemu-user and binfmt support?
Message-ID: <87wp1sc2i7.fsf@home.blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

This is likely nothing new to most of you, but I just stumbled across
binfmt and qemu-user.  Story short, I managed to cross-build
Emacs, which runs several compiled binaries during build time.  I now wonder
how to commit this success... Fiddling with /etc/qemu-binfmt/$ARCH does
work, but it isn't really a good solution.  I know I could patch the
build system to automatically call qemu-user, but... Is there perhaps
some other way to temporarily override the binfmt interpreter for the
target arch magic, such that I can pass -L $(TARGET_DIR) ?  Perhaps some
env var I am missing?  I am using the host (Debian) installation of
qemu-user.  Does the host-qemu package have something I missed?

Thanks

-- 
CYa,
  ?????
