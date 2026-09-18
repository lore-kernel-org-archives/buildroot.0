Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3013EC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 09:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1BEC60C1D;
	Fri, 18 Sep 2026 09:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu0NQ0jL29Lq; Fri, 18 Sep 2026 09:11:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2211B60BE1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789722709;
	b=tc6way+hxUpQpPManXrbhnZxVUSFuEmgHCyqCFBpzN58ifp3wGfXXabzArw2oALXqe3E
	 rbezN2TruFwzDBZlQtg9BP3ktq0mLUDDaJlWUEeuPeEBJx5+c0Y7TNmEdyA5rtDmi3NiM
	 DZX5/yIaOQk3XTdIALHRCpHc2e1LJHZAD/r60mP4lJNQ89Tfe174CBCa4jnQ8UaJG+tOP
	 KXPyFh4KPjNXiJzhDs9YMImn/IYLX38CzmOvy3R8kS1pB/NYx6BZGPqQ6Xb3gaomtdM97
	 SPbB7g5XChym0hJOsl//5KlZ5x3k/HNTsto6fkoBi0DMrhA1gJe64YNgnu4lG85f6Og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789722709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vfLmPWZa/pL9f0wLH9Kish8zBN1KcpnqsnVHv9FOg6w=;
	b=hS2LvyVbPWt/8Qhq3B9JSAfaP0rXvTY0oyBreDLcQ/1687LdjgFYUdpbZtoKvAHd095x
	 kfPphlGGYOCyP9m68LdkM1Bm/G3wjJiEdzrXPuD3RUSNUkDrF1Ml9btWr+3vbFa4qomG7
	 EWHdCOtnPaIN+nshLDT567d7TrfRanGwBLm/nSmMqMGwqtRNGaXSxl7QkDLPSCtct+AR+
	 BAGTuj/EGMYGL5xK4vIS6eXa0KvP0K2BXb9D28IbKO4w06Luzri3Cmqqa6K8F+5ljf2lT
	 upDKqHhwN135PEKab4NBF0xZowXlBhRPDfThDy0YDXx4DUM7R2dfT7nXtaDsDkA/3Xg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789722709;
	bh=vfLmPWZa/pL9f0wLH9Kish8zBN1KcpnqsnVHv9FOg6w=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dFjII+Q8dcYUdn4hDdT6/tNJtX7Wio8mt6D0pBBVrj4iAmeohH4c7kPscI2oZvnbp
	 EmNX62UCQ6ZRvdIyfBryr9FUjyJyAf4/OqoXOlro38D7oX59EtwB5lQgeKBhUCexAz
	 G9s7C+3o1TqMhaAD5xwbAECxzZpC6vIxgeUViUFN/XZYVdJPjTaND81cvWPgCeLhxP
	 tPxzuCdbrcvUUgno6WEyqG9Ym2rsA58UMx2FxHEeeNuxGQJ9VjsRl+pUdyH4Z6uRvi
	 n+vd//eqpDBWANvv2ANKpxIcIl8hYz774WsJyRInfuHQ50olpQ0YMwz3u0STZba/2T
	 oOmoFqUCfJrVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2211B60BE1;
	Fri, 18 Sep 2026 09:11:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB99E422
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A913D40B48
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efEVdbmgJQhg for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 09:11:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C21EB40B2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789722707;
 b=bRZcsLgeJbsCYfLlGy8jm5frSKTrLgyKjxVf0Fip7/mY2lzU4vZB37I5aat8dkZRO2r5
 1o3INhlEg5bDT+RM2s9YNePqX3/6aicT/Ui7ZGzrwDx/4c1OYKv1IMg05q+j+Z0D99up7
 JIvdUpXpt12KrzCXxqhXMoQCp8S+zE8TvgWGTe+f+DxKynMeYoAu76oMAtL3Oh3awNpM/
 X+Kl+P/ScSy0wFZQgkJqGNvSK5czD0KwiMx/wecDdcJVjFgc+AhNc+SKZ2G96o2TxjBSP
 2bgdGtp0qEbbwLTz3NgJZntqaeQVZr4QtzpOcdWXPc0wrcmzJOScoBjuMRw6m8kVxLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789722707;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=k0T/dylkHrZRQ1eeZn/YvbtoKmRYEIY+yxOgd80mEqo=;
 b=iUTb//nwBVa7BLLA/P5nnmdaa0lsL4ly6dqR/Pvjar3MrHYX9lfg1uB0rgi+XTFEf+Mp
 QXp6u8q1RyY9g1b0sBl0KV32wa6INU2uy0ZRnhyqGf69WB8EJJrUlNRMIja4npqvvaDB3
 SsIFTpZ0s7lxLeybMxYYEhd/uAp7AvB54bk8zSEV+yJQzpMmi0dSo9lRPAVWKyLEiFBbU
 kGf2YOVhVQjfohSnUhcj4wyW+eonwzPDG69aRN844F12/g8QRNyEaHFegSklL+h6q67uw
 vJ99URfY6Foz8AD9P/yAa1tKkmXi//D6ICEom5QL5aX28ktYBJUBk0topO5HjqDHjug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SLoRKLzR; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C21EB40B2C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 09:11:45 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912df756so3792215e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 02:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789722704; x=1790327504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k0T/dylkHrZRQ1eeZn/YvbtoKmRYEIY+yxOgd80mEqo=;
 b=aHHUImirV1DGin8RguUROvwW5M3Nr4re5+a9jdx17yLLFbs4BIhyFowS1nlnupRWaf
 bQJkb9VnhQ+PxX6olMDfI0vM/U2NX8EFDGRFl7PA3Jrl7oZCdLhcunZ1ViAy5gG0+5zL
 iMshrdU/uDuNlFGWOfYYrCwA3kh3o+/bWuS/C3cAHzgfS33CwqTOVxW/s7lSYkocBZfN
 1L1QJP9poaZZTbPpVCtTRb+818cPxHQHiO8b844HrJ7suCjx9HKWuTdxkDrT4LMal75S
 hoo/8gG0bFw7gtbp/XirhsXMMDp4vzWVwjyMQXAg1AuVMsFPmJiJvJog1emcNplzXBKZ
 zB7w==
