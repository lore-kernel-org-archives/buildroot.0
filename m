Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E16C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DD9281E7B;
	Mon,  4 Dec 2023 07:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD9281E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDk-b_mP7vYI; Mon,  4 Dec 2023 07:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA68581E6F;
	Mon,  4 Dec 2023 07:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA68581E6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6145E1BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455E640906
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 455E640906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wuiE3_EIdvgX for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:31:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1181440179
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1181440179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE0C87951; Mon,  4 Dec 2023 07:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 08:29:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d20329ed76082553368241aa4b38f4dabf45bc76
X-Git-Newrev: df812ace329b2ba78df11b42be33f618dc61f5c8
X-Patchwork-Hint: ignore
Message-Id: <20231204073134.5BE0C87951@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 4.0.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=df812ace329b2ba78df11b42be33f618dc61f5c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-6174: SSH dissector crash in Wireshark 4.0.0 to 4.0.10
allows denial of service via packet injection or crafted capture file

https://www.wireshark.org/security/wnpa-sec-2023-28
https://www.wireshark.org/security/wnpa-sec-2023-29
https://www.wireshark.org/docs/relnotes/wireshark-4.0.11.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index c9b693c9cb..a6ef69b1af 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.10.txt
-sha1  830ba7ff602da90323bbc5ec15941c0878d9ee4a  wireshark-4.0.10.tar.xz
-sha256  b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898  wireshark-4.0.10.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.11.txt
+sha1  4af3140d69f9d41e1c4e161fad66304a6920ddce  wireshark-4.0.11.tar.xz
+sha256  4c341cc33a6c512d983f4126e6f3e5c249f604e14ab7f337d38b1cbe58199e3d  wireshark-4.0.11.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 2f563950b2..6fb4b60f2b 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.10
+WIRESHARK_VERSION = 4.0.11
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
