Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9E1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 02:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6219240465;
	Mon, 31 Jan 2022 02:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfE-P5xmFeRa; Mon, 31 Jan 2022 02:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F4B74047C;
	Mon, 31 Jan 2022 02:16:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 618AB1BF471
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FC9440465
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 02:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Et01YEl9vxG9 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 02:16:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39B8140420
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 02:16:46 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id i1so10416659ils.5
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 18:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1aQNqM/QSZ5P6DRoMKcGZug/xowEDW2WT3iQ8TVjj+M=;
 b=MvBLwx/toQJ4eoN8RcaMMqyUK/xlGQH+7ftIBjz2GTeCBDKrsKDtC9LKxttEWwgrXv
 jh5wfNvnZ7P2mqMsSHdPOtB/aAO67ZC6OsGo7kvzsHxiU0ycmZ5703QJ5NrhiELfEwAW
 yKQSyBhNVNiMutc1AcLJDoTr5cfVoz0MBeUPmCnpLRUXHElY1xOLLNbUVS+hy+Rd1B6Y
 wWzQuaC+mN0uQh0FzK4ZJdur6jDwnPOomn0Nc/PsDKfW/MKddKtkgRnYYiSHsmMC3qdz
 E/Ua/fCjGP8154Me90QAeT82qMdLbMKtqBWCb5MThVU2w5roibjR37PF5aPaw7D3Z8T1
 j8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1aQNqM/QSZ5P6DRoMKcGZug/xowEDW2WT3iQ8TVjj+M=;
 b=kM2q9HnGdH3boTvklA17f12/ltQPeR/Pw73jnWahqxllAd/dvUzAbvrZ3sfqgC9L1L
 xm0oBNkEJ1CP2USGBM0a+xVUqO81xKfqZK5cHpdJfjTvhbUEOw3IkFO4eVT8BVsHNI/8
 SEjUEe0ELgsRCuC3e3ncEFk5tVYx0WjwUgVmWtN5m2e0UZpcpsDqsHPp69RWQCHvQGY+
 CuJfHR10qWQIuDnp0kFsfUT6/dND0T+Jz5dYnr/0k1Icn3BLwTF3Smy7aV5QlW4opdlS
 8j5Ns5vUp2M3BIQUPSOoK7H++dh7tTLOOIrkCCAszasnfhjnlNl/fFIjc2yAi9i9BOAH
 i8Qw==
X-Gm-Message-State: AOAM532SXIN6gnZBOSv0SblMfZEJLYL18t0QFHCYkn0VoIxmOsvscCRr
 ERza9xE49G13AIxQWYkQSbEQM5q/nno=
X-Google-Smtp-Source: ABdhPJw/T5iMGlvpAAuZchKsn++43IXgno7b8RDok4a1bUlzV8lB23X7KBwkolc+NMqMPwKYO5vbLA==
X-Received: by 2002:a92:2804:: with SMTP id l4mr2483268ilf.292.1643595405104; 
 Sun, 30 Jan 2022 18:16:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id g8sm17349487ilc.10.2022.01.30.18.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 18:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 19:16:09 -0700
Message-Id: <20220131021609.4117295-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bpftool: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This tool is needed for enabling features such as the systemd
bpf-framework(to be added in a future patch).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/bpftool/bpftool.hash |  5 +++++
 package/bpftool/bpftool.mk   | 25 +++++++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/bpftool/bpftool.hash
 create mode 100644 package/bpftool/bpftool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1ec9a091e..51b52871ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1282,6 +1282,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
+F:	package/bpftool/
 F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
new file mode 100644
index 0000000000..c7d4ae250e
--- /dev/null
+++ b/package/bpftool/bpftool.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  c868cb85bf44195ec6cd20649c3db4f7aff64a38d950a1c2911d981fb2d7042c  bpftool-a7f0e7f057283ae8af3de4578bcb8b7ee80b7144-br1.tar.gz
+sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
new file mode 100644
index 0000000000..21ade92789
--- /dev/null
+++ b/package/bpftool/bpftool.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# bpftool
+#
+################################################################################
+
+BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
+BPFTOOL_SITE = https://github.com/libbpf/bpftool
+BPFTOOL_SITE_METHOD = git
+BPFTOOL_GIT_SUBMODULES = YES
+BPFTOOL_LICENSE = GPL-2.0, BSD-2-Clause
+BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
+HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
+
+define HOST_BPFTOOL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src
+endef
+
+define HOST_BPFTOOL_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install DESTDIR="$(HOST_DIR)" prefix=/usr
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
