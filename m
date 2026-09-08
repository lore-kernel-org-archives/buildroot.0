Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C1EC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 19:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 210D760733;
	Tue,  8 Sep 2026 19:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBXM2-j57jNx; Tue,  8 Sep 2026 19:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6812660703
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788894850;
	b=IY7n3C0JKF+aSGGq2unDkxn0J3jMkDAykNcqFvp9z9WFhBYNkKA+1/7okBr4Ai7l+qZR
	 FnvrKBlivYz9N/G5qOp1+Nas44F81eNBVGHOO1hOxQR6G/avwnFUkgtmRsLfv8Ol9XdEd
	 AJtbe09a9gozujSGH+MOUyWD8+J2B6kKDf98ZM4lO/hk8lIbx/b57p/pTWLoE/OrBbC18
	 ziiRvhBz6H4S69UUZaQAuVsTBYANtMgHX1exzILPjeTImMSBDD3/b8bIugq1FuT2bc8+q
	 qeXIRMFrWdDTJ+wbCcsnw6W/ZSpEFrNQD5M2v8VO6cdchO1tK64dv9jO7lRFKR1/qsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788894850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Q8Pd4WlnYScbFIcV6OSy7pPGjhHCoYIviZJIpSMIYsI=;
	b=XX75/GAhztFe1+nhcrUKrkrCBgoTwbDJnjtL5PONHk4Wrgju3Jcyy2qLgx17VZlGcdY2
	 v3GtwYOEgJs/3NO8P/1+QFt1rXNGEBeFRQ1RpHhjf0fkBSyEjZeyNfPY3R9DB21gPGtpx
	 LdtI4Duw88Gs1c+xEtd190fAZyetCQTENy29ZfliuzyqnT5Q9olyMmvHf0d1E85W0s5X1
	 K9gLfP6X2rifRbZt92zsx7RzFQgA57LV53FeoaiXvJqSmkhmYGeVDzELfutLQ+pk17var
	 n4HLG0+fVlT+jCGfxWchjdaT+KxfbAhPDcsfCLSK+CFFTjIA9CTafiQQ5yWpy9SOrzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788894850;
	bh=Q8Pd4WlnYScbFIcV6OSy7pPGjhHCoYIviZJIpSMIYsI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QFyEbcX0vCGRiCgS/G5+tYPGrwMzwAS7BIkrROA/db/rMiCQyaqeRWR6emBoxWQNO
	 SqNmXVRyG6xj8FsAVY/BaFesuiask4gUDncn16i231bWQKhy6e1L2l4leuIzrZ0LAp
	 Uh7uLZVsdB0jBtONeIvJuHrQ6hm2nniWSDReYlhJxgZJGwGsDhTDm2cD9hphs3csuM
	 kb+FmiJ0DMHutrApvQVZqglTYT77P08bSztf2kFn7V08fGc6RPaFfnfHWcnqThOzOw
	 +Z9hCnh4m5N7pG6vdsgiyoNyOcYSE7idN9fUMNC+DkZqCygfMtuZgIsyJCAn0jBOHL
	 ktiV1ItRycXYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6812660703;
	Tue,  8 Sep 2026 19:14:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 715F14CC
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632A380C4D
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cTQqa_jAoc4 for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 19:14:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4431780C47
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788894848;
 b=rDiSvtcP33vecalqwEbMF7fwPU4rw9gUOUup7B9TuRfX7IEh5sDpIevQCEIzzQJV9Sc/
 cmg6cFoBWaZjYx4xh389SMTx8ZBFgpyUUex1wYSNcrzeCAGgjQP72Q1p/RP4uaVfPqNIr
 yf1vL2xhDQ/wxWsrJQ8FEkU4VApxTfMu0c9fPpZC4IrvY2fK9Fw7jwx02hu8ghEAC8B3U
 8VN2mZo9D4bQPwoM/00NePS+HB34DP2CIAR/TFcZQey8S/PicKoDsLATGQD9OLd/2R5FL
 l7GQ2TePRmBjD4+tpdh+99Q5ykxAM+kvhIVUgqNc9WXo4BQy0UcWCWEg406whPMrTqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788894848;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=MbY8s8c+mYjQWLW/G3qooQpvFsDoEphTJskJxFIMTK4=;
 b=EJQbfxVZSJk4a6mvJePH1LrKKqRO4ILCiZLX68H6R2zgLxQoaF9s7ssRFs9TWGNbrleQ
 JMBsZOqhHRdE2WYI2emocM8NOG6QYgarz9DWWUTzwLdZxNtKP4qXIulK6748mtDAdPz+7
 ghZrU5jSyZG8hZpRbbQheM1ZkKrgLqZ3w0kcqvTSv8iw7iQ0X1tld5Noa5OcStBE4VbZe
 bg9X2Qk0d/ImQuNKcUPpC/cw/HSKMK7/hxImoRztBPhGNFfXh4yWxmFOsAkEdmcFst2Kb
 8kxF03jtAvc16BLDnm/TiWqOq3vQYm3XalrIGhNwDG+VeppR9kXAuc1AstHL8nim9HA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oVsGecZx; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oVsGecZx
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4431780C47
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788894829;
 bh=MbY8s8c+mYjQWLW/G3qooQpvFsDoEphTJskJxFIMTK4=;
 h=From:To:Cc:Subject:Date:From;
 b=oVsGecZxLU6oHKa40VFf6pqmMz5jzwzCWNmrHIF4Fq8s1/p/AB4GNLbedPUWZfk+f
 lChkAOp+epMihKQeJ6bGourLs9GX1B8l78VfXNl/UQs4ZgiR6dSGK3/k8bmF9DlFTi
 SHG4cxonCdW2rO2F3H42TYAyVCaxWn9Lqv8mdJTvP3xxwQUbynwPutf69q4EZzpRTG
 NHVLwxyy0DmuzpDrtZ27cofqV2t4RJyfVSCI6uezP8RQmTfwNqCENYPf4hHT+FS1WF
 V80J0T5+OO63mwd50Z7oBDPyZALRDirbPqa5ZS9gbAEJf1JqmX1koUbot+jBS6fcKq
 ep5DFsmRNUY5A==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06DD1A4C38D9;
 Tue,  8 Sep 2026 21:13:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41268)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x41GO-000000006av-3ezG;
 Tue, 08 Sep 2026 19:13:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Tue,  8 Sep 2026 21:13:46 +0200
