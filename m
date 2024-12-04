Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E2E77171
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32A46090A;
	Wed,  4 Dec 2024 18:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzVRHDkLSPEX; Wed,  4 Dec 2024 18:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC5C60E49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC5C60E49;
	Wed,  4 Dec 2024 18:29:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 770421DD3
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50AF460AF9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EleRMdSL8Sjn for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B79E160812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79E160812
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B79E160812
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGQnP-1tQsl42QrF-006v1O; Wed, 04
 Dec 2024 19:29:23 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:10 +0100
Message-ID: <20241204182913.4085670-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:N8hSj5Fx296mBjJjjWJOemKuCnWUlvEbQQOgk6qtu39CRH7h7F2
 ZLJyjotxOtquprGrYCTAIn8ZIMEBwz/WeqlymKeMSaVBbBEDESBxi9Cnm2APHntR92JHPwK
 kLwHAI4ppW8/i15raIWE+FOwc6/qgEor3YWwBDfgQC+WhmJbZ8XOc8mib+eZW+y4vThJ2pn
 9kxdqydLmQY70VDWG5NgQ==
UI-OutboundReport: notjunk:1;M01:P0:iG93v612B2o=;PfgDk8JIAIt9Rfgmlq4sGdHcSVy
 bQtfLCDgkobtoEqebcylVKf1L5fzAzmzRgeaMHccu7YmYnoocE8mezWR77lZb8JzNUevXjojI
 6Au+TY0mAKRBiiJXHZd6Zj6nWNER9OpYVW6+BpBunUwmhDIgkT0mvBHU/L3ZDr2yCsOMq7dFk
 lJ+7hcBeAQsTV9VSZ4NWDLjulbxwYue48AFSILiXBZMWdHDN+SEkVplxK/ZE+YKDYTYybsg13
 5j27RtfZBgj1KrEa58YOJl1jLFW/qEZf6EMLwacg2UC22U15X2Hy4LEAZhyLV3DrcLjGa59u6
 XWpzEXQtlus4GSjz4M6/n4LBCb1mDkLz+3fAXPEhQh1yuJptIlxsPpK2VPsNdNskNscXan+ns
 ko4oZI62LKB5jiQtFaTYqJQDnSdLOY4cJ0F+l+sTRadOMV6Lcb7SKct7pFzkmhvRsQIY6FWvD
 bfHHLB9hrOibB+tYDBcG68aMtNK5+B0Ous+e080JlzGZnrDdwN7GS5LU8oWiObE2o5g0XZiYp
 7XSMOJoiwRdOCbfYIGCRtAH5ol/e6Mz9+2Towco9W3V9EKaiTMW488OK4pJeesfBM5Wk/Ervy
 1saVpUM/wyaX9LW/xkx87AjaHy53UL1g91vPyApNNZ5uSbrJ5ZQWFfVhuAutW3n/npkB6MVay
 EnMd+kgqj2Wd64qXcllZOiLWRG5993gaPmrHg3ESHeI6vGeV9W1pJYZLxjlZX1HC7qLybGuEV
 yPk9wvqPvRAn1CkpRSOHxWYfgQT6e/WWZgJvljN5TkIC2ld4wkQeiN0+c7Drsh8FcJF2zVIwg
 tMFT1u9Km6D4sJ0qxxx55+YXDB+awftWOlkvKACqLrN8HBlf/tuulpNRHAmIKJz+2Cd2aj0Jh
 e5u8dCQ963ufCaRtoGdWSqNxU9DKQG+e1l2hgLvpEV/OEKkLxTQpvNsliwwDA20gy+zkTvVHI
 i3ACSd5u/lETCYi5q75fGnbUD4AjDJm7ZRxed75Yld9/Fu1r8Js6TKkL0xmxAJqB6VvU0feUi
 8lCCKaPQFryERRoeEuZpAILG+TXjdxZ2fefJN5k5kSuGNpGsXkVMqAhSc6RWmqwi0kZ0uSoeZ
 f964LecPz92qPcVQF1cp1+xFCLLCAI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336963; x=1733941763; i=fiona.klute@gmx.de;
 bh=kxlReBV+pCRqJl1RtN0A0p2gocOCn8NK3o4RiC8lHts=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pRx9ppEtekSVPf6rf7suA3Y+kzYl8Hh3RQJCGJ20l2p0lTPZKbFKu5gxiDYu1wGT
 5/zXhojgARMY48P5lc6Co8ieH0RzfRBoimOgVeC3Yz1mTf7VTBi0d6N4CPNXvSVTs
 E9qU3hPrMowSJt5gY1avo+gsTWhuQz+7I4e0uzg0HmcbyNC9kbKTKQr98iiKlG0Up
 7lAJohVqpMkKQ2CLdfkSmfg9z64rAw8vlJxQUIrTdWhHHrpy1ZGE8KbLClqC5ZMhX
 zxn3dFts4zAPdAHQucaz06TC3v46gF7DdbWB/huBtWWZj+sllX/XKVi22FLsibN3V
 J90Vd+sPAGvoArnkbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pRx9ppEt
