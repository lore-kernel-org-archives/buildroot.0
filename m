Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA64DC0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656A981975;
	Wed, 25 Oct 2023 19:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656A981975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rpw7wH21c-mL; Wed, 25 Oct 2023 19:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B24C81DF2;
	Wed, 25 Oct 2023 19:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B24C81DF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6C381BF977
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACD9681DF2
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD9681DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DBKdIO8zFYB0 for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:19:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FFA81DEE
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FFA81DEE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE7A485E0E; Wed, 25 Oct 2023 19:19:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 21:14:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d00881cad152040cc679c37124d636196ab7eb82
X-Git-Newrev: 7385c7f8b302db76a944240ee32d9afafa1db2f7
X-Patchwork-Hint: ignore
Message-Id: <20231025191932.AE7A485E0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 4.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=7385c7f8b302db76a944240ee32d9afafa1db2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.wireshark.org/news/20231004.html
https://www.wireshark.org/news/20231004a.html

Fix CVE-2023-5371:
https://www.wireshark.org/security/wnpa-sec-2023-27.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f044f99483..c9b693c9cb 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.8.txt
-sha1  8ca1cc4471d0cb835cd5216833c393fa23bc154f  wireshark-4.0.8.tar.xz
-sha256  16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8  wireshark-4.0.8.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.10.txt
+sha1  830ba7ff602da90323bbc5ec15941c0878d9ee4a  wireshark-4.0.10.tar.xz
+sha256  b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898  wireshark-4.0.10.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 500bdbb77a..2f563950b2 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.8
+WIRESHARK_VERSION = 4.0.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
