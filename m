Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D47CC072A2
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100B7614F3;
	Wed, 15 Nov 2023 22:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 100B7614F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIl44OVgfzFr; Wed, 15 Nov 2023 22:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2783E60AF8;
	Wed, 15 Nov 2023 22:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2783E60AF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E761BF228
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4EE481ECF
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4EE481ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBu5rlO9UZSK for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 21:59:47 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C1FA81F05
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C1FA81F05
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFLrQXG032220; Wed, 15 Nov 2023 21:59:45 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud5en17ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:45 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AFKJ03F024846; Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn1sypc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Nov 2023 21:59:44 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AFLxhgR22676088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Nov 2023 21:59:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A559758063;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 938815805D;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Nov 2023 21:59:43 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id B39B35E00873; Wed, 15 Nov 2023 15:59:42 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 15:59:31 -0600
Message-Id: <20231115215931.860940-6-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231115215931.860940-1-arbab@linux.ibm.com>
References: <20231115215931.860940-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MVWj88G1d_fNgxNi7gk4kPYa6n5zZw3-
X-Proofpoint-GUID: MVWj88G1d_fNgxNi7gk4kPYa6n5zZw3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_20,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311150173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZQiMnfsJEplY9xqXLqs67KhRjYxFTyDNfxA14fjScIQ=;
 b=MCbWeujCPAb3VCmJ/7wtu37Gw1e8OsiZNumGexFXEWNIF3ccQll+7/wH0SQWZQUQOTrw
 5NOjlNeymwBj40Vpbd1HSQzEOLBYvOMlVJGZjpYtdi6ug1VMynupB+vmcoWj83ESjpR/
 zrlt4LvEK6tQTzsinhf5bT1eDq3cpqEcrvvjyjK3/xpIfOitjSeEc6o6rdfZVry9OH7V
 jbYKDbjqxEjv4CKLzfxzGtIbEtMp5BnhTI4N7qoDU6M46J0CUsooucEtetwR4KZt3v3U
 uRa+fEQjwtomQ04OyZ3l9rRXjZtqlpY7VY5PjlffSDT3VRUoS3nCD4pntDJK6+dSh6CN ig== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=MCbWeujC
Subject: [Buildroot] [PATCH v4 5/5] package/petitboot: run UI as non-root
 user
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Though the petitboot UI is a user application, it is currently being
run by root only because we use getty to display it on the console.

Create an unprivileged user to run the UI instead. The unix socket the
pb-discover daemon sets up is accessible to "petitgroup", so that should
be the gid, with arbitrary uid "petituser" to match.

This is currently the chain of processes leading to the UI:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 console linux
3. /sbin/getty -l/usr/libexec/petitboot/pb-console -n -i 0 console linux
4. /usr/libexec/petitboot/pb-console
5. /usr/sbin/petitboot-nc

Instead of (3) running the pb-console helper directly with "getty -l",
we can use "agetty -a" to autologin petituser, and run pb-console via
petituser's login shell:

1. /etc/init.d/pb-console start console
2. /usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i console linux
3. /sbin/agetty -a petituser -n -i console linux
4. /home/petituser/.profile
5. /usr/libexec/petitboot/pb-console
6. /usr/sbin/petiboot-nc

Here, everything from (4) down is running as petituser. In (4), use
$PPID to determine if we're logging in via getty, so that logging in by
other means will give a normal shell.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in      | 1 +
 package/petitboot/S15pb-discover | 4 +++-
 package/petitboot/pb-console     | 6 ++++--
 package/petitboot/petitboot.mk   | 6 ++++++
 package/petitboot/shell_profile  | 3 +++
 5 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 package/petitboot/shell_profile

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 46327903ed2e..b17ce3253b74 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
 	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	help
 	  Petitboot is a small kexec-based bootloader
 
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 71ab62d99859..9e8f6c87f8bb 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -12,7 +12,9 @@ fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown petituser:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
index 407ff3b30232..8b23b2233dee 100644
--- a/package/petitboot/pb-console
+++ b/package/petitboot/pb-console
@@ -3,14 +3,16 @@
 DAEMON="pb-console"
 
 PB_CONSOLE_PORT=${2:-"console"}
-PB_CONSOLE_ARGS="--getty --detach -- -n -i 0 $PB_CONSOLE_PORT linux"
+PB_CONSOLE_ARGS="--getty=/sbin/agetty --detach -- -a petituser -n -i $PB_CONSOLE_PORT linux"
 
 # shellcheck source=/dev/null
 [ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
 
 start() {
 	printf 'Starting %s on %s: ' "$DAEMON" "$PB_CONSOLE_PORT"
-	mkdir -p /var/log/petitboot
+	# shellcheck disable=SC2174 # only apply -m to deepest dir
+	mkdir -p -m 0775 /var/log/petitboot
+	chown petituser:petitgroup /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 3d29d103b518..929e0574f6f9 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -76,6 +76,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/init.d/pb-console
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-shell \
 		$(TARGET_DIR)/usr/libexec/petitboot/pb-shell
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
+		$(TARGET_DIR)/home/petituser/.profile
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
 	for port in $(PETITBOOT_GETTY_PORT); do \
@@ -89,4 +91,8 @@ endef
 
 PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
 
+define PETITBOOT_USERS
+	petituser -1 petitgroup -1 * /home/petituser /bin/sh - petitboot user
+endef
+
 $(eval $(autotools-package))
diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
new file mode 100644
index 000000000000..a958ca4402f2
--- /dev/null
+++ b/package/petitboot/shell_profile
@@ -0,0 +1,3 @@
+if [ "$PPID" = "1" ]; then
+	exec /usr/libexec/petitboot/pb-console
+fi
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
