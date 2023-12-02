Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C905EC4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 01:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F6C42279;
	Sat,  2 Dec 2023 01:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F6C42279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yFNNtzr6tlj3; Sat,  2 Dec 2023 01:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75B92423F4;
	Sat,  2 Dec 2023 01:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75B92423F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A92241BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 01:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8127C8489B
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 01:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8127C8489B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9353WWBWE9Hy for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 01:51:26 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B15484895
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 01:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B15484895
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9FABrsn3FnPdI9FACrGyZr; Sat, 02 Dec 2023 02:51:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 02:51:23 +0100
Message-Id: <20231202015123.2609353-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBcUAvJrVQPPyqz2Qu6S/xdEkIoVttZjRtZsPwnQDmNYJh7W+hE0q3tQnZzZmEB5Mh7SlmRnvh3qUr5pozvDfV66BFpXQ3+nDsS8GCf4ObPAWJCiCToF
 7wAxRKW5FAKv3SRLpykbEv2750h85G3cBHXcXdtNU0vC9Uoo2uxA9Aib3qbNy7UNRpqon4LAjX35qWFmZVGYy4qwXTGogjq3fheMx6riHCGtagi2DI4rjr7E
 5AA0goctEzG1oNCNog7AyFex9MDLzpXD+SJGtFiss+H9FNGCgYoR/7XNzJoF4AeTP5JrCHEvu3XoCb6IdhyJcDfDz7cbjpCy0sJ27edq0Qg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701481884; bh=Q36WUSOXB8qQJjb73dvj6/oQZ7ShwurNwzCsDC61WL0=;
 h=From:To:Subject:Date:MIME-Version;
 b=OdWPQLZRSmJzGt84R4H0wxpBCpHfhNHeMPyeuTKoHTDlRfFY1BHk2mqPg9H/7nN41
 /h6FJz7Mvct5tdJ/8wDoYpIF/1tccii9Tvc+glbHszbe6s5wfLIhFv/Z3G8W1zxPTd
 yZ3gh6rzKBVevk02stbtGI9ghlYhzS927aVgYMRLjWw1Xe1hLV4gyT060mHbdm3/EL
 bTNVHW8WRFpK7CKXnyU+jNhsAnkQWy+Hk3p4t+jjNbewJCvrVuQlnHp5PeqIvCDIIp
 U56GH3+bXObMdkb88pBf2Fd7Zi2xppnSNRaUtOEAhC05FeSVWL4zkj4aCIrR3guHRZ
 ewtxNESXfayxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OdWPQLZR
Subject: [Buildroot] [PATCH] package/swugenerator: add missing dependencies
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
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

At the moment swugenerator package lacks host-openssl, host-gzip and
host-zstd. All their final executables like openssl, gzip and zstd
can be used by swugenerator if the correct flag is passed so let's
add these missing dependencies.

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swugenerator/swugenerator.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index f4ead1d229..141a6a96c5 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -9,6 +9,6 @@ SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
 HOST_SWUGENERATOR_SETUP_TYPE = setuptools
-HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
+HOST_SWUGENERATOR_DEPENDENCIES = host-gzip host-openssl host-python-libconf
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
