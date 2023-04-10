Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E7C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 384AA613F9;
	Mon, 10 Apr 2023 19:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 384AA613F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3SVu68cI0mp; Mon, 10 Apr 2023 19:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70BD5613D6;
	Mon, 10 Apr 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BD5613D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 267071BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58C2840376
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C2840376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxhiRrkAZwMm for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6454540930
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6454540930
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5013683D27; Mon, 10 Apr 2023 19:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:59:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c1ad9ff27f607305090b4fe5bbbbf2d1f50e9649
X-Git-Newrev: ade8be6f139274ecc07f0c2685c7bb13fdcceec9
X-Patchwork-Hint: ignore
Message-Id: <20230410193614.5013683D27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/agentpp: security
 bump to version 4.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ade8be6f139274ecc07f0c2685c7bb13fdcceec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fixed (security) [APP-70]: Memory leak in MibLeaf::set if same OID is set
  twice in the same PDU.
- Fix the following build failure raised since bump of snmppp to version
  3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

snmp_pp_ext.cpp: In member function 'int Agentpp::Snmpx::send(const Agentpp::Pdux&, Snmp_pp::SnmpTarget*)':
snmp_pp_ext.cpp:1172:47: error: binding reference of type 'Snmp_pp::Pdu&' to 'const Snmp_pp::Pdu' discards qualifiers
 1172 |     status = snmpmsg.loadv3(Snmp::get_mpv3(), pdu, engine_id, security_name,
      |

Fixes:
 - http://autobuild.buildroot.net/results/d7347b8b3953596b66da6ca6d85f084fb427934c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f06ecf5e1516cac8911dbf9b05c66c0f7060379)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/agentpp/agentpp.hash | 2 +-
 package/agentpp/agentpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 99aae70263..527414eed5 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5f2cfe98fd1d50683e02c65fccd9423351254df427e5825e4f321c488a9234eb  agent++-4.5.4.tar.gz
+sha256  e09dc2d40277d468c18f1539ad18f43e0c3a95b10fad8a02184e9ace8bac0d67  agent++-4.6.0.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index d020228e44..0ef549426e 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.5.4
+AGENTPP_VERSION = 4.6.0
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
