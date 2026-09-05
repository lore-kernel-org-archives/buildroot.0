Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D94C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E9F8108B;
	Sat,  5 Sep 2026 13:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHlRzOZGEDCv; Sat,  5 Sep 2026 13:50:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 56D4081010
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616233;
	b=FvRGFUSg6lGJBa5eLesMaRkJXo1ONmVLFiy0Hk2t0TT5aS8TxW29W9NydKhr528LQXK2
	 lA2nNYMKCWkXBp6YVdfLpw2XNWnjKFW3h5f0dnSGKl8p7bEhEr62LQvz/MWWBT7w1s+1y
	 ObOZbW498qqeFRV8PAakHhSloPUL8wDYDj5nlz7oTTlkZSfayW+HZWXUKDz20aCRYIlPG
	 +7150VrHLIBxpoPbQ/TxLzx2xx/z17qOIHiSwZKQYuWAZkx/WmAhnAPGp19xLMNaCWAGs
	 VmV0/fZFFw9xIkRQNtoKukt10dFw2eK8ta5QM0DwfrRJEUm+Mw2Gi/oLMMOCWEivAGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ty9+NHAnwv4G4rAQ9xq3mfAkv0CMB0t7Hdlpds/FrVY=;
	b=DPCdq4eKoXBozNUjJY6nvrA2/UcWTn15onCZfdNDVEpyG/miWl4Ov1xzYvQVB6p3GZPk
	 I07PoIjZJSQNkSfLkYImqs3RBe3vI+Hq8oVoJVpzQvp6gOhdKseItYp67JCSIuMAfavg2
	 fpFCl7NHHtpQ62KTigwg19S/f7PZ77raYEu3PPVbSd9EnDtxhweIWAwF72xtsH/ztUBoq
	 7wldJl29QYagTXZJOBZ3Axnx/ynpXDuwMyU3oeBEuUDwOd3/GCP1AvWbSs/MKI/SaZSYw
	 4S06+EKCyqUa36YOSHzokYwl5VNwDMENboHxuBBUy0hMHtyt6MeFGQfAnEFsDlP8FpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616233;
	bh=Ty9+NHAnwv4G4rAQ9xq3mfAkv0CMB0t7Hdlpds/FrVY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Btz13BRtWrklwflhX9yhfyplbVRliG5ksQ9aeRtcG/UvkcX6ZcnD9ckWpgWoxPgGQ
	 0U0WA+6QWCSSA8mUIgx/2SZvmxwvtWNJiFbx0ko2e2xjB7d6H5OSvSxxE9YYI8e2hk
	 1W2uugxnbAuhFcLMrJqzG0je8a8qL/5jT/AX2NOqunBUAE7VcD9k7dcLIAE24Ug3e5
	 HEldV0qaO3YXT7LmjbL2tALiHOPq1QeHre7zusbFW3Y4E0/6JjLYwttEku4yX2/kNL
	 nweWdAscUg3UkDTtZWutdoGyCVk7nzx3TDz4C1NKzHaucTRdR5vKKH2pTJO2t3Ed/G
	 C8obVAP5jbVUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D4081010;
	Sat,  5 Sep 2026 13:50:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A79DB88
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BFF181016
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufY1tVNc5M5E for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:50:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AED9A81010
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616229;
 b=L2eJxnQXRFsAhMdFCPBQgtPSeqj1KDnxflRVltWy2fQLGEUEZT2zYdG1RuYz4XgR6GNw
 jjHikZ6p3hFcqLZK8z3EagvVtCrI2Gf/fK2TLP5NE/tS9LrEUE492XwsDpiXuF4nPauq6
 I+le+F5JVgXkQDxsb1rRe2yNiK5puFvsKtVtjDbfeH3xdzxMf2szKW+fC+W1oIO6fb7CC
 Tw06OaC87kR8EuoVz3SuwwkFkTlU35zK8d3yfcLrjLGZJlo9bT8LzfwF1tgdJOOWK4J3t
 9drITQCNIrieiJf95cqg1yqpb2WPsGa8l6AqJx+VRH4aYqMcBXojKvo2tMDQxABFTjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616229;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZbDLuLG3N5nvMZIcWa75elZZu9WsIQP6fficMcgg5sA=;
 b=RHzatFUMU/Gj/vckAPu8lJrWXmMM9rmL7Qv9FptBtklO+EdrsRiu20BXTrRefzbxsD1V
 IvP8t6dniyqbkEJyodQ8cd1Wefc6lsbQFQrYhqYQDjVuU5UozSPbNExCC5T37EG5HUnF9
 Gz+rhSrzqlPSGfqzhvzlvFSCtDxj29peeZsEKrd6q+UwFbO0M4zsMKv7z93ETKXEaMi95
 o6ym68ic08YBKCXng+W6gke+qYGVdHz7xXBlAaj0VWA5+ilDPMNkAvgS7JELwdZNzXZXT
 b5zX2WHY4eWgbbmL/FdBjFt5H8a3RO5lfclKLG7Mm13LCLlGy4H8+ixNUSf+A5bIpuw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AED9A81010
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9288C8B779; Sat,  5 Sep 2026 13:49:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 15:49:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7652a2f4861c154b41928a3239aa27bac2c0383
X-Git-Newrev: 7209f55cd22286eb61c058062aa5f6eebeda8e40
X-Patchwork-Hint: ignore
Message-Id: <20260905134928.9288C8B779@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: bump to version 1.18.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7209f55cd22286eb61c058062aa5f6eebeda8e40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

changelog:
https://github.com/google/googletest/releases/tag/v1.18.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 95cd4adc85..3c5c0618a7 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c  gtest-1.17.0.tar.gz
+sha256  6e3191c1455468b3fc35a417fb565c1c5071aee1b7e7f85e30cf48a98d37d8b5  gtest-1.18.0.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 1eab9371a1..ba17785288 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.17.0
+GTEST_VERSION = 1.18.0
 GTEST_SITE = $(call github,google,googletest,v$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
