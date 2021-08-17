Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884FEC432BE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 14:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75AC60FA0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 14:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D75AC60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=go-sys.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A781940175;
	Tue, 17 Aug 2021 14:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNfFhhbX-tNM; Tue, 17 Aug 2021 14:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B51401D1;
	Tue, 17 Aug 2021 14:24:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DACB41BF215
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 14:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB09180C41
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 14:24:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muVMnbcZHfas for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 14:24:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.97])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CC0880C13
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 14:24:26 +0000 (UTC)
Received: from [84.191.225.2] (helo=exchange.go-sys.de)
 by smtprelay07.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1mFzzY-0004Hb-Sn
 for buildroot@busybox.net; Tue, 17 Aug 2021 16:23:00 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2106.2; Tue, 17
 Aug 2021 16:24:21 +0200
Received: from go-sys.de (192.168.1.112) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2106.2 via Frontend Transport;
 Tue, 17 Aug 2021 16:24:21 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 17 Aug 2021 16:24:20 +0200
Message-ID: <20210817142420.32435-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/gdb: bump version 10.x to 10.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 ...1-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 0
 ...2-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 0
 package/gdb/{10.1 => 10.2}/0003-use-asm-sgidefs.h.patch         | 0
 .../gdb/{10.1 => 10.2}/0004-gdbserver-fix-build-for-m68k.patch  | 0
 .../0005-nat-fork-inferior-include-linux-ptrace.h.patch         | 0
 package/gdb/Config.in.host                                      | 2 +-
 package/gdb/gdb.hash                                            | 2 +-
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename package/gdb/{10.1 => 10.2}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (100%)
 rename package/gdb/{10.1 => 10.2}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (100%)
 rename package/gdb/{10.1 => 10.2}/0003-use-asm-sgidefs.h.patch (100%)
 rename package/gdb/{10.1 => 10.2}/0004-gdbserver-fix-build-for-m68k.patch (100%)
 rename package/gdb/{10.1 => 10.2}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (100%)

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
index 9814f3a79b..56943267bb 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -91,5 +91,5 @@ config BR2_GDB_VERSION
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
-	default "10.1"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
+	default "10.2"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