Subject: [Buildroot] [PATCH v5 3/6] package/iptables: check for rules in
 init script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Instead of installing an empty rules file, the init script now checks
if the rules file exists and does nothing if it doesn't. The "save"
action is exempt from that limit because it may be used to create the
rules file.

Also fix the shellcheck warning about the unused IPTABLES_ARGS
variable, and use long form options for iptables commands.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v4 -> v5:
* iptables init script: run any target only if rules file exists,
  except for "save" (which may be used to create it)

Changes v2 -> v3:
* replace "iptables -F" with "iptables --flush"

 .checkpackageignore          |  1 -
 package/iptables/S35iptables | 16 +++++++++++-----
 package/iptables/iptables.mk |  1 -
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..767e3bb21d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -612,7 +612,6 @@ package/ipmitool/0002-Fix-enterprise-numbers-URL.patch lib_patch.Upstream
 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch lib_patch.Upstream
 package/ipmitool/0004-configure.ac-allow-disabling-registry-downloads.patch lib_patch.Upstream
 package/iprutils/0001-configure.ac-add-AC_USE_SYSTEM_EXTENSIONS.patch lib_patch.Upstream
-package/iptables/S35iptables Shellcheck
 package/irda-utils/0001-daemon.patch lib_patch.Sob lib_patch.Upstream
 package/irda-utils/0002-nommu.patch lib_patch.Sob lib_patch.Upstream
 package/irda-utils/0003-subdir.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
index a2de29d222..fc42fc9a8c 100644
--- a/package/iptables/S35iptables
+++ b/package/iptables/S35iptables
@@ -2,11 +2,18 @@
 
 DAEMON="iptables"
 
-IPTABLES_ARGS=""
+IPTABLES_CONF="/etc/iptables.conf"
+
+# Run only if IPTABLES_CONF exists, except when the action is "save"
+# (which creates it).
+if [ ! -f "${IPTABLES_CONF}" ] && [ "$1" != "save" ]; then
+	echo "${IPTABLES_CONF} does not exist, nothing to do."
+	exit 0
+fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-	iptables-restore /etc/iptables.conf
+	iptables-restore "$IPTABLES_CONF"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -18,7 +25,7 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	iptables -F
+	iptables --flush
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -30,13 +37,12 @@ stop() {
 
 restart() {
 	stop
-	sleep 1
 	start
 }
 
 save() {
 	printf 'Saving %s: ' "$DAEMON"
-	iptables-save -f /etc/iptables.conf
+	iptables-save --file "$IPTABLES_CONF"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index dbf7fbf5e1..e7495c1085 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -59,7 +59,6 @@ endef
 define IPTABLES_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/iptables/S35iptables \
 		$(TARGET_DIR)/etc/init.d/S35iptables
-	touch $(TARGET_DIR)/etc/iptables.conf
 endef
 
 ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
