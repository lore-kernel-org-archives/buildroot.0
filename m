Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2C606A321
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HPYlLp15;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Z2s5Ctna
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9B1181179;
	Wed, 28 Oct 2026 22:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7JwhuvfRlmV; Wed, 28 Oct 2026 22:35:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CB8A181174
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226950;
	b=Nr6eZY3pw5+6WukK88FuI7D76U+Gb8t7kGUUOymb28Gn3IXwumU20AdA9v3Mv5P0wiTu
	 4KGuUYf5dKtBKX+o2YLHL8LVnOVRq1ER5RWTyd/jOwCP4+gCs7YsGYnWr2GgXbiOiPjKt
	 of9sGnOU9FVPDUEP3zyaTIGD3EVw23xfrpbNzaZGBmuOdW4qDTTNMQ5QLhqxrRFxcyAub
	 V2rv2Yp3Tr1Lg0wVQgN5uDpQd55VvugQ49iMduwyQ82hxSHXiU/wboYUDo76LIUbHFa9d
	 lKXWKSELTxnGFRwkriZL3e/2gUqCIpoFEpZMbI5CR9YsYbdr6CN0Z1nySEfnNRYUVgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	b=NFxRBVwFiIROb8LpxkA5gc3NDhDTO1QPtqmtSBeiJdE7QU8tP87HxaDCMRdowKPo5ZCa
	 epHidd2Ve24a3u+oQoTCbvhWXtmpsAZNlqVR8kMOVq2NTBdqhQSZavYNYNYSlBl0nH0Ni
	 b+oW4S4VuRalAf0MZiTSgkeXido/Zez9rLdx16v6k2zzj+ZKvEICzjuY3nuj/Bl9nkc/y
	 SPAIEudHlvYSm9oEhtaxJoi4Qyr4x5h/Vu/5Ul+BNJ0LDLAiDNku8jsiFcKSoORTrljpE
	 rPXKRGPaAzsScsA/KgAYFpyuzEDyoGMXEI14Yu8Etq7Webwl5dbQIlbleJuhpembv7Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226950;
	bh=nlOtvmdst+oCb769zmCOS6DHYlsd5C0Bw8vPz04wQmk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPYlLp15BR+YP7w8NiWY+5OIlPy/b20v+XM4urQvTHkoTm3utHxppXygbfQC/xT9C
	 JCxah83j4UTf5SsZLzvKf640oMAMll63hnYPlC4lGpcBjX1FcJ1pwl37iOgcI0CwUZ
	 qWOkl1DnAnos1C0ybvIKjEy3Qwx26lYB2pD9vhSCMXKdDyLs+FG9FoGV3XxfBSeabD
	 N+Tn16TTPmKvFxHESfUCbsuZxTbvEfmna82qd1HxA923EQSmlLwcY4U9BuDdulf//P
	 sZZB3BNNh6qg5iFSVYvd+KvSmnkm9po8lnbk2TZHot1uSbblclg/0xzSiVb5qdekK5
	 102pdfu5wqw3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB8A181174;
	Wed, 28 Oct 2026 22:35:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E712A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CE00400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5pjZxquDRLH for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:35:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D0B564004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226949;
 b=e4ySNIy1dWta/meKulhqxlEsF7pAkZ7UTw2CS7gI3GgRZxbHlcL2b0J5wLD+uqshjMo4
 Sweldh2j7924ZsOgqZm7eYrgVn0vpeaZyVRUhAsOva/LwMVmHhyWrmrvorlqoNxoXISS/
 dBTKSzRefNYmxXpgiuA0u1IfvRWRyrgdnlcxkf9X4hzlyM7TZzfPYSMNlO+2v5G8nL9rx
 LUArgrIsEiSkxDsxWZLKDxXS2UroICrkpNgVaXofF4fmWwC7yd3bm4/p9JRng1ndZBNJQ
 ymDvNihS6wwGHgkpOJtr1OkhV1zqgQCu268aLemt1bgmno1Rgpezj9HTl8rjViIg1GA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226949;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 b=f3vPfzp3Nc0A3bOs3TbtRra6jLSFG+hlQBbnVjLDj2Ugd5NQA2IicMYcrZNM9xOu8NWM
 GdFDYJQW87ewHwuPjoD3DkE8lD9PKQsKk22T3j14Un6xrl5jhSPSk2bobXEEFwW1Xv/A0
 xXv8Ome1lU0PUXgrlEc3uNm8uZ/Szgw/g6CTiH/PnfqKU2ZrwFRpy1N4UAdEM9k+5ccSj
 cVLlcW4CUt58kpf6JzN5KfLQq8ryVvOHjVnUQaDwDW2sPANXatI6a4pjkDOTlMx/INzT9
 OiYXqMeCDR5PE4KDIwmdpkrkomtPtQPiz4ZcygvDkgTmt+9hhNt9U8OfMsHKce5AMgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Z2s5Ctna; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Z2s5Ctna
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0B564004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226602;
 bh=pNZBPyZeOlBaRCbAAyVSNvXj1naepQ/zMPBj6+ASrAc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Z2s5CtnaJHT7Sv1dTiInYkVMfyIl68zpDcdmYq85K5UivueKMantA3Flexc19e0Gh
 WeE2Djf1eqIlozkRNW6MDEbekXAQDvCrXEd313BuiaawJHDTZbPEsC96cfmZhlgpLi
 dHKi6tPpbOI8bOCRDBQW7dkWFCCTetos529YHWGpplyRHnuuO85/OJ/TY9g+I7tngb
 e6L5G/tA0MsWEWFaN74QeleKyb6EJCE4VxYmy2tIXSQL4wZSkGFY2PivuQU+4ZNfui
 q53ZMFt9yX6z8xgG9iDEr3FagmgPmTA2f13n0wVxSlA00DOuydaKkEDVcAuhHxXvxq
 dhDaJx+nIlROw==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 gc+n4fWlbMHPleIQbvdC6aMJOtlQMACmqc/tqZi0NxnWT8Mi0KUhCjEwWbH+mGbTbh2GPghgXpA
 WsTXXhAMgYeg2XdqFUXyoAT1jsq6tSpiWNUf2FY4D3fbxN5+iP0mPadQxzGgAwE2h89t+zr6ewv
 behbTJyVXyd5VVv7x65ja0VIeKompD+YQ9M6laj/X1kNrGqyrm8Ap8ZNScbe3g09SX4EhR7OEFS
 kU7taCCUNvbj2yBXEHuvW1Loay+gp+RL5By9f9mr9HjTWo1Uv8YJsgDeuvDZXZun4fYiLERiDAg
 T4VCe4pQKQm/O/cJNL9K/DiQq+Os84zATIcMWSUIGGWq0jJQwVVyILdtcn0H03VsSjj/Eo6wqtf
 n8lWZDt/2/p7NvmfOH/dj3swLk8Efa13TojqzCZ4GIL8ID1CsVQiIKzyPsTMCyquWoEPRNUtxYV
 BQfNg0dXhV1TNjMwQN/YE/PvpY6SbZXPb/F2WYLUG8xb8Yk0JGEAlvef+S3f+e+hic4k4DFFslG
 rAiyPw4reXwLr9NLwp0D7hTFWSnmM1XX4kzwxGDv2lzKoFMIH0+uJoJiMHP8+83CLf7ooDdMmSg
 g9NK4Q==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0A61A4C6FEC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9L-000000001i7-0oWJ
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:33 +0100
Message-ID: <20261028222936.514451-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 16/18] package/kodi-skin-confluence: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 9cde584da2..9974b4a3bc 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae7177ad7f06fdb38ba0e217b2ac3e4375cf29a7792f2eaa70003286410521a0  kodi-skin-confluence-b049aa8b6bab50518de72783efd219680047d6d9.tar.gz
+sha256  8043658a939e141305d6acd426a5a5be3a35ec1b94baba23fde069e4a1ff0f00  kodi-skin-confluence-da60e21de4a87581a8526c9409625e9f21cc7a33.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 31d6b37380..2a83eb5994 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = b049aa8b6bab50518de72783efd219680047d6d9
+KODI_SKIN_CONFLUENCE_VERSION = da60e21de4a87581a8526c9409625e9f21cc7a33
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