Message-ID: <20260908191348.1892945-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/3] package/libest: fix build with gcc >= 14.x
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

Renumbered remaining patches.

Fixes:
https://autobuild.buildroot.net/results/149/149aad6f98163faab14232a9d3013c197579cbb4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commit/bdbdbd0557ae43c5cc6f186ee93a01eb7610c1b5

 ...client.c-include-est-est_ossl_util.h.patch | 27 +++++++++++++++++++
 ...ve-duplicate-invocation-of-AM_INIT_.patch} |  0
 ...h-add-missing-extern-on-e_ctx_ssl_e.patch} |  0
 3 files changed, 27 insertions(+)
 create mode 100644 package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
 rename package/libest/{0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch => 0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch} (100%)
 rename package/libest/{0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch => 0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch} (100%)

diff --git a/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
new file mode 100644
index 0000000000..d027d8012f
--- /dev/null
+++ b/package/libest/0003-java-jni-client.c-include-est-est_ossl_util.h.patch
@@ -0,0 +1,27 @@
+From b49542dea03c4b895a860c393453ab8497dabfce Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 12:52:02 +0200
+Subject: [PATCH] java/jni/client.c: include est/est_ossl_util.h
+
+Upstream: https://github.com/cisco/libest/pull/132#issuecomment-4749526125
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ java/jni/client.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/java/jni/client.c b/java/jni/client.c
+index c5bc28e..2c4663e 100644
+--- a/java/jni/client.c
++++ b/java/jni/client.c
+@@ -12,6 +12,7 @@
+ #include <stdint.h>
+ #include "jest.h"
+ #include <est/est.h>
++#include "est/est_ossl_util.h"
+ #include <openssl/x509v3.h>
+ #include <openssl/bio.h>
+ #include "safe_mem_lib.h"
+-- 
+2.47.3
+
diff --git a/package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch b/package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
similarity index 100%
rename from package/libest/0005-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
rename to package/libest/0004-configure.ac-remove-duplicate-invocation-of-AM_INIT_.patch
diff --git a/package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
similarity index 100%
rename from package/libest/0006-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
rename to package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
