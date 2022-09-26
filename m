Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B3C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EACE460F76;
	Mon, 26 Sep 2022 12:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EACE460F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZAvz6A_lR1G; Mon, 26 Sep 2022 12:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5490A60F71;
	Mon, 26 Sep 2022 12:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5490A60F71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D79CE1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA634091F
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA634091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOUBFHFTHjik for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:17:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00AE240903
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00AE240903
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDE79863CC; Mon, 26 Sep 2022 12:17:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:10:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27f6c1ab383ce27236d75526ea881d7c789331a4
X-Git-Newrev: 358f4a013453a5fdd5f353fe10b412362bedef33
X-Patchwork-Hint: ignore
Message-Id: <20220926121730.DDE79863CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: bump to version 4.3.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=358f4a013453a5fdd5f353fe10b412362bedef33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- boost regex is not needed since
  https://github.com/EttusResearch/uhd/commit/f773cf9fb96e25d064f43cffdc893ac905d91f15
- Drop all patches (already in version) except first one which has been
  reverted by upstream:
  https://github.com/EttusResearch/uhd/commit/1a00949b19eaecb84af0f27c370400dc71a9fd84
- Add LGPL-3.0+ for fpga/usrp3:
  https://github.com/EttusResearch/uhd/commit/bafa9d95453387814ef25e6b6256ba8db2df612f
- N230 is not supported since
  https://github.com/EttusResearch/uhd/commit/d94140a4129d6b2153b15860eeb2406672ebb414
- RFNoC is not supported since
  https://github.com/EttusResearch/uhd/commit/7d69dcdcc318ccdf87038b732acbf2bf7c087b60

https://github.com/EttusResearch/uhd/blob/v4.3.0.0/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   |  14 +
 ...ists-add-boost-unit_test_framework-requir.patch |  12 +-
 package/uhd/0002-host-fix-build-boost-173.patch    | 577 ---------------------
 package/uhd/0003-add-RISC-V-endian-detection.patch | 113 ----
 .../0004-lib-Fix-missing-includes-in-rpc-hpp.patch |  28 -
 ...e-remove-boost-math-in-favor-of-std-cmath.patch | 105 ----
 ...ce-boost-math-iround-math-sign-with-std-l.patch |  57 --
 ...-Use-explicit-template-type-for-std-min-T.patch |  28 -
 package/uhd/Config.in                              |  11 -
 package/uhd/uhd.hash                               |   5 +-
 package/uhd/uhd.mk                                 |  18 +-
 11 files changed, 26 insertions(+), 942 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5892dfd44f..93d921160a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -156,6 +156,20 @@ config BR2_iwmmxt
 	  as a replacement architecture variant. See
 	  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972
 
+config BR2_PACKAGE_UHD_N230
+	bool "uhd N230 support removed"
+	select BR2_LEGACY
+	help
+	  uhd N230 support has been dropped by upstream since version
+	  4.0.0.0.
+
+config BR2_PACKAGE_UHD_RFNOC
+	bool "uhd RFNoC support removed"
+	select BR2_LEGACY
+	help
+	  uhd RFNoC support has been dropped by upstream since version
+	  4.0.0.0.
+
 config BR2_PACKAGE_GPSD_OLDSTYLE
 	bool "gpsd oldstyle removed"
 	select BR2_LEGACY
diff --git a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
index a79b650bed..4c455d28fc 100644
--- a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
+++ b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
@@ -9,8 +9,10 @@ when ENABLE_TESTS=ON.
 This PR suppress unit_test_framework to the default list and append
 UHD_BOOST_REQUIRED_COMPONENTS when this library is needed
 
