Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121B606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mC5V7xML
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF8E8103B;
	Fri,  6 Nov 2026 15:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMbM9RadAc28; Fri,  6 Nov 2026 15:59:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BCEDA81290
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980743;
	b=arc0dveM36ytBf+1uUuLOH9HID4WYOp7eEhN0VPBP/LTFmN34SXVvBlkVm4zOJ8hiAJ+
	 qSceedipUtQYU1VvTdG53dzxGieAYjCFwiW++sLyMx16heez6H9gXeEmPvbiqRDiwFhsN
	 eRSsxIJECIsPXjBx8tOg3nrSchSbbxMx7X5aHh1sEuTdZ6P6jFVp7UaIk/ILzvf55IFwf
	 iuF7VsVJQ4NTpZCjiPk0+UTGkuPWecWW14q3MGRKEynbZmICNzZFdt3MBev+F6YAMmHrH
	 gjIFJshWsjg+5XlTRvO90Y+Ovh9fSiKHC27RAD4E5mIod9KlOtl9PlRxXajKcKOxTCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mEEDGFQelfvDf6Q9p59m9kRyMXyE8HAbaAuB8IuuOpI=;
	b=TW56bWh7VgNQo7Ki0TIkU7ElGfiLkX5hmggt3s05Rg1+5WfOlp0VL3cqwxH9SaXGAln7
	 UgUpoxI0PM+4qn61sUXMyBUJg5LYQQ9mLWmKah3ax6snD0T3eiPJgKI+SfoMOFtYxEP74
	 hD9OpKr2BIvAd4TkoVz7gyZw4Ga18YcQITWsEGPFutgLJdT/0ZDN0Lmo7/YvHXjjZWGgp
	 1V0k1X2pjZMSKiG/Ic23c71GVDwxdLRSyiLUp62r19jylDF9+SyuldEEB/3FNjJ0OoSHr
	 abFlt3nlcGs6CzHv+4XdEAWnd88qD8Yghd7fRfh7QUaNG7fA6U83/5cSBFX9JS1czsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980743;
	bh=mEEDGFQelfvDf6Q9p59m9kRyMXyE8HAbaAuB8IuuOpI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mC5V7xMLXgwIp4mVBFMeoi3k/n2PuaXi98l2upoTn52IU1C3TYfodKj/vQ5C81U2b
	 LSdOhUYiYtXIQKZ2GMov+Q4cQGIlRL3+6ruiKdzfn+3f0gOQL38rCJZxSHI7YGPK4M
	 aQ9XUPLRx/4HiazawOAxayQTVyHcaj30/6ENPssEw6jdmk66k+vy4ma1/6zZ2atLdD
	 Xj4r+nIwiGdqUpgQOWYcm56+ECG8wdxH1nEMqy4uR4WCQaojyd0Ga7zS2tYEzwiXgg
	 aFN2SooYFDQoy05ofKXF5Wn4D9TqZ+8fVmtwoM/mXyS2EXcRSnzXV/PXSm/0bdZDjT
	 86Nl5NGMd/H6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCEDA81290;
	Fri,  6 Nov 2026 15:59:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60260D3A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43404403DC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BjPP53EZiia for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D3D0F403DD
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D0F403DD
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17FE69E09B; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ddb270f94bf2cf9eb612c4ef5e041084c80cb28a
X-Git-Newrev: f98118f0f7979178e9765c4f85b2bba38a8ca438
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.17FE69E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/rtl8812au-aircrack-ng: fix build failure using gcc >= 14
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
Content-Type: multipart/mixed; boundary="===============2782699041591240828=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2782699041591240828==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f98118f0f7979178e9765c4f85b2bba38a8ca438
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Starting with gcc 14, several C diagnostics which were previously warnings are
errors by default. In particular, -Wincompatible-pointer-types was
changed to a permanent error by GCC commit:
r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
("c: Turn -Wincompatible-pointer-types into a permerror").
So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 750d353e3bb295b051ad50dfbd62a7cdff4a6857)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 6ffcf37c20..9c6cf3936f 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
-	-Wno-error=address \
-	-Wno-error=array-bounds \
-	-Wno-error=cast-function-type
+	-Wno-error
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
 	CONFIG_PLATFORM_I386_PC=n \

--===============2782699041591240828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2782699041591240828==--
