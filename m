Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFA7EE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7B3082155;
	Wed,  6 Sep 2023 19:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7B3082155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-ISfzTsaXkc; Wed,  6 Sep 2023 19:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8835821C3;
	Wed,  6 Sep 2023 19:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8835821C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49EAE1BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FB1405EF
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23FB1405EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXZcCrBbnFwL for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20E36415AB
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E36415AB
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 386JcvZ3019516; Wed, 6 Sep 2023 19:46:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxyj5rdv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 386IoQa1021478; Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfryp8g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:12 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 386JkCVn59310354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF4A258060;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D567258056;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 488F4CB579; Wed,  6 Sep 2023 14:46:11 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 14:46:08 -0500
Message-Id: <20230906194609.74080-5-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230906194609.74080-1-arbab@linux.ibm.com>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -ZuAI979K-nT0zHVRhRwM5cf2HPU637k
X-Proofpoint-GUID: -ZuAI979K-nT0zHVRhRwM5cf2HPU637k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uazBPmZwtIuVp2vnOytQb8RiDV26U1zf5j7xvrUAcx8=;
 b=FshJ8keTRacm6HnqqZMxerGD8ybpyJPzHquv7ETHMGiMnwoEiM5BgGukd72ifGxe1Dg0
 vCsV5Uffg5Svmu4XDGnsVtbuzr/RXxL4sRFudX5NXmwJpOGfHTQNi0EhoaJUodMZbJjQ
 F2cGHumHhHGbS1AmHB4V0gwW4r78tRsFJID+FRa/nat3lbZhugPhS5O4lv1xBG0LbpoM
 9EtdzO1lZtZtjCOBq0dqAo21MPmo0g1BN++6U+MWxlMkk5fB8LeTLkE5j7tehk7ZAiiB
 lZhXTII04g90FBC28K5ZwfkZbhFjpbEIxuLKRiNs06DgS3vpPDLLGxrcl9YUiGW3HIE0 7A== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=FshJ8keT
Subject: [Buildroot] [PATCH 4/5] package/petitboot: enable discovery of
 software RAID devices
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
Cc: Reza Arbab <arbab@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petitboot can support filesystems on software RAID arrays. If mdadm is
selected, install the associated udev rules to assemble the device.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/63-md-raid-arrays.rules | 41 ++++++++++++++
 package/petitboot/65-md-incremental.rules | 69 +++++++++++++++++++++++
 package/petitboot/petitboot.mk            | 10 ++++
 3 files changed, 120 insertions(+)
 create mode 100644 package/petitboot/63-md-raid-arrays.rules
 create mode 100644 package/petitboot/65-md-incremental.rules

