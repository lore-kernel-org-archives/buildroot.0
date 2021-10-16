Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03165C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4073B61101
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4073B61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC72580E80;
	Sat, 16 Oct 2021 21:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfmlvRIWm1Yr; Sat, 16 Oct 2021 21:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E98180D07;
	Sat, 16 Oct 2021 21:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 541231BF2B1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F27B402A4
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-K7nDg0FOk8 for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A3AE40111
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634421241;
 bh=Gw1G6E7M+J5H2mbQMe+6KBLkYOrAka7pjLc5W8UBXfs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iw/WravuYvxBhHr1EF/vGPPP7iBid1F83+k83z/yv/vZWmBvSZ7RcqvHzMPELiTDd
 lS+CJxdkB92Hfvtth8Y5gux1Js/bk6cCOvXt740S37LV2BJbM9vZU4gU854PSl8N5G
 xryk0ITq2s6ZFnxP7/sUwfS2SKJtMZiLJ30iKy0s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUosN-1mB9ey1lVh-00QfyT; Sat, 16 Oct 2021 23:54:01 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 23:53:58 +0200
Message-Id: <20211016215400.31415-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016215400.31415-1-ps.report@gmx.net>
References: <20211016215400.31415-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DrmN1VN+hj0sCQV+olllehQd5BdPZyl3FuI/oglXAIVby2xsv4O
 fNcdNZrmbSyDgbK+J9oJ3NJeWe6GR46uoNljY7B24gAq0slc7h2hkDtwBQy9O+cefvONSm8
 mABq4F89R8kAQiAcemeFTBO/wILnV8wZzVtaEJakdkY7DogJ8Ls+SjZtYKhj+XtIwIAhhl4
 ql6VokuTyxb8dMC88XAMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w8ncA/OtVRI=:P3NcDEbZb/ImXZchaT7wgG
 wVsU54OqbBY9UoXzlce+2UWqpzeXGxo9/EXzld7iS+Fx9UJL5bpjKnB1qKXqP8VG96x++OSCl
 pXe6a+fsNmJzz7D1/TXu4kUkeqFa4lp5vUzRJYQ+zr0xaKMs11GT9c2ISsuAC3Maxo46Blw2y
 8XEmq6BJDgSmwSdtFe7UGXGmbHsogtX392ppaY2pyL6YDteWpxFqhYNrYkXUMQ5SIbs6SmLpb
 A+uVY8elALnig/x2MqfZbNsJseOQZcm89I+U4Xv6wwppCsryAY2PmYDcyqdzDdPtRePGt0Ugg
 H41oybs+9Eb42bBqZr8Wp8t/8mXqeWb8clGQWcTpRJ3tS8wf7/ZgGcKtqhPZ6QCDDf7hGF5QB
 EXWUMOxJn1dI5FheDRrqhzEN5Ker+3DM09p/u+YNFcHEB81fe7s0+Ms+SgW9wR9ocfcICAv8W
 uUx/295oCAo9kNxn5B8EgOh/bqsO6rqnYBaH+/+t5k3z7/WaAY0qHyuARa1e6jp73jc7MPFxh
 4dzghkt33bBiVFf/+nUZd9TEeVlYzkTTA+AWIZA7g4HWR4TpvBoXCIo2qRl7PI7FmFYEvTSkh
 4ttzYzyXNOCTpysHwAvd7muwlHgQMHFKYDmM6/dbH0xwIT3A2+g64b6D9PCUPX8LrkgfWv1jP
 Ndnha2ftW25GIVvX0Qj/al37qPQ9kcD1Xg6ELSYpVUhXXSHGneWgQOWs4cLQJmY3EBR+yIlJt
 Oj5H3SVt7OqJfq+LnuI9HtTfAmYCo9eheNEmP3lbzPHQt/WrV7qBJaZJq1SaTunZalOb/10/s
 JM6VsbyBhfbbKYogrQAQseIGXwPryU3p9ixpzv00Lf8nHlFZ1DH+t+QzCBuYgU9y7/RH72cYJ
 Cf/iwwJImKn+fW9ww74T8i1g1ZO3YRFgZC51Jtk6dT3L0lUfGkaCM+J5xrOn/s2QhLcNPzIgC
 IB+EQWg4Mhk0QZ2TR7np6uDrs/5ow3SE1e8F5+qsnmuEuBDdViAZic2xaXBmrpNwPpV+qbXL/
 Usx0Mf/SDRT0UKAGfoV73YGESVftWTu/ZfVaH2Zy/08aDc/t3iOKYFL2zkftHgYki/e+jClmr
 K/aW519obSBgC4=
Subject: [Buildroot] [PATCH v1 3/5] package/ubus: bump version to a72457b
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - 2537be0 cmake: add a possibility to set library version
  - 4becbd6 ubusd: convert tx_queue to linked list
  - c736e47 ubusd: add per-client tx queue limit
  - a8cf678 ubusd: protect against too-short messages
  - 4fc532c ubusd: fix tx_queue linked list usage
  - b743a33 ubusd: log ACL init errors
  - 2099bb3 libubus: use list_empty/list_first_entry in ubus_process_pending_msg
  - ef03848 libubus: process pending messages in data handler if stack depth is 0
  - a72457b libubus: increase stack depth for processing obj msgs

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 15e67b53ed..2b7181e5d2 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0d2abb7212ad1ac0ac641d52f62e212bb090a1bbaeae975a78f44ab08d3e3c23  ubus-d1d9ddf98d39b0bdc055060fb962335439445690-br1.tar.gz
+sha256  275d184006f2f60c9b0172d8fd0ccc8952f182960c0d3d0945be640873c1bef6  ubus-a72457b61df045d3c499a6211362b751710590d7-br1.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 09668f7dd2..fa856fb36a 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = d1d9ddf98d39b0bdc055060fb962335439445690
+UBUS_VERSION = a72457b61df045d3c499a6211362b751710590d7
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
