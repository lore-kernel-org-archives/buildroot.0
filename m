Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A21C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDA361163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BDA361163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E18C403C7;
	Wed,  6 Oct 2021 20:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4bNG-KH9b5V; Wed,  6 Oct 2021 20:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3226E40384;
	Wed,  6 Oct 2021 20:43:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6321BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 476BC40726
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzUGQDIlMR-3 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:42:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26D3A406CC
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:42:04 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id oa4so2431006pjb.2
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yALcxjYVGWIDrwFzx2o0FES6iAM7lC6LQUbFFg7YPVM=;
 b=fjz5rRQuSGJZQFboBQp0bwT4ndgZxwAd/Szv6CL6nz8HpDDfl7BM+E8T3MZl9huLRu
 RQRo/Vw1A4UEIMXjofXa4TXDsu+xp6YTqHGgmHQxikHvtD2CPh8li/iWgwyYjbfHbeVZ
 j4qUR5bAuJNqRnm/hkd0YZeQF81O6ODnN6DOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yALcxjYVGWIDrwFzx2o0FES6iAM7lC6LQUbFFg7YPVM=;
 b=sYsy6SXkygTxY6pCnfMEVdotiXFCLiGqulm8bN9zb8AUl7QIqWEUS2jJqBUdw3T+5P
 b9B82Dp9depGtVk5pT2xRg/6L4U41k40e0W25xb09GYR+BoCq98ILq6z1ixNMLt+lDQx
 yHj5CDa8Bls2U3KLrwzkeSQlWiLjrdqfafQUPjglI3mOJvQTMX8wqjVxoXiiGTxO52Wj
 3GUP+ACS2IIaNYSf84SmzGIUV8bN+xP/23Cxf5DKIiKQLMPmzE8GOJdv6MQyjAEWyar2
 vEW1aNCVjhNMr7s13Etp42DmkyDtkd2uSdDnBzh7Su6UciA7MinUtIKnZhkqXC7eXrzt
 E08g==
X-Gm-Message-State: AOAM5310SikGkvop27ZGBpNxXTOf3HwQ1g/VFmWe52WLE4lH9HrmjyOC
 KM3HVheKMwTJq+eNGX70942IyxJw3LXoVbio
X-Google-Smtp-Source: ABdhPJyjTakkvAz+wPnY84UhByCMo3gIjZ1NEIzSB+71sa7SWCnzzQg6vUxw+dVA2w6FtwpvHJC6Hg==
X-Received: by 2002:a17:90b:1d04:: with SMTP id
 on4mr337595pjb.68.1633552923075; 
 Wed, 06 Oct 2021 13:42:03 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:42:02 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:31 -0700
Message-Id: <20211006204135.2813745-8-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/12] package/freescale-imx/isp-imx: add package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

i.MX Verisilicon Software ISP.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/Config.in               |   1 +
 .../isp-imx/0001-run.sh-fix-bashisms.patch    | 201 ++++++++++++++++++
 ...rt_isp.sh-refine-device-tree-parsing.patch |  28 +++
 package/freescale-imx/isp-imx/Config.in       |  15 ++
 package/freescale-imx/isp-imx/S80isp          |  18 ++
 package/freescale-imx/isp-imx/isp-imx.hash    |   4 +
 package/freescale-imx/isp-imx/isp-imx.mk      |  65 ++++++
 7 files changed, 332 insertions(+)
 create mode 100644 package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch
 create mode 100644 package/freescale-imx/isp-imx/0001-start_isp.sh-refine-device-tree-parsing.patch
 create mode 100644 package/freescale-imx/isp-imx/Config.in
 create mode 100755 package/freescale-imx/isp-imx/S80isp
 create mode 100644 package/freescale-imx/isp-imx/isp-imx.hash
 create mode 100644 package/freescale-imx/isp-imx/isp-imx.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 5f02d24909..0f0f5c50fd 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -117,6 +117,7 @@ source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
 source "package/freescale-imx/isp-vvcam-module/Config.in"