-[backported from https://github.com/EttusResearch/uhd/pull/341]
 Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+[Fabrice: updated for 4.3.0.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: reverted (https://github.com/EttusResearch/uhd/commit/1a00949b19eaecb84af0f27c370400dc71a9fd84)]
 ---
  host/CMakeLists.txt | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
@@ -19,15 +21,13 @@ diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
 index 8f72ece76..a7731ffbd 100644
 --- a/host/CMakeLists.txt
 +++ b/host/CMakeLists.txt
-@@ -291,10 +291,14 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
-     filesystem
-     program_options
+@@ -291,9 +291,12 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
      system
--    unit_test_framework
      serialization
      thread
+-    unit_test_framework
  )
-+
+
 +if(ENABLE_TESTS)
 +    list(APPEND UHD_BOOST_REQUIRED_COMPONENTS unit_test_framework)
 +endif(ENABLE_TESTS)
diff --git a/package/uhd/0002-host-fix-build-boost-173.patch b/package/uhd/0002-host-fix-build-boost-173.patch
deleted file mode 100644
index b685b5f8a7..0000000000
--- a/package/uhd/0002-host-fix-build-boost-173.patch
+++ /dev/null
@@ -1,577 +0,0 @@
-From 13caaf001061db3c01082c4574a5e326c4969ab6 Mon Sep 17 00:00:00 2001
-From: Martin Braun <martin.braun@ettus.com>
-Date: Thu, 16 Jul 2020 13:07:34 +0200
-Subject: [PATCH] boost: Include bind.hpp where used, add
- BOOST_BIND_GLOBAL_PLACEHOLDERS
-
-Consists of two changes:
-- Grepped for files that use boost::bind, but don't include
-  boost/bind.hpp. Changed all of those to include bind.hpp
-- Add BOOST_BIND_GLOBAL_PLACEHOLDERS so that Boost doesn't complain
-  about using bind placeholders in the global namespace.
-
-Background: boost/bind.hpp is a convenience header that pulls the Boost
-bind placeholders into the global namespace, but that's deprecated
-behaviour. For UHD 3.15, we'll keep the deprecated behaviour (modern UHD
-no longer uses Boost.Bind), so this fixes build failures with modern
-Boost, and related warnings.
-
-Patch retrieved from
-https://github.com/EttusResearch/uhd/commit/13caaf001061db3c01082c4574a5e326c4969ab6
-
-Signed-off-by: Martin Braun <martin.braun@ettus.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- host/cmake/Modules/UHDBoost.cmake                      | 3 +++
- host/examples/network_relay.cpp                        | 1 +
- host/examples/rfnoc_rx_to_file.cpp                     | 1 +
- host/examples/test_clock_synch.cpp                     | 1 +
- host/examples/txrx_loopback_to_file.cpp                | 1 +
- host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp            | 1 +
- host/lib/rfnoc/legacy_compat.cpp                       | 1 +
- host/lib/transport/xport_benchmarker.cpp               | 1 +
- host/lib/usrp/b100/b100_impl.cpp                       | 1 +
- host/lib/usrp/b200/b200_iface.cpp                      | 1 +
- host/lib/usrp/b200/b200_impl.cpp                       | 1 +
- host/lib/usrp/cores/rx_dsp_core_3000.cpp               | 1 +
- host/lib/usrp/cores/tx_dsp_core_3000.cpp               | 1 +
- host/lib/usrp/dboard/db_cbx.cpp                        | 1 +
- host/lib/usrp/dboard/db_dbsrx.cpp                      | 1 +
- host/lib/usrp/dboard/db_dbsrx2.cpp                     | 1 +
- host/lib/usrp/dboard/db_sbx_common.cpp                 | 1 +
- host/lib/usrp/dboard/db_sbx_version3.cpp               | 1 +
- host/lib/usrp/dboard/db_sbx_version4.cpp               | 1 +
- host/lib/usrp/dboard/db_tvrx.cpp                       | 1 +
- host/lib/usrp/dboard/db_tvrx2.cpp                      | 1 +
- host/lib/usrp/dboard/db_twinrx.cpp                     | 1 +
- host/lib/usrp/dboard/db_ubx.cpp                        | 1 +
- host/lib/usrp/dboard/db_wbx_common.cpp                 | 1 +
- host/lib/usrp/dboard/db_wbx_simple.cpp                 | 1 +
- host/lib/usrp/dboard/db_wbx_version2.cpp               | 1 +
- host/lib/usrp/dboard/db_wbx_version3.cpp               | 1 +
- host/lib/usrp/dboard/db_wbx_version4.cpp               | 1 +
- host/lib/usrp/dboard/db_xcvr2450.cpp                   | 1 +
- host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp | 1 +
- host/lib/usrp/multi_usrp.cpp                           | 1 +
- host/lib/usrp/n230/n230_resource_manager.cpp           | 1 +
- host/lib/usrp/n230/n230_uart.cpp                       | 1 +
- host/lib/usrp/usrp1/soft_time_ctrl.cpp                 | 1 +
- host/lib/usrp/usrp1/usrp1_impl.cpp                     | 1 +
- host/lib/usrp/x300/x300_radio_ctrl_impl.cpp            | 1 +
- host/lib/usrp_clock/octoclock/octoclock_impl.cpp       | 1 +
- host/lib/utils/ihex.cpp                                | 1 +
- host/lib/utils/tasks.cpp                               | 1 +
- host/utils/uhd_cal_rx_iq_balance.cpp                   | 1 +
- host/utils/uhd_cal_tx_dc_offset.cpp                    | 1 +
- host/utils/uhd_cal_tx_iq_balance.cpp                   | 1 +
- 42 files changed, 44 insertions(+)
-
-diff --git a/host/cmake/Modules/UHDBoost.cmake b/host/cmake/Modules/UHDBoost.cmake
-index 5ebb4acef..e3ee42b50 100644
---- a/host/cmake/Modules/UHDBoost.cmake
-+++ b/host/cmake/Modules/UHDBoost.cmake
-@@ -259,6 +259,9 @@ else()
-     # disable Boost's use of std::experimental::string_view
-     # works for Boost 1.67.0 and newer & doesn't hurt older
-     add_definitions(-DBOOST_ASIO_DISABLE_STD_EXPERIMENTAL_STRING_VIEW)
-+    # UHD 3.15 still uses global placeholders (_1, _2, ...) from Boost which
-+    # need to be enabled explicitly for some Boost versions
-+    add_definitions(-DBOOST_BIND_GLOBAL_PLACEHOLDERS)
- 
-     # Boost 1.70.0's find cmake scripts don't always set the expected
-     # return variables. Replicate the commit that fixes that issue here:
-diff --git a/host/examples/network_relay.cpp b/host/examples/network_relay.cpp
-index bf2ac9255..9a9f56eb5 100644
---- a/host/examples/network_relay.cpp
-+++ b/host/examples/network_relay.cpp
-@@ -8,6 +8,7 @@
- #include <uhd/utils/safe_main.hpp>
- #include <uhd/utils/thread.hpp>
- #include <boost/asio.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/program_options.hpp>
- #include <boost/thread/condition_variable.hpp>
-diff --git a/host/examples/rfnoc_rx_to_file.cpp b/host/examples/rfnoc_rx_to_file.cpp
-index 5bb9985ae..cbd35cbe8 100644
---- a/host/examples/rfnoc_rx_to_file.cpp
-+++ b/host/examples/rfnoc_rx_to_file.cpp
-@@ -23,6 +23,7 @@
- #include <uhd/types/tune_request.hpp>
- #include <uhd/utils/safe_main.hpp>
- #include <uhd/utils/thread.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/program_options.hpp>
- #include <chrono>
-diff --git a/host/examples/test_clock_synch.cpp b/host/examples/test_clock_synch.cpp
-index 8556063d7..ec071f7c7 100644
---- a/host/examples/test_clock_synch.cpp
-+++ b/host/examples/test_clock_synch.cpp
-@@ -12,6 +12,7 @@
- #include <uhd/usrp_clock/multi_usrp_clock.hpp>
- #include <uhd/utils/safe_main.hpp>
- #include <uhd/utils/thread.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/program_options.hpp>
- #include <chrono>
-diff --git a/host/examples/txrx_loopback_to_file.cpp b/host/examples/txrx_loopback_to_file.cpp
-index 271d249f6..a2f0427c9 100644
---- a/host/examples/txrx_loopback_to_file.cpp
-+++ b/host/examples/txrx_loopback_to_file.cpp
-@@ -13,6 +13,7 @@
- #include <uhd/utils/static.hpp>
- #include <uhd/utils/thread.hpp>
- #include <boost/algorithm/string.hpp>
-+#include <boost/bind.hpp>
- #include <boost/filesystem.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
-diff --git a/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp b/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp
-index a80e2ef53..b78635002 100644
---- a/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp
-+++ b/host/lib/rfnoc/dma_fifo_block_ctrl_impl.cpp
-@@ -11,6 +11,7 @@
- #include <uhd/utils/log.hpp>
- #include <uhdlib/rfnoc/wb_iface_adapter.hpp>
- #include <uhdlib/usrp/cores/dma_fifo_core_3000.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/make_shared.hpp>
- #include <boost/thread/mutex.hpp>
-diff --git a/host/lib/rfnoc/legacy_compat.cpp b/host/lib/rfnoc/legacy_compat.cpp
-index 91de361df..f93fe871a 100644
---- a/host/lib/rfnoc/legacy_compat.cpp
-+++ b/host/lib/rfnoc/legacy_compat.cpp
-@@ -19,6 +19,7 @@
- #include <uhd/usrp/subdev_spec.hpp>
- #include <uhd/utils/log.hpp>
- #include <uhdlib/rfnoc/legacy_compat.hpp>
-+#include <boost/bind.hpp>
- #include <boost/make_shared.hpp>
- #include <set>
- 
-diff --git a/host/lib/transport/xport_benchmarker.cpp b/host/lib/transport/xport_benchmarker.cpp
-index 67582ff2c..7abd4c5fd 100644
---- a/host/lib/transport/xport_benchmarker.cpp
-+++ b/host/lib/transport/xport_benchmarker.cpp
-@@ -6,6 +6,7 @@
- //
- 
- #include "xport_benchmarker.hpp"
-+#include <boost/bind.hpp>
- #include <chrono>
- #include <thread>
- 
-diff --git a/host/lib/usrp/b100/b100_impl.cpp b/host/lib/usrp/b100/b100_impl.cpp
-index cd4319803..08006ae32 100644
---- a/host/lib/usrp/b100/b100_impl.cpp
-+++ b/host/lib/usrp/b100/b100_impl.cpp
-@@ -15,6 +15,7 @@
- #include <uhd/utils/paths.hpp>
- #include <uhd/utils/safe_call.hpp>
- #include <uhdlib/usrp/common/apply_corrections.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <cstdio>
- #include <iostream>
-diff --git a/host/lib/usrp/b200/b200_iface.cpp b/host/lib/usrp/b200/b200_iface.cpp
-index 082be071c..cdf88f69b 100644
---- a/host/lib/usrp/b200/b200_iface.cpp
-+++ b/host/lib/usrp/b200/b200_iface.cpp
-@@ -12,6 +12,7 @@
- #include <uhd/exception.hpp>
- #include <uhdlib/utils/ihex.hpp>
- 
-+#include <boost/bind.hpp>
- #include <boost/functional/hash.hpp>
- #include <boost/lexical_cast.hpp>
- #include <boost/format.hpp>
-diff --git a/host/lib/usrp/b200/b200_impl.cpp b/host/lib/usrp/b200/b200_impl.cpp
-index 1be8c263b..c0f8ee1ac 100644
---- a/host/lib/usrp/b200/b200_impl.cpp
-+++ b/host/lib/usrp/b200/b200_impl.cpp
-@@ -17,6 +17,7 @@
- #include <uhd/utils/safe_call.hpp>
- #include <uhd/usrp/dboard_eeprom.hpp>
- #include <boost/format.hpp>
-+#include <boost/bind.hpp>
- #include <boost/filesystem.hpp>
- #include <boost/lexical_cast.hpp>
- #include <boost/functional/hash.hpp>
-diff --git a/host/lib/usrp/cores/rx_dsp_core_3000.cpp b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
-index 46fce3f69..ff7caf105 100644
---- a/host/lib/usrp/cores/rx_dsp_core_3000.cpp
-+++ b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
-@@ -13,6 +13,7 @@
- #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
- #include <uhdlib/usrp/cores/rx_dsp_core_3000.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/thread/thread.hpp> //thread sleep
- #include <algorithm>
-diff --git a/host/lib/usrp/cores/tx_dsp_core_3000.cpp b/host/lib/usrp/cores/tx_dsp_core_3000.cpp
-index be7593841..b76a74b1c 100644
---- a/host/lib/usrp/cores/tx_dsp_core_3000.cpp
-+++ b/host/lib/usrp/cores/tx_dsp_core_3000.cpp
-@@ -12,6 +12,7 @@
- #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
- #include <uhdlib/usrp/cores/tx_dsp_core_3000.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/thread/thread.hpp> //sleep
- #include <algorithm>
-diff --git a/host/lib/usrp/dboard/db_cbx.cpp b/host/lib/usrp/dboard/db_cbx.cpp
-index dd0640d00..f5c7f2399 100644
---- a/host/lib/usrp/dboard/db_cbx.cpp
-+++ b/host/lib/usrp/dboard/db_cbx.cpp
-@@ -7,6 +7,7 @@
- 
- #include "db_sbx_common.hpp"
- #include <boost/algorithm/string.hpp>
-+#include <boost/bind.hpp>
- #include <boost/math/special_functions/round.hpp>
- 
- using namespace uhd;
-diff --git a/host/lib/usrp/dboard/db_dbsrx.cpp b/host/lib/usrp/dboard/db_dbsrx.cpp
-index 587158470..dc82b60f9 100644
---- a/host/lib/usrp/dboard/db_dbsrx.cpp
-+++ b/host/lib/usrp/dboard/db_dbsrx.cpp
-@@ -21,6 +21,7 @@
- #include <uhd/usrp/dboard_base.hpp>
- #include <uhd/usrp/dboard_manager.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <utility>
-diff --git a/host/lib/usrp/dboard/db_dbsrx2.cpp b/host/lib/usrp/dboard/db_dbsrx2.cpp
-index e2505dfd7..da4da4148 100644
---- a/host/lib/usrp/dboard/db_dbsrx2.cpp
-+++ b/host/lib/usrp/dboard/db_dbsrx2.cpp
-@@ -18,6 +18,7 @@
- #include <uhd/usrp/dboard_base.hpp>
- #include <uhd/usrp/dboard_manager.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/thread.hpp>
- #include <boost/math/special_functions/round.hpp>
-diff --git a/host/lib/usrp/dboard/db_sbx_common.cpp b/host/lib/usrp/dboard/db_sbx_common.cpp
-index b6eaedc3d..95aff96b4 100644
---- a/host/lib/usrp/dboard/db_sbx_common.cpp
-+++ b/host/lib/usrp/dboard/db_sbx_common.cpp
-@@ -6,6 +6,7 @@
- //
- 
- #include "db_sbx_common.hpp"
-+#include <boost/bind.hpp>
- 
- using namespace uhd;
- using namespace uhd::usrp;
-diff --git a/host/lib/usrp/dboard/db_sbx_version3.cpp b/host/lib/usrp/dboard/db_sbx_version3.cpp
-index 369315b2e..fb829cf34 100644
---- a/host/lib/usrp/dboard/db_sbx_version3.cpp
-+++ b/host/lib/usrp/dboard/db_sbx_version3.cpp
-@@ -9,6 +9,7 @@
- #include "db_sbx_common.hpp"
- #include <uhd/types/tune_request.hpp>
- #include <boost/algorithm/string.hpp>
-+#include <boost/bind.hpp>
- 
- using namespace uhd;
- using namespace uhd::usrp;
-diff --git a/host/lib/usrp/dboard/db_sbx_version4.cpp b/host/lib/usrp/dboard/db_sbx_version4.cpp
-index d1c76287b..e1adebf99 100644
---- a/host/lib/usrp/dboard/db_sbx_version4.cpp
-+++ b/host/lib/usrp/dboard/db_sbx_version4.cpp
-@@ -9,6 +9,7 @@
- #include "db_sbx_common.hpp"
- #include <uhd/types/tune_request.hpp>
- #include <boost/algorithm/string.hpp>
-+#include <boost/bind.hpp>
- 
- using namespace uhd;
- using namespace uhd::usrp;
-diff --git a/host/lib/usrp/dboard/db_tvrx.cpp b/host/lib/usrp/dboard/db_tvrx.cpp
-index 8bf377c4d..5fbbf5bee 100644
---- a/host/lib/usrp/dboard/db_tvrx.cpp
-+++ b/host/lib/usrp/dboard/db_tvrx.cpp
-@@ -28,6 +28,7 @@
- #include <uhd/usrp/dboard_base.hpp>
- #include <uhd/usrp/dboard_manager.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/thread.hpp>
- #include <boost/array.hpp>
-diff --git a/host/lib/usrp/dboard/db_tvrx2.cpp b/host/lib/usrp/dboard/db_tvrx2.cpp
-index 5dba83551..e1623487d 100644
---- a/host/lib/usrp/dboard/db_tvrx2.cpp
-+++ b/host/lib/usrp/dboard/db_tvrx2.cpp
-@@ -55,6 +55,7 @@
- #include <uhd/usrp/dboard_manager.hpp>
- #include <boost/assign/list_of.hpp>
- #include <boost/format.hpp>
-+#include <boost/bind.hpp>
- #include <boost/array.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <utility>
-diff --git a/host/lib/usrp/dboard/db_twinrx.cpp b/host/lib/usrp/dboard/db_twinrx.cpp
-index de1cd3f33..aa9da8adf 100644
---- a/host/lib/usrp/dboard/db_twinrx.cpp
-+++ b/host/lib/usrp/dboard/db_twinrx.cpp
-@@ -19,6 +19,7 @@
- #include <uhd/utils/log.hpp>
- #include <uhd/utils/static.hpp>
- #include "dboard_ctor_args.hpp"
-+#include <boost/bind.hpp>
- #include <boost/make_shared.hpp>
- #include <boost/thread.hpp>
- #include <boost/thread/mutex.hpp>
-diff --git a/host/lib/usrp/dboard/db_ubx.cpp b/host/lib/usrp/dboard/db_ubx.cpp
-index 305a69c52..e78f9db75 100644
---- a/host/lib/usrp/dboard/db_ubx.cpp
-+++ b/host/lib/usrp/dboard/db_ubx.cpp
-@@ -20,6 +20,7 @@
- #include <uhd/utils/safe_call.hpp>
- #include <uhdlib/usrp/common/max287x.hpp>
- 
-+#include <boost/bind.hpp>
- #include <boost/shared_ptr.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/algorithm/string.hpp>
-diff --git a/host/lib/usrp/dboard/db_wbx_common.cpp b/host/lib/usrp/dboard/db_wbx_common.cpp
-index 41f323d19..fd7b2481a 100644
---- a/host/lib/usrp/dboard/db_wbx_common.cpp
-+++ b/host/lib/usrp/dboard/db_wbx_common.cpp
-@@ -12,6 +12,7 @@
- #include <uhd/utils/assert_has.hpp>
- #include <uhd/utils/algorithm.hpp>
- #include <uhd/utils/log.hpp>
-+#include <boost/bind.hpp>
- 
- using namespace uhd;
- using namespace uhd::usrp;
-diff --git a/host/lib/usrp/dboard/db_wbx_simple.cpp b/host/lib/usrp/dboard/db_wbx_simple.cpp
-index 390c5c47a..e3a5667c7 100644
---- a/host/lib/usrp/dboard/db_wbx_simple.cpp
-+++ b/host/lib/usrp/dboard/db_wbx_simple.cpp
-@@ -17,6 +17,7 @@
- #include <uhd/utils/assert_has.hpp>
- #include <uhd/usrp/dboard_manager.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- 
- using namespace uhd;
- using namespace uhd::usrp;
-diff --git a/host/lib/usrp/dboard/db_wbx_version2.cpp b/host/lib/usrp/dboard/db_wbx_version2.cpp
-index 775ee4467..f1bf7dacc 100644
---- a/host/lib/usrp/dboard/db_wbx_version2.cpp
-+++ b/host/lib/usrp/dboard/db_wbx_version2.cpp
-@@ -16,6 +16,7 @@
- 
- #include <uhd/usrp/dboard_base.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/algorithm/string.hpp>
-diff --git a/host/lib/usrp/dboard/db_wbx_version3.cpp b/host/lib/usrp/dboard/db_wbx_version3.cpp
-index 41979f8ef..b755d09a2 100644
---- a/host/lib/usrp/dboard/db_wbx_version3.cpp
-+++ b/host/lib/usrp/dboard/db_wbx_version3.cpp
-@@ -15,6 +15,7 @@
- 
- #include <uhd/usrp/dboard_base.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/algorithm/string.hpp>
-diff --git a/host/lib/usrp/dboard/db_wbx_version4.cpp b/host/lib/usrp/dboard/db_wbx_version4.cpp
-index 8b3d13b37..f2976d3a7 100644
---- a/host/lib/usrp/dboard/db_wbx_version4.cpp
-+++ b/host/lib/usrp/dboard/db_wbx_version4.cpp
-@@ -15,6 +15,7 @@
- 
- #include <uhd/usrp/dboard_base.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/algorithm/string.hpp>
-diff --git a/host/lib/usrp/dboard/db_xcvr2450.cpp b/host/lib/usrp/dboard/db_xcvr2450.cpp
-index 9e1c9f2b0..8f95dbb1c 100644
---- a/host/lib/usrp/dboard/db_xcvr2450.cpp
-+++ b/host/lib/usrp/dboard/db_xcvr2450.cpp
-@@ -49,6 +49,7 @@
- #include <uhd/usrp/dboard_base.hpp>
- #include <uhd/usrp/dboard_manager.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <utility>
-diff --git a/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp b/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp
-index 73851656b..717fa144f 100644
---- a/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp
-+++ b/host/lib/usrp/dboard/eiscat/eiscat_radio_ctrl_impl.cpp
-@@ -11,6 +11,7 @@
- #include <uhd/rfnoc/node_ctrl_base.hpp>
- #include <uhd/types/ranges.hpp>
- #include <boost/algorithm/string.hpp>
-+#include <boost/bind.hpp>
- #include <boost/make_shared.hpp>
- #include <boost/date_time/posix_time/posix_time_io.hpp>
- #include <boost/format.hpp>
-diff --git a/host/lib/usrp/multi_usrp.cpp b/host/lib/usrp/multi_usrp.cpp
-index 49ffec698..13cb03cf9 100644
---- a/host/lib/usrp/multi_usrp.cpp
-+++ b/host/lib/usrp/multi_usrp.cpp
-@@ -21,6 +21,7 @@
- #include <uhdlib/usrp/gpio_defs.hpp>
- #include <uhdlib/rfnoc/legacy_compat.hpp>
- #include <boost/assign/list_of.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/algorithm/string.hpp>
- #include <algorithm>
-diff --git a/host/lib/usrp/n230/n230_resource_manager.cpp b/host/lib/usrp/n230/n230_resource_manager.cpp
-index 22f8ddedb..df3c9fb15 100644
---- a/host/lib/usrp/n230/n230_resource_manager.cpp
-+++ b/host/lib/usrp/n230/n230_resource_manager.cpp
-@@ -14,6 +14,7 @@
- #include <uhd/utils/log.hpp>
- #include <uhd/utils/platform.hpp>
- #include <uhd/utils/paths.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/functional/hash.hpp>
- #include <boost/make_shared.hpp>
-diff --git a/host/lib/usrp/n230/n230_uart.cpp b/host/lib/usrp/n230/n230_uart.cpp
-index 8689335c8..26fafde94 100644
---- a/host/lib/usrp/n230/n230_uart.cpp
-+++ b/host/lib/usrp/n230/n230_uart.cpp
-@@ -13,6 +13,7 @@
- #include <uhd/utils/log.hpp>
- #include <uhd/types/time_spec.hpp>
- #include <uhd/exception.hpp>
-+#include <boost/bind.hpp>
- 
- using namespace uhd;
- using namespace uhd::transport;
-diff --git a/host/lib/usrp/usrp1/soft_time_ctrl.cpp b/host/lib/usrp/usrp1/soft_time_ctrl.cpp
-index 7f39caf8a..9a84ee188 100644
---- a/host/lib/usrp/usrp1/soft_time_ctrl.cpp
-+++ b/host/lib/usrp/usrp1/soft_time_ctrl.cpp
-@@ -8,6 +8,7 @@
- #include "soft_time_ctrl.hpp"
- #include <uhdlib/utils/system_time.hpp>
- #include <uhd/utils/tasks.hpp>
-+#include <boost/bind.hpp>
- #include <boost/make_shared.hpp>
- #include <boost/thread/condition_variable.hpp>
- #include <boost/date_time/posix_time/posix_time.hpp>
-diff --git a/host/lib/usrp/usrp1/usrp1_impl.cpp b/host/lib/usrp/usrp1/usrp1_impl.cpp
-index 2134f8182..1e83ce3fc 100644
---- a/host/lib/usrp/usrp1/usrp1_impl.cpp
-+++ b/host/lib/usrp/usrp1/usrp1_impl.cpp
-@@ -14,6 +14,7 @@
- #include <uhd/exception.hpp>
- #include <uhd/utils/static.hpp>
- #include <uhd/utils/paths.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/filesystem.hpp>
- #include <boost/lexical_cast.hpp>
-diff --git a/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp b/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp
-index 8d967ae15..de36379ea 100644
---- a/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp
-+++ b/host/lib/usrp/x300/x300_radio_ctrl_impl.cpp
-@@ -17,6 +17,7 @@
- #include <uhdlib/usrp/common/apply_corrections.hpp>
- #include <uhdlib/usrp/cores/gpio_atr_3000.hpp>
- #include <boost/algorithm/string.hpp>
-+#include <boost/bind.hpp>
- #include <boost/date_time/posix_time/posix_time_io.hpp>
- #include <boost/make_shared.hpp>
- #include <chrono>
-diff --git a/host/lib/usrp_clock/octoclock/octoclock_impl.cpp b/host/lib/usrp_clock/octoclock/octoclock_impl.cpp
-index f3cf3f4ea..4c11788d2 100644
---- a/host/lib/usrp_clock/octoclock/octoclock_impl.cpp
-+++ b/host/lib/usrp_clock/octoclock/octoclock_impl.cpp
-@@ -9,6 +9,7 @@
- 
- #include <boost/asio.hpp>
- #include <boost/assign.hpp>
-+#include <boost/bind.hpp>
- #include <stdint.h>
- #include <boost/filesystem.hpp>
- #include <boost/format.hpp>
-diff --git a/host/lib/utils/ihex.cpp b/host/lib/utils/ihex.cpp
-index 6bb0ba9d4..7fb605627 100644
---- a/host/lib/utils/ihex.cpp
-+++ b/host/lib/utils/ihex.cpp
-@@ -7,6 +7,7 @@
- 
- #include <uhd/exception.hpp>
- #include <uhdlib/utils/ihex.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/make_shared.hpp>
- #include <sstream>
-diff --git a/host/lib/utils/tasks.cpp b/host/lib/utils/tasks.cpp
-index 888a5a8f1..e5195fcf1 100644
---- a/host/lib/utils/tasks.cpp
-+++ b/host/lib/utils/tasks.cpp
-@@ -10,6 +10,7 @@
- #include <uhd/utils/thread.hpp>
- #include <uhd/utils/log.hpp>
- #include <uhd/exception.hpp>
-+#include <boost/bind.hpp>
- #include <boost/thread/thread.hpp>
- #include <boost/thread/barrier.hpp>
- #include <exception>
-diff --git a/host/utils/uhd_cal_rx_iq_balance.cpp b/host/utils/uhd_cal_rx_iq_balance.cpp
-index c68c96173..3f5fa1788 100644
---- a/host/utils/uhd_cal_rx_iq_balance.cpp
-+++ b/host/utils/uhd_cal_rx_iq_balance.cpp
-@@ -11,6 +11,7 @@
- #include <uhd/utils/paths.hpp>
- #include <uhd/utils/safe_main.hpp>
- #include <uhd/utils/thread.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/program_options.hpp>
-diff --git a/host/utils/uhd_cal_tx_dc_offset.cpp b/host/utils/uhd_cal_tx_dc_offset.cpp
-index f47b5e913..2cb65d3f5 100644
---- a/host/utils/uhd_cal_tx_dc_offset.cpp
-+++ b/host/utils/uhd_cal_tx_dc_offset.cpp
-@@ -11,6 +11,7 @@
- #include <uhd/utils/paths.hpp>
- #include <uhd/utils/safe_main.hpp>
- #include <uhd/utils/thread.hpp>
-+#include <boost/bind.hpp>
- #include <boost/format.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/program_options.hpp>
-diff --git a/host/utils/uhd_cal_tx_iq_balance.cpp b/host/utils/uhd_cal_tx_iq_balance.cpp
-index 2e7229fd3..ace93462e 100644
---- a/host/utils/uhd_cal_tx_iq_balance.cpp
-+++ b/host/utils/uhd_cal_tx_iq_balance.cpp
-@@ -8,6 +8,7 @@
- #include "usrp_cal_utils.hpp"
- #include <uhd/utils/safe_main.hpp>
- #include <uhd/utils/thread.hpp>
-+#include <boost/bind.hpp>
- #include <boost/math/special_functions/round.hpp>
- #include <boost/program_options.hpp>
- #include <boost/thread/thread.hpp>
--- 
-2.26.2
-
diff --git a/package/uhd/0003-add-RISC-V-endian-detection.patch b/package/uhd/0003-add-RISC-V-endian-detection.patch
deleted file mode 100644
index fb1168ba3e..0000000000
--- a/package/uhd/0003-add-RISC-V-endian-detection.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From d4717a38d2287c2f583fefb2a0ed273337a92bb6 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Mon, 11 Jan 2021 18:18:26 +0100
-Subject: [PATCH] msgpack/predef: add riscV support
-
-When the target CPU is riscV, msgpack is unable to detect endianness with a list of errors like:
-
-uhd/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:190:2: error: #error msgpack-c supports only big endian and little endian
-  190 | #error msgpack-c supports only big endian and little endian
-      |  ^~~~~
-
-and with subsequent errors:
-
-uhd0/host/lib/deps/rpclib/include/rpc/msgpack/pack.hpp:236:46: error: there are no arguments to 'take8_8' that depend on a template parameter, so a declaration of 'take8_8' must be available [-fpermissive]
-  236 |     char buf[2] = {static_cast<char>(0xccu), take8_8(d)};
-      |      
-
-This is due to a missing support for this architecture in msgpack.
-This patch adapt commit from https://github.com/boostorg/predef
-
-[backported from https://github.com/EttusResearch/uhd/pull/400]
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- .../include/rpc/msgpack/predef/architecture.h |  1 +
- .../rpc/msgpack/predef/architecture/riscv.h   | 48 +++++++++++++++++++
- .../include/rpc/msgpack/predef/other/endian.h |  3 +-
- 3 files changed, 51 insertions(+), 1 deletion(-)
- create mode 100644 host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h
-
-diff --git a/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h
-index 4a0ce2749..1bd998c59 100644
---- a/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h
-+++ b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture.h
-@@ -18,6 +18,7 @@ http://www.boost.org/LICENSE_1_0.txt)
- #include <rpc/msgpack/predef/architecture/parisc.h>
- #include <rpc/msgpack/predef/architecture/ppc.h>
- #include <rpc/msgpack/predef/architecture/pyramid.h>
-+#include <rpc/msgpack/predef/architecture/riscv.h>
- #include <rpc/msgpack/predef/architecture/rs6k.h>
- #include <rpc/msgpack/predef/architecture/sparc.h>
- #include <rpc/msgpack/predef/architecture/superh.h>
-diff --git a/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h
-new file mode 100644
-index 000000000..8b819d77e
---- /dev/null
-+++ b/host/lib/deps/rpclib/include/rpc/msgpack/predef/architecture/riscv.h
-@@ -0,0 +1,48 @@
-+/*
-+Copyright Andreas Schwab 2019
-+Distributed under the Boost Software License, Version 1.0.
-+(See accompanying file LICENSE_1_0.txt or copy at
-+http://www.boost.org/LICENSE_1_0.txt)
-+*/
-+
-+#ifndef BOOST_PREDEF_ARCHITECTURE_RISCV_H
-+#define BOOST_PREDEF_ARCHITECTURE_RISCV_H
-+
-+#include <boost/predef/version_number.h>
-+#include <boost/predef/make.h>
-+
-+/* tag::reference[]
-+= `BOOST_ARCH_RISCV`
-+
-+http://en.wikipedia.org/wiki/RISC-V[RISC-V] architecture.
-+
-+[options="header"]
-+|===
-+| {predef_symbol} | {predef_version}
-+
-+| `+__riscv+` | {predef_detection}
-+|===
-+*/ // end::reference[]
-+
-+#define BOOST_ARCH_RISCV BOOST_VERSION_NUMBER_NOT_AVAILABLE
-+
-+#if defined(__riscv)
-+#   undef BOOST_ARCH_RISCV
-+#   define BOOST_ARCH_RISCV BOOST_VERSION_NUMBER_AVAILABLE
-+#endif
-+
-+#if BOOST_ARCH_RISCV
-+#   define BOOST_ARCH_RISCV_AVAILABLE
-+#endif
-+
-+#if BOOST_ARCH_RISCV
-+#   undef BOOST_ARCH_WORD_BITS_32
-+#   define BOOST_ARCH_WORD_BITS_32 BOOST_VERSION_NUMBER_AVAILABLE
-+#endif
-+
-+#define BOOST_ARCH_RISCV_NAME "RISC-V"
-+
-+#endif
-+
-+#include <boost/predef/detail/test.h>
-+BOOST_PREDEF_DECLARE_TEST(BOOST_ARCH_RISCV,BOOST_ARCH_RISCV_NAME)
-diff --git a/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h b/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h
-index 3f367b3d4..a7c1fb4dc 100644
---- a/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h
-+++ b/host/lib/deps/rpclib/include/rpc/msgpack/predef/other/endian.h
-@@ -127,7 +127,8 @@ information and acquired knowledge:
-         defined(__AARCH64EL__) || \
-         defined(_MIPSEL) || \
-         defined(__MIPSEL) || \
--        defined(__MIPSEL__)
-+        defined(__MIPSEL__) || \
-+        defined(__riscv)
- #       undef MSGPACK_ENDIAN_LITTLE_BYTE
- #       define MSGPACK_ENDIAN_LITTLE_BYTE MSGPACK_VERSION_NUMBER_AVAILABLE
- #   endif
--- 
-2.26.2
-
diff --git a/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch b/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
deleted file mode 100644
index b287beec71..0000000000
--- a/package/uhd/0004-lib-Fix-missing-includes-in-rpc-hpp.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9c4d9d826a6f40f199c526afd5ec168d5d088591 Mon Sep 17 00:00:00 2001
-From: Martin Braun <martin.braun@ettus.com>
-Date: Fri, 29 Jan 2021 12:23:50 +0100
-Subject: [PATCH] lib: Fix missing includes in rpc.hpp
-
-[Retrieved from:
-https://github.com/EttusResearch/uhd/commit/9c4d9d826a6f40f199c526afd5ec168d5d088591]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- host/lib/include/uhdlib/utils/rpc.hpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/host/lib/include/uhdlib/utils/rpc.hpp b/host/lib/include/uhdlib/utils/rpc.hpp
-index e87a2ee324..ca89c10547 100644
---- a/host/lib/include/uhdlib/utils/rpc.hpp
-+++ b/host/lib/include/uhdlib/utils/rpc.hpp
-@@ -12,7 +12,11 @@
- #include <rpc/client.h>
- #include <rpc/rpc_error.h>
- #include <boost/format.hpp>
-+#include <chrono>
- #include <memory>
-+#include <mutex>
-+#include <string>
-+#include <thread>
- 
- namespace {
- 
diff --git a/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch b/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
deleted file mode 100644
index 9530b0213f..0000000000
--- a/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From dc187b5597779b14d0de4087db4aa54752a15d07 Mon Sep 17 00:00:00 2001
-From: Michael Dickens <michael.dickens@ettus.com>
-Date: Fri, 2 Jul 2021 16:43:41 -0400
-Subject: [PATCH] core: remove boost::math in favor of std cmath
-
-YA Boost removal!!!
-
-Justification
----
-const int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
-_dsp_freq_offset = if_freq * (-if_freq_sign);
-// boost::math::sign : 1 if x > 0, -1 if x < 0, and 0 if x is zero.
-// ==> if if_freq_sign > 0 then * by -1 else +1 (effectively)
-
-// std::signbit : true if arg is negative, false otherwise
-// ==> need 'not' of input argument to invert for same result as prior algorithm
-double fe_if_freq = fe_conn.get_if_freq();
-if (!std::signbit(fe_if_freq)) {
-  if_freq *= -1.0;
-}
----
-The above should result in the same algorithm except possibly
-if fe_if_freq is exactly 0.0 in which case the results might be
-off by the sign (+0.0 versus -0.0).
-
-[Retrieved from:
-https://github.com/EttusResearch/uhd/commit/dc187b5597779b14d0de4087db4aa54752a15d07]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- host/lib/usrp/cores/rx_dsp_core_3000.cpp      | 15 ++++++++-------
- host/lib/usrp/cores/rx_frontend_core_3000.cpp | 14 ++++++++------
- 2 files changed, 16 insertions(+), 13 deletions(-)
-
-diff --git a/host/lib/usrp/cores/rx_dsp_core_3000.cpp b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
-index 879748fa2..1c15180ae 100644
---- a/host/lib/usrp/cores/rx_dsp_core_3000.cpp
-+++ b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
-@@ -8,7 +8,6 @@
- #include <uhd/exception.hpp>
- #include <uhd/types/dict.hpp>
- #include <uhd/utils/log.hpp>
--#include <uhd/utils/math.hpp>
- #include <uhd/utils/safe_call.hpp>
- #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
- #include <uhdlib/usrp/cores/rx_dsp_core_3000.hpp>
-@@ -81,19 +80,21 @@ class rx_dsp_core_3000_impl : public rx_dsp_core_3000
-         _iface->poke32(REG_DSP_RX_MUX, reg_val);
- 
-         if (fe_conn.get_sampling_mode() == uhd::usrp::fe_connection_t::HETERODYNE) {
--            // 1. Remember the sign of the IF frequency.
--            //   It will be discarded in the next step
--            int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
-+            // 1. Remember the IF frequency
-+            const double fe_if_freq = fe_conn.get_if_freq();
-             // 2. Map IF frequency to the range [0, _tick_rate)
--            double if_freq = std::abs(std::fmod(fe_conn.get_if_freq(), _tick_rate));
--            // 3. Map IF frequency to the range [-_tick_rate/2, _tick_rate/2)
-+            double if_freq = std::abs(std::fmod(fe_if_freq, _tick_rate));
-+            // 3. Map IF frequency to the range [-_tick_rate/2, _tick_rate/2]
-             //   This is the aliased frequency
-             if (if_freq > (_tick_rate / 2.0)) {
-                 if_freq -= _tick_rate;
-             }
-             // 4. Set DSP offset to spin the signal in the opposite
-             //   direction as the aliased frequency
--            _dsp_freq_offset = if_freq * (-if_freq_sign);
-+            if (!std::signbit(fe_if_freq)) {
-+                if_freq *= -1.0;
-+            }
-+            _dsp_freq_offset = if_freq;
-         } else {
-             _dsp_freq_offset = 0.0;
-         }
-diff --git a/host/lib/usrp/cores/rx_frontend_core_3000.cpp b/host/lib/usrp/cores/rx_frontend_core_3000.cpp
-index eef25f27d..b9d908534 100644
---- a/host/lib/usrp/cores/rx_frontend_core_3000.cpp
-+++ b/host/lib/usrp/cores/rx_frontend_core_3000.cpp
-@@ -119,19 +119,21 @@ class rx_frontend_core_3000_impl : public rx_frontend_core_3000
- 
-         UHD_ASSERT_THROW(_adc_rate != 0.0)
-         if (fe_conn.get_sampling_mode() == fe_connection_t::HETERODYNE) {
--            // 1. Remember the sign of the IF frequency.
--            //   It will be discarded in the next step
--            const int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
-+            // 1. Remember the IF frequency
-+            const double fe_if_freq = fe_conn.get_if_freq();
-             // 2. Map IF frequency to the range [0, _adc_rate)
--            double if_freq = std::abs(std::fmod(fe_conn.get_if_freq(), _adc_rate));
--            // 3. Map IF frequency to the range [-_adc_rate/2, _adc_rate/2)
-+            double if_freq = std::abs(std::fmod(fe_if_freq, _adc_rate));
-+            // 3. Map IF frequency to the range [-_adc_rate/2, _adc_rate/2]
-             //   This is the aliased frequency
-             if (if_freq > (_adc_rate / 2.0)) {
-                 if_freq -= _adc_rate;
-             }
-             // 4. Set DSP offset to spin the signal in the opposite
-             //   direction as the aliased frequency
--            const double cordic_freq = if_freq * (-if_freq_sign);
-+            if (!std::signbit(fe_if_freq)) {
-+                if_freq *= -1.0;
-+            }
-+            const double cordic_freq = if_freq;
-             UHD_ASSERT_THROW(uhd::math::fp_compare::fp_compare_epsilon<double>(4.0)
-                              == std::abs(_adc_rate / cordic_freq));
- 
diff --git a/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
deleted file mode 100644
index b0cbffc245..0000000000
--- a/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3796175f32f0cc24c16809d8175d423bc7053de9 Mon Sep 17 00:00:00 2001
-From: StefanBruens <stefan.bruens@rwth-aachen.de>
-Date: Wed, 5 May 2021 18:24:58 +0200
-Subject: [PATCH] usrp2: Replace boost::math::iround/math::sign with std::lround
-
-Instead of multiplying zone with the sign repeatedly just make
-the zone a signed value.
-
-See #437, #438
-
-Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
-[gwenhael.goavec-merou@trabucayre.com: backport from upstream]
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- host/lib/usrp/usrp2/usrp2_impl.cpp | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
-index 1be4c7339..c0719a316 100644
---- a/host/lib/usrp/usrp2/usrp2_impl.cpp
-+++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
-@@ -22,6 +22,7 @@
- #include <boost/asio/ip/address_v4.hpp>
- #include <boost/asio.hpp> //used for htonl and ntohl
- #include <boost/thread.hpp>
-+#include <cmath>
- 
- using namespace uhd;
- using namespace uhd::usrp;
-@@ -844,20 +845,19 @@ double usrp2_impl::set_tx_dsp_freq(
-         _tree->access<double>("/mboards/"+mb+"/tick_rate").get();
- 
-     //calculate the DAC shift (multiples of rate)
--    const int sign = boost::math::sign(new_freq);
--    const int zone = std::min(boost::math::iround(new_freq/tick_rate), 2);
--    const double dac_shift = sign*zone*tick_rate;
-+    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
-+    const double dac_shift = zone * tick_rate;
-     new_freq -= dac_shift; //update FPGA DSP target freq
-     UHD_LOG_TRACE("USRP2",
-         "DSP Tuning: Requested " + std::to_string(freq_/1e6) + " MHz, Using "
--        "Nyquist zone " + std::to_string(sign*zone) + ", leftover DSP tuning: "
-+        "Nyquist zone " + std::to_string(zone) + ", leftover DSP tuning: "
-         + std::to_string(new_freq/1e6) + " MHz.");
- 
-     //set the DAC shift (modulation mode)
-     if (zone == 0) {
-         _mbc[mb].codec->set_tx_mod_mode(0); //no shift
-     } else {
--        _mbc[mb].codec->set_tx_mod_mode(sign*4/zone); //DAC interp = 4
-+        _mbc[mb].codec->set_tx_mod_mode(4 / zone); // DAC interp = 4
-     }
- 
-     return _mbc[mb].tx_dsp->set_freq(new_freq) + dac_shift; //actual freq
--- 
-2.32.0
-
diff --git a/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch b/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
deleted file mode 100644
index c5d303cd0a..0000000000
--- a/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d1c6290fe9c8b01068abfca6f272e2a1e031b9de Mon Sep 17 00:00:00 2001
-From: StefanBruens <stefan.bruens@rwth-aachen.de>
-Date: Wed, 5 May 2021 18:49:40 +0200
-Subject: [PATCH] usrp2: Use explicit template type for std::min<T>
-
-Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
-[gwenhael.goavec-merou@trabucayre.com: backport from upstream]
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- host/lib/usrp/usrp2/usrp2_impl.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
-index 59fd9849c..e82a9fa71 100644
---- a/host/lib/usrp/usrp2/usrp2_impl.cpp
-+++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
-@@ -845,7 +845,7 @@ double usrp2_impl::set_tx_dsp_freq(
-         _tree->access<double>("/mboards/"+mb+"/tick_rate").get();
- 
-     //calculate the DAC shift (multiples of rate)
--    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
-+    const int zone         = std::max(std::min<int>(std::lround(new_freq / tick_rate), 2), -2);
-     const double dac_shift = zone * tick_rate;
-     new_freq -= dac_shift; //update FPGA DSP target freq
-     UHD_LOG_TRACE("USRP2",
--- 
-2.32.0
-
diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 248e309dd5..75554259d0 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_UHD
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SERIALIZATION
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
@@ -76,11 +75,6 @@ config BR2_PACKAGE_UHD_MPMD
 	help
 	  enable MPMD support
 
-config BR2_PACKAGE_UHD_N230
-	bool "N230 support"
-	help
-	  enable N230 support
-
 config BR2_PACKAGE_UHD_N300
 	bool "N300 support"
 	select BR2_PACKAGE_UHD_MPMD
@@ -113,11 +107,6 @@ config BR2_PACKAGE_UHD_PYTHON
 	help
 	  enable python API support
 
-config BR2_PACKAGE_UHD_RFNOC
-	bool "RFNoC support"
-	help
-	  enable RFNoC support
-
 config BR2_PACKAGE_UHD_USB
 	bool "USB support"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
diff --git a/package/uhd/uhd.hash b/package/uhd/uhd.hash
index cfd1f3f641..3af1bc9251 100644
--- a/package/uhd/uhd.hash
+++ b/package/uhd/uhd.hash
@@ -1,4 +1,5 @@
 # Locally calculated:
-sha256  eed4a77d75faafff56be78985950039f8d9d1eb9fcbd58b8862e481dd49825cd  uhd-3.15.0.0.tar.gz
-sha256  8fc99820c2419d0de6bbbd319ff935d54960b37b716d0b4bb1c75de493f3e1fd  LICENSE.md
+sha256  8695800d593c58b557cbf9905b02bbf65a74ca68674e8c8c8c28bb6e203635ad  uhd-4.3.0.0.tar.gz
+sha256  94cc36ada2641d037980bf6c2418a750ac10a115ae11de5a5cda6177769dbd4c  LICENSE.md
 sha256  70bf7e79c8cd73a81f97ce81745ea0719a617eebe299a61868165daeae71fff2  host/LICENSE
+sha256  206adc03412b6c5b71b9c9df9c1f2e60e11833e89393877d5031fd11d332b1d4  fpga/usrp3/LICENSE.md
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index 2a5b69cefb..a9d711acd4 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-UHD_VERSION = 3.15.0.0
+UHD_VERSION = 4.3.0.0
 UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
-UHD_LICENSE = GPL-3.0+
-UHD_LICENSE_FILES = LICENSE.md host/LICENSE
+UHD_LICENSE = GPL-3.0+, LGPL-3.0+ (fpga/usrp3)
+UHD_LICENSE_FILES = LICENSE.md host/LICENSE fpga/usrp3/LICENSE.md
 
 UHD_SUPPORTS_IN_SOURCE_BUILD = NO
 UHD_SUBDIR = host
@@ -79,12 +79,6 @@ else
 UHD_CONF_OPTS += -DENABLE_MPMD=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_UHD_N230),y)
-UHD_CONF_OPTS += -DENABLE_N230=ON
-else
-UHD_CONF_OPTS += -DENABLE_N230=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_UHD_N300),y)
 UHD_CONF_OPTS += -DENABLE_N300=ON
 else
@@ -103,12 +97,6 @@ else
 UHD_CONF_OPTS += -DENABLE_OCTOCLOCK=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_UHD_RFNOC),y)
-UHD_CONF_OPTS += -DENABLE_RFNOC=ON
-else
-UHD_CONF_OPTS += -DENABLE_RFNOC=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_UHD_PYTHON),y)
 UHD_DEPENDENCIES += host-python-numpy host-python-requests \
 	python-numpy python-requests

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

