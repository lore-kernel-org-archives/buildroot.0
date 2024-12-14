Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2BBE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 14:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DD26070C;
	Sat, 14 Dec 2024 14:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr8_CaYMAaHd; Sat, 14 Dec 2024 14:12:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B7460715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B7460715;
	Sat, 14 Dec 2024 14:12:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C13C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A51880C4B
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHaUGyawKBdI for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 14:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9545A80C37
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9545A80C37
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 802A686FB9; Sat, 14 Dec 2024 14:12:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 15:09:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4338deaae58a68e397c7375476745778eb7b732f
X-Git-Newrev: b0d68b7322bcbf87bd465fb300acae941087f559
X-Patchwork-Hint: ignore
Message-Id: <20241214141223.802A686FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 4.2.9
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
Content-Type: multipart/mixed; boundary="===============4052271664722594029=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4052271664722594029==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b0d68b7322bcbf87bd465fb300acae941087f559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.9.html

Fixes the following vulnerabilities:

4.2.9:

CVE-2024-11595: wnpa-sec-2024-14 · FiveCo RAP dissector infinite loop
https://www.wireshark.org/security/wnpa-sec-2024-14

CVE-2024-11596: wnpa-sec-2024-15 · ECMP dissector crash
https://www.wireshark.org/security/wnpa-sec-2024-15

4.2.8:

CVE-2024-9781: wnpa-sec-2024-13 · AppleTalk and RELOAD Framing dissector
crashes
https://www.wireshark.org/security/wnpa-sec-2024-13

4.2.7:

CVE-2024-8250: wnpa-sec-2024-11 · NTLMSSP dissector crash
https://www.wireshark.org/security/wnpa-sec-2024-11

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 06119861f2..642bc5866d 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.6.txt
-sha1  db0374dce360b99d8abb9a3f3471f3fc98d6d099  wireshark-4.2.6.tar.xz
-sha256  5ec6028df29068d889c98489bf194a884b00831106fea1e921fea3c65f2003f5  wireshark-4.2.6.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.9.txt
+sha1  d1abbe110451dab9e57c9ee1fe0892e0d6a7d515  wireshark-4.2.9.tar.xz
+sha256  62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3  wireshark-4.2.9.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 242430194f..bade68f258 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.6
+WIRESHARK_VERSION = 4.2.9
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license

--===============4052271664722594029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4052271664722594029==--
