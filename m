Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D9FC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 19:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D224E40C33;
	Wed, 28 Sep 2022 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D224E40C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNq-ywM9WaDV; Wed, 28 Sep 2022 19:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81FF940C1C;
	Wed, 28 Sep 2022 19:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81FF940C1C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 000161BF3E0
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEB66610BB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 19:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEB66610BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIRk7gpHXBTb for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 19:28:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E95E2610CB
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTP id E95E2610CB
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 19:28:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dcixoHwuLRFZ1dcixo7hyt; Wed, 28 Sep 2022 21:28:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 21:28:02 +0200
Message-Id: <20220928192802.437811-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOheTQ7m8wH7JI3bIEVViHWyGi1cTKuiICDmpjXAAI62i6Huiwu8YEXqlB8o+uyL2AjrWXaFrqYbBYQex0swapcGr+sVR94/txnI39CXMUPv2ED2ypoZ
 lgXHNiyt59VCv6/UnojnFaT7XuGa7EGRSu4tTaLrNjgjRH7vXGF3QZs+bg7qXkW6UvlX5Lgo4UdMWM4lwKpl36hJX4XIfm+CTTD1WRqo0atH/nipviv4Go85
 orlZ8mSwwn2BBFZgWm1khkFgilPb9sqRvXqQ1kGJF8m6I7Tonw8Ga+7rYxNBWdb0WwMxjvgwJDMa6Ry/mn0JzQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664393283; bh=I3T9t60S/9kD6GQPYSMzW/XwU9zbXW7A5eenAJiwLo8=;
 h=From:To:Subject:Date:MIME-Version;
 b=FMzRAFBZM7QAhW/VSwC/3NQhOrooUJrPY6rhr36MD78GL/OG1RcuoWfQKh4mD4DuA
 lW28ZgcjMhN9DoIUSyUBtp1naC9n2bb3OlF3YXyQWVMQmUy5SpZTLBc0Kz/6vDVde3
 iOcg++lNdq0Pi/9ljn9T9UA/tWLOM/1cmEITlyCygDyUMHEMOqxuN0fxpyc7G3Lln+
 Dn8FaihTQFcwkihHjnS4eaCeTYdOjQdC1HjPL3b7+Ovzm9KlsEMYp3k2ddmcr3tDnM
 GLzi6g751wOa9zmssbDgK/smOb7gKLfmCyK2Jm/VUUgXZZGQ6mEzEXTQE62MjfagBq
 EcQB9qtr5dunA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FMzRAFBZ
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 wrong endianness
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment rtl8189es module has -DCONFIG_LITTLE_ENDIAN hardcoded and
there is no way to override it. So to do this let's add a patch that is
pending upstream[1] to allow to override CFLAGS and then let's undefine
CONFIG_LITTLE_ENDIAN and define the correct endianness in rtl8189es.mk

Fixes:
http://autobuild.buildroot.net/results/3bcad5e88876c86a2a3338961ed20f28b5953779/

[1]: https://github.com/jwrdegoede/rtl8189ES_linux/pull/83

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
 package/rtl8189es/rtl8189es.mk                |  8 +++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..dc4deff9f1
--- /dev/null
+++ b/package/rtl8189es/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,40 @@
+From 4a555ffb77a5947814b6c7f330968318e265c496 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Sep 2022 21:17:17 +0200
+Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
+ end of EXTRA_FLAGS assignment
+
+At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
+since it's assigned at the beginning of the Makefile. For example it's not
+possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
+allow to build these modules for big endian architectures. So let's move
+the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
+EXTRA_CFLAGS assignment.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream status: https://github.com/jwrdegoede/rtl8189ES_linux/pull/83]
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8fcb7bd..e4664e9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -2239,6 +2238,8 @@ ifneq ($(USER_MODULE_NAME),)
+ MODULE_NAME := $(USER_MODULE_NAME)
+ endif
+ 
++EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
++
+ ifneq ($(KERNELRELEASE),)
+ 
+ ########### this part for *.mk ############################
+-- 
+2.34.1
+
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 2fa6a3a483..cddcb195f9 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -8,10 +8,16 @@ RTL8189ES_VERSION = 39c17661136da48f8e9c644194dce6a7f5076896
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
+# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
+RTL8189ES_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
+# Set endianness
+RTL8189ES_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
 RTL8189ES_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189ES=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="$(RTL8189ES_USER_EXTRA_CLAGS)"
 
 define RTL8189ES_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
