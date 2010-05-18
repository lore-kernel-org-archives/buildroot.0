From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 May 2010 13:56:51 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	2010-05-15-fixes
In-Reply-To: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 16 May 2010 01:15:25 +0200")
References: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87tyq5xw1o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The following changes since commit 5e25bc482134bee62e3cc9d55af694aaa977d5b5:
 Thomas>   Thomas Petazzoni (1):
 Thomas>         external toolchain: check BR2_INSTALL_LIBSTDCPP

 Thomas> are available in the git repository at:

 Thomas>   git://git.busybox.net/~tpetazzoni/git/buildroot 2010-05-15-fixes

 Thomas> Thomas Petazzoni (12):
 Thomas>       iconv: disallow selection when BR2_ENABLE_LOCALE is enabled
 Thomas>       lmbench: needs BR2_INET_RPC
 Thomas>       startup-notification: add dependency on xlib_libX11
 Thomas>       ntp: fix build failure
 Thomas>       samba: only require libiconv if !BR2_ENABLE_LOCALE
 Thomas>       pango: run pango-querymodules on the target instead of on the host
 Thomas>       cairo: remove host variant
 Thomas>       mutt: fix build and convert to autotools
 Thomas>       lvm2: do not override CC and similar variables
 Thomas>       uemacs: don't forget CFLAGS at link time
 Thomas>       vpnc: pass CFLAGS at link time
 Thomas>       netsnmp: disable build with external toolchain

I wanted to pull this, but that's not what I got:

From git://git.busybox.net/~tpetazzoni/git/buildroot
 * branch            2010-05-15-fixes -> FETCH_HEAD
Removing package/mutt/mutt-1.5.16-makedoc-hostcc.patch
Merge made by recursive.
 package/avahi/Config.in                            |    5 +-
 package/avahi/avahi.mk                             |    2 +-
 package/cairo/cairo.mk                             |    3 -
 package/gettext/Config.in                          |    2 +
 package/gmpc/Config.in                             |    4 +-
 package/gmpc/gmpc.mk                               |    3 +-
 package/grep/Config.in                             |    4 +-
 package/grep/grep.mk                               |    2 +-
 package/hal/Config.in                              |    4 +-
 package/hal/hal.mk                                 |    2 +-
 package/libcap/libcap.mk                           |    4 +-
 ...cgicc-3.2.9-disable-documentation-option.patch} |    0
 package/libcgicc/libcgicc.mk                       |    2 +
 package/libglib2/Config.in                         |    4 +-
 package/libglib2/libglib2.mk                       |    2 +-
 package/libiconv/Config.in                         |    1 +
 package/libidn/libidn.mk                           |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/lmbench/Config.in                          |    2 +
 package/ltrace/ltrace.mk                           |    3 +-
 package/lvm2/lvm2.mk                               |    2 +-
 package/make/Config.in                             |    4 +-
 package/make/make.mk                               |    2 +-
 package/multimedia/libmpd/Config.in                |    2 -
 package/mutt/mutt-1.5.16-makedoc-hostcc.patch      |   32 ---------
 package/mutt/mutt-1.5.17+20080114-nodoc.patch      |   21 ++++++
 package/mutt/mutt.mk                               |   73 +++-----------------
 package/netsnmp/Config.in                          |    3 +
 package/ntp/ntp-4.2.4_p5-nano.patch                |   36 ++++++++++
 package/pango/S25pango                             |   20 ++++++
 package/pango/pango.mk                             |   18 +----
 package/php/Config.ext                             |    2 +-
 package/php/php.mk                                 |    2 +-
 package/psmisc/Config.in                           |    4 +-
 package/psmisc/psmisc.mk                           |    8 +--
 package/samba/Config.in                            |    2 +-
 package/samba/samba.mk                             |    2 +-
 package/sshfs/Config.in                            |    4 +-
 package/sshfs/sshfs.mk                             |    2 +-
 package/startup-notification/Config.in             |    2 +
 .../startup-notification/startup-notification.mk   |    1 +
 package/uemacs/uemacs.mk                           |    2 +-
 package/util-linux/Config.in                       |    4 +-
 package/util-linux/util-linux.mk                   |    4 +-
 package/vpnc/vpnc.mk                               |    4 +-
 toolchain/Config.in.2                              |    6 ++
 toolchain/external-toolchain/ext-tool.mk           |   12 +++
 47 files changed, 164 insertions(+), 163 deletions(-)

E.G. the branch also contained your older pull request, including the
avahi ipv6 dependency that I NACKed.

Could you fix that and send a new pull request, please?

-- 
Bye, Peter Korsgaard
