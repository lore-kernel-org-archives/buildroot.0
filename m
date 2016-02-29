From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:35:20 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
 GNU_TARGET_NAME-pkg-config
In-Reply-To: <u7ieqcx9kv.ln2@ID-313208.user.individual.net>
References: <1456770170-6326-1-git-send-email-jer@airfi.aero>
 <u7ieqcx9kv.ln2@ID-313208.user.individual.net>
Message-ID: <20160229213520.2b6e6ee7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Feb 2016 20:19:58 +0100, Bernd Kuhls wrote:

> >  By setting a symlink to the expected target we might even solve some
> >  real problems.
> 
> two years ago I proposed a similar patch, which was rejected:
> http://patchwork.ozlabs.org/patch/312273/

If we were to do this, then I would prefer to completely remove
$(HOST_DIR)/usr/bin/pkg-config, and only have
$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-pkg-config.

What I dislike with the current setup is that if you add
$(HOST_DIR)/usr/bin to your PATH, then any call to pkg-config returns
values that are valid only when cross-compiling, which is not
necessarily what one would expect.

However, doing this change means that any configure script or Makefile
that calls pkg-config directly would no longer find our pkg-config.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
