Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E7FC433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 22:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6BD60B1A;
	Fri,  7 Oct 2022 22:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF6BD60B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjB4TIlIPmXT; Fri,  7 Oct 2022 22:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D43B607B5;
	Fri,  7 Oct 2022 22:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D43B607B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 680B31BF2BB
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 22:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 506DC60750
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 22:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 506DC60750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIgcoPjTCGMV for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 22:06:06 +0000 (UTC)
X-Greylist: delayed 00:46:26 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1DC860B3B
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1DC860B3B
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 22:06:05 +0000 (UTC)
Received: from pps.filterd (m0072139.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 297LFGVN035105
 for <buildroot@buildroot.org>; Fri, 7 Oct 2022 21:19:39 GMT
Received: from xnwpv38.utc.com ([167.17.239.18])
 by mx0a-00105401.pphosted.com with ESMTP id 3k2s3f1r26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 21:19:38 +0000
Received: from qusnwadx.utcapp.com (QUSNWADX.utcapp.com [10.161.48.88])
 by xnwpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 297LJZc2183873
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Fri, 7 Oct 2022 21:19:35 GMT
Received: from dtulimr01.rockwellcollins.com ([10.172.224.19])
 by qusnwadx.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 297LJYkR009108
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Fri, 7 Oct 2022 21:19:35 GMT
X-Received: from crulcabin17.rockwellcollins.lab
 (crulcabin17.rockwellcollins.lab [10.148.24.109])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 63EF460428;
 Fri,  7 Oct 2022 16:19:34 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 16:19:32 -0500
Message-Id: <20221007211932.481-1-prabhu.sannachi@collins.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-ORIG-GUID: QzpO71Eh3dt2uc5g4kI110AvwvzlKGiQ
X-Proofpoint-GUID: QzpO71Eh3dt2uc5g4kI110AvwvzlKGiQ
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210070127
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id; s=POD051818;
 bh=b03ceU8+xpMRZtQFeOi2pcBubQxQLYH4aI7mDw6S2XA=;
 b=NtVjDkoB/dJGNP6Eb47k4VO3BU4TGa2zFnsEJHYnnVOr3Uh3R6LUFgi+yCEho0DXyxui
 y+dAwR8v/yfhioxW5uZ6gAZ7lSorsVIawAkrxHq7xZOFowJg3AmKYpwO50t2lMkzAzrl
 kbvbX3VMkQkaJWGZygR/pFuwK5CpSjqj4zxeGqxHUJj3ygPibJOQg6KAhuwCjo9bhtZ0
 MWx+jTyMpvScQ3dnk8TbvyFb+VjNryPp5CzMf76IlhwoMnqEG5atvDkr+VRRpw0/nhLd
 /WrmcZlPsLGFc2trbzSow61WnxYsUVJ10/IvOLhcdv/MZcBw6QyHCCtNugfA9TYnlil7 2w== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=NtVjDkoB
Subject: [Buildroot] [PATCH v1 1/1] package/redis-plus-plus: new package
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
From: prabhu sannachi via buildroot <buildroot@buildroot.org>
Reply-To: prabhu sannachi <prabhu.sannachi@collins.com>
Cc: prabhusannachi <prabhu.sannachi@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: prabhusannachi <prabhu.sannachi@collins.com>

Redis client written in C++

This is a C++ client library for Redis.
It's based on hiredis, and is compatible
with C++ 17, C++ 14, and C++ 11.

https://github.com/sewenew/redis-plus-plus

Signed-off-by: Prabhu Sannachi <prabhu.sannachi@collins.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/redis-plus-plus/Config.in            | 11 +++++++++++
 package/redis-plus-plus/redis-plus-plus.hash |  3 +++
 package/redis-plus-plus/redis-plus-plus.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 45 insertions(+)
 create mode 100644 package/redis-plus-plus/Config.in
 create mode 100644 package/redis-plus-plus/redis-plus-plus.hash
 create mode 100644 package/redis-plus-plus/redis-plus-plus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6..2f24fca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2435,6 +2435,9 @@ F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
 
+N:      Prabhu Sannachi <prabhu.sannachi@collins.com>
+F:      package/redis-plus-plus/
+
 N:	Rafal Susz <rafal.susz@gmail.com>
 F:	board/avnet/s6lx9_microboard/
 F:	configs/s6lx9_microboard_defconfig
diff --git a/package/Config.in b/package/Config.in
index e3a34d6..8235864 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1491,6 +1491,7 @@ if BR2_PACKAGE_POSTGRESQL
 	source "package/postgis/Config.in"
 endif
 	source "package/redis/Config.in"
+	source "package/redis-plus-plus/Config.in"
 	source "package/rocksdb/Config.in"
 	source "package/sqlcipher/Config.in"
 	source "package/sqlite/Config.in"
diff --git a/package/redis-plus-plus/Config.in b/package/redis-plus-plus/Config.in
new file mode 100644
index 0000000..3c23dc5
--- /dev/null
+++ b/package/redis-plus-plus/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_REDIS_PLUS_PLUS
+	bool "redis-plus-plus"
+	select BR2_PACKAGE_HIREDIS
+	help
+	  Redis client written in C++
+
+	  This is a C++ client library for Redis.
+	  It's based on hiredis, and is compatible
+	  with C++ 17, C++ 14, and C++ 11.
+
+	  https://github.com/sewenew/redis-plus-plus
diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
new file mode 100644
index 0000000..93e58e2
--- /dev/null
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  a49a72fef26ed39d36a278fcc4e4d92822e111697b5992d8f26f70d16edc6c1f  redis-plus-plus-1.3.5.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
new file mode 100644
index 0000000..145fcbe
--- /dev/null
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# redis-plus-plus
+#
+################################################################################
+
+REDIS_PLUS_PLUS_VERSION =  1.3.5
+REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
+REDIS_PLUS_PLUS_LICENSE =  Apache-2.0 license
+REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
+REDIS_PLUS_PLUS_INSTALL_STAGING = YES
+REDIS_PLUS_PLUS_DEPENDENCIES += hiredis
+
+# since version 1.3.0, by default, redis-plus-plus is built with the -std=c++17 standard
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
+    REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=14
+  else
+    REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_CXX_STANDARD=11
+  endif
+endif
+
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
+  REDIS_PLUS_PLUS_CONF_OPTS += -DREDIS_PLUS_PLUS_BUILD_TEST=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.7.4

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
