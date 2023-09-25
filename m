Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872C4CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4269A607A1;
	Mon, 25 Sep 2023 11:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4269A607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkReHWna2AcQ; Mon, 25 Sep 2023 11:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E14761038;
	Mon, 25 Sep 2023 11:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E14761038
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04B111BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FEC961096
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FEC961096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62bCWSJC6b0d for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABEC96106C
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABEC96106C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C18C87729; Mon, 25 Sep 2023 11:48:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 13:36:47 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 48b0011c67ff941ada8c33d886308e677a8f3961
X-Git-Newrev: 276c7d50da98bf1f379a78c0bad412e788191256
X-Patchwork-Hint: ignore
Message-Id: <20230925114822.9C18C87729@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/agentpp: fix
 build with gcc 4.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=276c7d50da98bf1f379a78c0bad412e788191256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix the following build failure with gcc 4.8 raised since bump of snmppp
to version 3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

configure: error: Cannot find suitable libsnmp++ library

[...]

configure:9496: checking if libsnmp++ can be linked with flags from pkg-config
configure:9528: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_XOPEN_SOURCE=XPG6  conftest.cpp -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib -lsnmp++ >&5
In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/snmp_pp.h:71:0,
                 from conftest.cpp:92:
/home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/uxsnmp.h:628:35: error: 'nullptr' was not declared in this scope
      CSNMPMessage *snmp_message = nullptr);
                                   ^

Fixes:
 - http://autobuild.buildroot.org/results/f272473e7b588f5390b183072935a0217290ee4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c6c018ad45c952a47e7f0e707da0d797cdbe4c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agentpp/agentpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 0ef549426e..7616d3eb0c 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -11,6 +11,7 @@ AGENTPP_LICENSE = Apache-2.0
 AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
 AGENTPP_INSTALL_STAGING = YES
 AGENTPP_DEPENDENCIES = host-pkgconf snmppp
+AGENTPP_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 AGENTPP_CONF_OPTS += \
 	--disable-proxy \
 	--disable-forwarder \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
