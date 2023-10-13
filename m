Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E096CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193B9610F1;
	Fri, 13 Oct 2023 15:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193B9610F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3szEmqZ3gl32; Fri, 13 Oct 2023 15:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0988661048;
	Fri, 13 Oct 2023 15:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0988661048
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73A901BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C7CE40102
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C7CE40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1meZ3gw1Q8dm for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:21:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21BBA4053F
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BBA4053F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FF6A84898; Fri, 13 Oct 2023 15:21:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:17:18 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e31a049bbc74d59cc39554a7d02fd9a152354cdb
X-Git-Newrev: ddf9ad1065b11c387d9d43e00675c11425dbc51c
X-Patchwork-Hint: ignore
Message-Id: <20231013152134.0FF6A84898@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/netsnmp: security
 bump to version 5.9.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddf9ad1065b11c387d9d43e00675c11425dbc51c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

CVE-2022-44792 handle_ipDefaultTTL in agent/mibgroup/ip-mib/ip_scalars.c
in Net-SNMP 5.8 through 5.9.3 has a NULL Pointer Exception bug that can
be used by a remote attacker (who has write access) to cause the
instance to crash via a crafted UDP packet, resulting in Denial of
Service.

CVE-2022-44793 handle_ipv6IpForwarding in
agent/mibgroup/ip-mib/ip_scalars.c in Net-SNMP 5.4.3 through 5.9.3 has a
NULL Pointer Exception bug that can be used by a remote attacker to
cause the instance to crash via a crafted UDP packet, resulting in
Denial of Service.

The pgp key was changed [0] as the old one expired [1].

[0]: https://sourceforge.net/p/net-snmp/htdocs/ci/90a6d98aae21fcdff06b5be139eb4d44ae96a9de/
[1]: https://github.com/net-snmp/net-snmp/issues/595

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 868603755c16296ae2a61845891edeafc36e48ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.hash | 6 +++---
 package/netsnmp/netsnmp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index e1e9d10898..7898941271 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature at
-# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.3/net-snmp-5.9.3.tar.gz.asc
-# using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
-sha256  2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a  net-snmp-5.9.3.tar.gz
+# https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9.4/net-snmp-5.9.4.tar.gz.asc
+# using key 6E6718AEF1EB5C65C32D1B2A356BC0B552D53CAB
+sha256  8b4de01391e74e3c7014beb43961a2d6d6fa03acc34280b9585f4930745b0544  net-snmp-5.9.4.tar.gz
 
 # Hash for license file
 sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 15bc318e36..ae85f2697f 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNMP_VERSION = 5.9.3
+NETSNMP_VERSION = 5.9.4
 NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
