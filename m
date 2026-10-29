Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA26606A322
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q9BhK8gj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E44A060B0E;
	Fri, 30 Oct 2026 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvImUc6ySvbg; Fri, 30 Oct 2026 14:07:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EEBBC60AF3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369235;
	b=eslH1eq+9fSoA44VmyYxTUiST0FAsG7eW9AKNjDmiGmtBGDkZ1e638UykagyzOPzszTE
	 imrEbx9SDmeGqb+x1lHbttubxiY/FCANxh085zp2YsJPs0yWO2y4hxs3MYsO9PEoFX4OR
	 j8F67bs1FnFzNV7Vr7BeIxi9qf4JA0qYdYKhkOP1tOg36wHoe3Fg1zDIVWcRD1J8K/+Aa
	 zGYOvyOEGsDyQZ9OjNBcONCM65fbBCLa6no+hMwZhH2XulMdJaKVKado6ZNvclPkHmCgD
	 mQN2wv17LHTQgjNmW70LahKyEpQ0YwldQio0TQYO5l5PD2NFiS3qlVKVKUN6Xu/Qe2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6VW+WDYx1OUyrtuExGSMoMz2NrlsHcxVrCCsiaSIK7w=;
	b=iUJ/TDo/ZAke8TkmegjdVR/CVUsEwWO5M/2hn4ZYH2IL0ZHfpPP+48GI63M2ZJBOgWX7
	 iGeD9EiPSTOemw2KcX/a6YE9wX/PcxCZwhRlrvm904wBco1nRYiQbt94o9ZftDtBOlf1D
	 6lQ863PXwbBxr3j4dAPilik2hw/OPd5pNL2hsewhM1mEkIFCgAtDRBbtHrQd9NDtYIPeU
	 DftIsFeijZr1ArfLV/bnu1cT97qey1dS4jZvlPenYoz8AZseIM8ebkD8U6kIitB53HFQ8
	 EvQOTVjE2+o5GbEd6aYtXiC0HFgpy5tvVkZV6VthXkJ7xpjW0iaLaX8Z2owQ09C2tUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369235;
	bh=6VW+WDYx1OUyrtuExGSMoMz2NrlsHcxVrCCsiaSIK7w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q9BhK8gjzPzYJzMiKu+TR3n9lRFKfSwZIRIrYM6OJSm5VpbpBFFTee7ZS4fP5QSpC
	 M8Ac1xOLJE4zLfsSMyFhc/eo4QQz+eQAkCQN376LpF4FWzLfztMWmb4gcSxD1DpT+2
	 +UpeR0rKRSdDZcTNllZIMawntFCs7DR5rHS3RcoVseQ1knpcx+P1J9NUyO2IA9smKA
	 uGOnF1OnkC6Lrahgw0DlXK98EUJb8e6+Akvy62iGsbz0vt3qI7RYxbyFPsT4B1yAqo
	 KO7a+gEQWzPvY4mr5iXGgPTx5NIpKEFDWOjbu48E1fjMs6zJT1NA5sdkIaoMcQGmr0
	 w9A5pX0Emv6wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEBBC60AF3;
	Fri, 30 Oct 2026 14:07:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B00DED38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0CEE40B36
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8NMiyQzYOfR for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EAB7D40B31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369166;
 b=SKxN1UOhLC3hwDTyRfnsrQmyYLzV1c6duOoyuiHnyzFB0h6lKw8ZhGMK1AD5idiYs6t1
 rmv25XehoRdLAOUk3icJO3gmqHBOksnru1A3jNjfzwJ8TOvGyelmWZKjXwEpSfqWW/71M
 dlN8kSwKQRH4o5sbbFP2hPg0dO6qIzc4KwTrsLEkagxlpRSz7nKJ0wmo/ujzIyfbMx5sC
 FVXOSTig/nYcY7T79nkUepLKDFGYaTPiNbU3qU1dExjPPH92GAmL82WQpFwTSC0SnXcFa
 wwX87cGy3i7iLssgrzzJ26d+Uu7cCFUb+/NBb7G+v49vgdjoVrgNB6YNfI7P4gb3pRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369166;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sSQbcwd1qa5wtvcFQlnFEokMDFAy56n/pme2i1PMtXw=;
 b=ZfQlJpYVkN6KZv+RdTnmSWVm+hiwJFPt5ygV+tl/+J9fgZgh1h20UqOJtbf6nkD2Bnig
 R0Lc/wYdjx/mDMtNPY87repK177FaXgZg0TLlSLYB/nzUgU3/COptuc5ehMVjLMDn80Xw
 xY2kYWnp6wdLZGjQQ07RN3bpIZoaDu7ctR0YyJN8e1lILDl6Y6g/12+XJ1ewxY2q1XCa2
 6RiTGDgkE06lUpzsJkITtA+CWUe480/YqdinSmpNt5prunpXYxgpV7A3+41Fzdx2QJF76
 sD+E5+ltP1DDU76S/xVe+rvEPNNhRFBMz35zlDGU8fQcRd8zmZ10QxA+6te2bPZt/8g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB7D40B31
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 167FC9D388; Fri, 30 Oct 2026 14:04:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1bcc4b447741571317b8f88d3174f59ce7768443
X-Git-Newrev: 88ee2842b977e02bc9b3dd74a42fa3a4cfac64a0
X-Patchwork-Hint: ignore
Message-Id: <20261030140438.167FC9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.114
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1640086054363374513=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1640086054363374513==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88ee2842b977e02bc9b3dd74a42fa3a4cfac64a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_114_RTM/doc/rst/releases/nss_3_114.rst

NOTE: starting from version 3.114 NSS requires NSPR >= 4.37

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f7b64eeeaff351bf1ddc810e3f70c03a23a93daa)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index e0bbc82413..764bf1d179 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_1_RTM/src/SHA256SUMS
-sha256  b8c586cc0ac60b76477f62483f664f119c26000a8189dd9ef417df7dbd33a2cc  nss-3.113.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_114_RTM/src/SHA256SUMS
+sha256  cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1  nss-3.114.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index a5ed34e95f..9af53ca8ff 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.113.1
+LIBNSS_VERSION = 3.114
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============1640086054363374513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1640086054363374513==--
