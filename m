Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE7C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 10:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9E941F8D;
	Tue, 10 Jun 2025 10:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taMKFMhzG0qs; Tue, 10 Jun 2025 10:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC9041F90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC9041F90;
	Tue, 10 Jun 2025 10:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C10CD
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 10:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAC03607D3
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 10:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WqxXSYsQSnl for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 10:12:16 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Jun 2025 10:12:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 882D760744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882D760744
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.74;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 882D760744
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 10:12:15 +0000 (UTC)
Received: from lesya.tangerine ([185.213.154.178]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1M5PVb-1uQJKR3mM9-00FOUO; Tue, 10 Jun 2025 12:07:07 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Cc: Johan Oudinet <johan.oudinet@gmail.com>,
 Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Tue, 10 Jun 2025 12:06:22 +0200
Message-ID: <20250610100622.1755003-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610100622.1755003-1-thomas.claveirole@green-communications.fr>
References: <20250610100622.1755003-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WJw20meD6I7CKUDeoEpVk/mwFFuxtGgyCTdBxj6b/cEVw7VQFaS
 Wz6eO/7lbIOPfue2fVeHscfQ4kLTHUVmVUjs9o5sBkdg60we97lyliO0iBPN0+0mMTa09SJ
 C8x8zu3AqjO04chm09BQUeBpGbWcnYwFkgBggI35SwNW48vlUEqj0ShpkgQLtLbg1Q0HxKb
 JpKxX25B4PLaiHyZUKhAg==
UI-OutboundReport: notjunk:1;M01:P0:OeFAIL3YVvU=;tL6JcLkXWqn5EQfzXIZCogZo6fl
 ffcSI0zDyntiWwmZfBAtgysgWIP5ddt21Tjo5NKxmVSEixLSmPHKxBcUjFojtqi3y7svlAmNB
 hcS6ni1Gn0e9xg+05AjN8rvw7s4CTNC3rkDIbaaTBzgt9YRDkrE245P8k69bPSiiA6L61+pCN
 IwkQcJ7YTh1jodY0qfoejIsIj/bkogao808M+g1UUzz1w6m+z17UUwJJ9TSlcT9u4tpwRWu7S
 7vwhPN5GntW9czWoFSKz6u//k+LtKdCyjFmrKYFGXswFJRqoM4kyQiKYJ1tPMYwoA5fswyImT
 o4Q9ck5bIRTlFKiQyzDfIutSa09WMziijn/Ly+RZVx6LLi3WT3oBkREpH/SN/ZRE9ANkWz6h6
 K/H3wKNqf6bbdySMcsRJzpZQx6sOHXRv2bYjXQZN+Kw/Dx6mUyNghw3cZx66geUUXxeIpnYtx
 AuOoM39WnnEmv/PD8mZ/PkgupnUujFCYLdWkbxWvBsPBo3u/jgrY8pjJ5iMJisMBa6GzBz9pn
 LDeHUCRfuHTbL4cvyCbGB/HKEHCMqxP4RieNebxlz1QQbkuASqrpULyarOBfcfg4nLlMNZPbW
 HSd7utydhOGloIOis+MnDkjziT10oDGk/ei8WJVUWmogSrvahVPmr9TE+mZ1T9zIHzMQaN80s
 rTLUI7tEsMZ4AbbT+g5Vb93tsTb9ta2lVmZARUnATu44kuatOvB9b8whqaBaBI66tLetqqbC9
 y5MVbTmaotYAhOG5IeCq+GDw/i56wochgboOUASY7Zzh2MHqpVEVgWDIg03kaSj7VacMs84RX
 ES9eaAPuyGpmu/3BwIsUzt4OMl6jLkQDhoylezOzgTUetiiSvDgeyhaSyY8jDcmfrU2mxccVC
 tDQMDRJ/zTpySIXtPy/ZpmRpPSNKu0vDsWkbXQfXm/MT0VyR/L+aJUYVqN303XauOSJ3z9tRP
 PwCEG690GnPaOlfvrmrRdUVgwbCpVRmVl1cmrK+c7bK69XgEFMQDGRD5mfhkMbuKm4k8RFjxm
 hsQnd71P3PBeEooct3lIVXHAKMPNLqAAdSICBEvcp7n+xcEKiO35BNQgqXMiCZLVZsFRu6VDp
 I+fOgpOSK2QR3Q/CkM3wYg4EiYTlrddMHN9yAa4JLkkDfO7ovbt2/a2RzZk1nfVxI1MQZDRZ9
 BIqrJoO+rmo8TuIvTgg/cUqNNz/OluYejCHMVBCXOAGsnedaOxjdxQCe8f/OpcNjzsZjzmuE0
 /uWh9X+b/ZK0Wj04/yatDmSlM95UfiXoPyBOv/yd/R+2gB4r1ub7WVPXHaKBH5PvP7ZRa0m8J
 JdBFD35NmYs2KkOp+O1IqxN11BSFf2tD7NTEPcirvZDuxDaIjUT+Aq2d72rzBNEk4gWTpZBoF
 Vv3wHrR8qspcat2HRi8CO1fl6txGAzeZAynjFbgr1Gt/bGKvM588L8Zj6TSiXVNrz73+pPKVw
 PEPCnztsxZ8l7tbjrSaElK+65PUQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 83c14e8823..299ca61649 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f114198b1efb7635c281cb191948f6ed1cecfa9a9e9be2c14d5356cd624eb60  vue-router-4.4.5.tgz
+sha256  093fee5133cf82e75d25940d86f58a4e3f194b74262205ff5c1926aed53339c4  vue-router-4.5.1.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 7de4864d3f..a6d9df6dc2 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.4.5
+VUEJS_ROUTER_VERSION = 4.5.1
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
