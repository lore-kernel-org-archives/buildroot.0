From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 13:03:46 +0200
Subject: [Buildroot] [PATCH] python: fix host-python symlink
 installation when no python is selected
In-Reply-To: <CAHXCMMKFCkPzYD=SgeYPUFS+p+RDVR-5mexT9r5CqoMuWUXC=Q@mail.gmail.com>
References: <1396769715-28635-1-git-send-email-s.martin49@gmail.com>
 <20140406083000.GD4096@tarshish>
 <CAHXCMMKFCkPzYD=SgeYPUFS+p+RDVR-5mexT9r5CqoMuWUXC=Q@mail.gmail.com>
Message-ID: <20140406130346.302f0b11@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 6 Apr 2014 12:48:04 +0200, Samuel Martin wrote:

> So, there is no python symlink yet installed in the host dir.; that's
> why the configure script fallback on the system python installation.
> 
> I see 2 possible way to fix this:
> 1) add the following line to libevdev.mk:
> LIBEVDEV_CONF_ENV += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
> 
> 2) or, if python3 is correctly supported by libevdev, then change the
> host-python dependency to:
> LIBEVDEV_DEPENDENCIES += $(if $(BR2_PACKAGE_PYHTON3),host-python3,host-python)

Can you check if Python 3 is OK for libevdev? If it's the case, then we
could implement solution (2) that you're proposing here.

Thanks for the investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
