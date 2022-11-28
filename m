Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A0EC43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 09:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0C4415A6;
	Mon, 28 Nov 2022 09:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0C4415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AX7H93qhacS; Mon, 28 Nov 2022 09:42:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C9F41519;
	Mon, 28 Nov 2022 09:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C9F41519
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3060A1BF3C8
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A43141519
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 09:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A43141519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVs2LXQhnpX5 for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 09:41:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FFB4150F
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40FFB4150F
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 500B41814B9; Mon, 28 Nov 2022 10:41:54 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:41:17 +0100
Message-Id: <20221128094125.3183141-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1669628514; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=8n+zVOeXW77byNEJlOEzp677ycFx/vPZWFMqANE8Qtk=;
 b=LiAV2OeMuxmy88MpsDo9s5WQjzZqkr0FCcHkozxX2aTY4y+WwIkW3TPz8f0n6w0HjM1t+v
 IeqfdXMbPah5akOVS3g/Ui3WBH9FvnRqA50z6F+QTPfQRLKP/yA8OmJg8VSzYJU2tN87/1
 JGj4B6Lundywk5oT8RWRPui9Ukpoyj4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=LiAV2OeM
Subject: [Buildroot] [PATCH] package/usbmount: select util-linux logger
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

usbmount has a runtime dependency on "logger" from util-linux.
Else it will just fail when it tries to log.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

I wasn't sure if it is neccessary to also add
select BR2_PACKAGE_UTIL_LINUX
or if this is done automatically.

So please adjust if neccessary.
---
 package/usbmount/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 7760356b7c..5145587b7c 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_USBMOUNT
 	depends on BR2_USE_MMU # lockfile-progs -> liblockfile
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
+	select BR2_PACKAGE_UTIL_LINUX_LOGGER
 	help
 	  The usbmount package automatically mounts USB mass storage
 	  devices when they are plugged in, and unmounts them when
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