diff --git a/package/petitboot/63-md-raid-arrays.rules b/package/petitboot/63-md-raid-arrays.rules
new file mode 100644
index 000000000000..92aec36e69d4
--- /dev/null
+++ b/package/petitboot/63-md-raid-arrays.rules
@@ -0,0 +1,41 @@
+# do not edit this file, it will be overwritten on update
+
+SUBSYSTEM!="block", GOTO="md_end"
+
+# handle md arrays
+ACTION!="add|change", GOTO="md_end"
+KERNEL!="md*", GOTO="md_end"
+
+# partitions have no md/{array_state,metadata_version}, but should not
+# for that reason be ignored.
+ENV{DEVTYPE}=="partition", GOTO="md_ignore_state"
+
+# container devices have a metadata version of e.g. 'external:ddf' and
+# never leave state 'inactive'
+ATTR{md/metadata_version}=="external:[A-Za-z]*", ATTR{md/array_state}=="inactive", GOTO="md_ignore_state"
+TEST!="md/array_state", ENV{SYSTEMD_READY}="0", GOTO="md_end"
+ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0", GOTO="md_end"
+LABEL="md_ignore_state"
+
+IMPORT{program}="/sbin/mdadm --detail --export $devnode"
+ENV{DEVTYPE}=="disk", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}", OPTIONS+="string_escape=replace"
+ENV{DEVTYPE}=="disk", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}"
+ENV{DEVTYPE}=="disk", ENV{MD_DEVNAME}=="?*", SYMLINK+="md/$env{MD_DEVNAME}"
+ENV{DEVTYPE}=="partition", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}-part%n", OPTIONS+="string_escape=replace"
+ENV{DEVTYPE}=="partition", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}-part%n"
+ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[^0-9]", SYMLINK+="md/$env{MD_DEVNAME}%n"
+ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[0-9]", SYMLINK+="md/$env{MD_DEVNAME}p%n"
+
+IMPORT{builtin}="blkid"
+OPTIONS+="link_priority=100"
+OPTIONS+="watch"
+ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{ID_FS_UUID_ENC}=="?*", SYMLINK+="disk/by-uuid/$env{ID_FS_UUID_ENC}"
+ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
+
+ENV{MD_LEVEL}=="raid[1-9]*", ENV{SYSTEMD_WANTS}+="mdmonitor.service"
+
+# Tell systemd to run mdmon for our container, if we need it.
+ENV{MD_LEVEL}=="raid[1-9]*", ENV{MD_CONTAINER}=="?*", PROGRAM="/usr/bin/readlink $env{MD_CONTAINER}", ENV{MD_MON_THIS}="%c"
+ENV{MD_MON_THIS}=="?*", PROGRAM="/usr/bin/basename $env{MD_MON_THIS}", ENV{SYSTEMD_WANTS}+="mdmon@%c.service"
+
+LABEL="md_end"
diff --git a/package/petitboot/65-md-incremental.rules b/package/petitboot/65-md-incremental.rules
new file mode 100644
index 000000000000..153d12fe6f7e
--- /dev/null
+++ b/package/petitboot/65-md-incremental.rules
@@ -0,0 +1,69 @@
+# This file causes block devices with Linux RAID (mdadm) signatures to
+# automatically cause mdadm to be run.
+# See udev(8) for syntax
+
+# Don't process any events if anaconda is running as anaconda brings up
+# raid devices manually
+ENV{ANACONDA}=="?*", GOTO="md_end"
+
+# Also don't process disks that are slated to be a multipath device
+ENV{DM_MULTIPATH_DEVICE_PATH}=="?*", GOTO="md_end"
+
+# We process add events on block devices (since they are ready as soon as
+# they are added to the system), but we must process change events as well
+# on any dm devices (like LUKS partitions or LVM logical volumes) and on
+# md devices because both of these first get added, then get brought live
+# and trigger a change event.  The reason we don't process change events
+# on bare hard disks is because if you stop all arrays on a disk, then
+# run fdisk on the disk to change the partitions, when fdisk exits it
+# triggers a change event, and we want to wait until all the fdisks on
+# all member disks are done before we do anything.  Unfortunately, we have
+# no way of knowing that, so we just have to let those arrays be brought
+# up manually after fdisk has been run on all of the disks.
+
+# First, process all add events (md and dm devices will not really do
+# anything here, just regular disks, and this also won't get any imsm
+# array members either)
+SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	RUN+="/sbin/mdadm -I --export $env{DEVNAME}"
+
+# Next, check to make sure the BIOS raid stuff wasn't turned off via cmdline
+IMPORT{cmdline}="noiswmd"
+IMPORT{cmdline}="nodmraid"
+ENV{noiswmd}=="?*", GOTO="md_imsm_inc_end"
+ENV{nodmraid}=="?*", GOTO="md_imsm_inc_end"
+SUBSYSTEM=="block", ACTION=="add", ENV{ID_FS_TYPE}=="isw_raid_member", \
+	RUN+="/sbin/mdadm -I $env{DEVNAME}"
+LABEL="md_imsm_inc_end"
+
+SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}=="?*", \
+	RUN+="/sbin/mdadm -If $name --path $env{ID_PATH}"
+SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}!="?*", \
+	RUN+="/sbin/mdadm -If $name"
+
+# Next make sure that this isn't a dm device we should skip for some reason
+ENV{DM_UDEV_RULES_VSN}!="?*", GOTO="dm_change_end"
+ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="dm_change_end"
+ENV{DM_SUSPENDED}=="1", GOTO="dm_change_end"
+KERNEL=="dm-*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+LABEL="dm_change_end"
+
+# Finally catch any nested md raid arrays.  If we brought up an md raid
+# array that's part of another md raid array, it won't be ready to be used
+# until the change event that occurs when it becomes live
+KERNEL=="md*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+
+# In case the initramfs only started some of the arrays in our container,
+# run incremental assembly on the container itself.  Note: we ran mdadm
+# on the container in 64-md-raid.rules, and that's how the MD_LEVEL
+# environment variable is already set.  If that disappears from the other
+# file, we will need to add this line into the middle of the next rule:
+#	IMPORT{program}="/sbin/mdadm -D --export $tempnode", \
+
+SUBSYSTEM=="block", ACTION=="add|change", KERNEL=="md*", \
+	ENV{MD_LEVEL}=="container", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+
+
+LABEL="md_end"
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 9326738aa038..596e801b781c 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -46,6 +46,16 @@ else
 PETITBOOT_CONF_OPTS += --without-fdt
 endif
 
+ifeq ($(BR2_PACKAGE_MDADM),y)
+define PETITBOOT_POST_INSTALL_MDADM
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/63-md-raid-arrays.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/63-md-raid-arrays.rules
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/65-md-incremental.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/65-md-incremental.rules
+endef
+PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_MDADM
+endif
+
 define PETITBOOT_POST_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
 		$(TARGET_DIR)/usr/libexec/petitboot/bb-kexec-reboot
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
