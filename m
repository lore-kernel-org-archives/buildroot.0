From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 18 Jul 2016 16:28:48 +0200
Subject: [Buildroot] [PATCH 0/2] Bump fcgiwrap, then fixes it w.r.t. systemd.
In-Reply-To: <20160717170017.GP3614@free.fr>
References: <20160717170017.GP3614@free.fr>
Message-ID: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> fcgiwrap fails to build because it does not find the systemd
> libraries:
>
> http://autobuild.buildroot.org/results/9b5/9b5e70e42e53e7752245f7c43bd01f208fcf76d0/build-end.log
> http://autobuild.buildroot.org/results/065/0656fde5005c7472e9e8ae8da32a6955ed5093cc/build-end.log
>
> That's because it is looking for the legacy systemd compat
> libraries, which have been removed in systemd 230:
>
>     PKG_CHECK_MODULES(systemd, [libsystemd-daemon],

I am not familiar with systemd and the documentation on
freedesktop.org appears very messy.  As far as I understand, linking
with libsystemd instead of libsystemd-daemon is a proper fix, right?
At least it does fix compilation and seems to produce a proper
fcgiwrap binary.

> Also, it seems the homepage referenced in the Config.in is no longer
> available. The git tree has not changed since April 2015.

I bumped the fcgiwrap package to the latest commit (which is not a GitHub
release, but the latest release is from February 2013) and changed the
homepage to the GitHub page.

> Care to have a look, please?

See the following patches.

Thomas Claveirole (2):
  fcgiwrap: Bump to 99c942c90063c73734e56bacaa65f947772d9186.
  fcgiwrap: Add a patch to link with libsystemd, not libsystemd-daemon.

 ...ith-libsystemd-instead-of-libsystemd-daemon.patch | 20 ++++++++++++++++++++
 package/fcgiwrap/Config.in                           |  2 +-
 package/fcgiwrap/fcgiwrap.hash                       |  2 +-
 package/fcgiwrap/fcgiwrap.mk                         |  4 ++--
 4 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100644 package/fcgiwrap/0002-link-with-libsystemd-instead-of-libsystemd-daemon.patch

--
2.8.1
