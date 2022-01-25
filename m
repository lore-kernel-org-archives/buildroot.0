Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA771C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C3654034C;
	Tue, 25 Jan 2022 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_uvH5JLaJ3p; Tue, 25 Jan 2022 21:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6C640341;
	Tue, 25 Jan 2022 21:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5C71BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F240B6080A
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krmUfpI87S7D for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D116D60759
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:09:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s18so22163808wrv.7
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1bHxo8kd7d5OmmMtoQHmqnvi+YiKWx2ZqWPMHRElaw=;
 b=al7J+TDrwlxK+OCUQpDM6YjGiaGVMEsB0lvD4NRf1I99A83KDRaZPBx+ANX5TCS5Nx
 hd/YTo6GHQk7Rj1PvX/vfxgRC689gPJDqZarsgvX9gKuX/hkstCOVjrkEcraWHm1KuZ0
 ZSSUt1bNHuldJygrgNps/6yzGcVTwp7C+2RO6dNdsYdi0qnALDz7YhoSSYKogZiijTHA
 anUBfmBlx40eVZTyj9ZQG/bvb4ci7IfKktIm221vRpv9waszXdQNs54ddE22xQT4LShz
 jP/fCGvpxc2XPZGqKPaSGys1FvRWUd2WXAlw26tIS/TuDxZsb4XCc9yzFkLcGeI2Qbgq
 tVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1bHxo8kd7d5OmmMtoQHmqnvi+YiKWx2ZqWPMHRElaw=;
 b=vboX3iVwdiWztI9ufGnggtZN0LIPKK0OBMigs2etgt8loCBf+Gvjepc9c67OCBEJN8
 OUNs7vqnIFY0M6jZVEds3C4ENb6u/lMlUVXiTC/T8K8glBxTyiL2baCWId2AvTvJzXIJ
 dSu3JerRzWNOu/jgifc1eEhkwrm6SPEffV1iXzLfCNJZ9mJz5T0MKf0+d8lL7s3j8gIE
 bf6s3e87CpCS6OXS8BaTZHHodU09/Z7duPMNdAMmb3T39meKH5rqiS/PJVtgVUo6SGrr
 lqMQnNlL9AsgusnYCS4cpVJgrYz+8rYHJtzsQqctBete0AWeftzPI4B/ARSnLWbqf0vv
 47qQ==
X-Gm-Message-State: AOAM533EVZceFqXtqyjaCzUh2AViwzD2Y2yv0WE0iRIvfplQ+5gPkSrd
 RDDIvf29jAlG81e3gTElzjKzoHaKGtg=
X-Google-Smtp-Source: ABdhPJzF8/AzOAfwte9Hcg+EWLumAeEw/cQjMh7NGe1ZoWoZemtUE/kwIHWEagP7Pp+ZP6aO7NET/A==
X-Received: by 2002:a5d:59ac:: with SMTP id p12mr2436415wrr.437.1643144988769; 
 Tue, 25 Jan 2022 13:09:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u3sm7924508wrs.55.2022.01.25.13.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 13:09:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:08:00 +0100
Message-Id: <20220125210800.299916-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netopeer2: disable tests
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tests which are enabled since bump to version 2.0.35 in commit
13d4856b916d797c3c771669edd3eb883336766f and
https://github.com/CESNET/netopeer2/commit/466a0b3c268ee319b4f65980404715a2723b4c0a
to avoid the following build failure if cmocka is built before
netopeer2:

In file included from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
                 from /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
                 from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/libyang/libyang.h:18,
                 from /home/buildroot/autobuild/instance-2/output-1/build/netopeer2-2.0.35/tests/test_sub_ntf.c:27:
/home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
   53 | typedef unsigned _Addr uintptr_t;
      |                        ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0660a4f767d5cdaf07b28a508101b87f0300850f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netopeer2/netopeer2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index c8b6763313..43f22b7e4c 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -11,7 +11,9 @@ NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
 NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
-NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
+NETOPEER2_CONF_OPTS = \
+	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
+	-DENABLE_TESTS=OFF
 
 # Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
 # files. This also ensures that concurrent parallel builds will not be
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
