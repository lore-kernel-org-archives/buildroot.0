From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 11 Apr 2014 13:09:38 +0200
Subject: [Buildroot] [PATCH v2 0/1] openvmtools: new package
Message-ID: <1397214579-53882-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is the second version of the new openvmtools package, based on
the comments of Thomas. I cleared up the code, but stayed with some of
my earlier decisions. I'm waiting for opinions.

Changes v1 -> v2:
  - Moved to section System tools from Hardware handling.
  - Unnecessary comments removed from both openvmtools.mk and Config.in.
  - Select is used in options instead of depends on.
  - $(LINUX_DIR) is used now when compiling kernel.
  - Vmblock-fuse comments cleaned up.
  - The package now does not copy the dnet-config script. One less hook.

What I did not change:
  - Initscript. I still think start-stop-daemon is an overkill for here.
    Please explain me why is it better in this case.
  - LDFLAGS variable is still used with procps, it can't use $TARGET_DIR.
    Why can't we compile a package with LDFLAGS?
  - CUSTOM_DNET_CPPFLAGS is still needed, it won't compile otherwise.
    Same, why can't we use custom FLAGS?

Kind regards,
Karoly

Karoly Kasza (1):
  openvmtools: new package

 package/Config.in                                  |    1 +
 package/openvmtools/Config.in                      |   70 +++++++++++++++
 package/openvmtools/S98vmtoolsd                    |   31 +++++++
 .../openvmtools-01-has_bsd_printf.patch            |   26 ++++++
 package/openvmtools/openvmtools.mk                 |   89 ++++++++++++++++++++
 package/openvmtools/shutdown                       |    7 ++
 6 files changed, 224 insertions(+)
 create mode 100644 package/openvmtools/Config.in
 create mode 100755 package/openvmtools/S98vmtoolsd
 create mode 100644 package/openvmtools/openvmtools-01-has_bsd_printf.patch
 create mode 100644 package/openvmtools/openvmtools.mk
 create mode 100755 package/openvmtools/shutdown

-- 
1.7.10.4
