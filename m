Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29434C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 15:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86584418ED;
	Fri, 18 Aug 2023 15:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86584418ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsE365jHfu6r; Fri, 18 Aug 2023 15:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4071A42075;
	Fri, 18 Aug 2023 15:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4071A42075
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DF071BF2EC
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC6574198F
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 15:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC6574198F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ty7wkhHWxVEv for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 15:52:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B8C41979
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 15:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B8C41979
Received: from pwmachine.numericable.fr (85-170-34-233.rev.numericable.fr
 [85.170.34.233])
 by linux.microsoft.com (Postfix) with ESMTPSA id C3945211F7D8;
 Fri, 18 Aug 2023 08:52:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C3945211F7D8
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 17:52:15 +0200
Message-Id: <20230818155219.71054-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1692373962;
 bh=VZIwIitGpKsjDlLph6Axu8TDdR3n4FZlEl4mssfeVS0=;
 h=From:To:Cc:Subject:Date:From;
 b=UYave/ijlfhclZuaB++G1wKTPjGW3+vrU4i28F5pJG8xTDIYuSqzl/4luDL9WO/Fg
 xr/1tVJrrIdiGO//egJG3G4l1P5/jiCpuGyQEgDUgdrvxZUrbBe0LoP+b8eUltZ54S
 HxCeTanwCczUjQRqm8OGOnuKZYZkrWjeATvkNK2s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=UYave/ij
Subject: [Buildroot] [RFC PATCH v3 0/3] Bump sysdig and falco libs
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.


With this contribution, I bumped sysdig and falcosecurity-libs.
Sadly, I am not fully satisfied with the result, hence the fact I marked it as
RFC because I would like to get your feedback to make it better.

First of all, sysdig builds and runs:
Welcome to Buildroot
buildroot login: root
# sysdig --version
sysdig version 0.31.4
# sysdig | head
scap: loading out-of-tree module taints kernel.
scap: driver loading, scap
scap: adding new consumer (____ptrval____)
scap: initializing ring buffer for CPU 0
scap: CPU buffer initialized, size=8388608
26 15:12:28.226519423 0 sysdig (108) > switch next=0 pgft_maj=10 pgft_min=1348 vm_size=47288 vm_rss=19408 vm_swap=0
27 15:12:28.227409149 0 <NA> (0) > switch next=13 pgft_maj=0 pgft_min=0 vm_size=0 vm_rss=0 vm_swap=0
...

Nonetheless, I had to increase the minimal size of the image as libsinsp.a is
quite big:
# du -sh /sysdig/libsinsp.a
171.4M  /sysdig/libsinsp.a
I am not forcefully sure where this library is used, I will investigate and
maybe we can run everything without it.
This /sysdig directory is installed by sysdig Cmake due to the following being
present in cmake_install.cmake:
if(CMAKE_INSTALL_COMPONENT STREQUAL "scap" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/sysdig/driver/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/sysdig/driver" TYPE DIRECTORY FILES "/home/francis-buildroot/buildroot/output/build/sysdig-0.31.4/buildroot-build/driver/src/" FILES_MATCHING>
endif()

Changes since:
 v1:
  * Removed everything regarding VALIJSON in sysdig.mk.
  * Bumped first falcosecurity-libs to avoid problem when building it.
  * Added runtime test for sysdig.
 v2:
  * Automatically got value for API_VERSION and SCHEMA_VERSION.
  * Added DEPS as sysdig dependencies.

Francis Laniel (3):
  package/falcosecurity-libs: bump to version 0.10.5
  package/sysdig: bump to version 0.31.4
  support/testing/package: add new test for sysdig

 .../0002-cmake-Install-shared-libraries.patch | 61 +++++++++++++++++++
 .../falcosecurity-libs.hash                   |  2 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 29 +++++----
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      | 15 ++++-
 .../testing/tests/package/test_sysdig.config  |  1 +
 support/testing/tests/package/test_sysdig.py  | 46 ++++++++++++++
 7 files changed, 140 insertions(+), 16 deletions(-)
 create mode 100644 package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
 create mode 100644 support/testing/tests/package/test_sysdig.config
 create mode 100644 support/testing/tests/package/test_sysdig.py

--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
