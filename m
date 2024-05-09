Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DBC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12797612FE;
	Thu,  9 May 2024 20:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7R6CKpSTPAy; Thu,  9 May 2024 20:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FC061307
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31FC061307;
	Thu,  9 May 2024 20:52:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73BA91BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F76B41FE7
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByWXjGGP8h8Y for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B2B641FE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2B641FE6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B2B641FE6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:52:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so9320395e9.0
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715287948; x=1715892748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tgAdxG7Sls8sb9B5xK2ZcYAoMfRT3fcfkdF10nEIIg=;
 b=HMC7BlLpDuvgJlCmwGafWTrbAj5GcXPOXoXuFY5vDCi65XiVUwJ/NWXUDM+wc1waTr
 mGPnJ/B/8CtJ+Gg+Nw/OzPWNw+5arkhNuPt9UxWIMpYp5t1bpIFINqeamzOLsNOJh/8A
 qr4s4fI2fLY+sHqwuNXxxI0i8L4ldlaPyeQjKz74LhH5WKGpgkTfW/L645XHVC5DgWSE
 rlOvXEPFbkjoctsEltkqKjIuwYqn9aU4qtDjYSa+nj5ejP8mukRjSJlFDBjoxXSnj04i
 Fswy6zNIKqE0qMYqlZIQZHUo5KnuNwr1xjDcwJc1XZUUdmeLsnvcl0DaS3RKK6AaX8xL
 1ZrQ==
X-Gm-Message-State: AOJu0YxOYqeX/8wxlzOV9wp40ahM7vheXRwaKAiQClE8VLJvUOaLRKhi
 gpbZVAYcaFW/MxfolZUDbwEy5s2YmyDJ8h/g7vcyE/hf15Pwe6c69MaqgQ==
X-Google-Smtp-Source: AGHT+IFcf4a8cq57wVo8rOrMFQL9dJf5ZpPzps8DAnp/YqSVzL/fOBS7+szB0Tbmatbv6EbUIgARFQ==
X-Received: by 2002:a05:600c:4f4e:b0:41b:a271:60a9 with SMTP id
 5b1f17b1804b1-41feaa2f38bmr5694895e9.6.1715287947561; 
 Thu, 09 May 2024 13:52:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88111033sm72171405e9.34.2024.05.09.13.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 13:52:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 22:52:22 +0200
Message-ID: <20240509205222.83610-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715287948; x=1715892748; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/tgAdxG7Sls8sb9B5xK2ZcYAoMfRT3fcfkdF10nEIIg=;
 b=CrC0HwEOhVbut2UXVJk5dPyC3SCmAJJveMC/+mocWQKzEa9HflCULk5kN3Wur3r6I8
 qgtJHk9VCOt54mRvjCVHzWieNdPhB3/7z0xwOOxi+iXWRzMqrD7oj324KLCbB+6cl72M
 gdhMoL5IGrnP7KdLSLaYST4BGTxhUZExHNkcPIH4p1TJjposJi2F8z0f6sIdaxvcyng4
 7sfEZDmAkKgerwfwodjJutK4KmQoQA5iNNowTGWOzQ9qupdG2anhRCqzo6nnvPGa5c6p
 Qi4Q0RLTTuc6z1CSNKrwsbmpKgh/23OaiI0zU7mSl4Ju+OwgqFbmmpwQc9mgdXdLwPi2
 KDyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CrC0HwEO
Subject: [Buildroot] [PATCH 1/1] package/python-mpmath: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOm1wbWF0aDptcG1hdGggaXMgYSB2YWxpZCBDUEUgaWRlbnRpZmllciBmb3IgdGhp
cyBwYWNrYWdlOgoKICBodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUvZGV0YWlsLzJF
RjA1RDAzLTQzMkQtNDcwRC04MEFCLTHDoEY1MEQzMDhCRDg1CgpTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL3B5
dGhvbi1tcG1hdGgvcHl0aG9uLW1wbWF0aC5tayB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1tcG1hdGgvcHl0aG9uLW1w
bWF0aC5tayBiL3BhY2thZ2UvcHl0aG9uLW1wbWF0aC9weXRob24tbXBtYXRoLm1rCmluZGV4IGNh
YTY0OTI5NjEuLmNkMTlkZDUyYmUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLW1wbWF0aC9w
eXRob24tbXBtYXRoLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLW1wbWF0aC9weXRob24tbXBtYXRo
Lm1rCkBAIC0xMCw1ICsxMCw3IEBAIFBZVEhPTl9NUE1BVEhfU0lURSA9IGh0dHBzOi8vbXBtYXRo
Lm9yZy9maWxlcwogUFlUSE9OX01QTUFUSF9TRVRVUF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9O
X01QTUFUSF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCiBQWVRIT05fTVBNQVRIX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCitQWVRIT05fTVBNQVRIX0NQRV9JRF9WRU5ET1IgPSBtcG1hdGgKK1BZVEhP
Tl9NUE1BVEhfQ1BFX0lEX1BST0RVQ1QgPSBtcG1hdGgKIAogJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
