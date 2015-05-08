From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri,  8 May 2015 14:27:47 +1000
Subject: [Buildroot] [PATCH 0/2] Improve powerpc-utils with librtas
Message-ID: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Many useful functions are missing from powerpc-utils when built by
buildroot, because they depend on librtas which is not included.

This set adds the librtas package, a small patch to fix a problem with
it's make install target, and tweaks the powerpc-utils config
to include it. This makes the following additional programs available
from powerpc-utils:

* uesensor
* set_poweron_time
* drmgr
* lsslot
* activate_firmware
* rtas_ibm_get_vpd
* serv_config
* rtas_event_decode
* sys_ident


Sam Bobroff (2):
  librtas: new package
  powerpc-utils: remove --without-librtas

 package/Config.in                          |    1 +
 package/librtas/Config.in                  |    9 +++++++++
 package/librtas/librtas.mk                 |   27 +++++++++++++++++++++++++++
 package/librtas/missing-librtas.so.1.patch |   11 +++++++++++
 package/powerpc-utils/Config.in            |    1 +
 package/powerpc-utils/powerpc-utils.mk     |    3 +--
 6 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 package/librtas/Config.in
 create mode 100644 package/librtas/librtas.mk
 create mode 100644 package/librtas/missing-librtas.so.1.patch

-- 
1.7.10.4
