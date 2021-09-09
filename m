Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E6FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 07:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 462E161101
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 07:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 462E161101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12C940261;
	Thu,  9 Sep 2021 07:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvouOJzTLzEA; Thu,  9 Sep 2021 07:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B664025C;
	Thu,  9 Sep 2021 07:05:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9F11BF8A8
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 07:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D8E940554
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 07:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tsf-FvetpzGc for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 07:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C686404B8
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 07:05:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7F6A688981; Thu,  9 Sep 2021 07:03:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Sep 2021 09:04:52 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: cb797087e95eb9c5bd281901a5b886d8352f66fe
X-Git-Newrev: 59062cac196746eabf1684b908c4fa447fdb5844
X-Patchwork-Hint: ignore
Message-Id: <20210909070335.7F6A688981@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/gdb: bump version
 10.x to 10.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59062cac196746eabf1684b908c4fa447fdb5844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2ee1063136edd030f1c4a8ca88d0a80d98ce8719)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch     | 0
 .../0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch     | 0
 package/gdb/{10.1 => 10.2}/0003-use-asm-sgidefs.h.patch                 | 0
 package/gdb/{10.1 => 10.2}/0004-gdbserver-fix-build-for-m68k.patch      | 0
 .../{10.1 => 10.2}/0005-nat-fork-inferior-include-linux-ptrace.h.patch  | 0
 package/gdb/Config.in.host                                              | 2 +-
 package/gdb/gdb.hash                                                    | 2 +-
 7 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/10.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/10.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/10.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/10.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/10.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/10.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/10.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/10.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/10.1/0003-use-asm-sgidefs.h.patch b/package/gdb/10.2/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/10.1/0003-use-asm-sgidefs.h.patch
rename to package/gdb/10.2/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/10.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/10.2/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/10.1/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/10.2/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/10.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/10.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/10.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/10.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 21e6b34caa..0f0933aed8 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -88,5 +88,5 @@ config BR2_GDB_VERSION
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	default "9.2"      if BR2_GDB_VERSION_9_2 || !BR2_PACKAGE_HOST_GDB
-	default "10.1"	   if BR2_GDB_VERSION_10
+	default "10.2"	   if BR2_GDB_VERSION_10
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 3b4845d64c..c45ee7329f 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
-sha512  0dc54380435c6853db60f1e388b94836d294dfa9ad7f518385a27db4edd03cb970f8717d5f1e9c9a0d4a33d7fcf91bc2e5d6c9cf9e4b561dcc74e65b806c1537  gdb-10.1.tar.xz
+sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
