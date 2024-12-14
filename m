Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C80BE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 12:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B00E84892;
	Sat, 14 Dec 2024 12:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwyLoiCIuFgz; Sat, 14 Dec 2024 12:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2826A8488F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2826A8488F;
	Sat, 14 Dec 2024 12:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 700D7C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 12:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 505FD417BC
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 12:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJ-Vq37RRjPm for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 12:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E40E7417C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E40E7417C3
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 12:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8AA586F88; Sat, 14 Dec 2024 12:29:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 12:50:49 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 79299da8c44e677447d926a14b9582c15a8c59b0
X-Git-Newrev: 5d1912ba3df31775bb7d5852a9b25d8d765d487e
X-Patchwork-Hint: ignore
Message-Id: <20241214122945.C8AA586F88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/wireshark:
 security bump to version 4.0.17
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0775879082767518679=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0775879082767518679==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5d1912ba3df31775bb7d5852a9b25d8d765d487e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following vulnerabilities:

4.0.17:

CVE-2024-8250: wnpa-sec-2024-11 · NTLMSSP dissector crash
https://www.wireshark.org/security/wnpa-sec-2024-11

4.0.16:

CVE-2024-8645: wnpa-sec-2024-10 · SPRT dissector crash
https://www.wireshark.org/security/wnpa-sec-2024-10

4.0.15:

CVE-2024-4854: wnpa-sec-2024-07 · MONGO and ZigBee TLV dissector infinite
loops
https://www.wireshark.org/security/wnpa-sec-2024-07

CVE-2024-4853: wnpa-sec-2024-08 · Editcap byte chopping crash
https://www.wireshark.org/security/wnpa-sec-2024-08

CVE-2024-4855: wnpa-sec-2024-09 · Editcap secret injection crash
https://www.wireshark.org/security/wnpa-sec-2024-09

4.0.14:

CVE-2024-2955: wnpa-sec-2024-06 · T.38 dissector crash
https://www.wireshark.org/security/wnpa-sec-2024-06

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 6610eb7781..bda95ab7e4 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.12.txt
-sha1  e00d90769995bf786b05c05bdd9a2c6c8e372e70  wireshark-4.0.12.tar.xz
-sha256  e4e3d618ba11e159fb163f0dc4716a8b72a065aafd1111db9405332552a5a115  wireshark-4.0.12.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.17.txt
+sha1  0853c04000d0c1fb4928b731966e25898afe1a46  wireshark-4.0.17.tar.xz
+sha256  5968c25979e84a9d1fafc4f37fffb77296830311a712d6df28f2bdeec0740627  wireshark-4.0.17.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 3759f9bf94..3cd1b3e534 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.12
+WIRESHARK_VERSION = 4.0.17
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============0775879082767518679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0775879082767518679==--
