Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D56C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 15:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286F6606FF;
	Tue,  2 Jul 2024 15:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KofpMIl736Is; Tue,  2 Jul 2024 15:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05A56081B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05A56081B;
	Tue,  2 Jul 2024 15:19:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65B5D1BF30A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 535454026C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BW1b0cd58Ip for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50889402AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50889402AB
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50889402AB
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 15:18:54 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 462F4wkV009194
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:53 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 404018hjx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 15:18:52 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 462FIq6I016384
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:52 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 462FIpZP018524
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 2 Jul 2024 15:18:52 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id B031910026A4;
 Tue,  2 Jul 2024 10:18:51 -0500 (CDT)
Date: Tue, 02 Jul 2024 15:18:44 +0000
MIME-Version: 1.0
Message-Id: <20240702-atftp-sysvinit-v1-1-f26694337129@collins.com>
References: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
In-Reply-To: <20240702-atftp-sysvinit-v1-0-f26694337129@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxlogscore=771
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=740 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407020114
X-Proofpoint-ORIG-GUID: OsU-kT42Ra6NSVn3dOiMD2232vvYF3Ey
X-Proofpoint-GUID: OsU-kT42Ra6NSVn3dOiMD2232vvYF3Ey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_10,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 mlxlogscore=840
 impostorscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407020114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=f2vhhpggqMn4rFhEgow83/sJhNZGI9TIALmmPe34inw=;
 b=IZ5ckyc17ZdYk2YAGDe/qxHIg9JCLt7y486zcv+cbyNNWDVQbNnLSNYX4vyHjY0zTucU
 YFRmAQ0MPiA06H2SJo4bRV/o7uD8iQB9YgAzftP9Lh86b7lXGQFOkFspBMBiiS/Vgrtm
 dquX9c09kaqKx2MkwZXKkCLstZI+NFtwFSTQKgE9RHD9mIBlU0bXzk77ht+GYzcEy2+S
 dOD6PGkMpV8PmgKDPzR2Ohip8kOAlFFg9GQXqkCpt8tgVpGnDWiNGPJFCvcLVpgmELmo
 2asCKKQ//t5PmACNvoMWyo4+xKEWE5/m0HIz7RrMNMYUxlL5Z09RH6ne8QCnowxWkG/1 +w== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=IZ5ckyc1
Subject: [Buildroot] [PATCH 1/3] package/atftp: add sysvinit script
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a script to launch the atftp daemon at boot.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/atftp/S80atftpd | 44 ++++++++++++++++++++++++++++++++++++++++++++
 package/atftp/atftp.mk  |  5 +++++
 2 files changed, 49 insertions(+)

diff --git a/package/atftp/S80atftpd b/package/atftp/S80atftpd
new file mode 100644
index 0000000000..8cd0e035e6
--- /dev/null
+++ b/package/atftp/S80atftpd
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+DAEMON="atftpd"
+PIDFILE="/var/run/$DAEMON.pid"
+ATFTPD_ARGS="--user root.root /tftpboot"
+
+# shellcheck disable=SC1090
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086
+	if start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" -- \
+		--daemon --pidfile="$PIDFILE" $ATFTPD_ARGS; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	if start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+case "$1" in
+start)
+	start
+	;;
+stop)
+	stop
+	;;
+restart|reload)
+	stop
+	start
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index d41178cac4..c71a70cd5d 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -36,4 +36,9 @@ else
 ATFTP_CONF_OPTS += --disable-libpcre
 endif
 
+define ATFTP_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/atftp/S80atftpd \
+		$(TARGET_DIR)/etc/init.d/S80atftpd
+endef
+
 $(eval $(autotools-package))

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
