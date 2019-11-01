From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Nov 2019 09:02:27 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package/eudev: introduce a host
 variant
In-Reply-To: <CAJ4jsade6K=5V+kXMTaUhshbZ01t2k79SbxesCshdF85dwntFQ@mail.gmail.com>
 (Carlos Santos's message of "Tue, 29 Oct 2019 19:29:43 -0300")
References: <cover.1572386855.git.yann.morin.1998@free.fr>
 <97ce5bca66396034f8d4523e01c40ae4286f40be.1572386855.git.yann.morin.1998@free.fr>
 <CAJ4jsade6K=5V+kXMTaUhshbZ01t2k79SbxesCshdF85dwntFQ@mail.gmail.com>
Message-ID: <874kzohvn0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <unixmania@gmail.com> writes:

 >> +++ b/package/eudev/eudev.mk
 >> @@ -55,4 +55,40 @@ define EUDEV_USERS
 >> - - kvm -1 * - - - kvm nodes
 >> endef
 >> 
 >> +HOST_EUDEV_DEPENDENCIES = host-gperf host-pkgconf
 >> +
 >> +HOST_EUDEV_SYSCONFDIR = $(if $(BR2_PACKAGE_SYSTEMD),/usr/lib,/etc)
 >> +HOST_EUDEV_CONF_OPTS = \
 >> +       --prefix=/usr \
 >> +       --sbindir=/sbin \
 >> +       --libexecdir=/lib \
 >> +       --with-rootlibdir=/lib \
 >> +       --sysconfdir=$(HOST_EUDEV_SYSCONFDIR) \

 > We don't actually need this, since /etc/udev/udevdb.bin is a valid
 > location for systemd too. It was my idea, but I take it back. :-)

Are you sure that works? The sysconfdir is used both for the input and
output location. If you use systemd then the files provided by
systemd-udev presumably gets installed under /usr/lib/udev/hwdb.d as
well?

-- 
Bye, Peter Korsgaard
