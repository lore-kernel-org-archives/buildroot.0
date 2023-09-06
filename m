Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705B7EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BEA8218E;
	Wed,  6 Sep 2023 19:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BEA8218E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpmQPCT1MM_D; Wed,  6 Sep 2023 19:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D288210B;
	Wed,  6 Sep 2023 19:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D288210B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EAC11BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1642F82109
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1642F82109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65ryuqcF7SJJ for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:45:56 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F1F68218E
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F1F68218E
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgNct-1pzwxL2OHn-00hxyL; Wed, 06 Sep 2023 21:45:52 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 21:44:19 +0200
Message-ID: <20230906194420.279926-4-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230906194420.279926-2-dalang@gmx.at>
References: <20230906194420.279926-2-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tqS8tWxxNPddOU8Li7a8PYncTVk/CEE79ze7MlHsp+uqWsjsR7l
 25CeW7kVuqbR3ha29JMgNVwq3EnaBawtnSCrkr7wiGIKdZoY9FyIZm8TX6960urJcBG9Hdr
 4dQjLz3AXTT0vgL/J09jU0Nrup/ibqnngO8XHP4uc15k59jSXx5MKtqV8sWPMGtAhWoPVg8
 7PvZqvJGz2PSWWcZlQZbQ==
UI-OutboundReport: notjunk:1;M01:P0:QlaLyTauDfY=;QyU1cr1Cyrg/CJz3Af5C/OzXII6
 uyR+VmMdHk7Uy1GOFwb4JIesRD2FXA5wkorFGUGqsQYLuDLCPx40+mLTYwp/esn7g9HLKWKjr
 HOkPbgi7GdMINvbdqKGr1/xzDhvLow6gBO664QdVkpk1jdzfVZSVW4+O/PbpRTfJXiD/DcbLV
 mLh7dkK8eOtGYMgOYG9Pa1LryzIUSNOeaCkG1hklkzxaE5ktNib1zj87LNC8Yl5WNtLlRilKr
 a0+P0ia1+TkzXYifwO0v8N4yqJCjjaNsoKSNvG1b9RUL7wwC2Gejs3fVg40pXpT4HatcC5sE7
 eT62nWEae6aDxXo/hk2Z/cIbdTQFVwMwh+6O5mJc70DntgfuFMDBCZFJfSyB9ofNXylRiNTuW
 g6UZZQQgRCsEd8GF6cbzF0PaynZ82LmCN7eVJlkfUrrZEWodrKqrt7MsaPVvPT5X0+DcB5krG
 /aBplRMyuSC7w2bXvUU5C8OTWOW2h2t+lZ2EOYKc6hHsD7g61nn1h2l+z1u+rhWaPDfjWl7ki
 CvGkZ1+Tu562aSopKz6vFNyqvOWnXtCfj4Dndk0NNsqHC3lpCR2N695ZzvjVbJFQs0v2YWzT4
 beNiZycYI3CSXmwPBHfs8S48thRazY6nF8vNGThwEVnUBQTTGVyu/e5/Drt+z/rsCWC/Y9bL2
 4/fox7dUz+lvC4SSiKkcWJQOJrycSkKCsjAgAO99xyYxC6SoDfz2LK0xzIsbyawKhXIs1ruxn
 5ZElrrqZ7tJQfCKx0F8w1JsyxgsJZ3oMzSZWVUqW5MpnNJ8OGqP8FbSIlP3flnif0qcaoAvIC
 uSOB9KQo4L/WTdLznt7Pkb/myioqpoCOlE5qNIJwMTtkmRFWYKls0VPP4/jFkWfdJIRk7TvB9
 25Jlnp8QM11I7o6JcpQpR7ni8oar4Ev7nR3V7jn+st3yRi1DdtLHTuTcKig4NeO1sBT0dZoi7
 plSOEpJ8g2BcFtHUUpuSEIRp5cw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1694029552; x=1694634352; i=dalang@gmx.at;
 bh=4JXYXufNjDc49RFu1pAe5KBXRuayzaBO+62AJPakU80=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BT24fR9VQdJCYifj2j25NrHFen4qF/AVaOnOV4a3P8UfztSsN3KI/DFxfauxo+j7etf3n7s
 olOe4upwt/w+Oy4h7pHT7/caKYIBolxeeKNEXVNfwnbp58zMm7lFRAXEZAh0GC/20KC2i194c
 WWmOl3Ya750QvTzZETLcU3ZmOgjVHtBzp8E8IRsO4J2FiPGV2vQoel92LNI+GpWrsd7nHdXN2
 s0gVgAFCYnm3wXGjGiZhXfiG8FMM/bFY3mB9V4tFiEogIMNGZjqBV6XceZC2Zc3xq/jeYesxV
 GULzWszKj3Q51uR5l+PZaANm78eC9oU9u4rh6BYyFXKsiVwtLzrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=BT24fR9V
Subject: [Buildroot] [PATCH 2/2] package/libcoap: ignore CVE-2023-35862
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to a collaborator [0] the affected code isn't in 4.3.1

[0]: https://github.com/obgm/libcoap/issues/1117

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libcoap/libcoap.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 3773ad293c..94bfc59702 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -16,6 +16,8 @@ LIBCOAP_CONF_OPTS = \
 LIBCOAP_AUTORECONF = YES
 # 0001-Backport-fix-for-CVE-2023-30362.patch
 LIBCOAP_IGNORE_CVES += CVE-2023-30362
+# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
+LIBCOAP_IGNORE_CVES += CVE-2023-35862
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