X-Gm-Message-State: AFuF++lSwdqszdS+6dH1vGmsJSAP6OsMIMppLVA2YxzuEVjApm8UHAwu
 4TW2glkTGC/YckZ5uKo5lDe7jW8JFyLWKP9mqYoDrHBzspiUH/QPSMgj5va1eEFUb/Z2yUtdoPm
 aAp0o
X-Gm-Gg: AYBFou3yNJzlIrOvI/ZRnPnp7+mhJYUAcd7Rk+gtX1lbnzpRKfWop4O864E1wSgKIGk
 7EvC8g4BAxAUmB6jjSmtrGfgbRQZjXVPlg4y/9ugD1+18EWhGQWr6vfohuHBjOvahVWM0L0BT8o
 CPPd498EzGm0xAtH+aUI26RuxxU+fs0Zmsi7dRJF5BqR9muyEoD4/P31qGCuMaq9SU+DrKMgUNG
 5udlNa472MeUkYWSrAXnKL8ydw2M7lnKNEZL7GQbYYUdpKnuW6QXneZ2pGV0bA8g5kydSkdZQnF
 M4BE93Au+gESUkzWhaed7/oADJO1AUAUbItc887f7p4SKb2ngSLjOkfV44DZQ6n5ONgPC8CLi45
 gPRb/JZfwkc4wFkPSCfb/aUgwL870wSKIRk2PKKB9c/fxb98wbhazAzPG91hbiAFChBgzBuZtzY
 J0k7itt8QNywhTia4eFufxaEUayN9D6wqGwWIu+3mddOQbvyqIoLQ3ENHT1aMAos/x
X-Received: by 2002:a05:600c:4ed4:b0:49f:c432:2e50 with SMTP id
 5b1f17b1804b1-49fc5743189mr19687245e9.25.1789722703911; 
 Fri, 18 Sep 2026 02:11:43 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720078bfcsm2493345f8f.28.2026.09.18.02.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 02:11:43 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Fri, 18 Sep 2026 11:11:40 +0200
Message-ID: <20260918091142.62239-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] utils/checkpackagelib: remove unused
 variable
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The `self.pending_patch` is set but unused.

Fixes: b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/checkpackagelib/lib_mk.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index eb5fbf474c..065733d464 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -130,7 +130,6 @@ class MissingCVEPatch(_CheckFunction):
     def check_patch_files(self):
         for patch_lineno, patch_name, patch_text in self.pending_patches:
             patch_file = self.package_dir / patch_name
-            self.pending_patch = None
 
             if not patch_file.is_file():
                 return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
