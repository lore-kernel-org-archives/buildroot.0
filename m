Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F8606A336
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dYuA5y6n
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131BD608D0;
	Fri,  6 Nov 2026 15:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gU-_YghjEFt; Fri,  6 Nov 2026 15:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 375EA608AB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980751;
	b=RTd4Vk1xaBnDpb6WMinWJ2ekpDgiBOYTyAkehsica46IaLvcprlJhbfAHCvMxog4gNru
	 IHU+nQgZl9OMAyNGsqHcI+DrDUdbDk9R21nFClkNPtxVvI39gI6tL33onzxLbpHu86ZFN
	 d926S1zmQ5e/0LqtAIRPrAX8ldttxLXO09Xbe3+vJaXKuH8UG9+Wt358E0fTD2IaoXMdL
	 4a+SGzyEPdY+pZ05RSuujP2a1PDBeI62ZtbDDKzTXniE0IgVjvk9GsTWiFuXRRA1oGBcJ
	 P12mfgvXuc02W52PUwkdM8+tJObPn1gSo7qhLJoTetrTGCB0drXQV31ltQCAJja28XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VGOuPwxOA97lP1Rvaht4d9H0AQYyOKZafFvwmNDa35s=;
	b=R0AkR0PFQYRjUQciUcoQyAsJ4ROwZBr0UasmyU4iDPsh1/LwOe0mwF73gwHlrOpwYKwC
	 HLV5Ik+6/haBGVMJYvzTX7RgXKx3U+K7LdRFGkF7sRfcCnxvtg+7GZ7IxQKhOUVhsnrbu
	 yrUz4q7DN87KVRDBLXvAqOl/zMv9xDdW+BEsGGsrc88W3D3luz4TT2s9WUZOnvGFCe6kD
	 0kDjsueOebbczKh5chLpsKC29Dd3cxhh4xRJnkGqzuxzEK2likmorCGXkjqx/D2tOKbGR
	 ex/ewn0xgohNsWRHWi42laroe3+N2XTnMqdo73snSHljtI1oVq6/gW8IheUjqy7tHDQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980751;
	bh=VGOuPwxOA97lP1Rvaht4d9H0AQYyOKZafFvwmNDa35s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dYuA5y6nV9wIeoDGM376JTQZm4P0GWbmqh9/oELZtDZDBonqDw9W4nivZOCwKJlJg
	 BJLYSsRogyc3m9lopCT4VzLtzQApy/MldpHWqHWU/mwQ+0J9A0MVgwbwbAWhs+LPsM
	 dWXwF/cujrvBNgLQaLhqKlOp9lJL0TuWZFv6jTntFiRxMN3U9+KvFee8jd8/53Cxcv
	 h2XL+91Zt853BPeswR5T+bPx0vXhadQBzvyCUSi9IY86K2nFQkcs/yLWbH8ehGfaVo
	 IsPd2UeFgM19kbbItf5sTtNFPPImcpmfJ/qxc60lOEQWlPhyFT9z63uRBa7Zy4ep2X
	 npIetaLpOaXrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375EA608AB;
	Fri,  6 Nov 2026 15:59:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF66A14
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D1984091B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tp27wIroH3ol for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BD7CD4091C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD7CD4091C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 012159E0AC; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 821a4db80e9b9f3eb261a4814ea764c1b06ef9dd
X-Git-Newrev: ddb270f94bf2cf9eb612c4ef5e041084c80cb28a
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.012159E0AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rtl8188eu: fix
 build failure using gcc >= 14
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
Content-Type: multipart/mixed; boundary="===============0931226226331210759=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0931226226331210759==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddb270f94bf2cf9eb612c4ef5e041084c80cb28a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 40a535a386aa3caef0e4f7da4c1f11619b912b5b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtl8188eu/rtl8188eu.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 9c60929d62..d6824ffc1f 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -8,7 +8,12 @@ RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
+
+RTL8188EU_EXTRA_CFLAGS = -Wno-error
+
+RTL8188EU_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8188EU=m \
+	USER_EXTRA_CFLAGS="$(RTL8188EU_EXTRA_CFLAGS)"
 
 define RTL8188EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)

--===============0931226226331210759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0931226226331210759==--