+source "package/freescale-imx/isp-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch b/package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch
new file mode 100644
index 0000000000..cbbc31906c
--- /dev/null
+++ b/package/freescale-imx/isp-imx/0001-run.sh-fix-bashisms.patch
@@ -0,0 +1,201 @@
+From 7c5c07a24c9e77d69002c6a9aefd1cc5a7a0615f Mon Sep 17 00:00:00 2001
+From: Chris Dimich <Chris.Dimich@boundarydevices.com>
+Date: Tue, 28 Sep 2021 17:27:33 -0700
+Subject: [PATCH 1/1] run.sh: fix bashisms
+
+---
+ imx/run.sh | 63 ++++++++++++++++++++++++++----------------------------
+ 1 file changed, 30 insertions(+), 33 deletions(-)
+
+diff --git a/imx/run.sh b/imx/run.sh
+index d3bb03a08..bab13c370 100755
+--- a/imx/run.sh
++++ b/imx/run.sh
+@@ -15,17 +15,17 @@ LOCAL_RUN="0" # search modules in /lib/modules and libraries in /usr/lib
+ RUN_OPTION=""
+ LOCAL_RUN="0"
+ # an array with the modules to load, insertion order
+-declare -a MODULES=("imx8-media-dev" "vvcam-video" "vvcam-dwe" "vvcam-isp")
++MODULES="imx8-media-dev vvcam-video vvcam-dwe vvcam-isp"
+ 
+ USAGE="Usage:\n"
+-USAGE+="run.sh -c <isp_config> &\n"
+-USAGE+="Supported configurations:\n"
+-USAGE+="\tbasler_1080p60         - single basler camera on MIPI-CSI1, 1920x1080, 60 fps\n"
+-USAGE+="\tdual_basler_1080p60    - dual basler cameras on MIPI-CSI1/2, 1920x1080, 60 fps\n"
+-USAGE+="\tbasler_4k              - single basler camera on MIPI-CSI1, 3840x2160, 30 fps\n"
+-USAGE+="\tbasler_1080p60hdr      - single basler camera on MIPI-CSI1, 1920x1080, 60 fps, HDR configuration\n"
+-USAGE+="\tdual_basler_1080p60hdr - dual basler cameras on MIPI-CSI1/2, 1920x1080, 60 fps, HDR configuration\n"
+-USAGE+="\tbasler_4khdr           - single basler camera on MIPI-CSI1, 3840x2160, 30 fps, HDR configuration\n"
++USAGE=$USAGE"run.sh -c <isp_config> &\n"
++USAGE=$USAGE"Supported configurations:\n"
++USAGE=$USAGE"\tbasler_1080p60         - single basler camera on MIPI-CSI1, 1920x1080, 60 fps\n"
++USAGE=$USAGE"\tdual_basler_1080p60    - dual basler cameras on MIPI-CSI1/2, 1920x1080, 60 fps\n"
++USAGE=$USAGE"\tbasler_4k              - single basler camera on MIPI-CSI1, 3840x2160, 30 fps\n"
++USAGE=$USAGE"\tbasler_1080p60hdr      - single basler camera on MIPI-CSI1, 1920x1080, 60 fps, HDR configuration\n"
++USAGE=$USAGE"\tdual_basler_1080p60hdr - dual basler cameras on MIPI-CSI1/2, 1920x1080, 60 fps, HDR configuration\n"
++USAGE=$USAGE"\tbasler_4khdr           - single basler camera on MIPI-CSI1, 3840x2160, 30 fps, HDR configuration\n"
+ 
+ 
+ # parse command line arguments
+@@ -182,21 +182,18 @@ load_module () {
+ 
+ load_modules () {
+ 	# remove any previous instances of the modules
+-	n=${#MODULES_TO_REMOVE[*]}
+-	for (( i = n-1; i >= 0; i-- ))
++	for i in "${MODULES_TO_REMOVE}"
+ 	do
+-		echo "Removing ${MODULES_TO_REMOVE[i]}..."
+-		rmmod ${MODULES_TO_REMOVE[i]} &>/dev/null
+-		#LSMOD_STATUS=`lsmod | grep "${MODULES[i]}"`
+-		#echo "LSMOD_STATUS=$LSMOD_STATUS"
+-		if lsmod | grep "${MODULES_TO_REMOVE[i]}" ; then
+-			echo "Removing ${MODULES_TO_REMOVE[i]} failed!"
++		echo "Removing $i..."
++		rmmod $i &>/dev/null
++		if lsmod | grep "$i" ; then
++			echo "Removing $i failed!"
+ 			exit 1
+ 		fi
+ 	done
+ 
+ 	# and now clean load the modules
+-	for i in "${MODULES[@]}"
++	for i in "${MODULES}"
+ 	do
+ 		echo "Loading module $i ..."
+ 		load_module $i
+@@ -206,10 +203,10 @@ load_modules () {
+ write_default_mode_files
+ 
+ echo "Trying configuration \"$ISP_CONFIG\"..."
+-MODULES_TO_REMOVE=( "basler-camera-driver-vvcam" "os08a20" "ov2775" "${MODULES[@]}")
++MODULES_TO_REMOVE="basler-camera-driver-vvcam os08a20 ov2775 ${MODULES}"
+ case "$ISP_CONFIG" in
+ 		basler_4k )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_4K.drv"
+@@ -218,7 +215,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		basler_1080p60 )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_1080P.drv"
+@@ -227,7 +224,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		dual_basler_1080p60 )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="DUAL_CAMERA"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_1080P.drv"
+@@ -237,7 +234,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor1_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		basler_4khdr )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_4K.drv"
+@@ -246,7 +243,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		basler_1080p60hdr )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_1080P.drv"
+@@ -255,7 +252,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		dual_basler_1080p60hdr )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="DUAL_CAMERA"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_1080P.drv"
+@@ -265,7 +262,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor1_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		dual_basler_1080p25hdr )
+-			MODULES=("basler-camera-driver-vvcam" "${MODULES[@]}")
++			MODULES="basler-camera-driver-vvcam ${MODULES}"
+ 			RUN_OPTION="DUAL_CAMERA"
+ 			CAM_NAME="basler-vvcam"
+ 			DRV_FILE="DAA3840_30MC_1080P.drv"
+@@ -275,7 +272,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor1_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		ov2775_1080p30 )
+-			MODULES=("ov2775" "${MODULES[@]}")
++			MODULES="ov2775 ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="ov2775"
+ 			DRV_FILE="ov2775.drv"
+@@ -284,7 +281,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		dual_ov2775_1080p30 )
+-			MODULES=("ov2775" "${MODULES[@]}")
++			MODULES="ov2775 ${MODULES}"
+ 			RUN_OPTION="DUAL_CAMERA"
+ 			CAM_NAME="ov2775"
+ 			DRV_FILE="ov2775.drv"
+@@ -294,7 +291,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor1_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		ov2775_1080p30hdr )
+-			MODULES=("ov2775" "${MODULES[@]}")
++			MODULES="ov2775 ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="ov2775"
+ 			DRV_FILE="ov2775.drv"
+@@ -303,7 +300,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		dual_ov2775_1080p30hdr )
+-			MODULES=("ov2775" "${MODULES[@]}")
++			MODULES="ov2775 ${MODULES}"
+ 			RUN_OPTION="DUAL_CAMERA"
+ 			CAM_NAME="ov2775"
+ 			DRV_FILE="ov2775.drv"
+@@ -313,7 +310,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor1_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		ov2775_1080p30hdr_native )
+-			MODULES=("ov2775" "${MODULES[@]}")
++			MODULES="ov2775 ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="ov2775"
+ 			DRV_FILE="ov2775.drv"
+@@ -322,7 +319,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		ov2775_720p )
+-			MODULES=("ov2775" "${MODULES[@]}")
++			MODULES="ov2775 ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="ov2775"
+ 			DRV_FILE="ov2775.drv"
+@@ -331,7 +328,7 @@ case "$ISP_CONFIG" in
+ 			write_sensor_cfg_file "Sensor0_Entry.cfg" $CAM_NAME $DRV_FILE $MODE_FILE $MODE
+ 			;;
+ 		os08a20_4k )
+-			MODULES=("os08a20" "${MODULES[@]}")
++			MODULES="os08a20 ${MODULES}"
+ 			RUN_OPTION="CAMERA0"
+ 			CAM_NAME="os08a20"
+ 			DRV_FILE="os08a20.drv"
+-- 
+2.31.1
+
diff --git a/package/freescale-imx/isp-imx/0001-start_isp.sh-refine-device-tree-parsing.patch b/package/freescale-imx/isp-imx/0001-start_isp.sh-refine-device-tree-parsing.patch
new file mode 100644
index 0000000000..cc98460b5f
--- /dev/null
+++ b/package/freescale-imx/isp-imx/0001-start_isp.sh-refine-device-tree-parsing.patch
@@ -0,0 +1,28 @@
+From ee98a802554a6a962b78bc65a951d84b5d60d526 Mon Sep 17 00:00:00 2001
+From: Chris Dimich <chris.dimich@boundarydevices.com>
+Date: Sun, 3 Oct 2021 10:29:31 -0700
+Subject: [PATCH 1/1] start_isp.sh: refine device tree parsing
+
+Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
+---
+ imx/start_isp.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/imx/start_isp.sh b/imx/start_isp.sh
+index 6daabc59c..892b7c061 100755
+--- a/imx/start_isp.sh
++++ b/imx/start_isp.sh
+@@ -7,8 +7,8 @@
+ #
+ 
+ RUNTIME_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
+-NR_DEVICE_TREE_BASLER=$(grep basler-camera-vvcam /sys/firmware/devicetree/base/soc@0/*/i2c@*/*/compatible -l | wc -l 2> /dev/null)
+-NR_DEVICE_TREE_OV5640=$(grep ov5640 /sys/firmware/devicetree/base/soc@0/*/i2c@*/*/compatible -l | wc -l 2> /dev/null)
++NR_DEVICE_TREE_BASLER=$(grep basler-camera-vvcam `find /sys/firmware/devicetree/base/soc@0/ -name compatible | grep i2c` -l | wc -l 2> /dev/null)
++NR_DEVICE_TREE_OV5640=$(grep ov5640 `find /sys/firmware/devicetree/base/soc@0/ -name compatible | grep i2c` -l | wc -l 2> /dev/null)
+ 
+ # check if the basler device has been enabled in the device tree
+ if [ $NR_DEVICE_TREE_BASLER -eq 1 ]; then
+-- 
+2.31.1
+
diff --git a/package/freescale-imx/isp-imx/Config.in b/package/freescale-imx/isp-imx/Config.in
new file mode 100644
index 0000000000..04d17284d4
--- /dev/null
+++ b/package/freescale-imx/isp-imx/Config.in
@@ -0,0 +1,15 @@
+comment "isp-imx requires aarch64"
+	depends on !BR2_aarch64
+
+comment "isp-imx requires g2d library"
+	depends on !BR2_PACKAGE_IMX_GPU_G2D
+
+config BR2_PACKAGE_ISP_IMX
+	bool "isp-imx"
+	depends on BR2_aarch64 # Only relevant for i.MX8
+	depends on BR2_PACKAGE_IMX_GPU_G2D
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LINUX_IMX_HEADERS
+	select BR2_PACKAGE_PYTHON3
+	help
+	  i.MX Verisilicon Software ISP.
diff --git a/package/freescale-imx/isp-imx/S80isp b/package/freescale-imx/isp-imx/S80isp
new file mode 100755
index 0000000000..a41028fde8
--- /dev/null
+++ b/package/freescale-imx/isp-imx/S80isp
@@ -0,0 +1,18 @@
+#! /bin/sh
+
+case "$1" in
+	start|"")
+		/bin/sh /opt/imx8-isp/bin/start_isp.sh &
+		;;
+	stop)
+		;;
+	restart|reload)
+		$0 stop
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop}" >&2
+		exit 1
+		;;
+esac
diff --git a/package/freescale-imx/isp-imx/isp-imx.hash b/package/freescale-imx/isp-imx/isp-imx.hash
new file mode 100644
index 0000000000..03bc61347f
--- /dev/null
+++ b/package/freescale-imx/isp-imx/isp-imx.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  e775975684aab4211f0bf8c5e2c6604ba46b83c5586937000675e044a50d77b8  isp-imx-4.2.2.13.0.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/isp-imx/isp-imx.mk b/package/freescale-imx/isp-imx/isp-imx.mk
new file mode 100644
index 0000000000..a05b7749b1
--- /dev/null
+++ b/package/freescale-imx/isp-imx/isp-imx.mk
@@ -0,0 +1,65 @@
+################################################################################
+#
+# isp-imx
+#
+################################################################################
+
+ISP_IMX_VERSION = 4.2.2.13.0
+ISP_IMX_SITE = $(FREESCALE_IMX_SITE)
+ISP_IMX_SOURCE = isp-imx-$(ISP_IMX_VERSION).bin
+ISP_IMX_DEPENDENCIES = linux linux-imx-headers python3 libdrm imx-gpu-g2d
+ISP_IMX_LICENSE = NXP Semiconductor Software License Agreement
+ISP_IMX_LICENSE_FILES = EULA COPYING
+ISP_IMX_REDISTRIBUTE = NO
+ISP_IMX_SUBDIR = appshell
+
+ISP_IMX_CONF_OPTS += \
+    -DCMAKE_BUILD_TYPE=release \
+    -DISP_VERSION=ISP8000NANO_V1802 \
+    -DPLATFORM=ARM64 \
+    -DAPPMODE=V4L2 \
+    -DQTLESS=1 \
+    -DFULL_SRC_COMPILE=1 \
+    -DWITH_DRM=1 \
+    -DWITH_DWE=1 \
+    -DSERVER_LESS=1 \
+    -DSUBDEV_V4L2=1 \
+    -DENABLE_IRQ=1 \
+    -DPARTITION_BUILD=0 \
+    -D3A_SRC_BUILD=0 \
+    -Wno-dev
+
+ISP_IMX_CONF_ENV += SDKTARGETSYSROOT=$(STAGING_DIR)
+
+define ISP_IMX_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(ISP_IMX_DL_DIR)/$(ISP_IMX_SOURCE))
+endef
+
+define ISP_IMX_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/*2775* $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/isp_media_server $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/*_test $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/bin/vvext $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/dewarp/dewarp_config $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/mediacontrol/case/ $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/$(ISP_IMX_SUBDIR)/generated/release/lib/*.so* $(TARGET_DIR)/usr/lib/
+
+	cp $(@D)/imx/run.sh $(TARGET_DIR)/opt/imx8-isp/bin
+	cp $(@D)/imx/start_isp.sh $(TARGET_DIR)/opt/imx8-isp/bin
+
+	chmod +x $(TARGET_DIR)/opt/imx8-isp/bin/run.sh
+	chmod +x $(TARGET_DIR)/opt/imx8-isp/bin/start_isp.sh
+endef
+
+define ISP_IMX_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/imx/imx8-isp.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/imx8-isp.service
+endef
+
+define ISP_IMX_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/freescale-imx/isp-imx/S80isp \
+		$(TARGET_DIR)/etc/init.d/S80isp
+endef
+
+$(eval $(cmake-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
