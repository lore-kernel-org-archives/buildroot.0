Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4772C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 23:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37DE760BE8;
	Sat, 24 Sep 2022 23:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37DE760BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVdnvER_0nv8; Sat, 24 Sep 2022 23:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C78C60773;
	Sat, 24 Sep 2022 23:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C78C60773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 814441BF3A7
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 23:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 572ED40165
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 23:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 572ED40165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhOdnvWSUFxj for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 23:08:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A910140123
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id A910140123
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 23:08:29 +0000 (UTC)
Received: from localhost.localdomain ([146.241.20.153])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cEG3oVG06lHojcEG3ol2md; Sun, 25 Sep 2022 01:08:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 01:08:26 +0200
Message-Id: <20220924230826.283565-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFPNb4l1MainPLdTGdd8HALUNdyOsJs8Q1M+KwbJWPSANckKiSOqlz3UO1oXQGVS6O8OrNZ2iaEoAVl01Vh+pvXjjFxPG9cUnBsY+8vkixbQxXOiHVdU
 uRJxFwrLmXrbQZsCbXM/NLug9bFrrbOh8D8cqqcHcVn+BoYCsqOLmIgLOjMn5z6O8D5Ecdg2lXanCBkoS1/kbuOfUM1/cOCa8CooO6zpnLHJ3gKuREiXHwSX
 +nun+Ba4Fp8EVjMDFj5O0hSQfuyW9aEizMB9UYIIiABCbz7WluP7FyrlG8nPFj6mSdyubBhFkjvBkbgnZMT8LQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664060907; bh=NHTcSFKR44cS+uplSybjfuQtr/luZ7mHWvXts3NGy64=;
 h=From:To:Subject:Date:MIME-Version;
 b=g50BCmAGwLIVPbdIBVGgnSmTflb/xmi4AR9uEyCoSRmm6lVTojazct2gSkhP69HMj
 hIDHiDP2jxjEMAnfZBN2IH7GY60PJ2rS9A+OWDuWntm8HpbUq8f9dFv156q3JKWs40
 pw6CDHNMMPSlS5W1RjjACSAJtdNfnshk4FMirE3+u7XanPcvY+SlT9YuWzDy535CR9
 3TuO9Ohh42pAZwLrZPqYYPvaWKuYzxvkMN/zIFXXA9kz3dE3yEIAenqp+1oKrfvvKr
 fOwHMh65NuwMKdsBXkQMJ4ZmtOLa4e9jKiXYZRijWcVdQJiqq2nT2TwgQGpVoNWaUZ
 pz1Pl9HLQx/lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=g50BCmAG
Subject: [Buildroot] [PATCH] package/collectd: work around gcc bug 68485
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

collectd is impacted by the microblaze-specific gcc bug #68485 [0].

As for all other impacted packages, force no optimisation when using a
toolchain riddled with that bug.

Fixes:
   http://autobuild.buildroot.net/results/6a8/6a87bbe17e6f606a97097800dc484a7b17bffa7d/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/collectd/collectd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5751757040..5510c265e8 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -27,6 +27,14 @@ COLLECTD_PLUGINS_DISABLE = \
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
+COLLECTD_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+COLLECTD_CFLAGS += -O0
+endif
+
+COLLECTD_CONF_ENV += CFLAGS="$(COLLECTD_CFLAGS)"
+
 #
 # NOTE: There's also a third availible setting "intswap", which might
 # be needed on some old ARM hardware (see [2]), but is not being
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
