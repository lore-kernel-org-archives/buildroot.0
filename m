Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABBCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 22:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1872B410D0;
	Wed, 22 Jun 2022 22:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1872B410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAGAASVksXou; Wed, 22 Jun 2022 22:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E2184012E;
	Wed, 22 Jun 2022 22:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2184012E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7E791BF3A8
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 22:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C19D94012E
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 22:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19D94012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQjKVJdheXUP for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 22:25:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58184002B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D58184002B
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 22:25:03 +0000 (UTC)
Received: from pps.filterd (m0074334.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 25MLA955015347
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:53 GMT
Received: from xnwpv36.utc.com ([167.17.239.16])
 by mx0b-00105401.pphosted.com with ESMTP id 3gv28e6dtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:52 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xnwpv36.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 25MLKp5a093253
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:51 GMT
Received: from crulimr01.rockwellcollins.com ([10.172.224.19])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 25MLKpZR018974
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 21:20:51 GMT
X-Received: from jdknight-dev2.rccalab.inside (unknown [10.197.250.171])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 1362F60585;
 Wed, 22 Jun 2022 16:20:50 -0500 (CDT)
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 17:20:44 -0400
Message-Id: <20220622212045.573-1-james.knight@collins.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
X-Proofpoint-GUID: MA2DpyAtBQBS6XEIVHD536-2x7nny1Rh
X-Proofpoint-ORIG-GUID: MA2DpyAtBQBS6XEIVHD536-2x7nny1Rh
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 priorityscore=1501 mlxlogscore=911 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=fprRBV9YkWTesdNIyp1Aqu2W5b9cwfdfa6Y+iQXVqpc=;
 b=QnSmhmPdZXfekLAs+zvlQOnzVGtfzC6HtJRFioN8MPnsolGlAgzqX9JRSvcFGJltkNnn
 wLkFfiCtjTrjrPc19p7Wu3NK1BT9WFxPcwvhSf5OtBP/hdM+w4VZFPLDa6qMM40b8ky1
 dlPsyHxW4AnF90Fc0///unq7XaMH6TK6ZjowJpHpAVNlCad3I5GkA2UPSr3lmcT2BArj
 5FxmiBGwwSACadieeggFBKhVcLRM1ufaLRLzoPdRuAup+POVB+jKZZwhj2My9ccocKFt
 tZdk/npsbS1Jo3UAdY/8Te06aEuEGD70dXEbNai/9IhrmiLeEyGipbnyiM+Xv9HEG0tJ bQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=QnSmhmPd
Subject: [Buildroot] [PATCH 1/2] package/skeleton-init-openrc: prepare
 runlevels from make over skeleton
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
From: James Knight via buildroot <buildroot@buildroot.org>
Reply-To: James Knight <james.knight@collins.com>
Cc: James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following commit changes the creation of an OpenRC environment's
`/etc/runlevels/default/sysv-rcs` symbolic link from the skeleton to
inside the package's Makefile (triggered from the
`SKELETON_INIT_OPENRC_INSTALL_TARGET_CMDS` call). The original symlink
to a `/etc/init.d/sysv-rcs` path may not gracefully work for all
developer environments. For example, on a fresh checkout in a Windows
environment, the symbolic link may be automatically updated to
include a drive specification. For example:

    $ git diff
    diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
    index ef5e00823c..e417b4bb44 120000
    --- a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
    +++ b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
    @@ -1 +1 @@
    -/etc/init.d/sysv-rcs
    \ No newline at end of file
    +G:/etc/init.d/sysv-rcs
    \ No newline at end of file

If a developer built with fresh checkout using an example
`qemu_x86_defconfig` tailored to target an OpenRC init system, an
improper symlink can be observed in the target system:

    ...
    Welcome to Buildroot
    buildroot login: root
    Jun 22 20:42:34 login[971]: root login on 'console'
    # /etc/runlevels/default/sysv-rcs  --version
    -sh: /etc/runlevels/default/sysv-rcs: not found
    # readlink /etc/runlevels/default/sysv-rcs
    /??/G:/etc/init.d/sysv-rcs
    #  /etc/init.d/sysv-rcs --version
    sysv-rcs (OpenRC) 0.43.3 (Buildroot 2022.05-225-g64390b6c42-dirty)

By switching from having the symbolic link in the skeleton file to
building it during the package's install stage, this (1) prevents
oddities with a Git working environment on environments like Windows,
as well as (2) ensures a proper symlink is created in a Windows
environment. For example:

    # readlink /etc/runlevels/default/sysv-rcs
    /etc/init.d/sysv-rcs
    # /etc/runlevels/default/sysv-rcs --version
    sysv-rcs (OpenRC) 0.43.3 (Buildroot 2022.05-225-g64390b6c42-dirty)

Signed-off-by: James Knight <james.knight@collins.com>
---
 package/skeleton-init-openrc/skeleton-init-openrc.mk             | 1 +
 .../skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 120000 package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs

diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
index b0538ad03ff6203cbe24ebc2e2e4bd2a5af4bed9..625c5d8a8ea0476f9574da9718083c3de69a3c1f 100644
--- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
+++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
@@ -32,6 +32,7 @@ endif # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 define SKELETON_INIT_OPENRC_INSTALL_TARGET_CMDS
 	$(call SYSTEM_RSYNC,$(SKELETON_INIT_OPENRC_PKGDIR)/skeleton,$(TARGET_DIR))
 	$(SKELETON_INIT_OPENRC_ROOT_RO_OR_RW)
+	ln -s /etc/init.d/sysv-rcs $(TARGET_DIR)/etc/runlevels/default/sysv-rcs
 endef
 
 $(eval $(generic-package))
diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
deleted file mode 120000
index ef5e00823c63ed0244be26e6082e17d8e135f5ea..0000000000000000000000000000000000000000
--- a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
+++ /dev/null
@@ -1 +0,0 @@
-/etc/init.d/sysv-rcs
\ No newline at end of file
-- 
2.30.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
