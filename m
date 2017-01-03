From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Tue,  3 Jan 2017 19:29:30 -0200
Subject: [Buildroot] [PATCH 0/2] efl: allow smaller builds.
Message-ID: <20170103212932.9254-1-barbieri@profusion.mobi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These two patches will allow smaller builds of EFL.

 1) efl: fix target package dependency on util-linux

    Drops util-linux if libmount support is not needed, it was
    partially a bug on using the incorrect variable.


 2) efl: do not force dependency on libudev by making eeze...

    Follow the other 'recommends' options and allow eeze (udev's
    wrapper) to not be built, this allows EFL to be used without /dev
    management, thus no eudev/libudev.
